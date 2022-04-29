-- Advanced Joins Part 13

SELECT T.Name,T.Gender,T.Salary,D.DepartmentName
FROM tblEmployee1 T
FULL JOIN tblDepartment D
ON T.DepartmentId = D.ID
WHERE D.ID IS NULL OR t.DepartmentId IS NULL;

SELECT T.Name,T.Gender,T.Salary,D.DepartmentName
FROM tblEmployee1 T
LEFT JOIN tblDepartment D
ON T.DepartmentId = D.ID
WHERE D.ID IS NULL;

SELECT T.Name,T.Gender,T.Salary,D.DepartmentName
FROM tblEmployee1 T
RIGHT JOIN tblDepartment D
ON T.DepartmentId = D.ID
WHERE T.DepartmentId IS NULL;
