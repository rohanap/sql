-- Views in sql server - Part 39

SELECT * FROM tblEmployee;
SELECT * FROM tblDepartment;

CREATE TABLE Employee
(
  Id int Primary Key,
  Name nvarchar(30),
  Salary int,
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


Insert into Employee values (1,'John', 5000, 'Male', 3);
Insert into Employee values (2,'Mike', 3400, 'Male', 2);
Insert into Employee values (3,'Pam', 6000, 'Female', 1);
Insert into Employee values (4,'Todd', 4800, 'Male', 4);
Insert into Employee values (5,'Sara', 3200, 'Female', 1);
Insert into Employee values (6,'Ben', 4800, 'Male', 3);


Select Id, Name, Salary, Gender, DeptName
from Employee
join Department
on Employee.DepartmentId = Department.DeptId;

Create View vWEmployeesByDepartment
as
Select Id, Name, Salary, Gender, DeptName
from Employee
join Department
on Employee.DepartmentId = Department.DeptId;


SELECT * from vWEmployeesByDepartment;

Create View vWITDepartment_Employees
as
Select Id, Name, Salary, Gender, DeptName
from Employee
join Department
on Employee.DepartmentId = Department.DeptId
where Department.DeptName = 'IT'

SELECT * from vWITDepartment_Employees;

Create View vWEmployeesNonConfidentialData
as
Select Id, Name, Gender, DeptName
from Employee
join Department
on Employee.DepartmentId = Department.DeptId;

SELECT * from vWEmployeesNonConfidentialData;

