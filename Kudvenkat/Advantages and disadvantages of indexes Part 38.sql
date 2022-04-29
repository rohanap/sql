-- Advantages and disadvantages of indexes - Part 38

CREATE TABLE [Employee]
(
 [Id] int Primary Key,
 [FirstName] nvarchar(50),
 [LastName] nvarchar(50),
 [Salary] int,
 [Gender] nvarchar(10),
 [City] nvarchar(50)
);


Insert into Employee Values(1,'Mike', 'Sandoz',4500,'Male','New York');
Insert into Employee Values(2,'Sara', 'Menco',6500,'Female','London');
Insert into Employee Values(3,'John', 'Barber',2500,'Male','Sydney');
Insert into Employee Values(4,'Pam', 'Grove',3500,'Female','Toronto');
Insert into Employee Values(5,'James', 'Mirch',7500,'Male','London');

Create NonClustered Index IX_Employee_Salary
On Employee (Salary Asc)

Select * from Employee where Salary > 4000 and Salary < 8000;

Delete from Employee where Salary = 2500

Update Employee Set Salary = 9000 where Salary = 7500
