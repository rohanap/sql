--  List all tables in a sql server database using a query - Part 65

-- Gets the list of tables only
Select * from SYSOBJECTS where XTYPE='U'
-- Gets the list of tables only
Select * from  SYS.TABLES
-- Gets the list of tables and views
Select * from INFORMATION_SCHEMA.TABLES

Select Distinct XTYPE from SYSOBJECTS

/* AF = Aggregate function (CLR)

C = CHECK constraint

D = Default or DEFAULT constraint

F = FOREIGN KEY constraint

L = Log

FN = Scalar function

FS = Assembly (CLR) scalar-function

FT = Assembly (CLR) table-valued function

IF = In-lined table-function

IT = Internal table

P = Stored procedure

PC = Assembly (CLR) stored-procedure

PK = PRIMARY KEY constraint (type is K)

RF = Replication filter stored procedure

S = System table

SN = Synonym

SQ = Service queue

TA = Assembly (CLR) DML trigger

TF = Table function

TR = SQL DML Trigger

TT = Table type

U = User table

UQ = UNIQUE constraint (type is K)

V = View

X = Extended stored procedure