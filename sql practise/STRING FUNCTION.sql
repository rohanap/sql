-- STRING FUNCTION

SELECT * FROM tblEmployee1;

SELECT LEFT('ABCDEF',4);
SELECT RIGHT('ABCDEF',4);

SELECT CHARINDEX('@','SARA@AAA.COM',1);

SELECT SUBSTRING('SARA@AAA.COM',6,7);
SELECT SUBSTRING('PAM@BBB.COM',CHARINDEX('@','PAM@BBB.COM')+1,7);
SELECT SUBSTRING('PAM@BBB.COM',CHARINDEX('@','PAM@BBB.COM')+1,LEN('PAM@BBB.COM')-CHARINDEX('@','PAM@BBB.COM'));

INSERT INTO tblEmployee4
VALUES (1,'Sam','Sony','Sam@aaa.com'),
       (2,'Ram','Barber','Ram@aaa.com'),
	   (3,'Sara','Sanosky','Sara@ccc.com'),
	   (4,'Todd','Gartner','Todd@bbb.com'),
	   (5,'John','Grover','John@aaa.com'),
	   (6,'Sana','Lenin','Sana@ccc.com'),
	   (7,'James','Bond','James@bbb.com'),
	   (8,'Rob','Hunter','Rob@ccc.com'),
	   (9,'Steve','Wilson','Steve@aaa.com'),
	   (10,'Pam','Broker','Pam@bbb.com'); 

SELECT SUBSTRING (Email,CHARINDEX('@',Email)+1,LEN(Email)-CHARINDEX('@',Email)) AS EMAIL,
COUNT(EMAIL)
FROM tblEmployee4
GROUP BY SUBSTRING (Email,CHARINDEX('@',Email)+1,LEN(Email)-CHARINDEX('@',Email));