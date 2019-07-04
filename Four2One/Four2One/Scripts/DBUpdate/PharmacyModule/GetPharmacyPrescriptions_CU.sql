CREATE PROCEDURE [dbo].[pr_Pharmacy_GetPharmacyPrescriptions_CU] 
AS  
BEGIN  

SELECT DISTINCT b.Id PatientPK
, c.IdentifierValue PatientId
, convert(varchar(100), decryptbykey(a.FirstName)) FirstName
, convert(varchar(100), decryptbykey(a.LastName )) LastName
, CAST(DATEDIFF(dd,a.DateOfBirth, GETDATE())/365.25 as decimal(18,1)) Age
, d.Id PatientDrugPrescriptionId
, d.PatientMasterVisitId
, CONVERT(varchar(15), CAST(d.PrescriptionDate AS time), 100) TimeOrdered
FROM Person a 
INNER JOIN Patient b ON a.Id = b.PersonId
LEFT JOIN (SELECT PatientId, IdentifierValue FROM PatientIdentifier
WHERE IdentifierTypeId = 1) c ON b.Id = c.PatientId
INNER JOIN PatientDrugPrescription d ON b.Id = d.PatientId
LEFT JOIN PatientDrugDispense e ON d.Id = e.PatientDrugPrescriptionId AND e.DeleteFlag = 0
WHERE CAST(d.PrescriptionDate as date) = 
CAST(GETDATE() as date)
AND e.DispensedBy IS NULL
END  