-- Snapshot isolation level in sql server - Part 75

SELECT * FROM tblInventory;

--Transaction 1
Set transaction isolation level serializable
Begin Transaction
Update tblInventory set ItemsInStock = 5 where Id = 1
waitfor delay '00:00:10'
Commit Transaction

-- Transaction 2
Set transaction isolation level serializable
Select ItemsInStock from tblInventory where Id = 1