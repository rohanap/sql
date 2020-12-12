-- STORED PROCEDURES WITH OUTPUT PARAMETERS

SELECT * FROM tblEmployee1;

CREATE PROC spGetEmployeeCountByGender
@Gender nvarchar(20),
@EmployeeCount int output
AS
BEGIN
   SELECT @EmployeeCount = COUNT(ID) FROM tblEmployee1 WHERE Gender = @Gender
END;

DECLARE @TotalCount int
EXECUTE spGetEmployeeCountByGender 'Male',@TotalCount Output
Print @TotalCount;

DECLARE @TotalCount int
EXECUTE spGetEmployeeCountByGender 'Male',@TotalCount 
IF (@TotalCount IS NULL)
     Print '@TotalCount is null'
ELSE  
     Print '@TotalCount is not null';

sp_help spGetEmployeeCountByGender;
sp_helptext spGetEmployeeCountByGender;
sp_depends spGetEmployeeCountByGender;
sp_depends tblEmployee1;