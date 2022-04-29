-- Group by Part 11
ALTER TABLE  [dbo].[tblEmployee]
ALTER COLUMN City VARCHAR;

INSERT INTO [dbo].[tblEmployee] (ID,[NAME],Gender,Salary,City)
VALUES 
          (1,'Tom','Male',4000,'London'),
		  (2,'Pam','Female',3000,'New York'),
		  (3,'John','Male',3500,'London'),
		  (4,'Sam','Male',4500,'London'),
		  (5,'Todd','Male',2800,'Sydney'),
		  (6,'Ben','Male',7000,'New York'),
		  (7,'Sara','Female',4800,'Sydney'),
		  (8,'Valarie','Female',5500,'New York'),
		  (9,'James','Male',6500,'London'),
		  (10,'Russell','Male',8800,'London');

SELECT * FROM tblEmployee;

SELECT SUM(Salary) as Salary
FROM tblEmployee;

SELECT Min(Salary) as Min
FROM tblEmployee;

SELECT Max(Salary) as Max
FROM tblEmployee;

SELECT City,SUM(Salary) as Salary
FROM tblEmployee
GROUP BY City;

SELECT City,Gender,SUM(Salary) as Salary
FROM tblEmployee
GROUP BY City,Gender
ORDER BY City;

SELECT City,Gender,SUM(Salary) as Salary, COUNT(Id) as [Number of Employees]
FROM tblEmployee
GROUP BY City,Gender;

SELECT City,Gender,SUM(Salary) as Salary, COUNT(Id) as [Number of Employees]
FROM tblEmployee
GROUP BY City,Gender
HAVING Gender = 'Male';