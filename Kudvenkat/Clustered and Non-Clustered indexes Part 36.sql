-- Clustered and Non-Clustered indexes -Part 36

CREATE TABLE [Employee]
(
 [Id] int Primary Key,
 [Name] nvarchar(50),
 [Salary] int,
 [Gender] nvarchar(10),
 [City] nvarchar(50)
);

EXEC sp_helpindex Employee;

Insert into Employee Values(3,'John',4500,'Male','New York');
Insert into Employee Values(1,'Sam',2500,'Male','London');
Insert into Employee Values(4,'Sara',5500,'Female','Tokyo');
Insert into Employee Values(5,'Todd',3100,'Male','Toronto');
Insert into Employee Values(2,'Pam',6500,'Female','Sydney');

Select * from Employee;

Create Clustered Index IX_Employee_Name
ON Employee(Name);

Create Clustered Index IX_Employee_Gender_Salary
ON Employee(Gender DESC, Salary ASC);