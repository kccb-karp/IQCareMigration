IF  EXISTS (SELECT * FROM sys.objects WHERE object_id 
= OBJECT_ID(N'[dbo].[sp_PatientManagement_GetPatientProfile]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].sp_PatientManagement_GetPatientProfile
GO

CREATE PROC sp_PatientManagement_GetPatientProfile(@patientId int) as
begin

 with lastAppointment as (
 select PatientId, MAX(AppointmentDate) AppointmentDate 
 from PatientAppointment
 where PatientId = @patientId
 group by PatientId)

 , ARTStart as 
 (select a.PatientId
, MIN(a.ARTSTartDate) ARTSTartDate
FROM (
select PatientId, MIN(TreatmentStartDate) ARTSTartDate
from PatientTransferIn
where YEAR(TreatmentStartDate) > 2000
GROUP BY PatientId 
UNION
select a.PatientId
, MIN(b.VisitDate) VisitDate 
from ARVTreatmentTracker a inner join PatientMasterVisit b on a.PatientMasterVisitId = b.Id
where RegimenId > 0
GROUP BY a.PatientId) a
GROUP BY a.PatientId)


select
convert(varchar(100), decryptbykey(d.FirstName)) + ' ' + convert(varchar(100), decryptbykey(d.LastName )) PatientName
, cast(DATEDIFF(dd, a.DateOfBirth, getdate())/365.25 as decimal(18,1)) Age 
, replace(convert(varchar(100), decryptbykey(g.MobileNumber)),'+254','0') PhoneNumber
, c.IdentifierValue UniqueId
, convert(varchar, i.AppointmentDate, 106) DateMissed
, isnull(h.LandMark,'') + ', ' + isnull(h.NearestHealthCentre,'') + ', ' + isnull(h.Village,'') PhysicalAddress
, CASE WHEN l.PatientId IS NOT NULL THEN 'On ART for ' 
+ 
	case 
	when DATEDIFF(mm, l.ARTSTartDate, getdate()) < 1 then
		cast(DATEDIFF(dd, l.ARTSTartDate, getdate()) as varchar(10)) + ' Days'
	when DATEDIFF(mm, l.ARTSTartDate, getdate()) < 12 then
		cast(DATEDIFF(mm, l.ARTSTartDate, getdate()) as varchar(10)) + ' Months'
	when DATEDIFF(mm, l.ARTSTartDate, getdate()) >= 12 then
		cast(cast(DATEDIFF(mm, l.ARTSTartDate, getdate())/12.0 as decimal(18,1)) as varchar(10)) + ' Years'
	end
ELSE 'Not on ART' END AS Treatment
, ISNULL(k.DisplayName, 'Not Documented') Occupation
from Patient a
inner join PatientIdentifier c on a.Id = c.PatientId and c.IdentifierTypeId = 1
inner join Person d ON a.PersonId = d.Id
left join PersonContact g on d.Id = g.PersonId 
left join PersonLocation h on d.Id = h.PersonId
left join lastAppointment i on a.Id = i.PatientId
left join PersonOccupation j on a.PersonId = j.Id
left join LookupItem k on j.Occupation = k.Id
left join ARTStart l on a.Id = l.PatientId
where a.id = @patientId
end

