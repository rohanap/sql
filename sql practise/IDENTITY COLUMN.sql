--IDENTITY COLUMN

SELECT * FROM [dbo].[tblPerson1];

INSERT INTO  [dbo].[tblPerson1]
VALUES ('Ron');

DELETE FROM [dbo].[tblPerson1]
WHERE PERSONID = 1;

INSERT INTO  [dbo].[tblPerson1]
VALUES ('Tom'),
       ('Sara'),
       ('Harry');

INSERT INTO  [dbo].[tblPerson1]
VALUES (1,'Jane');

SET IDENTITY_INSERT tblPerson1 ON;

INSERT INTO  [dbo].[tblPerson1] (PersonId,Name)
VALUES (1,'Jane');

SET IDENTITY_INSERT tblPerson1 OFF;

DBCC CHECKIDENT('tblPerson1',RESEED,0) -- IF YOU HAVE DELETE ALL THE ROWS AND YOU WANT TO RESET THE IDENTITY COLUMN
 