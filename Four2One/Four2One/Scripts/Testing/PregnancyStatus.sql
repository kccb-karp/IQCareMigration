 With V4Patients AS (select 
cc.Ptn_pk,
CAST(v.VisitDate as Date) as VisitDate,dp.Visit_pk
,CASE WHEN dp.LMP = CAST('' AS datetime) THEN NULL ELSE CAST(dp.LMP as DATE) END AS LMP
,CASE WHEN dp.EDD = CAST('' AS datetime) THEN NULL ELSE CAST(dp.EDD as DATE) END AS EDD
,dp.Pregnant,
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
WHERE mp.sex =17 and (v.DeleteFlag IS NULL OR v.DeleteFlag = 0)
and dp.Pregnant is not null  

),

PregnantStatus as (select pg.Ptn_pk,pg.VisitDate,pg.Pregnant,pg.Pregnancy_mapped_code,pg.Pregnancy_Status from(select p.Ptn_pk,p.Visit_pk,p.VisitDate,p.Pregnant,p.Pregnancy_mapped_code,p.Pregnancy_Status,ROW_NUMBER() OVER(Partition by p.Ptn_pk ,p.VisitDate
order by p.Visit_pk desc)rownum
from V4Patients p)pg where pg.rownum='1'
),






PatientLMP as(select lm.Ptn_pk,lm.LMP,lm.VisitDate from (select pp.Ptn_pk,pp.LMP,pp.VisitDate,pp.Visit_pk,ROW_NUMBER () OVER(partition by pp.Ptn_pk,pp.VisitDate
order by pp.Visit_pk desc)rownum
 from V4Patients pp
 where pp.LMP is not null)lm where lm.rownum='1'
 ),


PatientEDD as(select ed.Ptn_pk,ed.EDD,ed.VisitDate from (select pp.Ptn_pk,pp.EDD,pp.VisitDate,pp.Visit_pk,ROW_NUMBER () OVER(partition by pp.Ptn_pk,pp.VisitDate
order by pp.Visit_pk desc)rownum
 from V4Patients pp
 where pp.EDD is not null)ed where ed.rownum='1'
 ),



PatientVisit as(select p.Ptn_pk,p.VisitDate from (select p.Ptn_pk ,p.Visit_pk,p.VisitDate,ROW_NUMBER () OVER(partition by
  p.Ptn_pk,p.VisitDate order by p.Visit_pk desc) rownum  from V4Patients p
 inner join ord_Visit v on v.Visit_Id=p.Visit_pk
 )p  where p.rownum='1'),


V1Patients AS (
SELECT p.ptn_pk
,pv.Id
,pv.VisitDate
,e.PregnancyStatusId
,lm.DisplayName 


FROM [IQCareV1].[dbo].[Patient] p 
inner JOIN [IQCareV1].[dbo].[PatientMasterVisit] pv on pv.PatientId= p.id
inner JOIN  [IQCareV1].[dbo].[PregnancyIndicator] e ON e.PatientMasterVisitId = pv.Id
inner JOIN [IQCareV1].[dbo].[LookupMasterItem] lm ON lm.LookupItemId=e.PregnancyStatusId
where pv.VisitType=0  

),
V4FinalPatients as(select  v.Ptn_pk,v.VisitDate,p.Pregnant,p.Pregnancy_mapped_code,p.Pregnancy_Status,pe.EDD,lm.LMP as LMP
 from PatientVisit v
 left   join PregnantStatus p on p.Ptn_pk=v.Ptn_pk and p.VisitDate=v.VisitDate
 left join PatientEDD pe on pe.Ptn_pk=v.Ptn_pk and pe.VisitDate=V.VisitDate
 left join PatientLMP lm on lm.Ptn_pk=v.Ptn_pk and lm.VisitDate=v.VisitDate

 ),


 LineList AS 
(select a.Ptn_pk,b.PregnancyStatusId,a.Pregnancy_mapped_code,b.Id,a.VisitDate,a.EDD,a.LMP
, case when a.Pregnancy_mapped_code != b.PregnancyStatusId
or (a.Pregnancy_mapped_code is not null 
and b.PregnancyStatusId is null) 
then 1 else 0 end as DoesNotMatch

from V4FinalPatients a left join 
V1Patients b ON a.Ptn_pk = b.ptn_pk and a.VisitDate = b.VisitDate
)





SELECT 'Pregnancy Status' DataElement
, COUNT(Ptn_Pk) Total
, SUM(DoesNotMatch) DoesNotMatch
FROM LineList

