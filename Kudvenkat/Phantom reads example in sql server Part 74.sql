-- Phantom reads example in sql server - Part 74

Create table Employees
(
    Id int primary key,
    Name nvarchar(50)
)
Go

Insert into Employees values(1,'Mark');
Insert into Employees values(3, 'Sara');
Insert into Employees values(100, 'Mary');


-- Transaction 1
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
BEGIN TRAN
SELECT * FROM Employees
WHERE ID BETWEEN 1 AND 3

WAITFOR DELAY '00:00:10'

SELECT * FROM Employees
WHERE ID BETWEEN 1 AND 3
COMMIT TRAN


-- Transaction 2

INSERT INTO Employees
VALUES (2,'Emma');

DELETE FROM Employees
WHERE ID = 2;

