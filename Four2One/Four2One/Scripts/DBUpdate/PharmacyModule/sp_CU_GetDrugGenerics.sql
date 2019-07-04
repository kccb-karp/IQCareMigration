IF EXISTS(SELECT * FROM sys.procedures WHERE name = N'sp_CU_GetDrugGenerics')
DROP PROC sp_CU_GetDrugGenerics
GO

CREATE PROC sp_CU_GetDrugGenerics AS
BEGIN

SET NOCOUNT ON;

SELECT a.Id Drug_Pk
, a.DrugName
, CONCAT(a.Id,'~', a.DrugName) val

FROM ClinicalDrug a

END