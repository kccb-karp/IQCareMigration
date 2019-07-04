CREATE PROC sp_PharmacyModule_GetDrugGenerics AS  
BEGIN  
  
SET NOCOUNT ON;  
  
SELECT a.Id Drug_Pk  
, a.DrugName  
, CONCAT(a.Id,'~', a.DrugName,'~',b.DoseForm) val  
  
FROM ClinicalDrug a  inner join DoseFormGroup b on a.DoseFormGroupId = b.Id
  
END