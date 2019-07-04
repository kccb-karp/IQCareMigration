CREATE PROC sp_PharmacyModule_DeleteDrugReceipt(@drugReceiptId varchar(100))  
AS  
BEGIN  
declare @batchId as int;
set @batchId = (SELECT DrugBatchId FROM DrugReceived WHERE Id = @drugReceiptId);

UPDATE DrugReceived  
SET   
DeleteFlag = 1  
WHERE Id = @drugReceiptId;

IF NOT EXISTS(Select * from DrugReceived where DrugBatchId = @batchId AND DeleteFlag = 0)
UPDATE DrugBatch SET BatchNumber = '' 
, DeleteFlag = 1
WHERE Id = @batchId;
  
END