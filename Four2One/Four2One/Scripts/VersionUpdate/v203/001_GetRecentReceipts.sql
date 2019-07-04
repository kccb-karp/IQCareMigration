IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_PharmacyModule_GetRecentReceipts]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].sp_PharmacyModule_GetRecentReceipts
GO

CREATE PROC [dbo].[sp_PharmacyModule_GetRecentReceipts] 
AS
BEGIN


SELECT a.Id DrugReceivedId 
, c.DrugName + ' (' + CASE WHEN LiquidCapacity  > 0 THEN CAST(LiquidCapacity as varchar(100)) + 'ml bottles' ELSE
CAST(UnitPackSize as varchar(100)) + 's' END + ')' DrugDetails
, 'Batch: ' + b.BatchNumber+ ', Expires On: ' +  convert(varchar, b.ExpiryDate, 107) BatchDetails
, e.DrugSourceName
, CASE WHEN f.Id IS NULL THEN 1 ELSE 0 END AS CanEdit
, a.Quantity
FROM DrugReceived a INNER JOIN DrugBatch b on a.DrugBatchId = b.Id
INNER JOIN ClinicalDrug c ON b.ClinicalDrugId = c.Id
INNER JOIN DrugPackaging d ON b.DrugPackagingId = d.Id
INNER JOIN DrugSource e ON a.DrugSourceId = e.Id
LEFT JOIN (SELECT DISTINCT Id, DrugBatchId FROM DrugIssued WHERE DeleteFlag = 0) f ON a.DrugBatchId = f.DrugBatchId
WHERE a.DeleteFlag = 0
ORDER BY a.CreateDate DESC

END;