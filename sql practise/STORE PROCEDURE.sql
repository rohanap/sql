-- STORE PROCEDURE

SELECT * FROM tblEmployee1

CREATE PROCEDURE spGetEmployee  -- CREATE PROC
AS
BEGIN
   SELECT Name,Gender
   FROM tblEmployee1
END

spGetEmployee -- EXEC,EXECUTE

------------
CREATE PROC spGetEmployeeByGenderAndDeparment
@Gender nvarchar(20),
@DepartmentId int
AS
BEGIN
 SELECT Name,Gender,DepartmentId FROM tblEmployee1 WHERE Gender = @Gender AND DepartmentId = @DepartmentId
END

spGetEmployeeByGenderAndDeparment 'Male',1;

sp_helptext spGetEmployee;

ALTER PROCEDURE spGetEmployee  -- CREATE PROC
AS
BEGIN
   SELECT Name,Gender
   FROM tblEmployee1
   ORDER BY Name
END

DROP PROC spGetEmployee;

ALTER PROC spGetEmployeeByGenderAndDeparment
@Gender nvarchar(20),
@DepartmentId int
WITH ENCRYPTION
AS
BEGIN
 SELECT Name,Gender,DepartmentId FROM tblEmployee1 WHERE Gender = @Gender AND DepartmentId = @DepartmentId
END

sp_helptext spGetEmployeeByGenderAndDeparment;