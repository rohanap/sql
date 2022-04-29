-- Read committed snapshot isolation level in sql server - Part 76


--Transaction 1
Set transaction isolation level Read Committed
Begin Transaction
Update tblInventory set ItemsInStock = 5 where Id = 1
waitfor delay '00:00:10'
Commit Transaction

-- Transaction 2
Set transaction isolation level read committed
Begin Transaction
Select ItemsInStock from tblInventory where Id = 1
Commit Transaction

--Step 1 : Turn off READ_COMMITTED_SNAPSHOT
Alter database SampleDB SET READ_COMMITTED_SNAPSHOT OFF

--Step 2 : Enable snapshot isolation level at the database level
Alter database SampleDB SET ALLOW_SNAPSHOT_ISOLATION ON

/*Step 3 : Execute Transaction 1 first and then Transaction 2 simultaneously. 
           Just like in the previous example, notice that the Transaction 2 is not blocked. 
		   It immediately returns the committed data that is in the database before Transaction 1 started.
*/


--Transaction 1
Set transaction isolation level Read Committed
Begin Transaction
Update tblInventory set ItemsInStock = 5 where Id = 1
waitfor delay '00:00:10'
Commit Transaction

-- Transaction 2
Set transaction isolation level snapshot
Begin Transaction
Select ItemsInStock from tblInventory where Id = 1
Commit Transaction