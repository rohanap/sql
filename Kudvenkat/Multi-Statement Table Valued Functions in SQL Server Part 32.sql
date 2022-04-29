-- Multi-Statement Table Valued Functions in SQL Server - Part 32

SELECT * FROM tblEmpBirth;

CREATE FUNCTION fk_ILTVF_GetEmployee()
RETURNS TABLE
AS
RETURN (SELECT Id,Name,CAST(DateOfBirth AS date) AS DOB FROM tblEmpBirth)

CREATE FUNCTION fk_MSTVF_GetEmployee()
RETURNS @Table TABLE (ID INT, NAME NVARCHAR(20),DOB DATE)

AS
BEGIN
 INSERT INTO @Table
 SELECT Id,Name,CAST(DateOfBirth AS date) FROM tblEmpBirth
RETURN 
END

Select * from fk_ILTVF_GetEmployee();


Select * from fk_MSTVF_GetEmployee();