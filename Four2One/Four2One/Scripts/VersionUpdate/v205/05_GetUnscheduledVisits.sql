IF  EXISTS (SELECT * FROM sys.objects WHERE object_id 
= OBJECT_ID(N'[dbo].[sp_AppointmentsModule_GetUnscheduledVisits]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].sp_AppointmentsModule_GetUnscheduledVisits
GO

create proc sp_AppointmentsModule_GetUnscheduledVisits as
begin

with onART as 
(select distinct a.PatientId from 
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

, todaysAppointments as 
(select PatientId, max(AppointmentDate)AppointmentDate
from PatientAppointment
where cast(AppointmentDate as date) = cast(getdate() as date)
and DeleteFlag = 0
group by PatientId
union
select PatientId, max(DateRescheduled) AppointmentDate from PatientTracing
where cast(DateRescheduled as date) = cast(getdate() as date)
Group by PatientId
)

, appointments as 
(select PatientId, max(AppointmentDate)AppointmentDate
from PatientAppointment
where DeleteFlag = 0
and cast(CreateDate as date) < cast(getdate() as date)
group by PatientId)

, stabilityAssessment as (select a.PatientId, MAX(a.Categorization) StabilityAssessment 
from PatientCategorization a inner join (
select PatientId, MAX(DateAssessed) DateAssessed 
from PatientCategorization
Group by PatientId) b on a.PatientId = b.PatientId and a.DateAssessed = b.DateAssessed
group by a.PatientId)

select a.PatientId
, e.Id PersonId
, case when len(c.IdentifierValue) <= 5 then d.IdentifierValue else c.IdentifierValue end as PatientIdentifier
, convert(varchar(100), decryptbykey(e.FirstName)) + ' ' + convert(varchar(100), decryptbykey(e.LastName )) PatientName
,f.[Name] Sex
, CASE WHEN g.PatientId is not null then 1 ELSE 0 END AS OnART
, cast(DATEDIFF(dd, b.DateOfBirth, getdate())/365.25 as decimal(18,1)) Age 
, a.CheckedIn
, cast(i.AppointmentDate as date) ScheduledOn
, case when j.StabilityAssessment = 1 then 1 else 0 end as stabilityAssessment
from checkIn a inner join Patient b on a.PatientId = b.Id
inner join PatientIdentifier c on a.PatientId = c.PatientId and c.IdentifierTypeId = 1
left join PatientIdentifier d on a.PatientId = d.PatientId and d.IdentifierTypeId = 17
inner join Person e on b.PersonId = e.Id
inner join LookupItem f on e.Sex = f.Id
left join onART g on a.PatientId = g.PatientId
left join todaysAppointments h on a.PatientId = h.PatientId
left join appointments i on a.PatientId = i.PatientId
left join stabilityAssessment j on a.PatientId = j.PatientId
where h.PatientId is null


end
