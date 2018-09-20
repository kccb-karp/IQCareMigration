--Script to test migration of WHO stage
WITH _V4WHOStage as
(select 
a.Ptn_pk
,cast(c.VisitDate as date)VisitDate
,CASE
	WHEN d.Name IN ('1','I','T1') THEN 1
	WHEN d.Name IN ('2','II','T2') THEN 2
	WHEN d.Name IN ('3','III','T3') THEN 3
	WHEN d.Name IN ('4','IV','T4') THEN 4
ELSE NULL END AS WHOStageV4
from IQCareV4.dbo.CCCPatientsBeingMigrated a
inner join IQCareV4.dbo.dtl_PatientStage b on a.Ptn_pk=b.Ptn_pk
inner join IQCareV4.dbo.ord_Visit c on b.Ptn_pk=c.Ptn_pk and b.Visit_Pk=c.Visit_Id
inner join  IQCareV4.dbo.mst_Decode d on b.WHOStage=d.ID
where (c.DeleteFlag =0 or c.DeleteFlag is null))

, V4WHOStage AS
(SELECT Ptn_pk
, VisitDate
, MAX(WHOStageV4) WHOStageV4 FROM _V4WHOStage
GROUP BY  Ptn_pk
, VisitDate)



,V1WHOStage as (select 
a.PatientId
,b.ptn_pk
,cast(c.VisitDate as date)VisitDate
,case when d.Name='Stage1' then 1
when d.Name='Stage2' then 2
when d.Name='Stage3' then 3
when d.Name='Stage4' then 4 else null end As WHOStageV1
  from IQCareV1.dbo.PatientWHOStage a
 inner join IQCareV1.dbo.Patient b on a.PatientId=b.Id
 inner join IQCareV1.dbo.PatientMasterVisit c on a.PatientMasterVisitId=c.Id
 inner join IQCareV1.dbo.LookupItem d on a.WHOStage=d.Id
 where c.VisitType=0)

,linelist as( SELECT a.Ptn_pk,
       a.VisitDate,
       a.WHOStageV4,
       b.WHOStageV1,
       CASE
           WHEN a.WHOStageV4 !=b.WHOStageV1 
		   OR (a.WHOStageV4 IS NOT NULL AND b.WHOStageV1 IS NULL)
		   THEN 1
           ELSE 0
       END AS DoesNotMatch
FROM V4WHOStage a
LEFT JOIN V1WHOStage b ON a.Ptn_pk=b.ptn_pk
WHERE a.Ptn_pk=b.ptn_pk
  AND a.VisitDate=b.VisitDate)

select 
'WHO Stage' DataElement
,count( Ptn_pk)Total
,Sum(DoesNotMatch)DoesNotMatch
from linelist 


