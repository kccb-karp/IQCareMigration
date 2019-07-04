create proc sp_PharmacyModule_DeleteDrugAdjustment(@drugAdjustmentId varchar(100))
as
begin
 update DrugAdjusted
 set DeleteFlag = 1
 where Id = @drugAdjustmentId
end