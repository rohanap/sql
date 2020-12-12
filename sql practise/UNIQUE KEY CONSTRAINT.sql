-- UNIQUE KEY CONSTRAINT

SELECT * FROM [dbo].[tblPerson];

UPDATE  tblPerson
SET EMAIL = 'r@rr.com'
WHERE ID = 7;

ALTER TABLE tblPerson
ADD CONSTRAINT UQ_tblPerson_Email
UNIQUE (Email);

ALTER TABLE tblPerson
DROP CONSTRAINT UQ_tblPerson_Email;