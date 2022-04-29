-- Retrieving Identity Column Value Part 8

CREATE TABLE Test(
  ID int IDENTITY(1,1),
  Value nvarchar(20)
);

CREATE TABLE Test2(
  ID int IDENTITY(1,1),
  Value nvarchar(20)
);

INSERT INTO Test
VALUES('Nokia');

SELECT * FROM Test;
SELECT * FROM Test2;

CREATE TRIGGER trForInsert ON Test FOR INSERT
AS
BEGIN
  INSERT INTO Test2
  VALUES('Apple')
END;

SELECT SCOPE_IDENTITY(); -- Get values from same session and same scope.

SELECT @@IDENTITY; -- Same session and any scope.

SELECT IDENT_CURRENT('Test2');

