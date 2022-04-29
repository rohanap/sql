-- DatePart, DateAdd and DateDiff functions in SQL Server - Part 27

SELECT GETDATE();

SELECT DATEPART(WEEKDAY,'2021-11-04 18:21:59.217');
SELECT DATENAME(WEEKDAY,'2021-11-04 18:21:59.217');

SELECT DATEADD(DAY,20,'2021-11-04 18:21:59.217');
SELECT DATEADD(DAY,-20,'2021-11-04 18:21:59.217');

SELECT DATEDIFF(MONTH,'2021-11-04 18:21:59.217','2021-08-04 18:21:59.217');
SELECT DATEDIFF(DAY,'2021-11-04 18:21:59.217','2021-08-04 18:21:59.217');


CREATE TABLE tblEmpBirth(
    Id int NOT NULL,
	Name nvarchar(20) NOT NULL,
	DateOfBirth datetime DEFAULT GETDATE()
);

INSERT INTO tblEmpBirth
VALUES(1,'Sam','1980-12-30 00:00:00.000'),(2,'Pam','1982-09-01 12:02:36.260'),
       (3,'John','1985-08-22 12:03:30.370'),
	   (4,'Sara','1979-11-29 12:59:30.670'),
	   (5,'Bruce','1994-08-29 12:00:00.000');

SELECT * FROM tblEmpBirth;



------------------
CREATE FUNCTION fnComputeAge(@DOB DATETIME)
RETURNS NVARCHAR(50)
AS
BEGIN

DECLARE @tempdate DATETIME, @years INT, @months INT, @days INT


SELECT @tempdate = @DOB

SELECT @years = DATEDIFF(YEAR, @tempdate, GETDATE()) - 
                   CASE 
				     WHEN (MONTH(@DOB) > MONTH(GETDATE())) OR 
					      (MONTH(@DOB) = MONTH(GETDATE()) AND DAY(@DOB) > DAY(GETDATE()))
				     THEN 1 ELSE 0 END
SELECT @tempdate = DATEADD(YEAR, @years, @tempdate)

SELECT @months = DATEDIFF(MONTH, @tempdate, GETDATE()) - 
                   CASE 
				     WHEN DAY(@DOB) > DAY(GETDATE()) 
				   THEN 1 ELSE 0 END
SELECT @tempdate = DATEADD(MONTH, @months, @tempdate)

SELECT @days = DATEDIFF(DAY, @tempdate, GETDATE())

  DECLARE @Age nvarchar(50)
  SET @Age = CAST(@years AS NVARCHAR(4)) + ' Years' + CAST(@months AS NVARCHAR(4))+ ' Months' + CAST(@days AS NVARCHAR(4)) +' Days old'
  
  return @Age
END


SELECT DBO.fnComputeAge('08/29/1994');

SELECT Id,Name,DateOfBirth, DBO.fnComputeAge(DateOfBirth) AS Age FROM tblEmpBirth;