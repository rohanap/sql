-- CHAP 61

USE SQL_INVOICING;
CREATE VIEW SALE_BY_CLIENT AS
SELECT 
    C.CLIENT_ID,
    C.NAME,
    SUM(INVOICE_TOTAL)AS TOTAL_SALES
FROM CLIENTS C
JOIN INVOICES I USING(CLIENT_ID)
GROUP BY CLIENT_ID,NAME;

CREATE VIEW CLIENTS_BALANCE AS
SELECT C.CLIENT_ID,
C.NAME,
SUM(INVOICE_TOTAL - PAYMENT_TOTAL) AS BALANCE
FROM CLIENTS C
JOIN INVOICES I USING (CLIENT_ID)
GROUP BY CLIENT_ID,NAME;

-- CHAP 62

DROP VIEW SALE_BY_CLIENT;

CREATE OR REPLACE VIEW SALE_BY_CLIENT AS
SELECT 
    C.CLIENT_ID,
    C.NAME,
    SUM(INVOICE_TOTAL)AS TOTAL_SALES
FROM CLIENTS C
JOIN INVOICES I USING(CLIENT_ID)
GROUP BY CLIENT_ID,NAME;


-- CHAP 63

CREATE OR REPLACE VIEW INVOICES_WITH_BALANCE AS
SELECT 
    INVOICE_ID,
    NUMBER,
    CLIENT_ID,
    INVOICE_TOTAL,
    PAYMENT_TOTAL,
    INVOICE_TOTAL - PAYMENT_TOTAL AS BALANCE,
    INVOICE_DATE,
    DUE_DATE,
    PAYMENT_DATE
    FROM INVOICES
    WHERE (INVOICE_TOTAL - PAYMENT_TOTAL) > 0
    WITH CHECK OPTION;
    
DELETE FROM INVOICES_WITH_BALANCE
WHERE
INVOICE_ID = 1;

UPDATE  INVOICES_WITH_BALANCE
SET DUE_DATE = DATE_ADD(DUE_DATE ,INTERVAL 2 DAY)
WHERE INVOICE_ID = 2;

-- CHAP 64

UPDATE  INVOICES_WITH_BALANCE
SET PAYMENT_TOTAL =  INVOICE_TOTAL
WHERE INVOICE_ID = 3;

SELECT * FROM sql_invoicing.invoices_with_balance;

-- CHAP 67

DELIMITER  $$
CREATE PROCEDURE get_clients()
BEGIN
   SELECT *
   FROM CLIENTS;
END$$

DELIMITER ;

CALL get_clients();

DELIMITER $$
CREATE PROCEDURE get_invoices_with_balance()
BEGIN
select *
from invoices_with_balance
where balance > 0;
END$$

DELIMITER ;

-- chap 69

DROP PROCEDURE IF EXISTS get_clients;

DELIMITER  $$
CREATE PROCEDURE get_clients()
BEGIN
   SELECT *
   FROM CLIENTS;
END$$

DELIMITER ;

-- CHAP 70
DROP PROCEDURE IF EXISTS get_clients_by_state;
DELIMITER  $$
CREATE PROCEDURE get_clients_by_state(
state CHAR(2)
)
BEGIN
   SELECT *
   FROM CLIENTS c
   WHERE c.STATE = state;
END$$

DELIMITER ;

--  CHAP 71

DROP PROCEDURE IF EXISTS get_clients_by_state;
DELIMITER  $$
CREATE PROCEDURE get_clients_by_state(
state CHAR(2)
)
BEGIN
   IF STATE IS NULL THEN 
        -- SET STATE = 'CA';
        SELECT * FROM CLIENTS;
   -- END IF;
   ELSE 
   SELECT *
   FROM CLIENTS c
   WHERE c.STATE = state;
END IF;

DELIMITER ;

call get_clients_by_state(NULL);

-- CHAP 73

-- CHAP 74

SET @INVOICES_COUNT = 0;

-- CHAP 75

SELECT 
   client_id,
   name,
   get_risk_factor_for_client(client_id) AS risk_factor
FROM clients;

DROP FUNCTION IF EXISTS get_risk_factor_for_client;

-- CHAP 77

DELIMITER $$

DROP TRIGGER IF EXISTS payments_after_insert;

CREATE TRIGGER payments_after_insert
      AFTER INSERT ON payments
      FOR EACH ROW
      BEGIN
         UPDATE invoices
         SET payment_total = payment_total + NEW.amount
         WHERE invoice_id = NEW.invoice_id;
         INSERT INTO payments_audit
         VALUES(NEW.client_id,NEW.date,NEW.amount,'Insert',NOW());
      END $$
      
DELIMITER ;

INSERT INTO PAYMENTS
VALUES (DEFAULT,5,3,'2019/01/01',10,1);

DELIMITER $$

DROP TRIGGER IF EXISTS payments_after_delete;

CREATE TRIGGER payments_after_delete
      AFTER DELETE ON payments
      FOR EACH ROW
      BEGIN
        UPDATE invoices
         SET payment_total = payment_total - OLD.amount
         WHERE invoice_id = OLD.invoice_id;
         
          INSERT INTO payments_audit
         VALUES(OLD.client_id,OLD.date,OLD.amount,'Delete',NOW());
      END $$
      
DELIMITER ;

DELETE 
FROM PAYMENTS
WHERE PAYMENT_ID = 9;

-- CHAP 78
SHOW TRIGGERS;

-- CHAP 79
DROP TRIGGER IF EXISTS payments_after_insert;

-- CHAP 80
CREATE TABLE payments_audit 
(
   client_id INT NOT NULL,
   date DATE NOT NULL,
   amount DECIMAL(9,2) NOT NULL,
   action_type VARCHAR(50) NOT NULL,
   action_date DATETIME NOT NULL
);

INSERT INTO payments
VALUES(DEFAULT,5,3,'2019/01/01',10,1);

DELETE FROM payments
WHERE payment_id = 10;

-- CHAP 81

SHOW VARIABLES LIKE 'EVENT%';
SET GLOBAL EVENT_SCHEDULER = ON;

DELIMITER $$

CREATE EVENT yearly_delete_state_audit_rows
ON SCHEDULE
     EVERY 1 YEAR STARTS '2019/01/01' ENDS '2020/12/01'
     DO BEGIN 
          DELETE FROM payments_audit
          where action_date < NOW() - INTERVAL 1 YEAR;
          
         
     END $$
     
     DELIMITER ;
     
-- CHAP 82

SHOW EVENTS;
DROP EVENT IF EXISTS yearly_delete_state_audit_rows;
ALTER EVENT yearly_delete_state_audit_rows DISABLE;