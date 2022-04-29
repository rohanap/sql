-- Writing re-runnable sql server scripts - Part 66

Use [Sample]
If not exists (select * from information_schema.tables where table_name = 'Employee')
Begin
 Create table Employee
 (
  ID int identity primary key,
  Name nvarchar(100),
  Gender nvarchar(10),
  DateOfBirth DateTime
 )
 Print 'Table Employee successfully created'
End
Else
Begin
 Print 'Table Employee already exists'
End;

IF OBJECT_ID('Employee') IS NULL
Begin
   -- Create Table Script
   Print 'Table tblEmployee created'
End
Else
Begin
   Print 'Table tblEmployee already exists'
End;

Use [Sample]
IF OBJECT_ID('Employee') IS NOT NULL
Begin
 Drop Table Employee
End
Create table Employee
(
 ID int identity primary key,
 Name nvarchar(100),
 Gender nvarchar(10),
 DateOfBirth DateTime
);

Use [Sample]
if not exists(Select * from INFORMATION_SCHEMA.COLUMNS where COLUMN_NAME='EmailAddress' and TABLE_NAME = 'Employee' and TABLE_SCHEMA='dbo') 
Begin
 ALTER TABLE Employee
 ADD EmailAddress nvarchar(50)
End
Else
Begin
 Print 'Column EmailAddress already exists'
End;

If col_length('Employee','EmailAddress') is not null
Begin
 Print 'Column already exists'
End
Else
Begin
 Print 'Column does not exist'
End;
