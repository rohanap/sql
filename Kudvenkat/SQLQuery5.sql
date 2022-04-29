-- Identity Column Part 7

--SET IDENTITY_INSERT tblPerson ON;

DBCC CHECKIDENT(tblPerson, RESEED, 0); 