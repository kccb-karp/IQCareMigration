CREATE PROC sp_PharmacyModule_GetPrescriptionFields
(@PatientMasterVisitId as varchar(100))
AS

BEGIN

SELECT DISTINCT a.Id, TreatmentProgramId 
, b.TreatmentStatusId
, b.TreatmentStatusReasonId
, b.RegimenLineId
, b.RegimenId
, CONVERT(VARCHAR(10), a.PrescriptionDate, 105) PrescriptionDate
, CONVERT(VARCHAR(10), c.DispenseDate, 105) DispenseDate
FROM PatientDrugPrescription a INNER JOIN ARVTreatmentTracker b ON a.PatientMasterVisitId = b.PatientMasterVisitId
INNER JOIN PatientDrugDispense c ON a.Id = c.PatientDrugPrescriptionId
WHERE a.PatientMasterVisitId = @PatientMasterVisitId

END