-- All About SELECT Part 10

SELECT * FROM tblPerson;

SELECT DISTINCT City,Name FROM tblPerson;

SELECT * FROM tblPerson
WHERE City = 'Japan';

SELECT * FROM tblPerson
WHERE City  != 'Japan';

SELECT * FROM tblPerson
WHERE Age IN (10,23,45);

SELECT * FROM tblPerson
WHERE Age BETWEEN 10 AND 45;

SELECT * FROM tblPerson
WHERE City LIKE 'L%';

SELECT * FROM tblPerson
WHERE Email NOT LIKE '%@%';

SELECT * FROM tblPerson
WHERE Email LIKE '_@_.com';

SELECT * FROM tblPerson
WHERE Name LIKE '[jmk]%';

SELECT * FROM tblPerson
WHERE Name LIKE '[^jmk]%';

SELECT * FROM tblPerson
WHERE (City = 'London' OR City = 'Japan') AND Age > 25;

SELECT TOP 1 PERCENT *
FROM tblPerson;

SELECT * FROM tblPerson
ORDER BY Name;