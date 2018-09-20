declare @PatientID as VARCHAR(1000), @PatientMasterVisitId as VARCHAR(1000)
, @HIVTestDate as VARCHAR(1000)
, @RegistrationDate as VARCHAR(1000)
, @c as cursor

set @c = cursor for

With HIVTesting AS 
(Select a.ptn_pk, MAX(HIVDate)HIVTestDateMin
, MIN(HIVDate)HIVTestDateMax
From 
(Select a.ptn_pk, a.ConfirmHIVPosDate HIVDate
From dtl_PatientHivPrevCareEnrollment a  
Where a.ConfirmHIVPosDate Is Not Null And a.ConfirmHIVPosDate <> Cast('' as datetime)
union
Select a.ptn_pk, a.DateHIVDiagnosis
From dtl_PatientClinicalStatus a 
Where a.DateHIVDiagnosis Is Not Null And a.DateHIVDiagnosis <> Cast('' as datetime)) a group by a.ptn_pk)

, a as (	
Select ptn_pk
, CASE WHEN YEAR(HIVTestDateMin) < 1980 THEN HIVTestDateMax ELSE HIVTestDateMin END AS HIVTestDate
FROM HIVTesting
WHERE YEAR(CASE WHEN YEAR(HIVTestDateMin) < 1980 THEN HIVTestDateMax ELSE HIVTestDateMin END) BETWEEN 1980 and 2019)


select  b.Id PatientId
, ISNULL(c.Id,0) PatientMasterVisitId
, a.HIVTestDate
, b.RegistrationDate
 from a inner join Patient b on a.ptn_pk = b.ptn_pk
left join PatientMasterVisit c on b.Id = c.PatientId and c.VisitType is null
left join PatientHivDiagnosis d on b.Id = d.PatientId
where d.Id is null

open @c

fetch next from @c into @PatientID, @PatientMasterVisitId, @HIVTestDate,@RegistrationDate
while @@FETCH_STATUS = 0

begin

exec('
Declare @PtnVisitId as INT;

IF('+@PatientMasterVisitID+' = 0)
begin
INSERT INTO PatientMasterVisit
	(PatientId
	, ServiceId
	, Start
	, [End]
	, Active
	, VisitDate
	, VisitScheduled
	, VisitBy
	, VisitType
	, Status
	, CreateDate
	, DeleteFlag
	, CreatedBy
	, AuditData) 
	VALUES 
	('+@PatientID+'
	, 1
	, CAST('''+@RegistrationDate+''' AS DATETIME)
	, CAST('''+@RegistrationDate+''' AS DATETIME)
	, 1
	, CAST('''+@RegistrationDate+''' AS DATETIME)
	, 0
	, 0
	, NULL
	, 2
	, GETDATE(), 0, 1, NULL);
				
SELECT @PtnVisitId = IDENT_CURRENT(''PatientMasterVisit'')
end
ELSE 
begin
set @PtnVisitId = '+@PatientMasterVisitID+';
end

INSERT INTO PatientHivDiagnosis
(PatientMasterVisitId, PatientId
, HIVDiagnosisDate, EnrollmentDate
, EnrollmentWHOStage, DeleteFlag
, CreatedBy, CreateDate)
VALUES
(@PtnVisitId
, '+@PatientID+'
, cast('''+@HIVTestDate+''' as datetime)
, CAST('''+@RegistrationDate+''' AS DATETIME)
, 0, 0, 1, getdate()
)

')


fetch next from @c into @PatientID, @PatientMasterVisitId, @HIVTestDate,@RegistrationDate
end

close @c
deallocate @c