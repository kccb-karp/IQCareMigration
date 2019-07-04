CREATE PROC sp_PharmacyModule_DeleteDrugIssue(@drugIssueId varchar(100))
AS
BEGIN

UPDATE DrugIssued
SET 
DeleteFlag = 1
WHERE Id = @drugIssueId

END