-- Adding a Default Constraint Part 4

INSERT INTO [dbo].[tblPerson]
           ([ID]
           ,[Name]
           ,[Email])
     VALUES
           (7,'Rich','r@r.com')
GO

ALTER TABLE tblPerson
ADD CONSTRAINT DF_tblPerson_GenderID
DEFAULT 3 FOR GenderID;

SELECT * FROM tblPerson;

ALTER TABLE tblPerson
DROP CONSTRAINT DF_tblPerson_GenderID;