-- Transactions in SQL Server - Part 57

Create Table MailingAddress
(
   AddressId int NOT NULL primary key,
   EmployeeNumber int,
   HouseNumber nvarchar(50),
   StreetAddress nvarchar(50),
   City nvarchar(10),
   PostalCode nvarchar(50)
);

Insert into MailingAddress 
values (1, 101, '#10', 'King Street', 'Londoon', 'CR27DW');


Create Table PhysicalAddress
(
 AddressId int NOT NULL primary key,
 EmployeeNumber int,
 HouseNumber nvarchar(50),
 StreetAddress nvarchar(50),
 City nvarchar(10),
 PostalCode nvarchar(50)
);

Insert into PhysicalAddress
values (1, 101, '#10', 'King Street', 'Londoon', 'CR27DW');


Create Procedure spUpdateAddress
as
Begin
 Begin Try
  Begin Transaction
   Update MailingAddress set City = 'LONDON' 
   where AddressId = 1 and EmployeeNumber = 101
   
   Update PhysicalAddress set City = 'LONDON' 
   where AddressId = 1 and EmployeeNumber = 101
  Commit Transaction
 End Try
 Begin Catch
  Rollback Transaction
 End Catch
End;

SELECT * FROM MailingAddress;
SELECT * FROM PhysicalAddress;

Alter Procedure spUpdateAddress
as
Begin
 Begin Try
  Begin Transaction
   Update MailingAddress set City = 'LONDON12' 
   where AddressId = 1 and EmployeeNumber = 101
   
   Update PhysicalAddress set City = 'LONDON LONDON' 
   where AddressId = 1 and EmployeeNumber = 101
  Commit Transaction
 End Try
 Begin Catch
  Rollback Transaction
 End Catch
End;
