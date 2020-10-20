-- CHAPTER 28
USE SQL_STORE;

SELECT 
     ORDER_ID,
     ORDER_DATE,
     'Active' as status
FROM ORDERS
WHERE ORDER_DATE >='2019/01/01'
UNION
SELECT 
     ORDER_ID,
     ORDER_DATE,
     'Archieved' as status
FROM ORDERS
WHERE ORDER_DATE <'2019/01/01';

SELECT First_name  
FROM customers
UNION 
SELECT name
FROM SHIPPERS;


SELECT customer_id,first_name,points, 'Silver' as type 
FROM customers 
WHERE points between 2000 and 3000
union
SELECT customer_id,first_name,points, 'Gold' as type 
FROM customers 
WHERE points > 3000
union
SELECT customer_id,first_name,points, 'Bronze' as type 
FROM customers 
WHERE points < 2000
order by first_name;


-- chap 30
INSERT INTO CUSTOMERS
VALUES (
DEFAULT,
'John',
'Smith',
'1990/01/01',
default,
'address',
'City',
'CA',
DEFAULT);

SELECT *
FROM customerS;

-- CHAP 31
INSERT INTO SHIPPERS(NAME)
VALUES ('Shipper1'),
       ('Shipper2'),
       ('Shipper3');
       
INSERT INTO PRODUCTS (NAME,QUANTITY_IN_STOCK,UNIT_PRICE)
VALUES('Product1',10,1.95),
      ('Product2',11,1.95),
      ('Product3',12,1.95);
      
-- chap 32

INSERT INTO ORDERS(CUSTOMER_ID,ORDER_DATE,STATUS)
VALUES(1,'2019/01/01',1);

INSERT INTO order_items
VALUES(LAST_INSERT_ID(),1,1,2.95),
      (LAST_INSERT_ID(),2,1,3.95);
      
 --     CHAP 33
 
 -- CREATE TABLE orders_archived AS
 
 INSERT INTO orders_archived 
 SELECT  * FROM orders
 where order_date < '2019/01/01';
 
 
 CREATE TABLE invoices_archived as
 SELECT 
 I.INVOICE_ID,
 I.NUMBER,
 C.name AS CLIENT,
 I.invoice_total,
 I.payment_total,
 I.invoice_date,
 I.payment_date,
 I.due_date
 FROM invoices I
JOIN clients C 
USING (CLIENT_ID)
WHERE payment_date IS NOT NULL;

-- CHAP 34

UPDATE INVOICES
SET PAYMENT_TOTAL = 10, PAYMENT_DATE = '2019/03/01'
WHERE INVOICE_ID = 1;

UPDATE INVOICES
SET PAYMENT_TOTAL = 0, PAYMENT_DATE = NULL
WHERE INVOICE_ID = 1;

UPDATE INVOICES
SET PAYMENT_TOTAL = INVOICE_TOTAL * 0.5 , PAYMENT_DATE = DUE_DATE
WHERE INVOICE_ID = 3;

-- chap 35

UPDATE INVOICES
SET PAYMENT_TOTAL = INVOICE_TOTAL * 0.5 , PAYMENT_DATE = DUE_DATE
WHERE CLIENT_ID = 3;

USE SQL_HR;

UPDATE customers
SET POINTS = POINTS + 50
WHERE BIRTH_DATE < '1990/01/01';

-- CHAP 36 

UPDATE INVOICES
SET PAYMENT_TOTAL = INVOICE_TOTAL * 0.5 ,
    PAYMENT_DATE = DUE_DATE
WHERE CLIENT_ID = 
           (SELECT client_id
           FROM clients
           WHERE name = 'Myworks');
           
UPDATE INVOICES
SET PAYMENT_TOTAL = INVOICE_TOTAL * 0.5 ,
    PAYMENT_DATE = DUE_DATE
WHERE CLIENT_ID IN 
           (SELECT client_id
           FROM clients
           WHERE state IN ('CA','NY'));
          
          UPDATE orders
          SET comments = 'GOLD'
          WHERE CUSTOMER_ID IN
		(SELECT customer_id
            FROM customers
            WHERE points > 3000
          );
          
-- CHAP 37

DELETE FROM invoices
WHERE invoice_id = 1;

DELETE FROM invoices
WHERE client_id = 
           (SELECT *
            FROM clients
			WHERE NAME = 'MYWORKS');
            
-- CHAP 39

