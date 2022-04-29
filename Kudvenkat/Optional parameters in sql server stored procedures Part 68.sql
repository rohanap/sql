-- Optional parameters in sql server stored procedures - Part 68

CREATE TABLE Employee
(
 Id int IDENTITY PRIMARY KEY,
 Name nvarchar(50),
 Email nvarchar(50),
 Age int,
 Gender nvarchar(50),
 HireDate date,
);

Insert into Employee values
('Sara Nan','Sara.Nan@test.com',35,'Female','1999-04-04'),
('James Histo','James.Histo@test.com',33,'Male','2008-07-13'),
('Mary Jane','Mary.Jane@test.com',28,'Female','2005-11-11'),
('Paul Sensit','Paul.Sensit@test.com',29,'Male','2007-10-23');

SELECT * FROM Employee;

CREATE PROC spSearchEmployees
@Name nvarchar(50),
@Email nvarchar(50),
@Age int,
@Gender nvarchar(50)
AS 
BEGIN
  SELECT * FROM Employee
  WHERE Name = @Name AND
        Email = @Email AND
		Age = @Age AND
		Gender = @Gender
END;

ALTER PROC spSearchEmployees
@Name nvarchar(50) = NULL,
@Email nvarchar(50) = NULL,
@Age int = NULL,
@Gender nvarchar(50) = NULL
AS 
BEGIN
  SELECT * FROM Employee
  WHERE ( Name = @Name OR @Name IS NULL) AND
        ( Email = @Email OR @Email IS NULL) AND 
		( Age = @Age OR @Age IS NULL) AND
	   	( Gender = @Gender OR @Gender IS NULL)
END;

Execute spSearchEmployees -- This command will return all the rows
Execute spSearchEmployees @Gender = 'Male' -- Retruns only Male employees
Execute spSearchEmployees @Gender = 'Male', @Age = 29 -- Retruns Male employees whose age is 29

