IF  EXISTS (SELECT * FROM sys.objects WHERE object_id 
= OBJECT_ID(N'[dbo].[sp_AppointmentsModule_GetMissedAppointmentsChartData]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].sp_AppointmentsModule_GetMissedAppointmentsChartData
GO

create proc sp_AppointmentsModule_GetMissedAppointmentsChartData as
begin

if exists(select * from sys.tables where name = N'x_appointments')
drop table x_appointments;

create table x_appointments 
(PatientId int not null
, CreateDate date not null
, AppointmentDate date not null);

insert into x_appointments
select distinct a.PatientId
, cast(c.VisitDate as date) CreateDate
, cast(a.AppointmentDate as date) AppointmentDate 
from PatientAppointment a inner join (
select a.PatientId
, max(AppointmentDate) AppointmentDate
from PatientAppointment a 
where a.DeleteFlag = 0
group by a.PatientId) b on a.PatientId = b.PatientId
and a.AppointmentDate = b.AppointmentDate
inner join PatientMasterVisit c on a.PatientMasterVisitId = c.Id
where c.DeleteFlag = 0
and DATEDIFF(dd, a.AppointmentDate, getdate()) between 1 and 90;

with visits as (
select DISTINCT PatientId
, cast(EncounterStartTime as date) VisitDate
from PatientEncounter)

, met as (
select a.PatientId
, a.AppointmentDate
, b.VisitDate 
from x_appointments a left join visits b on a.PatientId = b.PatientId
and a.AppointmentDate = b.VisitDate)

, maybeMissed As (
select a.PatientId
, a.CreateDate
, a.AppointmentDate 
from x_appointments a left join met b on a.PatientId = b.PatientId 
and a.AppointmentDate = b.VisitDate
where b.PatientId is null)

, missed as (
select a.PatientId
, a.CreateDate
, a.AppointmentDate
from maybeMissed a left join PatientAppointment b on a.PatientId = b.PatientId
and cast(b.CreateDate as date) > cast(a.CreateDate as date) 
and cast(b.CreateDate as date) < cast(a.AppointmentDate as date)
where b.Id is null)

, careEnded as (select a.PatientId
, MAX(ExitDate) ExitDate
from PatientCareending a inner join LookupItem b On a.ExitReason = b.Id
where b.DisplayName IN ('Death','Lost To Follow Up','Transfer Out')
and a.DeleteFlag = 0
and a.Active = 0
GROUP BY a.PatientId)

, stillMissing as (
select a.PatientId
, a.CreateDate
, a.AppointmentDate
from missed a 
left join PatientMasterVisit b on a.PatientId = b.PatientId and b.VisitDate > a.AppointmentDate
left join careEnded c on a.PatientId = c.PatientId 
where b.Id is null and c.PatientId is null)

, lastAppointment as (
 select PatientId, MAX(AppointmentDate) AppointmentDate 
 from PatientAppointment
 group by PatientId)

 select cast(getdate() as date) SummaryDate
 , SUM([1-7 Days]) [1-7 Days] 
 , SUM([8-14 Days] ) [8-14 Days] 
 , SUM([15-30 Days] ) [15-30 Days] 
 , SUM([31-60 Days] ) [31-60 Days] 
 , SUM([61-90 Days] ) [61-90 Days] 
 FROM (
 select a.PatientId
 , case 
 when OverDueBy between 1 and 7 then 1 else 0 end as [1-7 Days] 
 , case when OverDueBy between 8 and 14 then 1 else 0 end as [8-14 Days] 
 , case when OverDueBy between 15 and 30  then 1 else 0 end as [15-30 Days] 
 , case when OverDueBy between 31 and 60  then 1 else 0 end as [31-60 Days] 
 , case when OverDueBy between 61 and 90 then 1 else 0 end as [61-90 Days] 
 from (
select a.PatientId
, datediff(dd, a.AppointmentDate, getdate()) OverDueBy
from stillMissing a 
inner join Patient b ON a.PatientId = b.Id) a) a

if exists(select * from sys.tables where name = N'x_appointments')
drop table x_appointments;

end