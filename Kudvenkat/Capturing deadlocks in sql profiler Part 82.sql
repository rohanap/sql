-- Capturing deadlocks in sql profiler Part 82

BEGIN TRAN

  UPDATE TableA SET Name = 'Mary Transaction 1'
  WHERE Id = 1;


  UPDATE TableB SET Name = 'Mary Transaction 1'
  WHERE Id = 1;

COMMIT TRAN


BEGIN TRAN

  UPDATE TableB SET Name = 'Mary Transaction 2'
  WHERE Id = 1;


  UPDATE TableA SET Name = 'Mary Transaction 2'
  WHERE Id = 1;

COMMIT TRAN


--HoBt ID : Heap Or Binary Tree ID. Using this ID query sys.partitions view to find the database objects involved in the deadlock.
SELECT object_name([object_id])
FROM sys.partitions
WHERE hobt_id = 72057594046971904 --72057594047037440


