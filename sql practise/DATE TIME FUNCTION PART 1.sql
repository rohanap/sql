-- DATE TIME FUNCTION

CREATE TABLE [tblDateTime]
(
 [c_time] [time](7) NULL,
 [c_date] [date] NULL,
 [c_smalldatetime] [smalldatetime] NULL,
 [c_datetime] [datetime] NULL,
 [c_datetime2] [datetime2](7) NULL,
 [c_datetimeoffset] [datetimeoffset](7) NULL
);

INSERT INTO tblDateTime
VALUES (GETDATE(),GETDATE(),GETDATE(),GETDATE(),GETDATE(),GETDATE());

UPDATE tblDateTime
SET c_datetimeoffset = '2020-12-11 12:06:11.3233333 +10:00'
WHERE c_datetimeoffset = '2020-12-11 12:06:11.3233333 +00:00';

SELECT * FROM tblDateTime;

SELECT GETDATE(); 
SELECT CURRENT_TIMESTAMP;
SELECT SYSDATETIME();
SELECT SYSDATETIMEOFFSET();
SELECT SYSTEM_USER;

