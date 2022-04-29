-- sql server lost update problem - Part 72

--Update tblInventory set ItemsInStock = 10 where Id=1;

Set Transaction Isolation Level REPEATABLE READ

-- Transaction 1
Begin Tran
Declare @ItemsInStock int

Select @ItemsInStock = ItemsInStock
from tblInventory where Id=1

-- Transaction takes 10 seconds
Waitfor Delay '00:00:05'
Set @ItemsInStock = @ItemsInStock - 1

Update tblInventory
Set ItemsInStock = @ItemsInStock where Id=1

Print @ItemsInStock

Commit Transaction

--SELECT * FROM tblInventory;