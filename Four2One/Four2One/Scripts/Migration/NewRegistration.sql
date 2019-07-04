IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pr_421_registration]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].pr_421_registration
GO


CREATE PROC pr_421_registration(@CountyName VARCHAR(1000), @MFLCode VARCHAR(1000)) AS
BEGIN

Open symmetric key Key_CTC decryption by password='ttwbvXWpqb5WOLfLrBgisw==';
/*Person*/
INSERT INTO dbo.[Person]
			( FirstName
			, MidName
			, LastName
			, Sex
			, Active
			, DeleteFlag
			, CreateDate
			, CreatedBy
			, DateOfBirth
			, DobPrecision
			, Ptn_Pk) 

SELECT 
CASE WHEN FirstName IS NULL THEN ENCRYPTBYKEY(KEY_GUID('Key_CTC'),'') ELSE FirstName END FirstName
,CASE WHEN MiddleName IS NULL THEN ENCRYPTBYKEY(KEY_GUID('Key_CTC'),'') ELSE MiddleName END MiddleName
, CASE WHEN LastName IS NULL THEN ENCRYPTBYKEY(KEY_GUID('Key_CTC'),'') ELSE LastName END LastName 
, CASE a.Sex WHEN 16 THEN 51 WHEN 17 THEN 52 ELSE NULL END AS Sex
, 1 Active
, 0 DeleteFlag
, CreateDate
, 1 CreatedBy
, DOB
, a.DobPrecision
, a.Ptn_Pk
 FROM mst_Patient a

 INNER JOIN (Select a.Ptn_pk
	, MAX(e.FacilityName) f
	, Coalesce(Min(Case When c.ModuleName = 'HIVCARE-STATICFORM' 
	Then COALESCE(b.OldEnrollDate, a.StartDate) Else Null End) 
	,Min(Case When c.ModuleName = 'CCC Patient Card MoH 257' 
	Then COALESCE(b.OldEnrollDate, a.StartDate) Else Null End)
	,Min(Case When c.ModuleName = 'Paediatric ART' 
	Then COALESCE(b.OldEnrollDate, a.StartDate) Else Null End)
	,MIN(Case When c.ModuleName = 'Comprehensive Care Clinic' 
	Then COALESCE(b.OldEnrollDate, a.StartDate) Else Null End)
	) RegistrationAtCCC
	From Lnk_PatientProgramStart a 
	LEFT JOIN Lnk_PatientReEnrollment b ON a.Ptn_pk = b.Ptn_Pk AND a.ModuleId = b.ModuleId 		
	LEFT join mst_module c on a.ModuleId = c.ModuleID
	INNER JOIN mst_Patient d ON a.Ptn_Pk = d.Ptn_Pk
	INNER JOIN mst_Facility e ON d.LocationID = e.FacilityID
	WHERE e.FacilityName NOT LIKE '%transit%'
	AND e.FacilityName NOT LIKE '%pep%'
	AND e.FacilityName NOT LIKE '%probation%'
	Group By a.Ptn_pk) regCCC ON a.Ptn_Pk = regCCC.Ptn_pk

Where MovedToPatientTable = 0
AND a.DeleteFlag = 0
AND regCCC.RegistrationAtCCC IS NOT NULL
AND COALESCE(CAST(a.PatientEnrollmentID as VARCHAR(1000)), CAST(a.PatientClinicID as VARCHAR(1000))) IS NOT NULL;


/*PersonLocation*/
INSERT INTO [dbo].[PersonLocation]
           ([PersonId]
           ,[County]
           ,[SubCounty]
           ,[Ward]
           ,[Village]
           ,[Location]
           ,[SubLocation]
           ,[LandMark]
           ,[NearestHealthCentre]
           ,[Active]
           ,[SketchMap]
           ,[DeleteFlag]
           ,[CreatedBy]
           ,[CreateDate]
           ,[AuditData])

