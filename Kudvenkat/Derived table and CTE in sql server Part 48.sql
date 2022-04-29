-- Derived table and CTE in sql server - Part 48

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

Create view vWEmployeeCount
as
Select DeptName, DepartmentId, COUNT(*) as TotalEmployees
from Employee
join Department
on Employee.DepartmentId = Department.DeptId
group by DeptName, DepartmentId;

Select DeptName, TotalEmployees 
from vWEmployeeCount
where  TotalEmployees >= 2;

-- Using Temp table


Select DeptName, DepartmentId, COUNT(*) as TotalEmployees
into #TempEmployeeCount
from Employee
join Department
on Employee.DepartmentId = Department.DeptId
group by DeptName, DepartmentId;

Select DeptName, TotalEmployees
From #TempEmployeeCount
where TotalEmployees >= 2;

Drop Table #TempEmployeeCount;

-- Using Table variable

Declare @tblEmployeeCount table
(DeptName nvarchar(20),DepartmentId int, TotalEmployees int)

Insert @tblEmployeeCount
Select DeptName, DepartmentId, COUNT(*) as TotalEmployees
from Employee
join Department
on Employee.DepartmentId = Department.DeptId
group by DeptName, DepartmentId

Select DeptName, TotalEmployees
From @tblEmployeeCount
where  TotalEmployees >= 2;

-- Using Derived Table

Select DeptName, TotalEmployees
from 
 (
  Select DeptName, DepartmentId, COUNT(*) as TotalEmployees
  from Employee
  join Department
  on Employee.DepartmentId = Department.DeptId
  group by DeptName, DepartmentId
 ) 
as EmployeeCount
where TotalEmployees >= 2;

-- Using CTE

With EmployeeCount(DeptName, DepartmentId, TotalEmployees)
as
(
 Select DeptName, DepartmentId, COUNT(*) as TotalEmployees
 from Employee
 join Department
 on Employee.DepartmentId = Department.DeptId
 group by DeptName, DepartmentId
)

Select DeptName, TotalEmployees
from EmployeeCount
where TotalEmployees >= 2;


