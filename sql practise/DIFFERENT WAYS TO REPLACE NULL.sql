-- DIFFERENT WAYS TO REPLACE NULL

SELECT  E.Name AS EmpName, ISNULL(M.Name,'No Manager') AS ManagerName
FROM tblEmployee2 E
LEFT JOIN tblEmployee2 M
ON E.ManagerID = M.EmployeeID; 

SELECT  E.Name AS EmpName, COALESCE(M.Name,'No Manager') AS ManagerName
FROM tblEmployee2 E
LEFT JOIN tblEmployee2 M
ON E.ManagerID = M.EmployeeID; 

SELECT  E.Name AS EmpName, CASE WHEN M.Name IS NULL THEN 'No Manager' ELSE M.Name END AS ManagerName
FROM tblEmployee2 E
LEFT JOIN tblEmployee2 M
ON E.ManagerID = M.EmployeeID; 