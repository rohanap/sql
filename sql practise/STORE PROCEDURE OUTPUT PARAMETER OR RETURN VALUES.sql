-- STORE PROCEDURE OUTPUT PARAMETER OR RETURN VALUES

SELECT * FROM tblEmployee1;

CREATE PROC spGetTotalCount1
@TotalCount int Output
AS
BEGIN 
   SELECT @TotalCount = COUNT(ID) FROM tblEmployee1
END;

DECLARE @Total int
EXECUTE spGetTotalCount1 @Total output
Print @Total

CREATE PROC spGetTotalCount2
AS
BEGIN 
   return (SELECT COUNT(ID) FROM tblEmployee1)
END;

DECLARE @Total int
EXECUTE @Total = spGetTotalCount2
PRINT @Total;

CREATE PROC spGetNameById1
@Id int,
@Name nvarchar(20) output
AS
BEGIN 
   SELECT @Name = Name FROM tblEmployee1 WHERE  ID = @Id
END;

DECLARE @Name nvarchar(20)
EXECUTE spGetNameById1 1,@Name OUT
PRINT 'Name = '+ @Name;

CREATE PROC spGetNameById2
@Id int
AS
BEGIN 
   RETURN (SELECT  Name FROM tblEmployee1 WHERE  ID = @Id)
END;

DECLARE @Name nvarchar(20)
EXECUTE @Name = spGetNameById2 1
PRINT 'Name = '+ @Name;
