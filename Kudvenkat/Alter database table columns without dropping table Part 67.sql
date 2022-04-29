-- Alter database table columns without dropping table - Part 67

Create table Employee
(
 ID int primary key identity,
 Name nvarchar(50),
 Gender nvarchar(50),
 Salary nvarchar(50)
);

Insert into Employee values('Sara Nani','Female','4500');
Insert into Employee values('James Histo','Male','5300');
Insert into Employee values('Mary Jane','Female','6200');
Insert into Employee values('Paul Sensit','Male','4200');
Insert into Employee values('Mike Jen','Male','5500');

Select Gender, Sum(Salary) as Total 
from Employee
Group by Gender

select * from Employee;

ALTER TABLE Employee
ALTER COLUMN Salary INT;