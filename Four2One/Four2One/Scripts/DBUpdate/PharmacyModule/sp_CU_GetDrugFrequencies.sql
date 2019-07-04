IF EXISTS (Select * FROM sys.procedures where name = N'sp_CU_GetDrugFrequencies')
DROP PROC sp_CU_GetDrugFrequencies
GO

CREATE PROC sp_CU_GetDrugFrequencies AS

BEGIN

SET NOCOUNT ON;

SELECT Id, FrequencyCode, Multiplier FROM DrugFrequency

END