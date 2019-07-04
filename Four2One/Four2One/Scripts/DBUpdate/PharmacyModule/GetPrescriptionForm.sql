CREATE PROC sp_PharmacyModule_GetPrescriptionForm (@PatientMasterVisitId varchar(100))

AS
BEGIN

SELECT c.Id ClinicalDrugId
, c.DrugName
, b.Dose
, b.Duration
, b.PrescribedQuantity
, b.PrescriptionComment
, b.DrugFrequencyId
, e.FrequencyCode
, b.DispensedQuantity
, d.Id BatchId
, d.BatchNumber
 FROM PatientDrugPrescription a 
LEFT JOIN PatientDrugDispense b ON a.Id = b.PatientDrugPrescriptionId
INNER JOIN ClinicalDrug c ON b.ClinicalDrugId = c.Id 
LEFT JOIN DrugBatch d ON b.DrugBatchId = d.Id
INNER JOIN DrugFrequency e ON b.DrugFrequencyId = e.Id

where a.PatientMasterVisitId = @PatientMasterVisitId

and b.DeleteFlag = 0;

END