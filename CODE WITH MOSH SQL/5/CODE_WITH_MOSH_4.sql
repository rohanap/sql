-- CHAPTER 23
SELECT 
  C.customer_id,
  C.first_name,
  O.ORDER_ID,
  SH.name AS SHIPER
FROM customers C
LEFT JOIN ORDERS O
ON C.customer_id = O.customer_id
LEFT JOIN shippers SH
ON O.shipper_id = SH.shipper_id
ORDER BY C.customer_id;

SELECT O.order_date,
O.order_id,
C.FIRST_NAME,
SH.name,
OS.name
FROM orders O
JOIN customers C
ON O.CUSTOMER_ID = C.CUSTOMER_ID
LEFT JOIN shippers SH 
ON O.shipper_id = SH.shipper_id
LEFT JOIN order_statuses OS
ON O.status = OS.order_status_id;

-- CHAPTER 24

USE SQL_HR;

SELECT 
     E.EMPLOYEE_ID,
     E.FIRST_NAME,
     M.FIRST_NAME AS MANAGER
FROM EMPLOYEES e
LEFT JOIN EMPLOYEES m
     ON E.REPORTS_TO = M.EMPLOYEE_ID;
     
     -- CHAP 25

SELECT 
    o.order_id,
    c.first_name,
    sh.name as shipper
FROM orders o
join customers c
-- on o.customer_id= c.customer_id;
 using (customer_id)
 left join shippers sh 
  using (shipper_id);    
  
  SELECT *
  FROM order_items OI
  JOIN order_item_notes OIN
    -- ON OI.order_Id = OIN.order_Id AND
     --   OI.product_id = OIN.product_id
     USING(ORDER_ID, PRODUCT_ID);
     
     USE SQL_INVOICING;
     
     SELECT 
       P.DATE,
       C.NAME,
       P.AMOUNT,
       pm.name
     FROM PAYMENTS P
     JOIN CLIENTS C
       USING(CLIENT_ID)
       JOIN PAYMENT_METHODS PM
         ON P.payment_method = PM.payment_method_id;
 
 -- chap 26
 
 SELECT 
 O.ORDER_ID,
 C.first_name
 FROM ORDERS O
 NATURAL JOIN customers C;
 
 -- CHAP 27
 
 SELECT 
   C.FIRST_NAME AS CUSTOMER,
   P.NAME AS PRODUCT
 FROM customers C
 CROSS JOIN PRODUCTS P
 ORDER BY C.first_name; 
 
 SELECT *
 FROM shippers,products;
 
 SELECT *
 FROM shippers SH
 CROSS JOIN products P
 ORDER BY P.name;