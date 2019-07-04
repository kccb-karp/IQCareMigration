CREATE PROCEDURE pr_Pharmacy_GetPatientPharmacyPrescription_CU 
(@PatientDrugPrescriptionId INT) AS
BEGIN

select a.Id PatientDrugPrescriptionId
, b.Id PatientDrugDispenseId 
, a.PatientId
, a.PatientMasterVisitId
, a.PrescriptionDate
, b.ClinicalDrugId
, b.Dose
, b.Duration
, b.PrescribedQuantity
, c.DrugName
, d.DoseForm 
, e.FrequencyCode
, null ExpiryDate

from PatientDrugPrescription a 
INNER JOIN PatientDrugDispense b ON a.Id = b.PatientDrugPrescriptionId
INNER JOIN ClinicalDrug c ON b.ClinicalDrugId = c.Id
INNER JOIN DoseFormGroup d ON c.DoseFormGroupId = d.Id
INNER JOIN DrugFrequency e ON b.DrugFrequencyId = e.Id
WHERE b.DeleteFlag = 0 AND a.DeleteFlag	 = 0
AND a.Id = @PatientDrugPrescriptionId;

END