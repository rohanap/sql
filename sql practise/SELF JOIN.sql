-- SELF JOIN

SELECT  E.Name AS EmpName, M.Name AS ManagerName
FROM tblEmployee2 E
LEFT JOIN tblEmployee2 M
ON E.ManagerID = M.EmployeeID;

SELECT  E.Name AS EmpName, M.Name AS ManagerName
FROM tblEmployee2 E
INNER JOIN tblEmployee2 M
ON E.ManagerID = M.EmployeeID;

SELECT  E.Name AS EmpName, M.Name AS ManagerName
FROM tblEmployee2 E
LEFT JOIN tblEmployee2 M
ON E.ManagerID = M.EmployeeID;

SELECT  E.Name AS EmpName, M.Name AS ManagerName
FROM tblEmployee2 E
CROSS JOIN tblEmployee2 M;


