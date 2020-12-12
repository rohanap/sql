-- ADVANCE JOIN

SELECT 
    E.Name
   ,E.Gender
   ,E.Salary
   ,D.DepartmentName
FROM
   tblEmployee1 E
LEFT JOIN
   tblDepartment D
ON E.DEPARTMENTID = D.ID
WHERE D.ID IS NULL;


SELECT 
    E.Name
   ,E.Gender
   ,E.Salary
   ,D.DepartmentName
FROM
   tblEmployee1 E
RIGHT JOIN
   tblDepartment D
ON E.DEPARTMENTID = D.ID
WHERE E.ID IS NULL;

SELECT 
    E.Name
   ,E.Gender
   ,E.Salary
   ,D.DepartmentName
FROM
   tblEmployee1 E
FULL JOIN
   tblDepartment D
ON E.DEPARTMENTID = D.ID
WHERE D.ID IS NULL OR
      E.DepartmentId IS NULL;

