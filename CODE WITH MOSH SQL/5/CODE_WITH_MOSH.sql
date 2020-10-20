SELECT * FROM sql_store.customers;

SELECT *
FROM customers
WHERE points between 1000 AND 3000;

SELECT *
FROM customers
WHERE birth_date BETWEEN '1990/01/01' AND '2000/01/01';

-- CHAP 11 LIKE OPRATOR
SELECT * 
FROM customers
WHERE last_name LIKE 'B%';

SELECT * 
FROM customers
WHERE last_name LIKE 'BRUSH%';

SELECT * 
FROM customers
WHERE last_name LIKE '%B%';

SELECT * 
FROM customers
WHERE last_name LIKE '%Y';

SELECT * 
FROM customers
WHERE last_name LIKE '_____Y';

SELECT * 
FROM customers
WHERE last_name LIKE 'B____Y';

SELECT *
FROM customers
WHERE address LIKE '%TRAIL%' OR address LIKE '%AVENUE%';

SELECT *
FROM customers
WHERE phone LIKE '%9';

-- CHAP 12 REGEXP OPRATOR
SELECT *
FROM customers
-- WHERE last_name LIKE '%FIELD%'
WHERE last_name REGEXP 'FIELD';

SELECT *
FROM customers
WHERE first_name REGEXP 'ELKA' OR first_name REGEXP 'AMBUR';

SELECT *
FROM customers
-- WHERE last_name REGEXP 'EY$' OR last_name REGEXP 'ON$';
WHERE last_name REGEXP 'EY$|ON$';

SELECT *
FROM customers
WHERE last_name REGEXP '^MY' OR last_name REGEXP 'SE';

-- CHAP 13 NOT NULL
SELECT *
FROM customers
WHERE phone IS NULL;

SELECT *
FROM customers
WHERE phone IS NOT NULL;

SELECT *
FROM orders
WHERE shipper_id IS NULL;

-- CHAP 14 ORDER BY
SELECT *
FROM customers
order by first_name;

SELECT *
FROM customers
order by state,first_name;

SELECT *
FROM order_items
where order_id = 2
order by  quantity * unit_price desc;

-- CHAP 15 LIMIT CLAUSE
SELECT *
FROM CUSTOMERS
LIMIT 3;

SELECT *
FROM CUSTOMERS
LIMIT 6,3;

SELECT *
FROM CUSTOMERS
ORDER BY points desc
LIMIT 3;

-- CHAP 16 INNER JOIN
SELECT O.order_id,O.customer_id, last_name
FROM orders O
INNER JOIN customers C
ON O.customer_id = C.customer_id;

SELECT O.order_id,O.product_id,P.name,quantity,O.unit_price
FROM order_items O
INNER JOIN products P 
ON O.product_id = P.product_id;

-- CHAP 17 JOINING ACROSS DATABASE
SELECT *
FROM order_items O

JOIN  sql_inventory.products P
ON O.product_id = P.product_id;

-- CHAP 18 SELF JOIN
USE SQL_HR;

SELECT 
   e.employee_id,
   e.first_name,
   m.first_name AS manager
FROM sql_hr.employees e
JOIN sql_hr.employees m
ON e.reports_to = m.employee_id;

-- chap 19 Joining Multiple Table
USE SQL_STORE;
SELECT 
   O.order_id,
   O.order_date,
   C.first_name,
   C.last_name,
   OS.name
FROM orders O
JOIN customers C 
	ON O.customer_id = C.customer_id
    JOIN order_statuses OS
    ON O.status = OS.order_status_id;
    
    SELECT 
       P.date,
       P.invoice_id,
       P.amount,
       C.name,
       M.name AS 'MODE OF PAYMENT'
    FROM clients C
    JOIN payments P
    ON C.client_id = P.client_id
    JOIN payment_methods M
    ON P.payment_method = M.payment_method_id;
    
-- CHAP 20 COMPOUND JOIN CONDITION
    
    SELECT *
    FROM order_items OI
    JOIN order_item_notes OIN
        ON OI.order_Id = OIN.order_Id
        AND OI.product_id = OIN.product_id;
        
   -- CHAP 21 IMPLICIT JOIN SYNTAX
   
   -- CHAP 23 OUTER JOIN BETWEEN MULTIPLE TABLE
   