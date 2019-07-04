CREATE PROCEDURE [dbo].sp_CU_GetPharmacyQueue
AS  
BEGIN  

WITH a AS (SELECT a.Id
, c.DrugName
 FROM PatientDrugPrescription a
INNER JOIN PatientDrugDispense b ON a.Id = b.PatientDrugPrescriptionId 
INNER JOIN ClinicalDrug c ON b.ClinicalDrugId = c.Id
WHERE b.DeleteFlag = 0)

, pharmCSV as (
SELECT b.Id
, STUFF((SELECT ',' + DrugName FROM a where a.id = b.id FOR XML PATH ('')), 1, 1, '')  Prescription
FROM a b
GROUP BY b.Id)

SELECT DISTINCT d.Id DrugPrescriptionId
, c.IdentifierValue PatientId
, convert(varchar(100), decryptbykey(a.FirstName)) 
+ ' ' 
+ convert(varchar(100), decryptbykey(a.LastName )) 
+ ' (' + CAST(CAST(DATEDIFF(dd,a.DateOfBirth, GETDATE())/365.25 as decimal(18,1)) as varchar(10)) + 'y)' Patient
, CAST(DATEDIFF(dd,a.DateOfBirth, GETDATE())/365.25 as decimal(18,1)) Age
, CONVERT(varchar(15), CAST(d.PrescriptionDate AS time), 100) PrescriptionTime
, e.Prescription PrescriptionSummary
, d.CreateDate
FROM Person a 
INNER JOIN Patient b ON a.Id = b.PersonId
LEFT JOIN (SELECT PatientId, IdentifierValue FROM PatientIdentifier
WHERE IdentifierTypeId = 1) c ON b.Id = c.PatientId
INNER JOIN PatientDrugPrescription d ON b.Id = d.PatientId
INNER JOIN pharmCSV e ON d.Id = e.Id
LEFT JOIN PatientDrugDispense f ON d.Id = f.PatientDrugPrescriptionId AND f.DeleteFlag = 0
WHERE f.DispenseDate IS NULL
ORDER BY d.CreateDate 
END