CREATE proc sp_PharmacyModule_GetReceipt(@drugReceiptId varchar(100))
as
begin

select a.Id DrugReceiptId
, CONVERT(varchar(10), DateReceived, 101) ReceiptDate
, c.DrugName
, a.DrugSourceId
, c.Id DrugId
, b.BatchNumber
 from DrugReceived a inner join DrugBatch b On a.DrugBatchId = b.Id
 inner join ClinicalDrug c on b.ClinicalDrugId = c.Id
 
where a.Id = @drugReceiptId

end