-- Union and union all - Part 17

CREATE TABLE tblIndiaCustomers(
   ID INT NOT NULL,
   Name varchar(50),
   Email varchar(50)
);

CREATE TABLE tblUKCustomers(
   ID INT NOT NULL,
   Name varchar(50),
   Email varchar(50)
);

INSERT INTO tblIndiaCustomers VALUES (1,'Raj','R@R.com');
INSERT INTO tblIndiaCustomers VALUES (1,'Sam','S@S.com');
INSERT INTO tblUKCustomers VALUES (1,'Ben','B@B.com');
INSERT INTO tblUKCustomers VALUES (1,'Sam','S@S.com');

SELECT * 
FROM tblIndiaCustomers
UNION 
SELECT * 
FROM tblUKCustomers;

SELECT * 
FROM tblIndiaCustomers
UNION ALL
SELECT * 
FROM tblUKCustomers;