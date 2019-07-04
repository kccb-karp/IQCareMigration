alter proc [dbo].[sp_PharmacyModule_GetStockSummary] as
begin

WITH 

MyDrugs AS 
(Select a.Id ClinicalDrugId, b.Id DrugPackagingId from ClinicalDrug a INNER JOIN DrugPackaging b ON a.Id = b.ClinicalDrugId)

, Received AS (
SELECT b.Id BatchId 
, b.DrugPackagingId
, SUM(a.Quantity) ReceivedQuantity
FROM DrugReceived a 
INNER JOIN DrugBatch b ON a.DrugBatchId = b.Id
WHERE a.DeleteFlag = 0
and b.ExpiryDate > getdate()
GROUP BY b.Id, b.DrugPackagingId)

, Issued AS (
SELECT b.Id BatchId 
, b.DrugPackagingId
, SUM(a.Quantity) IssuedQuantity
FROM DrugIssued a 
INNER JOIN DrugBatch b ON a.DrugBatchId = b.Id
WHERE a.DeleteFlag = 0
GROUP BY b.Id, b.DrugPackagingId)

, Adjusted AS (Select b.Id BatchId
, SUM(a.Quantity) AdjustedQuantity  FROM DrugAdjusted 
a INNER JOIN DrugBatch b ON a.DrugBatchId = b.Id
WHERE DrugStoreId = 2 AND a.DeleteFlag = 0
GROUP BY b.Id) 

, AvailableBatch AS (
Select a.BatchId
, a.DrugPackagingId
, a.ReceivedQuantity - ISNULL(b.IssuedQuantity,0) - ISNULL(c.AdjustedQuantity,0) AvailableQuantity
 FROM Received a LEFT JOIN Issued b ON a.BatchId = b.BatchId
 LEFT JOIN Adjusted c ON a.BatchId = c.BatchId)

 , TotalByDrugIDMS AS (
Select d.ClinicalDrugId
, d.DrugPackagingId
, SUM(a.ReceivedQuantity - ISNULL(b.IssuedQuantity,0) - ISNULL(c.AdjustedQuantity,0)) AvailableQuantity
 FROM Received a LEFT JOIN Issued b ON a.BatchId = b.BatchId
 LEFT JOIN Adjusted c ON a.BatchId = c.BatchId
 INNER JOIN DrugBatch d ON a.BatchId = d.Id
 --INNER JOIN ClinicalDrug e ON d.ClinicalDrugId = e.Id
 GROUP BY d.ClinicalDrugId
, d.DrugPackagingId)

 , AvailableBatchesInMS AS
 (Select BatchId
 , AvailableQuantity
 FROM AvailableBatch 
 where AvailableQuantity > 0)

, IssuedtoDS AS (
select 
b.Id BatchId
, SUM(a.Quantity) QuantityIssed from DrugIssued
a inner join DrugBatch b on a.DrugBatchId = b.Id
where DrugDestinationid = 1
and a.DeleteFlag = 0
and b.ExpiryDate > getdate()
group by b.Id)

, Dispensed AS 
(select a.DrugBatchId
, FLOOR(SUM(DispensedQuantity/(c.UnitPackSize))) DispensedQuantity
 from PatientDrugDispense a inner join DrugBatch b on a.DrugBatchId = b.Id
 inner join DrugPackaging c ON b.ClinicalDrugId = c.ClinicalDrugId
 GROUP BY a.DrugBatchId)

, AdjustedOutOfDS AS 
(Select b.Id BatchId
, SUM(a.Quantity) AdjustedQuantity  FROM DrugAdjusted 
a INNER JOIN DrugBatch b ON a.DrugBatchId = b.Id
WHERE DrugStoreId = 1 AND a.DeleteFlag = 0
GROUP BY b.Id) 

, AvailableBatchesInDS AS (
select a.BatchId
, a.QuantityIssed - ISNULL(b.DispensedQuantity,0)
 - ISNULL(c.AdjustedQuantity,0) Available
 from IssuedtoDS a left join Dispensed b
on a.BatchId = b.DrugBatchId
left join AdjustedOutOfDS c on a.BatchId = c.BatchId)

, TotalByDrugIdDS AS (
select b.ClinicalDrugId
, b.DrugPackagingId
, SUM(Available) Available from (
select a.BatchId
, a.QuantityIssed - ISNULL(b.DispensedQuantity,0)
 - ISNULL(c.AdjustedQuantity,0) Available
 from IssuedtoDS a left join Dispensed b
on a.BatchId = b.DrugBatchId
left join AdjustedOutOfDS c on a.BatchId = c.BatchId) a
inner join DrugBatch b on a.BatchId = b.Id
group by b.ClinicalDrugId, b.DrugPackagingId) 

, TotalDrugByIdAllStores AS (
SELECT 
b.ClinicalDrugId
, b.DrugPackagingId
, SUM(ISNULL(b.AvailableQuantity,0) 
+ ISNULL(c.Available,0)) TotalQuantity 
from MyDrugs a left join TotalByDrugIDMS b on a.ClinicalDrugId = b.ClinicalDrugId and a.DrugPackagingId = b.DrugPackagingId
left join TotalByDrugIdDS c on a.ClinicalDrugId = c.ClinicalDrugId and a.DrugPackagingId = c.DrugPackagingId
GROUP BY b.ClinicalDrugId
, b.DrugPackagingId)



 Select 
 d.DrugName + CASE WHEN g.LiquidCapacity > 0 THEN ' (' +  CAST(g.LiquidCapacity as varchar(100)) + 'ml) ' ELSE
+ ' (' + CAST(g.UnitPackSize as varchar(100)) + 's)' 
	end DrugName
 , a.BatchNumber 
 , CONVERT(VARCHAR(12), a.ExpiryDate, 107) ExpiryDate
 , b.AvailableQuantity MSQuantity
 , e.AvailableQuantity MSTotal
 , c.Available DSQuantity
 , f.Available DSTotal
 , h.TotalQuantity TotalStock
FROM DrugBatch a
left join AvailableBatchesInMS b on a.Id = b.BatchId
left join AvailableBatchesInDS c on a.Id = c.BatchId
left join ClinicalDrug d on a.ClinicalDrugId = d.Id
left join TotalByDrugIDMS e on a.ClinicalDrugId = e.ClinicalDrugId AND a.DrugPackagingId = e.DrugPackagingId
left join TotalByDrugIdDS f on a.ClinicalDrugId = f.ClinicalDrugId and a.DrugPackagingId = f.DrugPackagingId
left join DrugPackaging g on a.DrugPackagingId = g.Id
left join TotalDrugByIdAllStores h ON a.ClinicalDrugId = h.ClinicalDrugId and a.DrugPackagingId = h.DrugPackagingId
where b.AvailableQuantity > 0 or c.Available > 0

order by  d.DrugName + CASE WHEN g.LiquidCapacity > 0 THEN ' (' +  CAST(g.LiquidCapacity as varchar(100)) + 'ml) ' ELSE
+ ' (' + CAST(g.UnitPackSize as varchar(100)) + 's)' 
	end

end;