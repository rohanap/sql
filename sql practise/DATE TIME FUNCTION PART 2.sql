-- DATE TIME FUNCTION

SELECT ISDATE('HELLO');
SELECT ISDATE(GETDATE());

SELECT DAY(GETDATE());
SELECT MONTH(GETDATE());
SELECT YEAR(GETDATE());

SELECT DATENAME(WEEKDAY,GETDATE());
SELECT DATENAME(MONTH,GETDATE());

Select Name, DateOfBirth, DateName(WEEKDAY,DateOfBirth) as [Day], 
            Month(DateOfBirth) as MonthNumber, 
            DateName(MONTH, DateOfBirth) as [MonthName],
            Year(DateOfBirth) as [Year]
From   tblEmployees