select a.Id
, 48 CountyID
, 286 SubCountyID
, 1425 WardID
, REPLACE(COALESCE(c.Name,'Not Documented'),'''','''''') Village
, 'Not Documented' [Location]
, 'Not Documented' [SubLocation]
, 'Not Documented' Landmark
, 'Not Documented' NearestHealthCentre
, 1
, NULL
, 0
, a.CreatedBy
, a.CreateDate
, NULL
 from Person a INNER JOIN 
mst_Patient b ON a.Ptn_Pk = b.Ptn_Pk 
LEFT JOIN mst_Village c ON b.VillageName = c.ID 
LEFT JOIN PersonLocation d ON a.Id = d.PersonId
WHERE d.Id IS NULL;

/*PersonContact*/

INSERT INTO [dbo].[PersonContact]
           ([PersonId]
           ,[PhysicalAddress]
           ,[MobileNumber]
           ,[Active]
           ,[DeleteFlag]
           ,[CreatedBy]
           ,[CreateDate])

SELECT a.Id
, b.Address
, b.Phone
, 1
, 0
, a.CreatedBy
, a.CreateDate
 from Person a INNER JOIN 
mst_Patient b ON a.Ptn_Pk = b.Ptn_Pk 
LEFT JOIN PersonContact d ON a.Id = d.PersonId
WHERE d.Id IS NULL;

/*PatientMaritalStatus*/

INSERT INTO [dbo].[PatientMaritalStatus]
           ([PersonId]
           ,[MaritalStatusId]
           ,[Active]
           ,[DeleteFlag]
           ,[CreatedBy]
           ,[CreateDate])

SELECT a.Id
, CASE WHEN c.[Name] LIKE '%Polygamous%' THEN 60 --Married Polygamous
WHEN c.[Name] LIKE '%Married%' THEN (select Id FROM LookupItem WHERE [Name] = 'Married') --Married
WHEN c.[Name] LIKE '%Divorced%' THEN 62 
WHEN c.[Name] LIKE '%Single%' THEN 58 --Single
WHEN c.[Name] LIKE '%Cohabit%' THEN 59 --Cohabiting
WHEN c.[Name] LIKE '%Widowed%' THEN 1437 --Cohabiting
WHEN c.[Name] LIKE '%Separated%' THEN 61 --Cohabiting
WHEN c.[Name] LIKE '%Child%' THEN 0 --Null
ELSE 518 --Unknown/Other 
END AS MaritalStatusId
, 1
, 0
, a.CreatedBy
, a.CreateDate
 from Person a INNER JOIN 
mst_Patient b ON a.Ptn_Pk = b.Ptn_Pk 
LEFT JOIN mst_Decode c ON b.MaritalStatus = c.ID 
LEFT JOIN PatientMaritalStatus d ON a.Id = d.PersonId
WHERE d.Id IS NULL;



/*Patient*/



INSERT INTO [dbo].[Patient]
           ([ptn_pk]
           ,[PersonId]
           ,[PatientIndex]
           ,[PatientType]
           ,[FacilityId]
           ,[Active]
           ,[DateOfBirth]
           ,[DobPrecision]
           ,[NationalId]
           ,[DeleteFlag]
           ,[CreatedBy]
           ,[CreateDate]
           ,[RegistrationDate])


SELECT a.Ptn_Pk
, a.Id
, CAST(YEAR(regCCC.RegistrationAtCCC) AS VARCHAR(1000)) + '-' + CAST(ROW_NUMBER() 
	OVER(PARTITION BY YEAR(regCCC.RegistrationAtCCC) 
	ORDER BY regCCC.RegistrationAtCCC) AS VARCHAR(1000)) AS PatientIndex
, 261 PatientType
, @MFLCode FacilityId
, 1 Active
, a.DateOfBirth 
, a.DobPrecision
, ENCRYPTBYKEY(KEY_GUID('Key_CTC')
	,CASE WHEN [ID/PassportNo] = '' OR [ID/PassportNo] IS NULL 
		THEN '' 
	ELSE LTRIM(RTRIM([ID/PassportNo])) 
	END)  NationalId
, 0 DeleteFlag
, a.CreatedBy
, a.CreateDate
, regCCC.RegistrationAtCCC

 from Person a INNER JOIN 
mst_Patient b ON a.Ptn_Pk = b.Ptn_Pk 
INNER JOIN (Select a.Ptn_pk
	, MAX(e.FacilityName) f
	, Coalesce(Min(Case When c.ModuleName = 'HIVCARE-STATICFORM' 
	Then COALESCE(b.OldEnrollDate, a.StartDate) Else Null End) 
	,Min(Case When c.ModuleName = 'CCC Patient Card MoH 257' 
	Then COALESCE(b.OldEnrollDate, a.StartDate) Else Null End)
	,Min(Case When c.ModuleName = 'Paediatric ART' 
	Then COALESCE(b.OldEnrollDate, a.StartDate) Else Null End)
	,MIN(Case When c.ModuleName = 'Comprehensive Care Clinic' 
	Then COALESCE(b.OldEnrollDate, a.StartDate) Else Null End)
	) RegistrationAtCCC
	From Lnk_PatientProgramStart a 
	LEFT JOIN Lnk_PatientReEnrollment b ON a.Ptn_pk = b.Ptn_Pk AND a.ModuleId = b.ModuleId 		
	LEFT join mst_module c on a.ModuleId = c.ModuleID
	INNER JOIN mst_Patient d ON a.Ptn_Pk = d.Ptn_Pk
	INNER JOIN mst_Facility e ON d.LocationID = e.FacilityID
	WHERE e.FacilityName NOT LIKE '%transit%'
	AND e.FacilityName NOT LIKE '%pep%'
	AND e.FacilityName NOT LIKE '%probation%'
	Group By a.Ptn_pk) regCCC ON a.Ptn_Pk = regCCC.Ptn_pk
LEFT JOIN Patient d ON a.Id = d.PersonId
WHERE d.Id IS NULL;




/*PatientEnrollment*/

INSERT INTO [dbo].[PatientEnrollment]
           ([PatientId]
           ,[ServiceAreaId]
           ,[EnrollmentDate]
           ,[EnrollmentStatusId]
           ,[TransferIn]
           ,[CareEnded]
           ,[DeleteFlag]
           ,[CreatedBy]
           ,[CreateDate])
Select a.Id 
, 1 ServiceAreaId
, a.RegistrationDate
, 0
, 0
, 0
, 0
, a.CreatedBy
, a.CreateDate

FROM Patient a LEFT JOIN PatientEnrollment b
ON a.Id = b.PatientId
WHERE b.Id IS NULL

/*PatientIdentifier*/

INSERT INTO [dbo].[PatientIdentifier]
           ([PatientId]
           ,[PatientEnrollmentId]
           ,[IdentifierTypeId]
           ,[IdentifierValue]
           ,[DeleteFlag]
           ,[CreatedBy]
           ,[CreateDate]
           ,[Active])
SELECT c.Id PatientId
, d.Id PatientEnrollmentId
, 1
, CAST(c.FacilityId as VARCHAR(1000)) 
--+ '-' 
+ COALESCE(CAST(b.PatientEnrollmentID as VARCHAR(1000)), CAST(b.PatientClinicID as VARCHAR(1000))) IdentifierValue
, 0
, a.CreatedBy
, a.CreateDate
, 1
 from Person a INNER JOIN 
(select Ptn_Pk 
, case
 when ISNUMERIC(PatientEnrollmentId) = 1 and len(PatientEnrollmentId) = 1
 then '0000' + PatientEnrollmentId
when ISNUMERIC(PatientEnrollmentId) = 1 and len(PatientEnrollmentId) = 2
then '000' + PatientEnrollmentId
when ISNUMERIC(PatientEnrollmentId) = 1 and len(PatientEnrollmentId) = 3
then '00' + PatientEnrollmentId
when ISNUMERIC(PatientEnrollmentId) = 1 and len(PatientEnrollmentId) = 4
then '0' + PatientEnrollmentId
else PatientEnrollmentID end as PatientEnrollmentID
, PatientClinicId
from mst_Patient) b ON a.Ptn_Pk = b.Ptn_Pk 
INNER JOIN Patient c ON a.Id = c.PersonId
INNER JOIN PatientEnrollment d ON c.Id = d.PatientId
LEFT JOIN PatientIdentifier e ON d.Id = e.PatientEnrollmentId
WHERE e.Id IS NULL;


/*ServiceEntryPoint*/

INSERT INTO [dbo].[ServiceEntryPoint]
           ([PatientId]
           ,[ServiceAreaId]
           ,[EntryPointId]
           ,[DeleteFlag]
           ,[CreatedBy]
           ,[CreateDate]
           ,[Active])
SELECT c.Id PatientId
, 1 ServiceAreaId
, CASE WHEN d.Name LIKE '%VCT%' THEN 17 --VCT
	WHEN d.Name LIKE '%OPD%' OR d.Name LIKE '%Out%patient%' THEN 18 --OPD
	WHEN d.Name LIKE '%MCH%' OR d.Name LIKE '%PMTCT%' THEN 19 --MCH	
	WHEN d.Name LIKE 'TB%' THEN 20 --TB
	WHEN (d.Name LIKE '%Inpatient%' OR d.Name LIKE '%IPD%')
	AND CAST(DATEDIFF(dd, a.DateOfBirth, c.RegistrationDate)/365.25 as decimal(18,1)) >= 15 THEN 22 --IPD-Adult
	WHEN (d.Name LIKE '%Inpatient%' OR d.Name LIKE '%IPD%') 
	AND CAST(DATEDIFF(dd, a.DateOfBirth, c.RegistrationDate)/365.25 as decimal(18,1)) < 15 THEN 21 --IPD-Child
	WHEN d.Name IS NULL THEN 0 --Not Documented
	ELSE 25 --Other
	END AS EntryPoint
, 0 DeleteFlag
, a.CreatedBy
, a.CreateDate
, 1 Active
 from Person a INNER JOIN 
mst_Patient b ON a.Ptn_Pk = b.Ptn_Pk 
INNER JOIN Patient c ON a.Id = c.PersonId
left join mst_decode d on b.ReferredFrom = d.ID and d.CodeID IN (17, 1089)
left join ServiceEntryPoint e on c.Id = e.PatientId
WHERE e.Id IS NULL;

/*PatientMasterVisit*/

INSERT INTO [dbo].[PatientMasterVisit]
           ([PatientId]
           ,[ServiceId]
           ,[Start]
           ,[End]
           ,[Active]
           ,[VisitDate]
           ,[VisitType]
           ,[CreateDate]
           ,[DeleteFlag]
           ,[CreatedBy])
Select a.Id 
, 1 ServiceId
, a.RegistrationDate [Start]
, a.RegistrationDate [End]
, 0 [Active]
, a.RegistrationDate [VisitDate]
, 316 [VisitType]
, a.CreateDate
, 0 DeleteFlag
, a.CreatedBy

FROM Patient a LEFT JOIN PatientMasterVisit b 
ON a.Id = b.PatientId AND b.VisitType = 316
WHERE b.Id IS NULL;

UPDATE mst_Patient
Set MovedToPatientTable = 1
WHERE Ptn_Pk IN 
(Select a.Ptn_Pk FROM mst_Patient a

 INNER JOIN (Select a.Ptn_pk
	, MAX(e.FacilityName) f
	, Coalesce(Min(Case When c.ModuleName = 'HIVCARE-STATICFORM' 
	Then COALESCE(b.OldEnrollDate, a.StartDate) Else Null End) 
	,Min(Case When c.ModuleName = 'CCC Patient Card MoH 257' 
	Then COALESCE(b.OldEnrollDate, a.StartDate) Else Null End)
	,Min(Case When c.ModuleName = 'Paediatric ART' 
	Then COALESCE(b.OldEnrollDate, a.StartDate) Else Null End)
	,MIN(Case When c.ModuleName = 'Comprehensive Care Clinic' 
	Then COALESCE(b.OldEnrollDate, a.StartDate) Else Null End)
	) RegistrationAtCCC
	From Lnk_PatientProgramStart a 
	LEFT JOIN Lnk_PatientReEnrollment b ON a.Ptn_pk = b.Ptn_Pk AND a.ModuleId = b.ModuleId 		
	LEFT join mst_module c on a.ModuleId = c.ModuleID
	INNER JOIN mst_Patient d ON a.Ptn_Pk = d.Ptn_Pk
	INNER JOIN mst_Facility e ON d.LocationID = e.FacilityID
	WHERE e.FacilityName NOT LIKE '%transit%'
	AND e.FacilityName NOT LIKE '%pep%'
	AND e.FacilityName NOT LIKE '%probation%'
	Group By a.Ptn_pk) regCCC ON a.Ptn_Pk = regCCC.Ptn_pk

Where MovedToPatientTable = 0
AND a.DeleteFlag = 0
AND regCCC.RegistrationAtCCC IS NOT NULL
AND COALESCE(CAST(a.PatientEnrollmentID as VARCHAR(1000)), CAST(a.PatientClinicID as VARCHAR(1000))) IS NOT NULL);

Close symmetric key Key_CTC;

END