-- DateTime functions in SQL Server - Part 25

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
VALUES (GETDATE(),GETDATE(),GETDATE(),GETDATE(),
GETDATE(),GETDATE());

SELECT * FROM tblDateTime;

SELECT GETDATE();
SELECT CURRENT_TIMESTAMP;
SELECT SYSDATETIME();
SELECT SYSDATETIMEOFFSET();
SELECT GETUTCDATE();
SELECT SYSUTCDATETIME();