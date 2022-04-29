-- Built in string functions in sql server 2008 - Part 22

SELECT ASCII('A');

PRINT CHAR(65);

DECLARE @Number int
SET @Number = 1
WHILE(@Number <= 255)
BEGIN
  Print CHAR(@Number)
  SET @Number = @Number + 1
END

Declare @Number1 int
Set @Number1 = 65
While(@Number1 <= 90)
Begin
 Print lower( CHAR(@Number1))
 Set @Number1 = @Number1 + 1
End

Select LTRIM('   Hello');
Select RTRIM('Hello   ');
Select LOWER('CONVERT This String Into Lower Case');
Select UPPER('CONVERT This String Into upper Case');
Select REVERSE('ABCDEFGHIJKLMNOPQRSTUVWXYZ');
Select LEN('SQL Functions   ');
SELECT CHARINDEX('t', 'Customer') AS MatchPosition;
SELECT CHARINDEX('OM', 'Customer') AS MatchPosition;
SELECT CONCAT('W3Schools', '.com');
SELECT CONCAT_WS('-', 'www', 'W3Schools', 'com');
SELECT 'W3Schools' + '.com';
SELECT 'SQL' + ' ' + 'is' + ' ' + 'fun!';
SELECT DATALENGTH('W3Schools.com');
SELECT DATALENGTH('2017-08');
SELECT DIFFERENCE('Juice', 'Jucy');
SELECT DIFFERENCE('Juice', 'Banana');
DECLARE @d DATETIME = '12/01/2018';
SELECT FORMAT (@d, 'd', 'en-US') AS 'US English Result',
               FORMAT (@d, 'd', 'no') AS 'Norwegian Result',
               FORMAT (@d, 'd', 'zu') AS 'Zulu Result';

SELECT FORMAT(123456789, '##-##-#####');
SELECT LEFT('SQL Tutorial', 3) AS ExtractString;
SELECT PATINDEX('%schools%', 'W3Schools.com');
SELECT PATINDEX('%s%com%', 'W3Schools.com');
SELECT PATINDEX('%[ol]%', 'W3Schools.com');
SELECT PATINDEX('%[z]%', 'W3Schools.com');
SELECT QUOTENAME('abcdef');
SELECT QUOTENAME('abcdef', '[]');
SELECT REPLACE('SQL Tutorial', 'T', 'M');
SELECT REPLACE('SQL Tutorial', 'SQL', 'HTML');
SELECT REPLICATE(' SQL Tutorial', 5);
SELECT RIGHT('SQL Tutorial', 3) AS ExtractString;
SELECT SOUNDEX('Juice'), SOUNDEX('Jucy');
SELECT SPACE(10);
SELECT STR(185);
SELECT STUFF('SQL Tutorial', 1, 3, 'HTML');
SELECT TRIM('     SQL Tutorial!     ') AS TrimmedString;