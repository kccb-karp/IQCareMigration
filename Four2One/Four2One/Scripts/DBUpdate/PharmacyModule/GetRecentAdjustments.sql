CREATE PROC sp_PharmacyModule_GetRecentAdjustments
AS
BEGIN
SELECT a.Id DrugAdjustedId 
, c.DrugName + ' (' + CASE WHEN LiquidCapacity  > 0 THEN CAST(LiquidCapacity as varchar(100)) + 'ml bottles' ELSE
CAST(UnitPackSize as varchar(100)) + 's' END + ')' DrugDetails

, 'Batch: ' + b.BatchNumber + ' In ' + e.DrugStoreName 
+ ' - On: ' +  convert(varchar, a.DateAdjusted, 107) 
+ ' - Down by: ' +  cast(a.Quantity as varchar(100)) BatchDetails
, f.AdjustmentReasonName AdjustmentReason


FROM DrugAdjusted a INNER JOIN DrugBatch b on a.DrugBatchId = b.Id
INNER JOIN ClinicalDrug c ON b.ClinicalDrugId = c.Id
INNER JOIN DrugPackaging d ON b.DrugPackagingId = d.Id
INNER JOIN DrugStore e ON a.DrugStoreId = e.Id
INNER JOIN DrugAdjustmentReason f ON a.DrugAdjustmentReasonId = f.Id
WHERE a.DeleteFlag = 0

ORDER BY a.CreateDate DESC

END