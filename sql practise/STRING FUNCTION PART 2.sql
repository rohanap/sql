-- STRING FUNCTION PART 2

SELECT REPLICATE ('Goku ',2);

SELECT SPACE(10);
SELECT * FROM tblEmployee4;
SELECT FirstName + SPACE(1) + LastName as fullname
FROM tblEmployee4;

SELECT Email,PATINDEX('%@bbb.com ',Email) AS FirstOccurance
FROM tblEmployee4
WHERE PATINDEX('%@bbb.com',Email) > 0;

SELECT Email,REPLACE(Email,'.com','.net') AS StuffedEmail
FROM tblEmployee4;

SELECT FirstName ,LastName, STUFF(Email,2,3,'*****') AS StuffedEmail
FROM tblEmployee4;