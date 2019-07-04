IF  EXISTS (SELECT * FROM sys.objects WHERE object_id 
= OBJECT_ID(N'[dbo].[sp_AppointmentsModule_GetLastCoupleOfDaysChartData]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].sp_AppointmentsModule_GetLastCoupleOfDaysChartData
GO

create proc sp_AppointmentsModule_GetLastCoupleOfDaysChartData as
begin

with checkIn as (select PatientId
, MAX(cast(VisitDate as date)) VisitDate 
from PatientMasterVisit where cast(VisitDate as date) between DATEADD(dd,-7,getdate()) and DATEADD(dd,-1,getdate())
group by PatientId) 

, scheduledAppointments as (
Select cast(AppointmentDate as date) AppointmentDate
, PatientId 
FROM PatientAppointment WHERE cast(AppointmentDate as date) between DATEADD(dd,-7,getdate()) and DATEADD(dd,-1,getdate())
union
select cast(DateRescheduled as date), PatientId 
from PatientTracing where DateRescheduled between DATEADD(dd,-7,getdate()) and DATEADD(dd,-1,getdate())
)

, unscheduledAppointments as (
select distinct
cast(a.VisitDate as date) VisitDate
, a.PatientId
from PatientMasterVisit a left join PatientAppointment b
on a.PatientId = b.PatientId
and cast(a.VisitDate as date) = cast(b.AppointmentDate as date)
left join PatientTracing c on a.PatientId = c.PatientId and cast(a.VisitDate as date) = cast(c.DateRescheduled as date)
where a.VisitDate between DATEADD(dd, -7, getdate()) and DATEADD(dd,-1,getdate())
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