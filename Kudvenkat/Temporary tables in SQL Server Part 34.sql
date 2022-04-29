-- Temporary tables in SQL Server - Part 34

USE Sample;

Create Table #PersonDetails
(Id int, 
 Name nvarchar(20)
);

Insert into #PersonDetails Values(1, 'Mike');
Insert into #PersonDetails Values(2, 'John');
Insert into #PersonDetails Values(3, 'Todd');

Select * from #PersonDetails;

Select name from tempdb..sysobjects 
where name like '#PersonDetails%';

DROP TABLE #PersonDetails;


Create Procedure spCreateLocalTempTable
as
Begin
Create Table #PersonDetails(Id int, Name nvarchar(20))

Insert into #PersonDetails Values(1, 'Mike')
Insert into #PersonDetails Values(2, 'John')
Insert into #PersonDetails Values(3, 'Todd')

Select * from #PersonDetails
End;

EXEC spCreateLocalTempTable;

Select * from #PersonDetails;

Create Table ##EmployeeDetails
(Id int, 
 Name nvarchar(20)
);
