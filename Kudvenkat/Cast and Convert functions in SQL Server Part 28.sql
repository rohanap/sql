-- Cast and Convert functions in SQL Server - Part 28

Select Id, Name, DateOfBirth, CAST(DateofBirth as nvarchar) as ConvertedDOB
from tblEmpBirth;

Select Id, Name, DateOfBirth, Convert(nvarchar, DateOfBirth,103) as ConvertedDOB
from tblEmpBirth;

SELECT CONVERT(VARCHAR(10),GETDATE(),101);

SELECT CAST(GETDATE() as DATE);
SELECT CONVERT(DATE, GETDATE());

SELECT Id,Name,Name + ' - '+ CAST(Id AS nvarchar) AS 'Name -Id'
FROM tblEmpBirth;