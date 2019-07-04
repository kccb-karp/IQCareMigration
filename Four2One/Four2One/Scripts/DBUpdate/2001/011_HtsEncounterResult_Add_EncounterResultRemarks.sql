IF NOT EXISTS (SELECT *  FROM sys.all_columns  
	WHERE name = 'EncounterResultRemarks' 
	AND Object_ID = OBJECT_ID(N'HtsEncounter'))
BEGIN 
	ALTER TABLE [dbo].[HtsEncounterResult] 
	ADD EncounterResultRemarks varchar(50) NULL
END