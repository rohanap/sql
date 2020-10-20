SELECT 
    name,
    unit_price,
    unit_price * 1.1 AS 'new price'
 FROM sql_store.products;
 
 SELECT * 
 FROM  customers
 WHERE points > 3000;
 
 SELECT * 
 FROM  customers
 WHERE state = 'VA';
 
  SELECT * 
 FROM  customers
 WHERE birth_date > '1990-01-01' AND points > 1000;
 
  SELECT * 
 FROM  customers
 WHERE birth_date > '1990-01-01' OR points > 1000;
 
SELECT * 
FROM  customers
 WHERE birth_date > '1990-01-01' OR points > 1000 AND 
 state = "VA";
 
 
