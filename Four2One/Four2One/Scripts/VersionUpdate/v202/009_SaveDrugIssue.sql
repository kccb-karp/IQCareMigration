IF  EXISTS (SELECT * FROM sys.objects WHERE object_id 
= OBJECT_ID(N'[dbo].[sp_CU_SaveDrugIssue]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].sp_CU_SaveDrugIssue
GO

CREATE PROC [dbo].[sp_CU_SaveDrugIssue](
@destinationId varchar(100),
@dateOfIssue varchar(100),
@batchId varchar(100),
@quantity varchar(100),
@userId varchar(100)
)

AS

BEGIN

IF NOT EXISTS(SELECT * FROM DrugIssued WHERE DrugBatchId = @batchId
AND DrugDestinationId = @destinationId AND Quantity = @quantity
AND cast(DateIssued as date) = convert(datetime, @dateOfIssue, 103))
	BEGIN

	INSERT INTO DrugIssued(DrugBatchId
	, DateIssued
	, DrugDestinationId
	, Quantity
	, UserId
	, DeleteFlag
	, CreateDate)
	VALUES
	(@batchId, convert(datetime,  @dateOfIssue, 103), @destinationId, @quantity, @userId, 0, getdate())

	END

END
GO


