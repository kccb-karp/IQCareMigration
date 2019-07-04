IF  EXISTS (SELECT * FROM sys.objects WHERE object_id 
= OBJECT_ID(N'[dbo].[sp_CU_SaveDrugReceipt]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].sp_CU_SaveDrugReceipt
GO

CREATE PROC [dbo].[sp_CU_SaveDrugReceipt] (
@clinicalDrugId varchar(100)
,@packagingId varchar(100)
,@drugSourceId varchar(100)
, @batchNumber varchar(100)
, @quantity varchar(100)
, @dateOfReceipt varchar(100)
, @dateOfExpiry varchar(100)
, @userId varchar(100))

AS

BEGIN
declare @drugBatchId as int = 0;
--Check Batch Name
IF NOT EXISTS(Select * FROM DrugBatch WHERE BatchNumber = @batchNumber)
BEGIN
INSERT INTO DrugBatch (BatchNumber, ClinicalDrugId, DrugPackagingId, ExpiryDate)
VALUES
(@batchNumber, @clinicalDrugId, @packagingId, convert(datetime, @dateOfExpiry, 103))
END

SELECT @drugBatchId = Id FROM DrugBatch WHERE BatchNumber = @batchNumber;

IF NOT EXISTS(Select * FROM DrugReceived WHERE DrugBatchId = @drugBatchId AND DrugSourceId = @drugSourceId
AND cast(DateReceived as date) = convert(datetime, @dateOfReceipt,103) and Quantity = @quantity)
BEGIN

INSERT INTO DrugReceived (DrugBatchId, DateReceived, DrugSourceId, Quantity, UserId, DeleteFlag, CreateDate)
VALUES
(@drugBatchId, convert(datetime, @dateOfReceipt, 103), @drugSourceId, @quantity, @userId, 0, getdate())

END


END
GO


