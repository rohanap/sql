-- GROUP BY
SELECT * FROM tblEmployee;

SELECT SUM(SALARY) FROM tblEmployee;
SELECT MIN(SALARY) FROM tblEmployee;
SELECT MAX(SALARY) FROM tblEmployee;

SELECT City, SUM(Salary) AS TotalSalary 
FROM tblEmployee
GROUP BY City;

SELECT City,Gender, SUM(Salary) AS TotalSalary 
FROM tblEmployee
GROUP BY City,Gender
ORDER BY City;

SELECT City,Gender, SUM(Salary) AS TotalSalary , COUNT(ID) AS TotalEmployees 
FROM tblEmployee
GROUP BY City,Gender;

SELECT City,Gender, SUM(Salary) AS TotalSalary , COUNT(ID) AS TotalEmployees 
FROM tblEmployee
WHERE Gender = 'Female'
GROUP BY City,Gender;

SELECT City,Gender, SUM(Salary) AS TotalSalary , COUNT(ID) AS TotalEmployees 
FROM tblEmployee
GROUP BY City,Gender
HAVING Gender = 'Male';

SELECT City,Gender, SUM(Salary) AS TotalSalary , COUNT(ID) AS TotalEmployees 
FROM tblEmployee
GROUP BY City,Gender
HAVING SUM(Salary) > 5000;



