UPDATE PatientDrugDispense SET DispenseDate = CreateDate 
where DispenseDate is not null and deleteFlag = 0
and cast(DispenseDate as date) = cast('2019-03-11' as date)
GO

ALTER PROC [dbo].[sp_CU_SaveDispense]
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
, DispenseDate = getdate()
, DispensedBy = @userId
, DrugBatchId = @batchId
WHERE Id = @drugDispenseId

end;