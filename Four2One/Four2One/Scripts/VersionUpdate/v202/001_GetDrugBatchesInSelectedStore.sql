IF  EXISTS (SELECT * FROM sys.objects WHERE object_id 
= OBJECT_ID(N'[dbo].[sp_PharmacyModule_GetDrugBatchesInSelectedStore]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].sp_PharmacyModule_GetDrugBatchesInSelectedStore
GO


CREATE proc [dbo].[sp_PharmacyModule_GetDrugBatchesInSelectedStore](@clinicalDrugId varchar(100), @storeId varchar(100))
as
begin

if(@storeId = 1)
	begin

	WITH Issued AS (
	SELECT b.Id BatchId 
	, b.DrugPackagingId
	, SUM(a.Quantity*c.UnitPackSize) IssuedQuantity
	FROM DrugIssued a 
	INNER JOIN DrugBatch b ON a.DrugBatchId = b.Id
	inner join DrugPackaging c on b.DrugPackagingId = c.Id
	WHERE b.ClinicalDrugId = @clinicalDrugId
	GROUP BY b.Id, b.DrugPackagingId)

	, Dispensed AS 
	(select DrugBatchId
	, SUM(DispensedQuantity) DispensedQuantity
	 from PatientDrugDispense a inner join DrugBatch b on a.DrugBatchId = b.Id
	 where b.ClinicalDrugId = @clinicalDrugId
	 GROUP BY DrugBatchId)

	 , Adjusted AS (Select b.Id BatchId
	, SUM(a.Quantity) AdjustedQuantity  FROM DrugAdjusted 
	a INNER JOIN DrugBatch b ON a.DrugBatchId = b.Id
	WHERE DrugStoreId = 1 AND a.DeleteFlag = 0
	AND b.ClinicalDrugId = @clinicalDrugId
	GROUP BY b.Id) 

	, Available AS (
	Select a.BatchId
	, a.DrugPackagingId
	, a.IssuedQuantity - ISNULL(b.DispensedQuantity,0) - ISNULL(c.AdjustedQuantity,0) AvailableQuantity
	 FROM Issued a LEFT JOIN Dispensed b ON a.BatchId = b.DrugBatchId
	 LEFT JOIN Adjusted c ON a.BatchId = c.BatchId)

	 Select a.BatchId Id
	, 'BATCH ' + b.BatchNumber 
	+ ' - ' + CAST(FLOOR(a.AvailableQuantity/c.UnitPackSize) AS varchar(100)) 
	+ ' Packs of ' + CAST(c.UnitPackSize as varchar(100)) 
	+ 's - Expiring on ' + CONVERT(VARCHAR(12), b.ExpiryDate, 107)
	+ ' Available'  AvailableBatch

	FROM Available a INNER JOIN DrugBatch b
	 ON a.BatchId = b.Id 
	 INNER JOIN DrugPackaging c ON b.DrugPackagingId = c.Id
	 WHERE a.AvailableQuantity > 0 AND b.ExpiryDate > GETDATE()

	end

if(@storeId = 2)
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
	, a.ReceivedQuantity - ISNULL(b.IssuedQuantity,0) - ISNULL(c.AdjustedQuantity, 0)  AvailableQuantity
	 FROM Received a LEFT JOIN Issued b ON a.BatchId = b.BatchId
	 LEFT JOIN Adjusted c ON a.BatchId = c.BatchId )

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
end
