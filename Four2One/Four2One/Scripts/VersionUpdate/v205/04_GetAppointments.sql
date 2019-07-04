IF  EXISTS (SELECT * FROM sys.objects WHERE object_id 
= OBJECT_ID(N'[dbo].[sp_AppointmentsModule_GetAppointments]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].sp_AppointmentsModule_GetAppointments
GO

create proc sp_AppointmentsModule_GetAppointments as
begin

with onART as 
(
select distinct a.PatientId from 
PatientDrugPrescription a left join 
ARVTreatmentTracker b on a.PatientMasterVisitId = b.PatientMasterVisitId
where a.TreatmentProgramId = 222 and b.RegimenId is not null
union
select distinct a.PatientId from ord_PatientPharmacyOrder a left join 
ARVTreatmentTracker b on a.PatientMasterVisitId = b.PatientMasterVisitId
where a.ProgID = 222 and b.RegimenId is not null
)

, checkIn as (select PatientId
, MAX([Status]) CheckedIn 
from PatientMasterVisit where cast(VisitDate as date) = cast(getdate() as date)
group by PatientId) 

, rescheduledAppointments as 
(select a.PatientId, a.DateRescheduled 
from PatientTracing a inner join (
select PatientId, MAX(Id) Id from PatientTracing
where DateRescheduled is not null
group by PatientId) b on a.Id = b.Id)

, stabilityAssessment as (select a.PatientId, MAX(a.Categorization) StabilityAssessment 
from PatientCategorization a inner join (
select PatientId, MAX(DateAssessed) DateAssessed 
from PatientCategorization
Group by PatientId) b on a.PatientId = b.PatientId and a.DateAssessed = b.DateAssessed
group by a.PatientId)

select distinct a.Id PatientId
, case when len(c.IdentifierValue) <= 5 then d.IdentifierValue else c.IdentifierValue end as PatientIdentifier
, convert(varchar(100), decryptbykey(e.FirstName)) + ' ' + convert(varchar(100), decryptbykey(e.LastName )) PatientName
,f.[Name] Sex
, CASE WHEN g.PatientId is not null then 1 ELSE 0 END AS OnART
, cast(DATEDIFF(dd, a.DateOfBirth, getdate())/365.25 as decimal(18,1)) Age 
, h.CheckedIn
, e.Id PersonId
, case when i.PatientId is not null then 1 else 0 end as previouslyMissed
, case when j.StabilityAssessment = 1 then 1 else 0 end as stabilityAssessment
from Patient a left join 
	(select PatientId
	, AppointmentDate 
		from (
		Select PatientId, max(AppointmentDate) AppointmentDate
		FROM PatientAppointment 
		WHERE DeleteFlag = 0 and cast(CreateDate as date) < cast(getdate() as date)
		group by PatientId) a
		WHERE cast(AppointmentDate as date) = cast(getdate() as date)) b on a.Id = b.PatientId
inner join PatientIdentifier c on a.Id = c.PatientId and c.IdentifierTypeId = 1
left join PatientIdentifier d on a.Id = d.PatientId and d.IdentifierTypeId = 17
inner join Person e on a.PersonId = e.Id
inner join LookupItem f on e.Sex = f.Id
left join onART g on a.Id = g.PatientId
left join checkIn h on a.Id = h.PatientId
left join (select PatientId, DateRescheduled 
		FROM rescheduledAppointments 
		WHERE cast(DateRescheduled as date) = cast(getdate() as date)) i on a.Id = i.PatientId
left join stabilityAssessment j on a.Id = j.PatientId
where coalesce(b.PatientId, i.PatientId) is not null
order by previouslyMissed desc
end