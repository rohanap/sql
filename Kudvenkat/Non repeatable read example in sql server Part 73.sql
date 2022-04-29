-- Non repeatable read example in sql server - Part 73

-- Transaction 1
Set transaction isolation level repeatable read

Begin Transaction
Select ItemsInStock from tblInventory where Id = 1

-- Do Some work
waitfor delay '00:00:10'

Select ItemsInStock from tblInventory where Id = 1
Commit Transaction