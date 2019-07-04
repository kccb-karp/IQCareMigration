IF  EXISTS (SELECT * FROM sys.objects WHERE object_id 
= OBJECT_ID(N'[dbo].[sp_AppointmentsModule_GetTodaysChartData]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].sp_AppointmentsModule_GetTodaysChartData
GO

create proc sp_AppointmentsModule_GetTodaysChartData as
begin

with checkIn as (select PatientId
, MAX(cast(VisitDate as date)) VisitDate 
from PatientMasterVisit where cast(VisitDate as date) = cast(getdate() as date)
group by PatientId) 

, scheduledAppointments as (
Select cast(AppointmentDate as date) AppointmentDate
, PatientId 
FROM (
select PatientId, MAX(AppointmentDate) AppointmentDate
FROM PatientAppointment 
WHERE cast(AppointmentDate as date) = cast(getdate() as date)
GROUP BY PatientId) a

union
select cast(DateRescheduled as date), PatientId 
from 
(
select PatientId, MAX(DateRescheduled) DateRescheduled FROM 
PatientTracing 
GROUP BY PatientId) a

where cast(DateRescheduled as date) = cast(getdate() as date))

, unscheduledAppointments as (
select distinct
cast(a.VisitDate as date) VisitDate
, a.PatientId
from PatientMasterVisit a left join PatientAppointment b
on a.PatientId = b.PatientId
and cast(a.VisitDate as date) = cast(b.AppointmentDate as date)
left join PatientTracing c on a.PatientId = c.PatientId and cast(a.VisitDate as date) = cast(c.DateRescheduled as date)
where cast(a.VisitDate as date) = cast(getdate() as date)
and (b.PatientId is null and c.PatientId is null))


select
coalesce(b.AppointmentDate, c.VisitDate) VisitDate
, sum(case when b.PatientId is not null and c.PatientId is not null then 1 else 0 end) as Met
, sum(case when b.PatientId is not null and c.PatientId is null then 1 else 0 end) as Pending
, count(distinct case when b.AppointmentDate = cast(getdate() as date) then null else d.PatientId end) Unscheduled
from Patient a 
left join scheduledAppointments b on a.Id = b.PatientId
left join checkIn c on a.Id = c.PatientId
left join unscheduledAppointments d on a.Id = d.PatientId
where coalesce(b.PatientId, c.PatientId) is not null
group by coalesce(b.AppointmentDate, c.VisitDate) 
order by VisitDate desc

end