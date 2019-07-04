--ALTER TABLE PatientDrugDispense ADD DrugBatchId INT NULL

CREATE PROC sp_CU_SaveDispense
(@dispenseDate varchar(100)
,@userId varchar(100)
,@drugDispenseId varchar(100)
,@batchId varchar(100)
,@quantityDispensed varchar(100)
)
as
begin


UPDATE PatientDrugDispense
SET 
DispensedQuantity = CAST(@quantityDispensed as decimal(18,1))
, DispenseDate = CAST(@dispenseDate as datetime)
, DispensedBy = @userId
, DrugBatchId = @batchId
WHERE Id = @drugDispenseId

end

