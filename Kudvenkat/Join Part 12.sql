-- Join Part 12

Create table tblDepartment
(
     ID int primary key,
     DepartmentName nvarchar(50),
     Location nvarchar(50),
     DepartmentHead nvarchar(50)
)
Go

Insert into tblDepartment values (1, 'IT', 'London', 'Rick')
Insert into tblDepartment values (2, 'Payroll', 'Delhi', 'Ron')

 
Insert into tblDepartment values (3, 'HR', 'New York', 'Christie')

 
Insert into tblDepartment values (4, 'Other Department', 'Sydney', 'Cindrella')
Go

Create table tblEmployee1
(
     ID int primary key,
     Name nvarchar(50),
     Gender nvarchar(50),
     Salary int,
     DepartmentId int foreign key references tblDepartment(Id)
)
Go

Insert into tblEmployee1 values (1, 'Tom', 'Male', 4000, 1)
Insert into tblEmployee1 values (2, 'Pam', 'Female', 3000, 3)
Insert into tblEmployee1 values (3, 'John', 'Male', 3500, 1)
Insert into tblEmployee1 values (4, 'Sam', 'Male', 4500, 2)
Insert into tblEmployee1 values (5, 'Todd', 'Male', 2800, 2)
Insert into tblEmployee1 values (6, 'Ben', 'Male', 7000, 1)
Insert into tblEmployee1 values (7, 'Sara', 'Female', 4800, 3)
Insert into tblEmployee1 values (8, 'Valarie', 'Female', 5500, 1)
Insert into tblEmployee1 values (9, 'James', 'Male', 6500, NULL)
Insert into tblEmployee1 values (10, 'Russell', 'Male', 8800, NULL)
Go

SELECT T.Name,T.Gender,T.Salary,D.DepartmentName
FROM tblEmployee1 T
INNER JOIN tblDepartment D
ON T.DepartmentId = D.ID;

SELECT T.Name,T.Gender,T.Salary,D.DepartmentName
FROM tblEmployee1 T
LEFT JOIN tblDepartment D
ON T.DepartmentId = D.ID;

SELECT T.Name,T.Gender,T.Salary,D.DepartmentName
FROM tblEmployee1 T
RIGHT JOIN tblDepartment D
ON T.DepartmentId = D.ID;

SELECT T.Name,T.Gender,T.Salary,D.DepartmentName
FROM tblEmployee1 T
FULL JOIN tblDepartment D
ON T.DepartmentId = D.ID;

SELECT T.Name,T.Gender,T.Salary,D.DepartmentName
FROM tblEmployee1 T
CROSS JOIN tblDepartment D;

