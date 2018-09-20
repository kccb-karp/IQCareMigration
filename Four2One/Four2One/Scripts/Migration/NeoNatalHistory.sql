WITH MilestoneAssessments AS (
select a.Ptn_pk
, cast(d.VisitDate as date) VisitDate
, cast(a.Date as date) DateAssessed
, a.TypeofTest MilestoneAssessed
, a.Result
, case when a.Comments = '' then null else a.Comments end as Comments
 from [dtl_KNHPMTCTHEI_GridData] a
inner join ord_Visit d ON a.Ptn_pk = d.Ptn_Pk and a.Visit_pk = d.Visit_Id
where a.Section = 'Milestone')



INSERT INTO PatientMilestone
(PatientId, PatientMasterVisitId, CreatedBy, MilestoneAssessedId
,MilestoneDate, MilestoneAchievedId, MilestoneStatusId, MilestoneComments
, CreateDate
, DeleteFlag )

SELECT distinct b.Id PatientId
, c.Id PatientMasterVisitId
, 1 CreatedBy
, MilestoneAssessedId = (select Id from LookupItem where DisplayName = a.MilestoneAssessed)
, a.DateAssessed MilestoneDate
, 0 MilestoneAchievedId
, MilestoneStatusId = (select Id from LookupItem where DisplayName = a.Result) 
, ISNULL(a.Comments,'') Comments
, c.CreateDate 
, 0 DeleteFlag
FROM MilestoneAssessments a
inner join Patient b on a.Ptn_pk = b.ptn_pk
inner join PatientMasterVisit c on b.id = c.PatientId
and cast(a.visitdate as date) = cast(c.visitdate as date)
and c.VisitType = 0
left join PatientMilestone d ON c.Id = d.PatientMasterVisitId
where d.PatientMasterVisitId IS NULL
GO

INSERT INTO PatientScreening
(PatientId
, PatientMasterVisitId
, ScreeningTypeId
, ScreeningDone
, ScreeningDate
, ScreeningCategoryId
, ScreeningValueId
, Active
, DeleteFlag
, CreatedBy
, CreateDate
, VisitDate)
Select Distinct a.PatientId
, a.PatientMasterVisitId 
, (select Id from LookupMaster WHERE DisplayName = 'NeonatalHistory')
, 1
, b.VisitDate
, (select Id from LookupItem where DisplayName = 'Record Neonatal History')
, (select Id from LookupItem where DisplayName = 'Yes')
, 0
, 0
, 1
, b.CreateDate
, b.VisitDate
FROM PatientMilestone a INNER JOIN PatientMasterVisit b
ON a.PatientMasterVisitId = b.Id
LEFT JOIN PatientScreening c ON a.PatientMasterVisitId = c.PatientMasterVisitId
AND c.ScreeningTypeId = (select Id from LookupMaster WHERE DisplayName = 'NeonatalHistory')
WHERE c.Id IS NULL
GO

WITH Immunizations as (
select 
a.Ptn_pk
, cast(d.VisitDate as date) VisitDate
, cast(a.Date as date) DateOfImmunization
, a.TypeofTest ImmunizationPeriod
, a.Result ImmunizationGiven
 from [dtl_KNHPMTCTHEI_GridData] a
inner join ord_Visit d ON a.Ptn_pk = d.Ptn_Pk and a.Visit_pk = d.Visit_Id
where a.Section = 'Immunization')

INSERT INTO Vaccination
(PatientId
, PatientMasterVisitId
, Vaccine
, VaccineStage
, DeleteFlag
, CreatedBy
, CreateDate
, VaccineDate
, Active)
Select distinct b.Id PatientId
, c.Id PatientMasterVisitId 
, Vaccine = (select Id from LookupItem where DisplayName = a.ImmunizationGiven)
, VaccineStage = (select Id from LookupItem where DisplayName = a.ImmunizationPeriod)
, 0 DeleteFlag
, c.CreatedBy
, c.CreateDate
, a.DateOfImmunization
, 0 [Active]

FROM Immunizations a 
inner join Patient b on a.Ptn_pk = b.ptn_pk
inner join PatientMasterVisit c on b.id = c.PatientId
and cast(a.visitdate as date) = cast(c.visitdate as date)
and c.VisitType = 0
left join Vaccination d ON c.Id = d.PatientMasterVisitId
where d.PatientMasterVisitId IS NULL
GO

WITH NeonatalNotes as
(select a.Ptn_Pk
, a.VisitDate
, case when c.Examinations = '' then null else c.Examinations end as NeonatalNotes
from 
ord_Visit a inner join dtl_KNHPMTCTHEI c 
ON a.Ptn_pk = c.Ptn_pk and a.Visit_Id = c.Visit_pk
WHERE (a.DeleteFlag = 0 or a.DeleteFlag is null)
and case when c.Examinations = '' then null else c.Examinations end is not null)

insert into PatientClinicalNotes
(PatientId, PatientMasterVisitId
, ServiceAreaId
, ClinicalNotes
, DeleteFlag
, CreatedBy
, CreateDate
, ModifyFlag
, NotesCategoryId
, Active)
Select distinct b.Id PatientId
, c.Id PatientMasterVisitId 
, 203 ServiceAreaId
, ISNULL(a.NeonatalNotes,'') Notes 
, 0 DeleteFlag
, c.CreatedBy
, c.CreateDate
, 0 ModifyFlag
, NotesCategoryId = (select Id from LookupItem WHERE DisplayName = 'Neonatal History Notes')
, 0
FROM NeonatalNotes a
inner join Patient b on a.Ptn_pk = b.ptn_pk
inner join PatientMasterVisit c on b.id = c.PatientId
and cast(a.visitdate as date) = cast(c.visitdate as date)
and c.VisitType = 0
left join PatientClinicalNotes d ON c.Id = d.PatientMasterVisitId
and d.NotesCategoryId = (select Id from LookupItem WHERE DisplayName = 'Neonatal History Notes')
where d.PatientMasterVisitId IS NULL
GO
