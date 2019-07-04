CREATE PROC sp_CU_GetDrugDestinations
AS
BEGIN
SELECT Id, DrugDestinationName 
FROM DrugDestination
END