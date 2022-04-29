-- Updatable CTE - Part 50

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

With Employees_Name_Gender
as
(
 Select Id, Name, Gender from Employee
)
Select * from Employees_Name_Gender;

With Employees_Name_Gender
as
(
 Select Id, Name, Gender from Employee
)
Update Employees_Name_Gender Set Gender = 'Female' where Id = 1;


With EmployeesByDepartment
as
(
 Select Id, Name, Gender, DeptName 
 from Employee
 join Department
 on Department.DeptId = Employee.DepartmentId
)
Select * from EmployeesByDepartment;

With EmployeesByDepartment
as
(
 Select Id, Name, Gender, DeptName 
 from Employee
 join Department
 on Department.DeptId = Employee.DepartmentId
)
Update EmployeesByDepartment set Gender = 'Male' where Id = 1;

With EmployeesByDepartment
as
(
 Select Id, Name, Gender, DeptName 
 from Employee
 join Department
 on Department.DeptId = Employee.DepartmentId
)
Update EmployeesByDepartment set 
Gender = 'Female', DeptName = 'IT'
where Id = 1;

With EmployeesByDepartment
as
(
 Select Id, Name, Gender, DeptName 
 from Employee
 join Department
 on Department.DeptId = Employee.DepartmentId
)
Update EmployeesByDepartment set 
DeptName = 'IT' where Id = 1;

