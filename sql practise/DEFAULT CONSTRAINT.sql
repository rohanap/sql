--DEFAULT CONSTRAINT
SELECT * FROM [dbo].[tblGender];
SELECT * FROM [dbo].[tblPerson];

INSERT INTO tblPerson (ID,Name,Email)
VALUES (4,'Ron','r@r.com');

ALTER TABLE tblPerson
ADD CONSTRAINT DF_tblPerson_GenderID
DEFAULT 3 FOR GenderId;

ALTER TABLE tblPerson
DROP CONSTRAINT DF_tblPerson_GenderID;

