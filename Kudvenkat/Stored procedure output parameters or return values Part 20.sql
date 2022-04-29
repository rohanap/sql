-- Stored procedure output parameters or return values - Part 20

SELECT * FROM tblEmployee1;

Create Procedure spGetTotalCountOfEmployees1
@TotalCount int output
as
Begin
 Select @TotalCount = COUNT(ID) from tblEmployee1
End

Declare @TotalEmployees int
Execute spGetTotalCountOfEmployees1 @TotalEmployees Output
Select @TotalEmployees


-- Using Return value

Create Procedure spGetTotalCountOfEmployees2
as
Begin
 return (Select COUNT(ID) from tblEmployee1)
End

Declare @TotalEmployees int
Execute @TotalEmployees = spGetTotalCountOfEmployees2
Select @TotalEmployees

---------------

Create Procedure spGetNameById1
@Id int,
@Name nvarchar(20) Output
as
Begin
 Select @Name = Name from tblEmployee1 Where Id = @Id
End

Declare @EmployeeName nvarchar(20)
Execute spGetNameById1 1, @EmployeeName out
Print 'Name of the Employee = ' + @EmployeeName

------

Create Procedure spGetNameById2
@Id int
as
Begin
 Return (Select Name from tblEmployee1 Where Id = @Id)
End

Declare @EmployeeName nvarchar(20)
Execute @EmployeeName = spGetNameById2 1
Print 'Name of the Employee = ' + @EmployeeName