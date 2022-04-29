-- Unique and Non-Unique Indexes - Part 37

CREATE TABLE [Employee]
(
 [Id] int Primary Key,
 [FirstName] nvarchar(50),
 [LastName] nvarchar(50),
 [Salary] int,
 [Gender] nvarchar(10),
 [City] nvarchar(50)
);

Execute sp_helpindex Employee;

Insert into Employee Values(1,'Mike', 'Sandoz',4500,'Male','New York');
Insert into Employee Values(1,'John', 'Menco',2500,'Male','London');

DROP  INDEX Employee.PK__Employee__3214EC07BD5D4888;

Create Unique NonClustered Index UIX_Employee_FirstName_LastName
On Employee(FirstName, LastName);

ALTER TABLE Employee 
ADD CONSTRAINT UQ_Employee_City 
UNIQUE NONCLUSTERED (City);

EXECUTE SP_HELPCONSTRAINT Employee;

CREATE UNIQUE INDEX IX_Employee_City
ON Employee(City)
WITH IGNORE_DUP_KEY;