CREATE PROC sp_CU_GetDrugBatchesWithStocks(@clinicalDrugId varchar(100))
AS
BEGIN

SELECT a.Id
, 'BATCH ' + a.BatchNumber + ' : ' + CAST(a.AvailableQuantity AS varchar(100)) + ' Packs of ' + CAST(a.UnitPackSize as varchar(100)) + 's Available' AvailableBatch
 FROM (
SELECT a.Id, a.BatchNumber 
, c.UnitPackSize
, SUM(b.Quantity) AvailableQuantity
FROM DrugBatch a INNER JOIN DrugReceived b ON a.Id = b.DrugBatchId
INNER JOIN DrugPackaging c ON a.DrugPackagingid = c.Id
WHERE a.ExpiryDate > GETDATE()
AND a.ClinicalDrugId = @clinicalDrugId
GROUP BY a.Id, a.BatchNumber, c.UnitPackSize) a

END