-- IsDate, Day, Month, Year and DateName DateTime functions in SQL Server - Part 26

Select ISDATE('PRAGIM') -- returns 0
Select ISDATE(Getdate()) -- returns 1
Select ISDATE('2012-08-31 21:02:04.167') -- returns 1
Select ISDATE('2012-09-01 11:34:21.1918447') -- returns 0.

Select DAY(GETDATE()) -- Returns the day number of the month, based on current system datetime.
Select DAY('11/04/2021') -- Returns 4

Select Month(GETDATE()) -- Returns the Month number of the year, based on the current system date and time
Select Month('11/04/2021') -- Returns 11
Select Year(GETDATE()) -- Returns the year number, based on the current system date
Select Year('11/04/2021') -- Returns 2021

Select DATENAME(Day, '2021-11-04 12:43:46.837') -- Returns 30
Select DATENAME(WEEKDAY, '2021-11-04 12:43:46.837') -- Returns Sunday
Select DATENAME(MONTH, '2021-11-04 12:43:46.837') -- Returns September