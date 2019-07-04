
WITH IPTStart as (select a.Ptn_Pk as PatientPk,CASE WHEN  CONVERT(date,a.INHStartDate) = CONVERT(date, '1900-01-01 00:00:00.000') then cc.VisitDate 
else a.INHStartDate end  as IPTStartDate,a.INHEndDate,cc.VisitDate,b.VisitDate as V4Visit from dtl_TBScreening a
inner join mst_Decode c on c.ID=a.IPT
Inner Join ord_visit b On a.Visit_Pk = b.visit_id   
inner join CCCEncountersBeingMigrated cc on a.Ptn_pk = cc.Ptn_pk  and CAST(cc.VisitDate as date)=CAST(b.VisitDate as date)
where c.Name='Start IPT ')








insert into PatientIptWorkup
(PatientId
,PatientMasterVisitId
, YellowColouredUrine
, Numbness
, YellownessOfEyes
, AbdominalTenderness
, LiverFunctionTests
, DeleteFLag
, CreatedBy
, CreateDate
, StartIpt
, IptStartDate)

Select b.Id PatientId
, c.Id PatientMasterVisitId
, 0 YellowColouredUrine
, 0 Numbness
, 0 YellownessOfEyes
, 0 AbdominalTenderness
, '' LiverFunctionTests
, 0 DeleteFLag
, c.CreatedBy
, c.CreateDate
, 1 StartIpt
, a.IPTStartDate
FROM IPTStart a
INNER JOIN Patient b on a.PatientPK = b.ptn_pk
inner join PatientMasterVisit c on b.id = c.PatientId
and cast(a.IPTStartDate as date) = cast(c.visitdate as date)
and c.VisitType = 0
left join PatientIptWorkup d ON c.Id = d.PatientMasterVisitId
where d.PatientMasterVisitId IS NULL
go


UPDATE PatientIcf
SET EverBeenOnIpt = 1
WHERE PatientMasterVisitId IN 
(select PatientMasterVisitId
FROM PatientIptWorkup WHERE StartIpt = 1)


go


with IPTComplete as( select a.Ptn_Pk,pt.Id as PatientId,pmv.Id as PatientMasterVisitId,a.INHStartDate,a.INHEndDate,pmv.VisitDate,b.VisitDate as V4Visit,a.CreateDate from dtl_TBScreening a
inner join mst_Decode c on c.ID=a.IPT
INNER JOIN Patient pt on a.Ptn_pk = pt.ptn_pk
Inner Join ord_visit b On a.Visit_Pk = b.visit_id 
inner join PatientMasterVisit pmv on pmv.PatientId = pt.Id and CAST(pmv.VisitDate as date)=CAST(b.VisitDate as date)  
--inner join CCCEncountersBeingMigrated cc on a.Ptn_pk = cc.Ptn_pk  and CAST(cc.VisitDate as date)=CAST(b.VisitDate as date)
where c.Name='Completed IPT'
),
IPTDiscontinued as(
select a.Ptn_Pk,pt.Id as PatientId,pmv.Id as PatientMasterVisitId,CASE WHEN  CONVERT(date,a.INHStartDate) = CONVERT(date, '1900-01-01 00:00:00.000') then cc.VisitDate else a.INHStartDate end  as IPTStartDate,a.INHEndDate,cc.VisitDate,a.CreateDate 
,d.[Name] as ReasonofDiscontinued,CASE when d.ID is null then a.OtherReasonDeclinedIPT else d.[Name] end as [ReasonofDiscontinuation]
,b.VisitDate as V4Visit from dtl_TBScreening a
INNER JOIN Patient pt on a.Ptn_pk = pt.ptn_pk
inner join PatientMasterVisit pmv on pmv.PatientId = pt.Id
inner join mst_Decode c on c.ID=a.IPT
Inner Join ord_visit b On a.Visit_Pk = b.visit_id   
inner join CCCEncountersBeingMigrated cc on a.Ptn_pk = cc.Ptn_pk  and CAST(cc.VisitDate as date)=CAST(b.VisitDate as date)
left join mst_Decode  d on d.ID=a.IPTDiscontinued
where c.Name='Discontinued'
)

INSERT INTO  PatientIptOutcome (PatientMasterVisitId,PatientId,IptEvent,ReasonForDiscontinuation,DeleteFlag,CreatedBy,CreateDate) 
select c.PatientMasterVisitId,c.PatientId,(Select itemId from LookupItemView where ItemDisplayName='Completed' and MasterName='IptOutcome'),'' as ReasonForDiscontinuation,'0' as DeleteFlag,'1' as Createdby,
c.CreateDate
 from IPTComplete c
 union
 select d.PatientMasterVisitId,d.PatientId,((Select itemId from LookupItemView where ItemDisplayName='Discontinued' and MasterName='IptOutcome')),d.[ReasonofDiscontinuation],'0' as DeleteFlag,'1' as Createdby, 
 d.CreateDate
  from IPTDiscontinued d

UPDATE PatientIcf
SET EverBeenOnIpt = 1
WHERE PatientMasterVisitId IN 
(select PatientMasterVisitId
FROM PatientIptWorkup WHERE StartIpt = 1)
GO

GO



WITH IPTContinue as (
select a.Ptn_Pk,pmv.Id as PatientMasterVisitId,pt.Id as PatientId,v.[Weight] ,pmv.VisitDate  as PatientVisitDate ,d.Name,CASE WHEN  CONVERT(date,a.INHStartDate) = CONVERT(date, '1900-01-01 00:00:00.000') then b.VisitDate else a.INHStartDate end  as IPTStartDate,a.INHEndDate,b.VisitDate as V4Visit,a.CreateDate,
CASE WHEN d.Name='Bad >9 Missed Doses' then 'Bad()Missed9'
WHEN d.Name='Fair 4 -8 Missed Doses' then 'Fair(Missed4-8/month) '
WHEN d.Name='Good <3 Missed Doses' then 'Good(Missed<3/month)'
end as Adherence
 from dtl_TBScreening a
inner join mst_Decode c on c.ID=a.IPT
INNER JOIN Patient pt on a.Ptn_pk = pt.ptn_pk

Inner Join ord_visit b On a.Visit_Pk = b.visit_id
inner join PatientMasterVisit pmv on pmv.PatientId = pt.Id and CAST(pmv.VisitDate as date)=CAST(b.VisitDate as date)
inner join dtl_PatientVitals v on v.Visit_pk=a.Visit_Pk
inner join mst_Decode d on d.ID=a.IPTAdherence
where c.[Name]='Continue IPT'  and pmv.VisitType = 0) 


INSERT INTO PatientIpt(PatientMasterVisitId,PatientId,IptDueDate,IptDateCollected,Weight,AdheranceMeasurement,DeleteFlag,CreatedBy,CreateDate)
select c.PatientMasterVisitId,c.PatientId,c.PatientVisitDate as IPTDueDate,c.PatientVisitDate as IPTDateCollected,c.Weight,(select ItemId from LookupItemView lv where lv.ItemName =c.Adherence) as AdheranceMeasurement,0 as DeleteFlag,'1', c.CreateDate from IPTContinue c 



