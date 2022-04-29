-- Replicate, Space, Patindex, Replace and Stuff functions - Part 24

 SELECT REPLICATE('Pragim', 3);

 SELECT REPLICATE(Name, 2) FROM tblPerson;

 SELECT * FROM tblPerson;
 SELECT PATINDEX('%@%',Email) FROM tblPerson;

 SELECT Name, SUBSTRING(Email,1,PATINDEX('%@%',Email)-1)+REPLICATE('*',5)+ SUBSTRING(Email,PATINDEX('%@%',Email),LEN(EMAIL)-PATINDEX('%@%',Email)+1) 
 FROM tblPerson;

  SELECT REPLACE(Email,'.COM','.net') FROM tblPerson;


