-- Recursive CTE - Part 51

Create Table Employee
(
  EmployeeId int Primary key,
  Name nvarchar(20),
  ManagerId int
);

Insert into Employee values (1, 'Tom', 2);
Insert into Employee values (2, 'Josh', null);
Insert into Employee values (3, 'Mike', 2);
Insert into Employee values (4, 'John', 3);
Insert into Employee values (5, 'Pam', 1);
Insert into Employee values (6, 'Mary', 3);
Insert into Employee values (7, 'James', 1);
Insert into Employee values (8, 'Sam', 5);
Insert into Employee values (9, 'Simon', 1);

SELECT * FROM Employee;

SELECT EMP.Name AS [Employee Name],
ISNULL(MANAGER.Name,'Super Boss') AS [Manager Name]
FROM Employee EMP
LEFT JOIN Employee MANAGER
ON EMP.ManagerId = MANAGER.EmployeeId;

WITH 
  EmployeeCTE(EmployeeId, Name, ManagerId, [Level])
  AS
  (
    SELECT EmployeeId, Name, ManagerId, 1
    FROM Employee
	WHERE ManagerId IS NULL

	UNION ALL

	SELECT Employee.EmployeeId,Employee.Name,Employee.ManagerId,EmployeeCTE.[Level]+1
	FROM Employee
	INNER JOIN EmployeeCTE
	ON Employee.ManagerId = EmployeeCTE.EmployeeId
   )

  SELECT EmpCTE.Name AS Employee, ISNULL(MgrCTE.Name, 'Super Boss') AS Manager, 
  EmpCTE.[Level] 
  FROM EmployeeCTE EmpCTE
  LEFT JOIN EmployeeCTE MgrCTE
  ON EmpCTE.ManagerId = MgrCTE.EmployeeId;