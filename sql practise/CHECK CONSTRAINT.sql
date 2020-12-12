--CHECK CONSTRAINT
SELECT * FROM [dbo].[tblPerson];
INSERT INTO tblPerson
VaLUES (5,'Sara','sys@s.com',2,-10);

DELETE  FROM [dbo].[tblPerson]
WHERE ID = 5;

INSERT INTO tblPerson
VaLUES (5,'Sara','sys@s.com',2,10);

ALTER TABLE tblPerson
DROP CONSTRAINT [CK_tblPerson_Age];

ALTER TABLE tblPerson
ADD CONSTRAINT CK_tblPerson_Age1 CHECK (Age > 0 AND Age < 150);