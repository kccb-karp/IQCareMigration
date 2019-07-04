  
ALTER VIEW [dbo].[PatientTreatmentTrackerView]    
AS    
SELECT a.Id  
, a.PatientId  
, b.ptn_pk  
, a.ServiceAreaId  
, a.PatientMasterVisitId  
, a.RegimenStartDate  
, a.RegimenId  
, d.Name + '(' + d.DisplayName + ')' Regimen  
, a.RegimenLineId  
, e.Name RegimenLine  
 , a.DrugId  
 , a.RegimenStatusDate  
 , a.TreatmentStatusId  
 , f.Name TreatmentStatus  
 , a.ParentId  
 , a.CreateBy AS CreatedBy  
 , a.CreateDate  
 , a.DeleteFlag  
 , a.TreatmentStatusReasonId  
 , g.Name TreatmentReason  
 , case when c.DispensedByDate is null then i.PrescriptionDate end as DispensedByDate
 , h.VisitDate    
  
FROM ARVTreatmentTracker a INNER JOIN    
Patient b ON a.PatientId = b.Id  
LEFT JOIN ord_PatientPharmacyOrder c ON a.PatientMasterVisitId = c.PatientMasterVisitId    
 LEFT JOIN LookupItem d ON a.RegimenId = d.Id  
 LEFT JOIN LookupItem e ON a.RegimenLineId = e.Id  
 LEFT JOIN LookupItem f ON a.TreatmentStatusId = f.Id  
 LEFT JOIN LookupItem g ON a.TreatmentStatusReasonId = g.Id  
 INNER JOIN PatientMasterVisit h ON a.PatientMasterVisitId = h.Id
 LEFT JOIN PatientDrugPrescription i ON a.PatientMasterVisitId = i.PatientMasterVisitId AND i.DeleteFlag = 0