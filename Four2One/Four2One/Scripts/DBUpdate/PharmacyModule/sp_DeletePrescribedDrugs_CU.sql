IF EXISTS(Select * FROM sys.procedures WHERE name = N'sp_DeletePrescribedDrugs_CU')
DROP PROC sp_DeletePrescribedDrugs_CU
GO

CREATE PROC sp_DeletePrescribedDrugs_CU
(
@PatientDrugPrescriptionId INT
)

AS

BEGIN

UPDATE PatientDrugDispense SET DeleteFlag = 1
WHERE [PatientDrugPrescriptionId] = @PatientDrugPrescriptionId;

END