-- Stored procedures Input - Part 18

CREATE PROCEDURE spGetEmployeeS
AS
BEGIN
 SELECT Name, Gender FROM tblEmployee
END

ALTER PROCEDURE spGetEmployeeS
AS
BEGIN
 SELECT Name, Gender FROM tblEmployee
 ORDER BY Name
END


EXEC spGetEmployeeS;

DROP PROC spGetEmployeeS;

CREATE PROCEDURE spGetEmployeesByGenderAndDepartment
@Gender nvarchar(20),
@DepartmentId int
AS
BEGIN
SELECT Name, Gender, DepartmentId FROM tblEmployee1
WHERE Gender = @Gender AND DepartmentId = @DepartmentId
END

EXEC spGetEmployeesByGenderAndDepartment 'Male',1;

sp_helptext spGetEmployeesByGenderAndDepartment;

ALTER PROCEDURE spGetEmployeesByGenderAndDepartment
@Gender nvarchar(20),
@DepartmentId int
WITH ENCRYPTION
AS
BEGIN
 SELECT Name, Gender, DepartmentId FROM tblEmployee1
 WHERE Gender = @Gender AND DepartmentId = @DepartmentId
END
