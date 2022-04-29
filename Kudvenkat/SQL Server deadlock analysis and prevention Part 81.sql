-- SQL Server deadlock analysis and prevention Part 81

ALTER procedure spTransaction1
as
Begin
    Begin Tran
    Update TableA Set Name = 'Mark Transaction 1' where Id = 1
    Waitfor delay '00:00:05'
    Update TableB Set Name = 'Mary Transaction 1' where Id = 1
    Commit Transaction
End

ALTER procedure spTransaction2
as
Begin
    Begin Tran
	Update TableA Set Name = 'Mary Transaction 2' where Id = 1
	Waitfor delay '00:00:05'
    Update TableB Set Name = 'Mark Transaction 2' where Id = 1
   
    
    Commit Transaction
End

SELECT * FROM TableA
SELECT * FROM TableB