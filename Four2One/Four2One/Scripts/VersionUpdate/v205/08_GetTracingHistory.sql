IF  EXISTS (SELECT * FROM sys.objects WHERE object_id 
= OBJECT_ID(N'[dbo].[sp_PatientManagement_GetTracingHistory]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].sp_PatientManagement_GetTracingHistory
GO

CREATE PROC sp_PatientManagement_GetTracingHistory(@patientId int) as
begin

 with lastAppointment as (
 select PatientId, MAX(AppointmentDate) AppointmentDate 
 from PatientAppointment
 where PatientId = @patientId
 group by PatientId)


 select cast(a.TracingDate as date) TracingDate
 , c.DisplayName TracingProcess
 , a.Reached
 , case when d.DisplayName like 'Other%' then a.ReasonMissedText else d.DisplayName end ReasonMissed
 , case when e.DisplayName like 'Other%' then  a.ActionTakenText else e.DisplayName end ActionTaken
 , convert(varchar, a.DateRescheduled, 106) DateRescheduled 
 , f.UserFirstName + ' ' + f.UserLastName CreatedBy

 from PatientTracing a left join lastAppointment b on a.PatientId = b.PatientId 
 inner join LookupItem c on a.TracingProcessID = c.Id
 left join LookupItem d on a.ReasonMissedID = d.Id
 left join LookupItem e on a.ActionTakenID = e.Id
 inner join mst_User f on a.CreatedBy = f.UserID
 where a.PatientId = @patientId
 and TracingDate >= b.AppointmentDate
 order by a.TracingDate desc, a.Id desc
end

