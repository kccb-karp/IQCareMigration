CREATE PROC sp_CU_GetBatchQuantity(@batchId varchar(1000))
AS
BEGIN

SELECT a.Id DrugBatchId
, SUM(Quantity) BatchQuantity 
FROM DrugBatch a INNER JOIN DrugReceived b On a.Id = b.DrugBatchId
WHERE a.Id = @batchId
GROUP BY a.Id 

END
