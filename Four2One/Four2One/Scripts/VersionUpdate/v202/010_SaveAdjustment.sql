IF  EXISTS (SELECT * FROM sys.objects WHERE object_id 
= OBJECT_ID(N'[dbo].[sp_PharmacyModule_SaveAdjustment]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].sp_PharmacyModule_SaveAdjustment
GO


CREATE proc [dbo].[sp_PharmacyModule_SaveAdjustment](
@batchId varchar(100)  
, @storeId varchar(100)
, @adjustmentReasonId varchar(100)  
, @dateOfAdjustment varchar(100)  
, @quantity varchar(100)  
, @userId varchar(100))  
as  
begin  
  
 if not exists (select * from DrugAdjusted where DrugBatchId = @batchId  
 and DrugAdjustmentReasonId = @adjustmentReasonId  
 and cast(DateAdjusted as date) = convert(datetime, @dateOfAdjustment, 103)
 and DrugStoreId = @storeId)  
 begin  
  insert into DrugAdjusted(DrugBatchId,DrugStoreId, DateAdjusted, DrugAdjustmentReasonId, Quantity, UserId, DeleteFlag, CreateDate)  
  values  
  (@batchId, @storeId, convert(datetime, @dateOfAdjustment,103), @adjustmentReasonId, @quantity, @userId, 0, getdate())  
 end  
end  
  
  
  
GO


