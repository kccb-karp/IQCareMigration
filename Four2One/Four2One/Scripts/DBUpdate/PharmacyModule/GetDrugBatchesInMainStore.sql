CREATE PROC [dbo].[sp_PharmacyModule_GetDrugBatchesInMainStore](@clinicalDrugId varchar(100))
AS
BEGIN

WITH Received AS (
SELECT b.Id BatchId 
, b.DrugPackagingId
, SUM(a.Quantity) ReceivedQuantity
FROM DrugReceived a 
INNER JOIN DrugBatch b ON a.DrugBatchId = b.Id
WHERE b.ClinicalDrugId = @clinicalDrugId
AND a.DeleteFlag = 0
GROUP BY b.Id, b.DrugPackagingId)

, Issued AS (
SELECT b.Id BatchId 
, b.DrugPackagingId
, SUM(a.Quantity) IssuedQuantity
FROM DrugIssued a 
INNER JOIN DrugBatch b ON a.DrugBatchId = b.Id
WHERE b.ClinicalDrugId = @clinicalDrugId
AND a.DeleteFlag = 0
GROUP BY b.Id, b.DrugPackagingId)

, Adjusted AS (Select b.Id BatchId
, SUM(a.Quantity) AdjustedQuantity  FROM DrugAdjusted 
a INNER JOIN DrugBatch b ON a.DrugBatchId = b.Id
WHERE DrugStoreId = 2 AND a.DeleteFlag = 0
AND b.ClinicalDrugId = @clinicalDrugId
GROUP BY b.Id) 

, Available AS (
Select a.BatchId
, a.DrugPackagingId
, a.ReceivedQuantity - ISNULL(b.IssuedQuantity,0) - ISNULL(c.AdjustedQuantity,0) AvailableQuantity
 FROM Received a LEFT JOIN Issued b ON a.BatchId = b.BatchId
 LEFT JOIN Adjusted c ON a.BatchId = c.BatchId)

 Select a.BatchId Id
, 'BATCH ' + b.BatchNumber 
+ ' - ' + CAST(a.AvailableQuantity AS varchar(100)) 
+ CASE WHEN LiquidCapacity  > 0 THEN ' bottles (' +  CAST(LiquidCapacity as varchar(100)) + 'ml) ' ELSE
' packs of ' + CAST(UnitPackSize as varchar(100)) + 's' END
+ ' - Expiring on ' + CONVERT(VARCHAR(12), b.ExpiryDate, 107)
+ ' Available'  AvailableBatch

FROM Available a INNER JOIN DrugBatch b
 ON a.BatchId = b.Id 
 INNER JOIN DrugPackaging c ON b.DrugPackagingId = c.Id
 WHERE a.AvailableQuantity > 0 AND b.ExpiryDate > GETDATE()

END