--CASCADING REFERENTIAL INTEGRITY

SELECT * FROM [dbo].[tblGender];
SELECT * FROM [dbo].[tblPerson];

DELETE  FROM [dbo].[tblGender]
WHERE ID = 2;