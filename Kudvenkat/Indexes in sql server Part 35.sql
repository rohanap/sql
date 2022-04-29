-- Indexes in sql server - Part 35

Select * from tblEmployee 
where Salary > 5000 and Salary < 7000;

CREATE Index IX_tblEmployee_Salary 
ON tblEmployee (SALARY ASC);

Execute sp_helpindex[tblEmployee];

Drop Index tblEmployee.IX_tblEmployee_Salary;