SELECT MAX(INVOICE_TOTAL) AS HIGHEST,
	   MIN(INVOICE_TOTAL) AS LOWEST,
       AVG(INVOICE_TOTAL) AS AVERAGE,
       SUM(INVOICE_TOTAL) AS TOTAL,
       COUNT(INVOICE_TOTAL) AS NUMBER_OF_INVOICES
FROM INVOICES;

SELECT  
   'First half 0f 2019' AS date_range,
   SUM(invoice_total) AS TOTAL_SALES,
   SUM(payment_total) AS TOTAL_PAYMENTS,
   SUM(invoice_total - payment_total) AS what_we_expect
FROM invoices
WHERE invoice_date BETWEEN '2019/01/01' AND '2019/06/30'
UNION
SELECT  
   'Second half 0f 2019' AS date_range,
   SUM(invoice_total) AS TOTAL_SALES,
   SUM(payment_total) AS TOTAL_PAYMENTS,
   SUM(invoice_total - payment_total) AS what_we_expect
FROM invoices
WHERE invoice_date BETWEEN '2019/07/01' AND '2019/12/30'
UNION
SELECT  
   'Total' AS date_range,
   SUM(invoice_total) AS TOTAL_SALES,
   SUM(payment_total) AS TOTAL_PAYMENTS,
   SUM(invoice_total - payment_total) AS what_we_expect
FROM invoices
WHERE invoice_date BETWEEN '2019/01/01' AND '2019/12/31';

-- chap 40

SELECT 
   CLIENT_ID,
   SUM(invoice_total) AS TOTAL_SALES
FROM INVOICES
WHERE INVOICE_DATE >= '2019/07/01'
GROUP BY CLIENT_ID
ORDER BY TOTAL_SALES DESC;

SELECT 
   state,
   city,
   SUM(invoice_total) AS TOTAL_SALES
FROM INVOICES I
JOIN clients
USING (CLIENT_ID)
-- WHERE INVOICE_DATE >= '2019/07/01'
GROUP BY state, city;
-- ORDER BY TOTAL_SALES DESC;

SELECT date,
       PM.name AS PAYMENTS_METHOD,
       SUM(amount) AS TOTAL_PAYMENTS
FROM payments P
JOIN payment_methods PM
ON P.payment_method = PM.payment_method_id
GROUP BY date,PAYMENTS_METHOD
ORDER BY date;

-- CHAP 41

SELECT 
   CLIENT_ID,
   SUM(invoice_total) AS TOTAL_SALES,
   COUNT(*) AS NUMBER_OF_INVOICES
FROM INVOICES
GROUP BY CLIENT_ID
HAVING TOTAL_SALES > 500 AND NUMBER_OF_INVOICES > 5 ;

SELECT 
C.customer_id,
C.first_name,
C.last_name,
SUM(OI.quantity * OI.unit_price) AS TOTAL_SALES
FROM customers C
JOIN orders O 
USING (CUSTOMER_ID)
JOIN order_items OI
USING (ORDER_ID)
WHERE state = 'VA'
GROUP BY C.customer_id,
C.first_name,
C.last_name
HAVING TOTAL_SALES > 100;

-- CHAP 42

SELECT 
   CLIENT_ID,
   SUM(invoice_total) AS TOTAL_SALES
FROM INVOICES
GROUP BY CLIENT_ID WITH ROLLUP;

SELECT 
   state,
   CITY,
   SUM(invoice_total) AS TOTAL_SALES
FROM INVOICES I
JOIN clients C USING (CLIENT_ID)
GROUP BY state,city WITH ROLLUP;

SELECT 
    PM.name AS PAYMENT_METHOD,
   SUM( P.amount) AS TOTAL
FROM payment_methods PM
JOIN payments P 
ON PM.payment_method_id = P.payment_method
GROUP BY  PM.name WITH ROLLUP;


-- CHAP 44

SELECT *
FROM products
WHERE unit_price > (
   SELECT unit_price
   FROM products
   WHERE product_id = 3
);

SELECT * FROM employees
WHERE salary > (
SELECT 
AVG(salary)
FROM employees
);


SELECT *
FROM products
WHERE unit_price > (
   SELECT unit_price
   FROM products
   WHERE product_id = 3
);

SELECT *
FROM products
WHERE product_id NOT IN (
SELECT DISTINCT product_id
FROM order_items
);

