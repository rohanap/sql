-- Unique key Constraint Part 9

SELECT * FROM tblPerson;
DELETE FROM tblPerson
WHERE ID =3;

ALTER TABLE tblPerson
ADD CONSTRAINT UQ_tblPerson_Email
UNIQUE(Email);

ALTER TABLE tblPerson
DROP CONSTRAINT UQ_tblPerson_Email;

