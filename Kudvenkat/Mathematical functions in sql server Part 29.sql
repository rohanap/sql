-- Mathematical functions in sql server - Part 29

SELECT ABS(-007);

Select CEILING(15.2); -- Returns 16
Select CEILING(-15.2); -- Returns -15

Select FLOOR(15.2); -- Returns 15
Select FLOOR(-15.2); -- Returns -16

Select POWER(2,3);

SELECT SQUARE(9);

SELECT SQRT(81);

SELECT RAND();

SELECT FLOOR(RAND()*100);

DECLARE @COUNTER INT
SET @COUNTER = 1

WHILE (@COUNTER <=10)
  BEGIN
       PRINT FLOOR(RAND()*100)
	   SET @COUNTER = @COUNTER + 1
  END

-- Round to 2 places after (to the right) the decimal point
Select ROUND(850.556, 2) -- Returns 850.560

-- Truncate anything after 2 places, after (to the right) the decimal point
Select ROUND(850.556, 2, 1) -- Returns 850.550

-- Round to 1 place after (to the right) the decimal point
Select ROUND(850.556, 1) -- Returns 850.600

-- Truncate anything after 1 place, after (to the right) the decimal point
Select ROUND(850.556, 1, 1) -- Returns 850.500

-- Round the last 2 places before (to the left) the decimal point
Select ROUND(850.556, -2) -- 900.000

-- Round the last 1 place before (to the left) the decimal point
Select ROUND(850.556, -1) -- 850.000