-- DML Triggers - Part 43

SELECT * FROM Employee;
SELECT * FROM tblEmployeeAudit;

CREATE TABLE tblEmployeeAudit
(
  Id int identity(1,1) primary key,
  AuditData nvarchar(1000)
);

CREATE TRIGGER tr_tblEMployee_ForInsert
ON Employee
FOR INSERT
AS
BEGIN
 DECLARE @Id int
 SELECT @Id = Id from inserted

 INSERT INTO tblEmployeeAudit
 VALUES('New employee with Id ='+CAST(@Id AS NVARCHAR(5))+ 'is added at'+CAST(GETDATE() AS NVARCHAR(20)))
 END;

 INSERT INTO Employee
 VALUES (7,'Tan',2300,'Female',3);

CREATE TRIGGER tr_tblEMployee_ForDelete
ON Employee
FOR DELETE
AS
BEGIN
 DECLARE @Id int
 SELECT @Id = Id from deleted

 INSERT INTO tblEmployeeAudit
 VALUES('An existing employee with Id  ='+CAST(@Id AS NVARCHAR(5))+ 'is delated at'+CAST(GETDATE() AS NVARCHAR(20)))
 END;