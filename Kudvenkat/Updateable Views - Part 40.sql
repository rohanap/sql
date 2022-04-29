-- Updateable Views - Part 40

Create view vWEmployeesDataExceptSalary
as
Select Id, Name, Gender, DepartmentId
from Employee;

Select * from vWEmployeesDataExceptSalary;

Update vWEmployeesDataExceptSalary 
Set Name = 'Mikey' Where Id = 2;

Delete from vWEmployeesDataExceptSalary where Id = 2;
Insert into vWEmployeesDataExceptSalary values (2, 'Mikey', 'Male', 2);


Create view vwEmployeeDetailsByDepartment
as
Select Id, Name, Salary, Gender, DeptName
from Employee
join Department
on Employee.DepartmentId = Department.DeptId;

Select * from vwEmployeeDetailsByDepartment;

Update vwEmployeeDetailsByDepartment 
set DeptName='IT' where Name = 'John';