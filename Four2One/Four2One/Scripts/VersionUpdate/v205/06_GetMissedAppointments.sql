IF  EXISTS (SELECT * FROM sys.objects WHERE object_id 
= OBJECT_ID(N'[dbo].[sp_AppointmentsModule_GetMissedAppointments]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].sp_AppointmentsModule_GetMissedAppointments
GO

create proc sp_AppointmentsModule_GetMissedAppointments as
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

, treatmentSupporters as (select a.PersonId
, convert(varchar(100), decryptbykey(b.FirstName)) + ' ' + convert(varchar(100), decryptbykey(b.LastName )) TreatmentSupporterName
, convert(varchar(100), decryptbykey(a.MobileContact)) TreatmentSupporterPhoneNumber 
from PatientTreatmentSupporter a inner join Person b on a.SupporterId = b.Id
where a.DeleteFlag = 0)

, lastAppointment as (
 select PatientId, MAX(AppointmentDate) AppointmentDate 
 from PatientAppointment
 group by PatientId)

 , MostRecentTrace_ as (
 select a.PatientId
 , a.TracingDate
 , a.TracingProcessID
 , a.Reached
 , a.ReasonMissedID
 , a.ActionTakenID
 , a.ActionTakenText
 , a.ReasonMissedText
 , a.DateRescheduled
 , a.CreatedBy 
 from PatientTracing a inner join (
 select a.PatientId, MAX(a.Id) Id from PatientTracing a inner join (
 select a.PatientId
 , MAX(a.TracingDate) TracingDate from 
 PatientTracing a left join lastAppointment b on a.PatientId = b.PatientId 
 where TracingDate >= b.AppointmentDate
 GROUP BY a.PatientId) b on a.PatientId = b.PatientId and a.TracingDate = b.TracingDate
 group by a.PatientId) b on a.Id = b.Id)

 , mostRecentTrace as (
 select a.PatientId
 , cast(a.TracingDate as date) TracingDate
 , c.DisplayName TracingProcess
 , a.Reached
 , case when d.DisplayName like 'Other%' then a.ReasonMissedText else d.DisplayName end ReasonMissed
 , case when e.DisplayName like 'Other%' then  a.ActionTakenText else e.DisplayName end ActionTaken
 , convert(varchar, a.DateRescheduled, 106) DateRescheduled 
 , f.UserFirstName + ' ' + f.UserLastName CreatedBy
from MostRecentTrace_ a  
 inner join LookupItem c on a.TracingProcessID = c.Id
 left join LookupItem d on a.ReasonMissedID = d.Id
 left join LookupItem e on a.ActionTakenID = e.Id
 inner join mst_User f on a.CreatedBy = f.UserID)

select a.PatientId
, b.PersonId
, convert(varchar(100), decryptbykey(d.FirstName)) + ' ' + convert(varchar(100), decryptbykey(d.LastName )) PatientName
, e.[Name] Sex
, cast(DATEDIFF(dd, b.DateOfBirth, getdate())/365.25 as decimal(18,1)) Age 
, c.IdentifierValue UniqueId
, convert(varchar, a.AppointmentDate , 106) AppointmentDate
, f.TreatmentSupporterName
, replace(f.TreatmentSupporterPhoneNumber,'+254','0') TreatmentSupporterPhoneNumber
, replace(convert(varchar(100), decryptbykey(g.MobileNumber)),'+254','0') PersonPhoneNumber
, isnull(h.LandMark,'') + ', ' + isnull(h.NearestHealthCentre,'') + ', ' + isnull(h.Village,'') PhysicalLocation
, i.TracingDate
, i.TracingProcess
, i.Reached
, i.ReasonMissed
, i.ActionTaken
, i.DateRescheduled
, i.CreatedBy
from stillMissing a inner join Patient b ON a.PatientId = b.Id

inner join PatientIdentifier c on a.PatientId = c.PatientId and c.IdentifierTypeId = 1
inner join Person d ON b.PersonId = d.Id
inner join LookupItem e on d.Sex = e.Id
left join treatmentSupporters f on d.Id = f.PersonId
left join PersonContact g on d.Id = g.PersonId and g.DeleteFlag = 0
left join PersonLocation h on d.Id = h.PersonId and h.DeleteFlag = 0
left join mostRecentTrace i on a.PatientId = i.PatientId
order by a.AppointmentDate desc;

if exists(select * from sys.tables where name = N'x_appointments')
drop table x_appointments;

end