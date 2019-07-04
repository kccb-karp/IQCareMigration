CREATE PROC sp_PharmacyModule_GetDrugsAvailableInDispensingStore AS  
BEGIN  
  
SET NOCOUNT ON;  
  
WITH AvailableDrugs AS(  
SELECT d.Id   
, d.DrugName  
, e.DoseForm
, SUM(a.Quantity) - SUM(f.Quantity) Quantity  
FROM DrugIssued a 
INNER JOIN DrugDestination b ON a.DrugDestinationId = b.Id  
INNER JOIN DrugBatch c ON a.DrugBatchId = c.Id   
INNER JOIN ClinicalDrug d ON c.ClinicalDrugId = d.Id  
INNER JOIN DoseFormGroup e ON d.DoseFormGroupId = e.Id 
LEFT JOIN (SELECT DrugBatchId, Quantity FROM DrugAdjusted f WHERE DeleteFlag = 0 AND DrugStoreId = 1) f ON a.DrugBatchId = f.DrugBatchId
WHERE b.IsDispensingStore = 1  
AND c.ExpiryDate > GETDATE()  
AND a.DeleteFlag = 0

GROUP BY d.Id   
, d.DrugName
, e.DoseForm)  
  
SELECT a.Id Drug_Pk  
, a.DrugName  
, CONCAT(a.Id,'~', a.DrugName,'~',b.DoseForm) val  
  
FROM ClinicalDrug a INNER JOIN AvailableDrugs b ON a.Id = b.Id  
  
END