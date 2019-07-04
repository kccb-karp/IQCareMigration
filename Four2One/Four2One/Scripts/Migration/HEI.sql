IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pr_HEIRegistration]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].pr_HEIRegistration
GO


CREATE PROC pr_HEIRegistration(@MFLCode VARCHAR(1000)) AS
BEGIN

IF EXISTS(select name from sys.tables where name = N'x_HEI')
DROP TABLE x_HEI;

CREATE TABLE x_HEI (Ptn_Pk INT NOT NULL, RegistrationDate DATE NOT NULL, HEIID VARCHAR(1000) NOT NULL);

INSERT INTO x_HEI (Ptn_Pk, RegistrationDate, HEIID)
	SELECT a.Ptn_Pk
	, MIN(b.StartDate) RegistrationDate
	, MAX(a.HEIIDNumber) HEIIDNumber
	from mst_Patient a inner join Lnk_PatientProgramStart b
	on a.Ptn_Pk = b.Ptn_pk inner join mst_Module c on b.ModuleId = c.ModuleID
	inner join DTL_FBCUSTOMFIELD_HEI_Follow_Up_Card d on a.ptn_pk = d.ptn_pk
	left join Person e oN a.Ptn_Pk = e.Ptn_Pk
	where c.ModuleName = 'ANC Maternity and Postnatal'
	and e.Id IS NULL
	AND a.HEIIDNumber IS NOT NULL
	AND a.DeleteFlag = 0
	GROUP BY a.Ptn_Pk;

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

 INNER JOIN  x_HEI b ON a.Ptn_Pk = b.Ptn_pk

Where MovedToPatientTable = 0
AND a.DeleteFlag = 0
AND b.RegistrationDate IS NOT NULL
AND a.HEIIDNumber IS NOT NULL;


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
INNER JOIN x_HEI e ON a.Ptn_Pk = e.Ptn_Pk
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
INNER JOIN x_HEI e ON a.Ptn_Pk = e.Ptn_Pk
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
, CAST(YEAR(c.RegistrationDate) AS VARCHAR(1000)) + '-' + CAST(ROW_NUMBER() 
	OVER(PARTITION BY YEAR(c.RegistrationDate) 
	ORDER BY c.RegistrationDate) AS VARCHAR(1000)) AS PatientIndex
, 261 PatientType
, @MFLCode FacilityId
, 1 Active
, a.DateOfBirth 
, a.DobPrecision
, ENCRYPTBYKEY(KEY_GUID('Key_CTC'),'')  NationalId
, 0 DeleteFlag
, a.CreatedBy
, a.CreateDate
, c.RegistrationDate

 from Person a INNER JOIN 
mst_Patient b ON a.Ptn_Pk = b.Ptn_Pk 
INNER JOIN  x_HEI c ON a.Ptn_Pk = c.Ptn_pk
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
, 6 ServiceAreaId
, a.RegistrationDate
, 0
, 0
, 0
, 0
, a.CreatedBy
, a.CreateDate

FROM Patient a LEFT JOIN PatientEnrollment b ON a.Id = b.PatientId
INNER JOIN x_HEI c ON a.ptn_pk = c.Ptn_Pk
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
, 5
, b.HEIID
, 0
, a.CreatedBy
, a.CreateDate
, 1
 from Person a INNER JOIN 
x_HEI b ON a.Ptn_Pk = b.Ptn_Pk 
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
inner join x_HEI f ON a.Ptn_Pk = f.Ptn_Pk
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
INNER JOIN x_HEI c ON a.ptn_pk = c.Ptn_Pk
WHERE b.Id IS NULL;

UPDATE mst_Patient
Set MovedToPatientTable = 1
WHERE Ptn_Pk IN 
(Select a.Ptn_Pk FROM mst_Patient a
 INNER JOIN x_HEI b ON a.Ptn_Pk = b.Ptn_pk
Where MovedToPatientTable = 0);


