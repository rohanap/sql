-- Creating and Working with tables Part 3
USE [Sample]
GO

CREATE TABLE tblGender (
  ID int NOT NULL PRIMARY KEY,
  Gender nvarchar(50) NOT NULL
);

INSERT INTO tblGender
VALUES (
         1,'Make',2,'Female'
		 );

ALTER TABLE tblPerson
ADD CONSTRAINT tblPerson_GenderID_FK
FOREIGN KEY (GenderID) 
REFERENCES tblGender (ID);