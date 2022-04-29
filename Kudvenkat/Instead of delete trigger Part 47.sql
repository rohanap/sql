-- Instead of delete trigger - Part 47

CREATE TABLE Employee
(
  Id int Primary Key,
  Name nvarchar(30),
  Gender nvarchar(10),
  DepartmentId int
);

CREATE TABLE Department
(
 DeptId int Primary Key,
 DeptName nvarchar(20)
);

Insert into Department values (1,'IT');
Insert into Department values (2,'Payroll');
Insert into Department values (3,'HR');
Insert into Department values (4,'Admin');

Insert into Employee values (1,'John', 'Male', 3);
Insert into Employee values (2,'Mike', 'Male', 2);
Insert into Employee values (3,'Pam', 'Female', 1);
Insert into Employee values (4,'Todd', 'Male', 4);
Insert into Employee values (5,'Sara', 'Female', 1);
Insert into Employee values (6,'Ben', 'Male', 3);

SELECT * FROM Employee;
SELECT * FROM Department;

Create view vWEmployeeDetails
as
Select Id, Name, Gender, DeptName
from Employee 
join Department
on Employee.DepartmentId = Department.DeptId;

Select * from vWEmployeeDetails;

Delete from vWEmployeeDetails where Id = 1;


Create Trigger tr_vWEmployeeDetails_InsteadOfDelete
on vWEmployeeDetails
instead of delete
as
Begin
 Delete Employee 
 from Employee
 join deleted
 on Employee.Id = deleted.Id
 
 --Subquery
 --Delete from tblEmployee 
 --where Id in (Select Id from deleted)
End;

Delete from vWEmployeeDetails where Id = 1;

Delete from vWEmployeeDetails where Id IN (2);