SELECT *
FROM CLIENTS
WHERE CLIENT_ID NOT IN(
SELECT DISTINCT client_id
FROM invoices);

-- CHAP 46

SELECT *
FROM CLIENTS
LEFT JOIN INVOICES USING (CLIENT_ID)
WHERE INVOICE_ID IS NULL;

SELECT * FROM 
CUSTOMERS
WHERE CUSTOMER_ID IN (
SELECT O.CUSTOMER_ID
FROM order_items OI
JOIN ORDERS O USING (ORDER_ID)
WHERE product_id = 3);

SELECT DISTINCT customer_id,first_name,last_name
FROM customers c
JOIN orders O USING (CUSTOMER_ID)
JOIN order_items OI USING (ORDER_ID)
WHERE OI.product_id = 3;

-- CHAP 47
USE SQL_INVOICING;

SELECT *
FROM INVOICES 
WHERE INVOICE_TOTAL > (
SELECT MAX(INVOICE_TOTAL) FROM INVOICES
WHERE CLIENT_ID = 3);

SELECT *
FROM INVOICES 
WHERE INVOICE_TOTAL > ALL (
SELECT INVOICE_TOTAL FROM INVOICES
WHERE CLIENT_ID = 3);

SELECT *
FROM INVOICES 
WHERE INVOICE_TOTAL > SOME (
SELECT INVOICE_TOTAL FROM INVOICES
WHERE CLIENT_ID = 3);

-- CHAP 48

SELECT *
FROM CLIENTS
WHERE CLIENT_ID = ANY (
     SELECT CLIENT_ID
     FROM INVOICES
     GROUP BY CLIENT_ID
     HAVING COUNT(*) >=2
);

SELECT *
FROM CLIENTS
WHERE CLIENT_ID IN (
     SELECT CLIENT_ID
     FROM INVOICES
     GROUP BY CLIENT_ID
     HAVING COUNT(*) >=2
);

-- CHAP 49

USE SQL_HR;

SELECT *
FROM EMPLOYEES E
WHERE SALARY > (
   SELECT AVG(SALARY)
   FROM EMPLOYEES
   WHERE OFFICE_ID = E.OFFICE_ID
);

SELECT *
FROM invoices I
WHERE invoice_total > (
    SELECT  
		AVG(invoice_total)
    FROM invoices
    WHERE CLIENT_ID = I.CLIENT_ID
);

-- CHAP 50

SELECT *
FROM clients
WHERE client_id IN(
   SELECT DISTINCT CLIENT_ID
   FROM invoices
);

SELECT *
FROM clients C
WHERE EXISTS (
   SELECT CLIENT_ID
   FROM invoices
   WHERE client_id = C.client_id
);

USE SQL_STORE;

SELECT *
FROM PRODUCTS P
WHERE NOT EXISTS (
    SELECT PRODUCT_ID
    FROM ORDER_ITEMS
    WHERE PRODUCT_ID = P.PRODUCT_ID
);

SELECT *
FROM PRODUCTS
WHERE PRODUCT_ID NOT IN (
    SELECT DISTINCT PRODUCT_ID
    FROM ORDER_ITEMS
);


-- CHAP 51
USE SQL_INVOICING;

SELECT 
INVOICE_ID,
INVOICE_TOTAL,
(SELECT AVG(INVOICE_TOTAL) 
FROM INVOICES) AS INVOICE_AVERAGE,
INVOICE_TOTAL - (SELECT INVOICE_AVERAGE) AS DIFFERENCE
FROM INVOICES;

SELECT 
    client_id ,
	name,
    SUM( I.invoice_total) AS TOTAL_SALES,
    (SELECT AVG(invoice_total)
    FROM invoices) AS AVERAGE
   -- (SELECT TOTAL_SALES -  AVERAGE ) AS DIFFERENCE
FROM clients C
LEFT JOIN invoices I USING (CLIENT_ID)
GROUP BY name;

SELECT 
    client_id ,
	name,
    (SELECT 
         SUM( invoice_total)
         FROM invoices
         WHERE CLIENT_ID = C.CLIENT_ID) AS TOTAL_SALES,
    (SELECT AVG(invoice_total)
    FROM invoices) AS AVERAGE,
    (SELECT TOTAL_SALES -  AVERAGE ) AS DIFFERENCE
FROM clients C;

-- CHAP 52

