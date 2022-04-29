-- Check Constraint Part 6

SELECT * FROM tblPerson;

INSERT INTO tblPerson
VALUES (8,'Sara','s@s.com',2,10);

INSERT INTO tblPerson
VALUES (8,'Sara','s@s.com',2,NULL);

ALTER TABLE tblPerson
ADD CONSTRAINT CK_tblPerson_Age
CHECK (Age > 0 AND Age < 150);

ALTER TABLE tblPerson
DROP CONSTRAINT CK_tblPerson_Age;


