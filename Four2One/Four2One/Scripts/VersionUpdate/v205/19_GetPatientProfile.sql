IF  EXISTS (SELECT * FROM sys.objects WHERE object_id 
= OBJECT_ID(N'[dbo].[sp_PharmacyModule_GetPatientProfile]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].sp_PharmacyModule_GetPatientProfile
GO

CREATE PROCEDURE [dbo].sp_PharmacyModule_GetPatientProfile(@patientId int, @drugPrescriptionId int)  
AS    
BEGIN  
declare @patientMasterVisitId as int = 
	(select top 1 PatientMasterVisitId from PatientDrugPrescription
	where Id = @drugPrescriptionId);

with vitals as (
select a.PatientId
, floor(a.Height) PatientHeight
, floor(a.Weight) PatientWeight
, a.BMI PatientBMI
, a.BPSystolic BPS
, a.BPDiastolic BPD
from PatientVitals a INNER JOIN (
select PatientId, MAX(VisitDate) VisitDate 
from PatientVitals
where PatientId = @patientId and DeleteFlag = 0
GROUP BY PatientId) b ON a.PatientId = b.PatientId and a.VisitDate = b.VisitDate
WHERE a.DeleteFlag = 0)

, arttracker as (
select a.Id, a.PatientId
, a.PatientMasterVisitId
, cast(b.VisitDate as date) VisitDate
, c.Name RegimenCode
, c.DisplayName Regimen
from ARVTreatmentTracker a inner join PatientMasterVisit b on a.PatientMasterVisitId = b.Id
inner join LookupItem c on a.RegimenId = c.Id
where a.PatientId = @patientId and a.DeleteFlag = 0 and b.DeleteFlag = 0)

, currentart as (
select a.PatientId, a.VisitDate, a.Regimen, a.RegimenCode 
from arttracker a inner join (
select PatientId, max(visitdate) visitdate 
from arttracker
group by PatientId) b 
on a.PatientId = b.PatientId and a.VisitDate = b.visitdate)

, nextAppointment as (select PatientId, cast(AppointmentDate as date) NextAppointmentDate
from PatientAppointment where 
PatientMasterVisitId = @patientMasterVisitId and DeleteFlag = 0)

, prescription as (select PatientId
, b.UserFirstName + ' ' + b.UserLastName PrescribedBy
from PatientDrugPrescription a
inner join mst_User b on a.CreatedBy = b.UserID
where a.Id = @drugPrescriptionId)

select convert(varchar(100), decryptbykey(a.FirstName))
+ ' '   
+ convert(varchar(100), decryptbykey(a.LastName )) PatientName
, CAST(DATEDIFF(dd,a.DateOfBirth, GETDATE())/365.25 as decimal(18,1)) Age
, c.Name Gender
, d.PatientWeight
, d.PatientHeight
, d.PatientBMI
, d.BPS
, d.BPD
, e.RegimenCode
, e.Regimen
, f.NextAppointmentDate
, g.PrescribedBy
FROM 
Person a inner join Patient b on a.Id = b.PersonId
left join LookupItem c on a.Sex = c.Id
left join vitals d on b.Id = d.PatientId
left join currentart e on b.Id = e.PatientId
left join nextAppointment f on b.Id = f.PatientId
left join prescription g on b.Id = g.PatientId
where b.Id = @patientId


END