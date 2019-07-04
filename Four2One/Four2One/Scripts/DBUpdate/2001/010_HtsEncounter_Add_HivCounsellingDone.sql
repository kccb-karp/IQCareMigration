IF NOT EXISTS (SELECT *  FROM sys.all_columns  
	WHERE name = 'HivCounsellingDone' 
	AND Object_ID = OBJECT_ID(N'HtsEncounter'))
BEGIN 
ALTER TABLE [dbo].[HtsEncounter] ADD HivCounsellingDone INT NULL
END