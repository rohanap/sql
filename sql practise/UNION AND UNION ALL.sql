-- UNION AND UNION ALL

CREATE TABLE tblIndiaCustomers(
  ID INT NOT NULL ,
  Name VARCHAR(50),
  Email nchar(50)
);

INSERT INTO tblIndiaCustomers
VALUES (1,'Raj','r@r.com'),
       (2,'Sam','s@s.com');

CREATE TABLE tblUkCustomers(
  ID INT NOT NULL ,
  Name VARCHAR(50),
  Email nchar(50)
);

INSERT INTO tblUkCustomers
VALUES (1,'Ben','b@b.com'),
       (2,'','s@s.com');

SELECT * FROM tblIndiaCustomers
UNION
SELECT * FROM tblUkCustomers;

SELECT * FROM tblIndiaCustomers
UNION ALL
SELECT * FROM tblUkCustomers;