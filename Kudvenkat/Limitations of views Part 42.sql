-- Limitations of views - Part 42

Create View vWEmployeeDetails
@Gender nvarchar(20)
as
Select Id, Name, Gender, DepartmentId
from  Employee
where Gender = @Gender;

Create function fnEmployeeDetails(@Gender nvarchar(20))
Returns Table
as
Return 
(Select Id, Name, Gender, DepartmentId
from Employee where Gender = @Gender);

Select * from dbo.fnEmployeeDetails('Male');

Create View vWEmployeeDetailsSorted
as
Select Id, Name, Gender, DepartmentId
from Employee
order by Id;

Create Table ##TestTempTable(
 Id int, Name nvarchar(20), Gender nvarchar(10));

Insert into ##TestTempTable values(101, 'Martin', 'Male');
Insert into ##TestTempTable values(102, 'Joe', 'Female');
Insert into ##TestTempTable values(103, 'Pam', 'Female');
Insert into ##TestTempTable values(104, 'James', 'Male');

Create View vwOnTempTable
as
Select Id, Name, Gender
from ##TestTempTable;

