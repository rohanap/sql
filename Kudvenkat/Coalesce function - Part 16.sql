-- Coalesce function - Part 16 
-- Return 1st NON NULL value

SELECT ID, COALESCE(Name,DepartmentId )
FROM tblEmployee1;


