if exists(select name from sys.tables where name = 'x_CareEnding')
drop table x_CareEnding
go

create table x_CareEnding
( PatientId Int NULL
, CareEnded int null
, ExitReason varchar(1000) null
, DeathDate date null
, DeathReason varchar(1000) null
, DeathReasonOther varchar(1000) null
, ExitDate date null
, TransferTo varchar(1000) null
, CreateDate date null)
go

insert into x_CareEnding
select distinct 
b.Id PatientId
, a.CareEnded
, CASE WHEN d.Name = 'Transfer to another LPTF' THEN 263
	WHEN  d.Name = 'Lost to follow-up' THEN 544 
	WHEN  d.Name = 'Death' THEN 262 
	WHEN  d.Name LIKE '%HIV%Negative%' THEN 264 
	
	ELSE NULL END ExitReason
, cast(a.DeathDate as date) DeathDate
, e.Name DeathReason
, CASE WHEN a.DeathReasonDescription = '' THEN NULL ELSE a.DeathReasonDescription END AS DeathReasonOther
, cast(a.CareEndedDate as date) ExitDate
, f.Name TransferTo
--, a.FollowUpReason
--, a.FollowUpReasonOther 
, cast(a.CreateDate as date) CreateDate


from dtl_PatientCareEnded a 
inner join Patient b ON a.Ptn_Pk = b.Ptn_pk
inner join dtl_PatientTrackingCare c ON a.Ptn_Pk = c.Ptn_Pk and a.TrackingId = c.TrackingID
inner join mst_Decode d ON a.PatientExitReason = d.Id
left join mst_Decode e ON a.DeathReason = e.Id
left join mst_LPTF f ON a.LPTFTransfer = f.Id
where ARTended is null
and c.ModuleId in (2,203)
go

declare @c as cursor
, @patientId varchar(1000) 
, @careEnded varchar(1000)
, @exitReason varchar(1000)
, @deathDate varchar(1000)
, @deathReason varchar(1000)
, @deathReasonOther varchar(1000)
, @exitDate varchar(1000)
, @transferTo varchar(1000)
, @createDate varchar(1000)
, @patientEnrollmentId  varchar(1000)
set @c = cursor for 
select a.PatientId
, isnull(a.CareEnded,1) CareEnded
, a.ExitReason
, ISNULL(a.DeathDate,'')DeathDate
, REPLACE(ISNULL(a.DeathReason,''),'''','''''') DeathReason
, REPLACE(ISNULL(a.DeathReasonOther, ''),'''','''''') DeathReasonOther
, a.ExitDate
, REPLACE(ISNULL(a.TransferTo,''),'''','''''') TransferTo
, a.CreateDate
 , c.Id PatientEnrollmentId
from x_CareEnding a 
LEFT JOIN PatientCareending b ON a.PatientId = b.PatientId and cast(a.ExitDate as date) = cast(b.ExitDate as date)
INNER JOIN PatientEnrollment c ON a.PatientId = c.PatientId AND ServiceAreaId = 1
WHERE b.Id IS NULL and a.ExitReason is not null
and a.ExitDate is not null
order by a.PatientId, a.CreateDate

open @c
fetch next from @c into @patientId, @careEnded, @exitReason, @deathDate, @deathReason
, @deathReasonOther, @exitDate, @transferTo, @createDate,  @patientEnrollmentId
while @@FETCH_STATUS = 0
begin

exec('
declare @PatientMasterVisitId as int;

insert into PatientMasterVisit(PatientId, ServiceId, [Start]
, [End]
, [Active]
, VisitDate
, [Status]
, CreateDate
, DeleteFlag
, CreatedBy)
values
('+@patientId+'
,1
,cast('''+@createDate+''' as datetime)
,cast('''+@createDate+''' as datetime)
,0
,cast('''+@createDate+''' as datetime)
,1
,cast('''+@createDate+''' as datetime) 
,0
,1);

select @PatientMasterVisitId = IDENT_CURRENT(''PatientMasterVisit'');

insert into PatientCareending
(PatientId
, PatientMasterVisitId
, PatientEnrollmentId
, ExitReason
, ExitDate
, TransferOutFacility
, DateOfDeath
, CareEndingNotes
, Active
, DeleteFlag
, CreatedBy
, CreateDate
)
values
('+@patientId+'
, @PatientMasterVisitId
, '+@patientEnrollmentId+'
, '+@exitReason+'
, cast('''+@exitDate+''' as datetime)
, (select case when '''+@transferTo+''' != '''' then '''+@transferTo+''' else null end)
, (select case when cast('''+@deathDate+''' as datetime) != cast('''' as datetime) then cast('''+@deathDate+''' as datetime) else null end)
, (select case when '''+@deathReason+''' != '''' then '''+@deathReason+''' + '' - '+@deathReasonOther+''' else null end)
, case when '+@careEnded+' = 0 then 1 else 0 end
, 0
, 1
,cast('''+@createDate+''' as datetime) 
);

UPDATE PatientEnrollment SET CareEnded = '+@careEnded+' WHERE Id = '+@patientEnrollmentId+' AND ServiceAreaId = 1;

')

fetch next from @c into @patientId, @careEnded, @exitReason, @deathDate, @deathReason
, @deathReasonOther, @exitDate, @transferTo, @createDate, @patientEnrollmentId
end
close @c
deallocate @c

go


if exists(select name from sys.tables where name = 'x_CareEnding')
drop table x_CareEnding
go


declare @CareEndEncounter varchar(100) = (select top 1 Id from lookupitem where Name = 'careend-encounter')
insert into PatientEncounter
select pmv.PatientId
, @CareEndEncounter
, pmv.Id
, pmv.start
, pmv.start
, 203
, 0
, 1
, ord.createdate
, null
,0
from PatientCareending ord 
inner join patientmastervisit pmv on ord.PatientMasterVisitId = pmv.id
where patientmastervisitid is not null 
and not exists 
(select 1 from PatientEncounter where PatientId = pmv.PatientId 
and encountertypeid=@CareEndEncounter and patientmastervisitid = pmv.Id)
go