Close symmetric key Key_CTC;

/*Migrate Pharmacy Forms*/
INSERT INTO [dbo].[PatientMasterVisit]
           ([PatientId]
           ,[ServiceId]
           ,[Start]
           ,[End]
           ,[Active]
           ,[VisitDate]
           ,[VisitScheduled]
           ,[VisitBy]
           ,[VisitType]
           ,[Status]
           ,[CreateDate]
           ,[DeleteFlag]
           ,[CreatedBy]
           )

			Select distinct
			c.Id PatientId
			, 1 ServiceId
			, case when a.visitdate > getdate() 
				then cast(a.CreateDate as date) 
				else cast(a.VisitDate as date) 
				end as Starting
			, case when a.visitdate > getdate() 
				then cast(a.CreateDate as date) 
				else cast(a.VisitDate as date) 
				end Ending
			, 0 Active
			, case when a.visitdate > getdate() 
				then cast(a.CreateDate as date) 
				else cast(a.VisitDate as date) 
				end as VisitDate
			, 0 VisitScheduled
			, 111 VisitBy
			, 0 VisitType
			, 2 Status
			, MIN(CAST(a.CreateDate as date)) CreateDate
			, 0 DeleteFlag
			, 1 CreatedBy

			FROM x_HEI x INNER JOIN 
			ord_Visit a ON x.Ptn_Pk = a.Ptn_Pk
			INNER JOIN mst_VisitType b ON a.VisitType = b.VisitTypeID
			INNER JOIN Patient c on a.Ptn_Pk = c.ptn_pk
			LEFT JOIN PatientMasterVisit d ON c.Id = d.PatientId 
				AND cast(a.VisitDate as date) = cast(d.VisitDate as date)
				AND d.VisitType = 0
			
			
			Where 
			(a.DeleteFlag = 0 OR a.DeleteFlag iS NULL)
			
			AND b.VisitName LIKE '%Pharmacy%'
			AND YEAR(a.visitdate) >= 2000
			and d.Id is null
			GROUP BY c.Id
			,  case when a.visitdate > getdate() 
				then cast(a.CreateDate as date) 
				else cast(a.VisitDate as date) 
				end;


WITH Pharmacy AS (

select a.ptn_pharmacy_pk
, d.PatientId
, d.Id PatientMasterVisitId
 from ord_PatientPharmacyOrder
a inner join ord_visit b on a.VisitID = b.Visit_Id
inner join Patient c on a.Ptn_pk = c.ptn_pk
inner join PatientMasterVisit d on c.Id = d.PatientId and 
cast(b.visitdate as date) = cast(d.visitdate as date)
and d.VisitType = 0
inner join mst_Patient e ON a.ptn_pk = e.ptn_pk
where a.PatientMasterVisitId is null
and (e.deleteflag = 0 or e.deleteflag is null))

UPDATE ord_PatientPharmacyOrder
SET PatientId = B.PatientId
, PatientMasterVisitId = B.PatientMasterVisitId
FROM ord_PatientPharmacyOrder A
INNER JOIN Pharmacy B
    ON A.ptn_pharmacy_pk = B.ptn_pharmacy_pk
WHERE A.PatientId IS NULL;


declare @PharmacyEncounter varchar(100) = (select top 1 Id from lookupitem where Name = 'Pharmacy-encounter')
insert into PatientEncounter
select pmv.PatientId, @PharmacyEncounter, pmv.Id, pmv.start, pmv.start, 204, 0, 1, ord.createdate, null,0
from ord_patientpharmacyorder ord inner join patientmastervisit pmv on ord.PatientMasterVisitId = pmv.id
where patientmastervisitid is not null and not exists (select 1 from PatientEncounter where PatientId = pmv.PatientId 
and encountertypeid=@PharmacyEncounter and patientmastervisitid = pmv.Id);				


IF EXISTS(select name from sys.tables where name = N'x_HEI')
DROP TABLE x_HEI;

END