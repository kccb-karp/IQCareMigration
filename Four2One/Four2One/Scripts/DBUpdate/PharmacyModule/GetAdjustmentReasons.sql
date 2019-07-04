CREATE PROC sp_PharmacyModule_GeAdjustmentReasons
AS
BEGIN

	SELECT Id
	, AdjustmentReasonName
	, NetEffect 
	FROM DrugAdjustmentReason

END