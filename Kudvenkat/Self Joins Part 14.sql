-- Self Joins Part 14

CREATE TABLE tblEmp (
  EmployeeID INT NOT NULL,
  Name nvarchar(50),
  ManagerID INT
);

INSERT INTO tblEmp VALUES(1,'Mike',3);
INSERT INTO tblEmp VALUES(2,'Rob',1);
INSERT INTO tblEmp VALUES(3,'Todd',NULL);
INSERT INTO tblEmp VALUES(4,'Ben',1);
INSERT INTO tblEmp VALUES(5,'Sam',1);


SELECT emp.Name,m.Name as manager
FROM tblEmp emp
INNER JOIN tblEmp m
ON emp.ManagerID = m.EmployeeID;

SELECT emp.Name,m.Name as manager
FROM tblEmp emp
LEFT JOIN tblEmp m
ON emp.ManagerID = m.EmployeeID;