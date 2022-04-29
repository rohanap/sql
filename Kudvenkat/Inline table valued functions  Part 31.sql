-- Inline table valued functions - Part 31

SELECT * FROM tblEmployee1;

CREATE FUNCTION fk_EmployeeByGender(@Gender nvarchar(10))
RETURNS TABLE
AS
RETURN (SELECT ID,Name,Gender,DepartmentId
        FROM tblEmployee1
		WHERE Gender = @Gender)

SELECT * FROM fk_EmployeeByGender('MALE')
WHERE Name = 'TOM';

SELECT E.Name,E.Gender,D.DepartmentName FROM fk_EmployeeByGender('MALE') E
INNER JOIN tblDepartment D
ON E.DepartmentId= D.ID

SELECT * FROM tblDepartment

