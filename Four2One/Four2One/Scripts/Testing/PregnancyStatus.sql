With V4Patients AS (select 
cc.Ptn_pk,
CAST(v.VisitDate as Date) as VisitDate,
dp.LMP,
dp.EDD,
dp.Pregnant,
Case when dp.Pregnant=89 or dp.Pregnant = 1 then 'Yes' 
     when dp.Pregnant=90 or dp.Pregnant = 0 or dp.Pregnant = 9 then 'No'
	 when dp.Pregnant=91 then 'No - Induced Abortion'
	 when dp.Pregnant=92 then 'No - Miscarriage (mc)'
	 else 'NULL' end  as Pregnancy_Status
, Case when dp.Pregnant=89 or dp.Pregnant = 1  then '82' 
     when dp.Pregnant=90 or dp.Pregnant = 0 or dp.Pregnant = 9 then '84'
	 when dp.Pregnant=91 then '85'
	 when dp.Pregnant=92 then '86'
	 else NULL end  as Pregnancy_mapped_code
FROM IQCareV4.dbo.CCCPatientsBeingMigrated cc 
INNER JOIN  IQCareV4.dbo.mst_Patient mp ON mp.Ptn_Pk=cc.Ptn_pk
INNER JOIN IQCareV4.dbo.dtl_PatientClinicalStatus  dp  ON  cc.Ptn_Pk=cc.Ptn_Pk
INNER JOIN IQCareV4.dbo.ord_Visit v 
ON cc.Ptn_Pk = v.Ptn_Pk AND dp.Visit_Pk = v.Visit_Id
WHERE mp.sex =17  
and dp.Pregnant is not null  
)

,V1Patients AS (


SELECT p.ptn_pk
,pv.VisitDate
,e.PregnancyStatusId
,lm.DisplayName 

FROM [IQCareV1].[dbo].[Patient] p 
INNER JOIN [IQCareV1].[dbo].[PatientMasterVisit] PV on pv.PatientId= p.id
INNER JOIN  [IQCareV1].[dbo].[PregnancyIndicator] e ON e.PatientMasterVisitId  = pv.Id
INNER JOIN [IQCareV1].[dbo].[LookupMasterItem] lm ON lm.LookupItemId=e.PregnancyStatusId
)
, LineList AS 
(select a.Ptn_pk
, case when a.Pregnancy_mapped_code != b.PregnancyStatusId
or (a.Pregnancy_mapped_code is not null 
and b.PregnancyStatusId is null) 
then 1 else 0 end as DoesNotMatch
from V4Patients a left join 
V1Patients b ON a.Ptn_pk = b.ptn_pk and a.VisitDate = b.VisitDate)


SELECT 'Pregnancy Status' DataElement
, COUNT(Ptn_Pk) Total
, SUM(DoesNotMatch) DoesNotMatch
FROM LineList


