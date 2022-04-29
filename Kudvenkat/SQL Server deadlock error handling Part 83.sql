-- SQL Server deadlock error handling Part 83

ALTER procedure spTransaction1
as
Begin
    Begin Tran
	BEGIN TRY
      Update TableA Set Name = 'Mark Transaction 1' where Id = 1
      Waitfor delay '00:00:05'
      Update TableB Set Name = 'Mary Transaction 1' where Id = 1
      Commit Transaction
	  SELECT 'Transaction Successful!'
	END TRY
	BEGIN CATCH
	  if(ERROR_NUMBER() = 1205)
	  BEGIN
	    SELECT 'Deadlock.'
	  END
	  Rollback
	END CATCH
End

ALTER procedure spTransaction2
as
Begin
    Begin Tran
	BEGIN TRY
	  Update TableB Set Name = 'Mark Transaction 2' where Id = 1
      Waitfor delay '00:00:05'
      Update TableA Set Name = 'Mary Transaction 2' where Id = 1
      Commit Transaction
	   SELECT 'Transaction Successful!'
	END TRY
	BEGIN CATCH
	  if(ERROR_NUMBER() = 1205)
	  BEGIN
	    SELECT 'Deadlock.'
	  END
	  Rollback
	END CATCH
End

EXEC spTransaction1;
EXEC spTransaction2;