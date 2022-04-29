-- Stored procedures with output parameters - Part 19

CREATE PROCEDURE spGetEmployeeCountByGender
@Gender nvarchar(20),
@EmployeeCount int OUTPUT
AS
BEGIN
 SELECT COUNT(ID) FROM tblEmployee1
 WHERE Gender = @Gender 
END

DECLARE @EmployeeTotal int
EXEC spGetEmployeeCountByGender 'Male',@EmployeeTotal OUTPUT

Print @EmployeeTotal;

EXEC sp_help spGetEmployeeCountByGender;

EXEC sp_depends spGetEmployeeCountByGender;