SELECT *
FROM (
SELECT 
    client_id ,
	name,
    (SELECT SUM( invoice_total)
		FROM invoices
		WHERE CLIENT_ID = C.CLIENT_ID) AS TOTAL_SALES,
    (SELECT AVG(invoice_total)
    FROM invoices) AS AVERAGE,
    (SELECT TOTAL_SALES -  AVERAGE ) AS DIFFERENCE
FROM clients C
) AS SALES_SUMMERY
WHERE TOTAL_SALES IS NOT NULL;

-- CHAP 53

SELECT ROUND(5.7345,1);
SELECT TRUNCATE(5.7345,2);
SELECT CEILING(5.2);
SELECT ABS(-5.2);
SELECT RAND();

-- CHAP 54

SELECT LENGTH('SKY');
SELECT UPPER('SKY');
SELECT LOWER('SKY');
SELECT TRIM(' SKY');
SELECT LEFT('KINDERGARDEN',4);
SELECT LOCATE('N','KINDGARDEN');
SELECT CONCAT('FIRST','SECOND');

-- CHAP 55

SELECT NOW() , CURDATE(), CURTIME();
SELECT YEAR(NOW());
SELECT MONTH(NOW());
SELECT DAYNAME(NOW());
SELECT EXTRACT(DAY FROM NOW());
SELECT EXTRACT(MONTH FROM NOW());
SELECT EXTRACT(YEAR FROM NOW());

SELECT *
FROM ORDERS
WHERE YEAR(ORDER_DATE) =  YEAR(NOW());

-- CHAP 56

SELECT DATE_FORMAT(NOW(),'%Y');
SELECT DATE_FORMAT(NOW(),'%y');
SELECT DATE_FORMAT(NOW(),'%M %y');
SELECT DATE_FORMAT(NOW(),'%M %D %Y');
SELECT DATE_FORMAT(NOW(),'%M %d %Y');

-- chap 57

SELECT DATE_ADD(NOW(),INTERVAL 1 DAY); 
SELECT DATE_ADD(NOW(),INTERVAL 1 YEAR); 
SELECT DATE_ADD(NOW(),INTERVAL -1 DAY); 
SELECT DATE_SUB(NOW(),INTERVAL 1 DAY); 
SELECT DATEDIFF('2019/01/05','2019/01/01');
SELECT TIME_TO_SEC('09:00');

-- CHAP 58

USE SQL_STORE;

SELECT 
    ORDER_ID,
    IFNULL(SHIPPER_ID,'NOT ASSIGINED') AS SHIPPER
FROM ORDERS;

SELECT 
    ORDER_ID,
    COALESCE(SHIPPER_ID,COMMENTS,'NOT ASSIGINED') AS SHIPPER
FROM ORDERS;

SELECT concat(FIRST_NAME,' ',LAST_NAME)AS CUSTOMER,
IFNULL(PHONE,'UNKNOWN') AS PHONE
FROM CUSTOMERS;

-- CHAP 59
SELECT 
ORDER_ID,
ORDER_DATE,
IF(YEAR(ORDER_DATE) = YEAR(NOW()), 'ACTIVE','ARCHIVED') AS CATEGORY
FROM ORDERS;


/* SELECT PRODUCT_ID,NAME,COUNT(*) AS ORDER,
IF(COUNT(*)>1 'MANY TIMES','ONCE')AS FREQUENCY
FROM PRODUCTS
JOIN ORDER_ITEMS USING(PRODUCT_ID)
GROUP BY PRODUCT_ID,NAME;
*/
-- CHAP 60

SELECT 
ORDER_ID,
ORDER_DATE,
CASE 
  WHEN   YEAR(ORDER_DATE) = YEAR(NOW())     THEN  'ACTIVE'
  WHEN   YEAR(ORDER_DATE) = YEAR(NOW()) - 1 THEN  'LAST YEAR'
  WHEN   YEAR(ORDER_DATE) < YEAR(NOW()) - 1 THEN  'ARCHIVED'
  ELSE 'FUTURE'
  END AS CATTEGORY
FROM ORDERS;

SELECT 
   CONCAT(FIRST_NAME,' ',LAST_NAME) AS CUSTOMER,
   POINTS,
   CASE
   WHEN POINTS > 3000 THEN 'GOLD'
   WHEN POINTS BETWEEN 2000 AND 3000 THEN 'SILVER'
   WHEN POINTS < 2000 THEN 'BRONZE'
   END AS CATEGORY
FROM CUSTOMERS