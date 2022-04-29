-- Common Table Expressions - Part 49

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

With EmployeeCount(DepartmentId, TotalEmployees)
as
(
 Select DepartmentId, COUNT(*) as TotalEmployees
 from Employee
 group by DepartmentId
)

Select DeptName, TotalEmployees
from Department
join EmployeeCount
on Department.DeptId = EmployeeCount.DepartmentId
order by TotalEmployees;

With EmployeesCountBy_Payroll_IT_Dept(DepartmentName, Total)
as
(
 Select DeptName, COUNT(Id) as TotalEmployees
 from Employee
 join Department 
 on Employee.DepartmentId = Department.DeptId
 where DeptName IN ('Payroll','IT')
 group by DeptName
),
EmployeesCountBy_HR_Admin_Dept(DepartmentName, Total)
as
(
 Select DeptName, COUNT(Id) as TotalEmployees
 from Employee
 join Department 
 on Employee.DepartmentId = Department.DeptId
 group by DeptName 
)
Select * from EmployeesCountBy_HR_Admin_Dept 
UNION
Select * from EmployeesCountBy_Payroll_IT_Dept;
