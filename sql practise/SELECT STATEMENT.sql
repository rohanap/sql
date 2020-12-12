-- SELECT STATEMENT
SELECT  * FROM tblPerson;

SELECT DISTINCT GenderId FROM tblPerson;

SELECT * FROM [dbo].[tblEmployee]
WHERE City = 'LONDON';

SELECT * FROM [dbo].[tblEmployee]
WHERE City <> 'LONDON';

SELECT * FROM [dbo].[tblEmployee]
WHERE City != 'LONDON';


SELECT * FROM [dbo].[tblEmployee]
WHERE SALARY IN (4000,3000,5500);

SELECT * FROM [dbo].[tblEmployee]
WHERE SALARY BETWEEN 2000 AND 10000;

SELECT * FROM [dbo].[tblEmployee]
WHERE City LIKE  'L%';

SELECT  * FROM tblPerson
WHERE Email LIKE '%@%';

SELECT  * FROM tblPerson
WHERE Email LIKE '_@_.COM%';

SELECT * FROM [dbo].[tblEmployee]
WHERE NAME LIKE '[TPMS]%';

SELECT * FROM [dbo].[tblEmployee]
WHERE NAME LIKE '[^TPMS]%';

SELECT * FROM [dbo].[tblEmployee]
WHERE CITY = 'London' OR City = 'New York' AND Gender = 'MALE';

SELECT * FROM [dbo].[tblEmployee]
ORDER BY Name ASC,City DESC;

SELECT TOP 2 NAME FROM [dbo].[tblEmployee];

