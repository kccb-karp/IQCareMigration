  ALTER VIEW [dbo].[gcPatientView]  
AS  

WITH IPTDispense AS (select a.PatientId
, case when a.OrderedByDate is null then a.DispensedByDate else a.OrderedByDate end DateDispensed  
from ord_PatientPharmacyOrder a inner join dtl_PatientPharmacyOrder b on a.ptn_pharmacy_pk = b.ptn_pharmacy_pk  
inner join mst_Drug c on b.Drug_Pk = c.Drug_pk  
where c.DrugName like 'Isoniazid%' and a.DeleteFlag = 0 
and case when a.OrderedByDate is null then a.DispensedByDate else a.OrderedByDate end  is not null
union  
select a.PatientId
, c.PrescriptionDate 
from PatientDrugDispense a inner join ClinicalDrug b on a.ClinicalDrugId = b.Id  
inner join PatientDrugPrescription c on a.PatientDrugPrescriptionId = c.Id   
where b.DrugName LIKE 'Isoniazid%' and a.DeleteFlag = 0)   
  
, IPTStart AS (  
 Select a.PatientId  
 , Min(a.DateDispensed) IPTStartDate  
 , MAX(a.DateDispensed) LastIPTDispense  
 From IPTDispense a    
 Group By a.PatientId)  

SELECT DISTINCT pt.Id  
 ,pt.PersonId  
 ,pt.ptn_pk  
 ,pclinic.[IdentifierValue] as [PatientClinicId]  
 ,pni.IdentifierValue EnrollmentNumber  
 ,pt.PatientIndex  
 ,CAST(DECRYPTBYKEY(pn.FirstName) AS VARCHAR(50)) AS FirstName  
 ,CAST(DECRYPTBYKEY(pn.MidName) AS VARCHAR(50)) AS MiddleName  
 ,CAST(DECRYPTBYKEY(pn.LastName) AS VARCHAR(50)) AS LastName  
 ,pn.Sex  
 ,pn.Active  
 ,pt.RegistrationDate  
 ,ISNULL(pe.EnrollmentDate, convert(datetime,'1900-06-15') ) AS [EnrollmentDate],  
 pe.CareEnded  
 ,ISNULL(CAST((  
    CASE pe.CareEnded  
     WHEN 0  
      THEN 'Active'  
     WHEN 1  
      THEN (  
        SELECT TOP 1 ItemName  
        FROM LookupItemView  
        WHERE MasterName = 'CareEnded'  
         AND ItemId = ptC.ExitReason  
        )  
     ELSE 'Not Enrolled'  
     END  
    ) AS VARCHAR(50)), 'Active') AS PatientStatus  
 ,ptC.ExitReason  
 ,pt.DateOfBirth  
 ,CAST(DECRYPTBYKEY(pt.NationalId) AS VARCHAR(50)) AS NationalId  
 ,pt.FacilityId  
 ,pt.PatientType  
 ,pe.TransferIn  
 ,(CAST(DECRYPTBYKEY((SELECT top 1 MobileNumber FROM PersonContact WHERE PersonId=pn.Id)) AS VARCHAR(20))) AS MobileNumber  

 ,ISNULL((  
   SELECT TOP (1) ScreeningValueId  
   FROM dbo.PatientScreening  
   WHERE (PatientId = pt.Id)  
    AND (  
     ScreeningTypeId IN (  
      SELECT Id  
      FROM dbo.LookupMaster  
      WHERE (Name = 'TBStatus')  
      )  
     )  
   ORDER BY Id DESC  
   ), 0) AS TBStatus  

 ,ISNULL((  
   SELECT TOP (1) ScreeningValueId  
   FROM dbo.PatientScreening AS PatientScreening_1  
   WHERE (PatientId = pt.Id)  
    AND (  
     ScreeningTypeId IN (  
      SELECT Id  
      FROM dbo.LookupMaster AS LookupMaster_1  
      WHERE (Name = 'NutritionStatus')  
      )  
     )  
   ORDER BY Id DESC  
   ), 0) AS NutritionStatus  

 ,ISNULL((  
   SELECT TOP (1) Categorization  
   FROM dbo.PatientCategorization  
   WHERE (PatientId = pt.Id)  
   ORDER BY id DESC  
   ), 0) AS Categorization  

 ,ISNULL(pt.DobPrecision, 0) AS DobPrecision 

 , CASE WHEN ipt.PatientId IS NULL THEN 'NOT STARTED' ELSE 'STARTED ON ' + CONVERT(varchar, ipt.IPTStartDate, 106) END AS IPTStatus

FROM dbo.Patient AS pt  
INNER JOIN dbo.Person AS pn ON pn.Id = pt.PersonId  
INNER JOIN dbo.PatientEnrollment AS pe ON pt.Id = pe.PatientId  
INNER JOIN dbo.PatientIdentifier AS pni ON pni.PatientId = pt.Id  
INNER JOIN dbo.Identifiers ON pni.IdentifierTypeId = dbo.Identifiers.Id  

LEFT  JOIN  
(select pid.PatientId,pid.PatientEnrollmentId  
,pid.IdentifierValue,pid.IdentifierTypeId,iid.DisplayName from PatientIdentifier pid  
INNER JOIN Identifiers iid on iid.Id=pid.IdentifierTypeId where iid.Code='PatientClinicId') pclinic on pclinic.PatientId=pt.Id  

LEFT OUTER JOIN (  
 SELECT a.PatientId  
 ,a.ExitReason  
 FROM dbo.PatientCareending a   
 INNER JOIN (SELECT PatientId, MAX(ExitDate) ExitDate   
 FROM dbo.PatientCareending  
 GROUP BY PatientId ) b ON a.PatientId = b.PatientId  
 AND a.ExitDate = b.ExitDate  
 where deleteflag=0) AS ptC ON pt.Id = ptC.PatientId  

LEFT JOIN IPTStart ipt ON pt.Id = ipt.PatientId  

WHERE  (dbo.Identifiers.Name = 'CCC Registration Number')   
AND  (pn.DeleteFlag = 0)   
And Pt.DeleteFlag=0  and pe.ServiceAreaId = 1  
  