CREATE PROC sp_CU_GetDrugSources
AS
BEGIN
SELECT Id, DrugSourceName  
FROM DrugSource
END