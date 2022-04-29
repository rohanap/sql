-- Different ways to replace NULL Part 15

SELECT emp.Name,ISNULL(m.Name,'Manager') as manager
FROM tblEmp emp
LEFT JOIN tblEmp m
ON emp.ManagerID = m.EmployeeID;

SELECT emp.Name, 
      CASE 
	    when m.name IS NULL THEN 'Manager'
	    ELSE m.name 
	  END as manager
FROM tblEmp emp
LEFT JOIN tblEmp m
ON emp.ManagerID = m.EmployeeID;

SELECT emp.Name,COALESCE( m.name, 'Manager') as Manager
FROM tblEmp emp
LEFT JOIN tblEmp m
ON emp.ManagerID = m.EmployeeID;