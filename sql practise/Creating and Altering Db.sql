--CREATE DB
CREATE DATABASE Sample1;

USE Sample1;

--RENAME DB USING QUERY,SP
ALTER DATABASE Sample1
MODIFY NAME = Sample;

EXECUTE sp_renamedb 'Sample','Sample1';

--DROP DATABSE
DROP DATABASE Sample;