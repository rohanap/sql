-- Scalar User Defined Functions in sql server - Part 30

CREATE FUNCTION CalculateAge(@DOB Date)  
RETURNS INT  
AS  
BEGIN  
DECLARE @Age INT 

 SET @Age = DATEDIFF(YEAR, @DOB, GETDATE()) - 
            CASE 
			  WHEN (MONTH(@DOB) > MONTH(GETDATE())) OR 
			  (MONTH(@DOB) = MONTH(GETDATE()) AND DAY(@DOB) > DAY(GETDATE())) 
			  THEN 1 ELSE 0 
			END  
 RETURN @Age  
END;

SELECT  [dbo].[CalculateAge] ('08/29/1994');

SELECT Id,Name,DateOfBirth, [dbo].[CalculateAge] (DateOfBirth) AS Age 
FROM tblEmpBirth;

SELECT Id,Name,DateOfBirth, [dbo].[CalculateAge] (DateOfBirth) AS Age 
FROM tblEmpBirth
WHERE [dbo].[CalculateAge] (DateOfBirth) > 30;