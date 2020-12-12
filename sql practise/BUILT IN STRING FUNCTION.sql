-- BUILT IN STRING FUNCTION

SELECT ASCII('A');

SELECT CHAR(65);

DECLARE @Start int = 65
WHILE (@Start <= 90)
BEGIN
  PRINT CHAR(@Start)
  SET @Start = @Start + 1
END;

DECLARE @Start int = 97
WHILE (@Start <= 122)
BEGIN
  PRINT CHAR(@Start)
  SET @Start = @Start + 1
END;

SELECT  LTRIM('       Hello');
SELECT  RTRIM('Hello      ');
SELECT  RTRIM(LTRIM('       Hello   '));
SELECT  UPPER('Hello');
SELECT  LOWER('Hello');
SELECT  REVERSE('Hello');
SELECT  LEN('Hello');
