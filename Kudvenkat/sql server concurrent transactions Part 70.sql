-- sql server concurrent transactions - Part 70

CREATE TABLE Accounts (
  Id INT PRIMARY KEY,
  AccountName nvarchar(25) NOT NULL,
  Balance INT
);

INSERT INTO Accounts
VALUES (1,'Mark',1000),
       (2,'Mary',1000);

-- Transfer $100 from Mark to Mary Account
BEGIN TRY
    BEGIN TRANSACTION
         UPDATE Accounts SET Balance = Balance - 100 WHERE Id = 1
         UPDATE Accounts SET Balance = Balance + 100 WHERE Id = 'A'
    COMMIT TRANSACTION
    PRINT 'Transaction Committed'
END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION
    PRINT 'Transaction Rolled back'
END CATCH;

SELECT * FROM Accounts;
