ALTER PROC [dbo].[sp_CU_SaveDrugIssue](
@destinationId varchar(100),
@dateOfIssue varchar(100),
@batchId varchar(100),
@quantity varchar(100),
@userId varchar(100)
)

AS

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
GO