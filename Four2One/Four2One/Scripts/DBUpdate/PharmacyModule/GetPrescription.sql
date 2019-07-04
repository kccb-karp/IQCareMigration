CREATE proc sp_PharmacyModule_GetPrescription(@drugPrescriptionId varchar(100))  
as  
begin  
WITH AvailableBatches AS (  
SELECT   
a.ClinicalDrugId  
, '<option value="'+cast(a.Id as varchar(100))+'"> ' + a.BatchNumber + ' : Expiring on ' + CONVERT(VARCHAR(12), a.ExpiryDate, 107) + ' </option>' opt  
  
FROM DrugBatch a INNER JOIN 

(SELECT DrugBatchId, SUM(Quantity) IssuedQuantity 
FROM DrugIssued 
WHERE DeleteFlag = 0 
GROUP BY DrugBatchId) b ON a.id = b.DrugBatchId
LEFT JOIN 

(SELECT DrugBatchId, SUM(Quantity) AdjustedQuantity 
FROM DrugAdjusted f WHERE DeleteFlag = 0 AND DrugStoreId = 1
GROUP BY DrugBatchId) c ON a.Id = c.DrugBatchId
LEFT JOIN (
Select DrugBatchId, SUM(DispensedQuantity)/(MAX(c.UnitPackSize)*1.0) DispensedQuantity 
FROM PatientDrugDispense a INNER JOIN DrugBatch b ON a.DrugBatchId = b.Id
INNER JOIN DrugPackaging c ON b.DrugPackagingId = c.Id
GROUP BY DrugBatchId)  d ON a.Id = d.DrugBatchId
WHERE b.IssuedQuantity - ISNULL(c.AdjustedQuantity,0) - ISNULL(d.DispensedQuantity,0) > 0
AND a.ExpiryDate > GETDATE())


  
, batch AS (  
Select ClinicalDrugId   
,  
REPLACE((   
REPLACE(STUFF((SELECT '' + opt FROM AvailableBatches a where a.ClinicalDrugId = b.ClinicalDrugId FOR XML PATH ('')), 1, 0, '')   
,'&lt;','<')),'&gt;','>') batchOptions  
  
FROM AvailableBatches b  
GROUP BY ClinicalDrugId)  
  
SELECT b.Id DrugDispenseId   
, c.Id ClinicalDrugId  
, c.DrugName  
, b.Duration  
, b.PrescribedQuantity  
, CASE WHEN d.batchOptions IS NULL THEN '<option value="0">No Batch Available</option>'  
ELSE '<option value="0">Select</option>' + d.batchOptions  
END AS BatchOptions  
  
, b.PrescriptionComment  
, b.Dose  
, e.FrequencyDescription  
  
FROM PatientDrugPrescription a  
INNER JOIN PatientDrugDispense b ON a.Id = b.PatientDrugPrescriptionId AND b.DeleteFlag = 0  
INNER JOIN ClinicalDrug c ON b.ClinicalDrugId = c.Id  
LEFT JOIN batch d ON c.Id = d.ClinicalDrugId  
INNER JOIN DrugFrequency e ON b.DrugFrequencyId = e.Id  
WHERE a.Id = @drugPrescriptionId  
  
end