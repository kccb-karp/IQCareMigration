CREATE PROC sp_PharmacyModule_GetRecentIssues
AS
BEGIN
SELECT a.Id DrugIssuedId 
, 
'Issued ' + c.DrugName + ' (' + CASE WHEN LiquidCapacity  > 0 THEN CAST(LiquidCapacity as varchar(100)) + 'ml bottles' ELSE
CAST(UnitPackSize as varchar(100)) + 's' END + ')' DrugDetails

, 'Batch: ' + b.BatchNumber
+ ', On: ' +  convert(varchar, a.DateIssued, 107) BatchDetails
, 'To: ' +  e.DrugDestinationName DrugDestinationName
, CASE WHEN f.DrugBatchId IS NULL THEN 1 ELSE 0 END AS CanEdit

FROM DrugIssued a INNER JOIN DrugBatch b on a.DrugBatchId = b.Id
INNER JOIN ClinicalDrug c ON b.ClinicalDrugId = c.Id
INNER JOIN DrugPackaging d ON b.DrugPackagingId = d.Id
INNER JOIN DrugDestination e ON a.DrugDestinationId = e.Id
LEFT JOIN

(SELECT DISTINCT DrugBatchId FROM PatientDrugDispense WHERE DeleteFlag = 0) f ON a.DrugBatchId = f.DrugBatchId
WHERE a.DeleteFlag = 0

ORDER BY a.CreateDate DESC

END