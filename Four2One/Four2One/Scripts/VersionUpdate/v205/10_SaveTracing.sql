IF  EXISTS (SELECT * FROM sys.objects WHERE object_id 
= OBJECT_ID(N'[dbo].[sp_PatientManagement_SaveTracing]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].sp_PatientManagement_SaveTracing
GO

create proc sp_PatientManagement_SaveTracing(@patientId int, @userId int, @tracingProcessId int
, @tracingDate varchar(100), @reached int
, @missedAppointmentReasonId varchar(10), @actionTakenId varchar(10)
, @missedAppointmentReasonText varchar(1000), @actionTakenText varchar(1000), @rescheduleDate varchar(100)) 
as
begin

if not exists(select * from PatientTracing where PatientId = @patientId and CAST(TracingDate as date) = convert(date, @tracingDate, 103)
and TracingProcessId = @tracingProcessId and Reached = 1 and ReasonMissedId = @missedAppointmentReasonId)
begin
INSERT INTO PatientTracing
(PatientId, TracingDate, TracingProcessId, Reached
, ReasonMissedId, ActionTakenId
, ReasonMissedText, ActionTakenText, DateRescheduled
, CreatedBy, CreateDate, DeleteFlag)
VALUES
(@patientId
, convert(datetime, @tracingDate, 103)
, @tracingProcessId
, @reached
, case when @missedAppointmentReasonId != '' then @missedAppointmentReasonId else null end
, case when @actionTakenId != '' then @actionTakenId else null end
, case when @missedAppointmentReasonText != '' then @missedAppointmentReasonText else null end
, case when @actionTakenText != '' then @actionTakenText else null end
, case when @rescheduleDate != '' then convert(datetime, @rescheduleDate, 103) else null end
, @userId, getdate(), 0
)
end
end