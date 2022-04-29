-- sql server dirty read example - Part 71

Create table tblInventory
(
    Id int identity primary key,
    Product nvarchar(100),
    ItemsInStock int
)
Go

Insert into tblInventory values ('iPhone', 10);

Begin Tran
Update tblInventory set ItemsInStock = 9 where Id=1

-- Billing the customer
Waitfor Delay '00:00:15'
-- Insufficient Funds. Rollback transaction

Rollback Transaction;

Select * from tblInventory where Id=1;

-- Transaction 2 :
Set Transaction Isolation Level Read Uncommitted
Select * from tblInventory where Id=1;

Select * from tblInventory (NOLOCK) where Id=1;
