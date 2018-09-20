IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pr_421_registration]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].pr_421_registration
GO


CREATE PROC pr_421_registration(@CountyName VARCHAR(100), @MFLCode VARCHAR(100)) AS
BEGIN

declare @MaleID as INT = (SELECT LookupItemId FROM LookupMasterItem WHERE DisplayName = N'Male' AND LookupMasterId = 17)
declare @FemaleID as INT = (SELECT LookupItemId FROM LookupMasterItem WHERE DisplayName = N'Female' AND LookupMasterId = 17)
DECLARE @CountyID AS INT = (SELECT TOP 1 CountyID FROM County WHERE LTRIM(RTRIM(CountyName)) = @CountyName)


DECLARE @Ptn_Pk VARCHAR(10),
@PatientIndex VARCHAR(50),
@FirstName VARCHAR(100),
@MiddleName VARCHAR(100),
@LastName VARCHAR(100),
@Sex VARCHAR(10),
@DOB VARCHAR(20),
@DobPrecision VARCHAR(10),
@County VARCHAR(10),
@SubCounty VARCHAR(10),
@Ward VARCHAR(10),
@Village VARCHAR(500),
@Location VARCHAR(500),
@SubLocation VARCHAR(500),
@NearestHealthCentre VARCHAR(500),
@PhysicalAddress VARCHAR(500),
@MobileNumber VARCHAR(500),
@AlternativeNumber VARCHAR(MAX),
@EmailAddress VARBINARY(MAX),
@PopulationType VARCHAR(500),
@PopulationCategory VARCHAR(500),
@EnrollmentDate VARCHAR(20),
@EntryPoint VARCHAR(500),
@PatientType VARCHAR(10),
@PatientEnrollmentID VARCHAR(500),
@MaritalStatus VARCHAR(500)

Open symmetric key Key_CTC decryption by password='ttwbvXWpqb5WOLfLrBgisw=='
DECLARE @C as cursor
Set @C =  CURSOR FOR


select a.Ptn_Pk
	, CAST(YEAR(regCCC.RegistrationAtCCC) AS VARCHAR(10)) + '-' + CAST(ROW_NUMBER() OVER(PARTITION BY YEAR(regCCC.RegistrationAtCCC) ORDER BY regCCC.RegistrationAtCCC) AS VARCHAR(10)) AS PatientIndex
	--**Person
	, Convert(varchar(100), Decryptbykey(firstname)) FirstName
	, Convert(varchar(100), Decryptbykey(MiddleName)) MiddleName
	, Convert(varchar(100), Decryptbykey(LastName)) LastName
	, CASE Sex WHEN 17 THEN @FemaleID WHEN 16 THEN @MaleID ELSE NULL END AS Sex
	, CONVERT(VARCHAR(10), DOB, 111) DOB
	, DobPrecision

	--**PersonLocation
	, @CountyID County
	, 0 SubCounty
	, 0 Ward
	, REPLACE(COALESCE((Select Name FROM mst_Village WHERE ID = VillageName),'Unknown'),'''','''''') Village
	, 'Unknown' [Location]
	, 'Unknown' SubLocation
	, 'Unknown' NearestHealthCentre

	--**PersonContact
	, Convert(varchar(500), Decryptbykey([Address])) PhysicalAddress
	, Convert(varchar(500), Decryptbykey(Phone)) MobileNumber	
	, NULL AlternativeNumber
	, NULL EmailAddress

	--**Patient Population
	, 'General Population' PopulationType
	, 0 PopulationCategory
	--, a.RegistrationDate


	--**Enrollment
	, CONVERT(VARCHAR(10),  regCCC.RegistrationAtCCC, 111)  EnrollmentDate
	, CASE WHEN EntryPoint.Name LIKE '%VCT%' THEN 17 --VCT
	WHEN EntryPoint.Name LIKE '%OPD%' OR EntryPoint.Name LIKE '%Out%patient%' THEN 18 --OPD
	WHEN EntryPoint.Name LIKE '%MCH%' OR EntryPoint.Name LIKE '%PMTCT%' THEN 19 --MCH	
	WHEN EntryPoint.Name LIKE 'TB%' THEN 20 --TB
	WHEN EntryPoint.Name LIKE '%Inpatient%' OR EntryPoint.Name LIKE '%IPD%' THEN 22 --MCH
	WHEN EntryPoint.Name IS NULL THEN 0 --Not Documented
	ELSE 25 --Other
	END AS EntryPoint
	, 261 PatientType
	, @MFLCode + '-' + PatientEnrollmentID PatientEnrollmentID

	--**MaritalStatus
	
	, CASE WHEN MaritalStatus.[Name] LIKE '%Polygamous%' THEN 60 --Married Polygamous
	WHEN MaritalStatus.[Name] LIKE '%Married%' THEN 57 --Married Monogamous
	WHEN MaritalStatus.[Name] LIKE '%Divorced%' THEN 62 --Married Monogamous
	WHEN MaritalStatus.[Name] LIKE '%Single%' THEN 58 --Single
	WHEN MaritalStatus.[Name] LIKE '%Cohabit%' THEN 59 --Cohabiting
	WHEN MaritalStatus.[Name] LIKE '%Widowed%' THEN 1437 --Cohabiting
	WHEN MaritalStatus.[Name] LIKE '%Separated%' THEN 61 --Cohabiting
	WHEN MaritalStatus.[Name] LIKE '%Child%' THEN 0 --Null
	ELSE 518 --Unknown/Other 
	END AS MaritalStatus


	 from mst_Patient a

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

	left join mst_decode EntryPoint on a.ReferredFrom = EntryPoint.ID and EntryPoint.CodeID IN (17, 1089)	
	LEFT join mst_Decode MaritalStatus on a.MaritalStatus = MaritalStatus.ID
	where 
	a.MovedToPatientTable = 0	and 
	a.DeleteFlag = 0
	and a.PatientEnrollmentID IS NOT NULL
	and regCCC.RegistrationAtCCC IS NOT NULL


OPEN @C

FETCH NEXT FROM @C INTO 
@Ptn_Pk,
@PatientIndex,
@FirstName,
@MiddleName,
@LastName,
@Sex,
@DOB,
@DobPrecision,
@County,
@SubCounty,
@Ward,
@Village,
@Location,
@SubLocation,
@NearestHealthCentre,
@PhysicalAddress,
@MobileNumber,
@AlternativeNumber,
@EmailAddress,
@PopulationType,
@PopulationCategory,
@EnrollmentDate,
@EntryPoint,
@PatientType,
@PatientEnrollmentID,
@MaritalStatus

WHILE @@FETCH_STATUS = 0
BEGIN

EXEC('
DECLARE @PersonID as INT, @PatientID as INT, @PatientEnrollmentID as INT;

INSERT INTO dbo.[Person]
			(FirstName
			, MidName
			, LastName
			, Sex
			, Active
			, DeleteFlag
			, CreateDate
			, CreatedBy
			, DateOfBirth
			, DobPrecision) 
		VALUES 
			(ENCRYPTBYKEY(KEY_GUID(''Key_CTC''),'''+@FirstName+''')
			, ENCRYPTBYKEY(KEY_GUID(''Key_CTC''),'''+@MiddleName+''')
			, ENCRYPTBYKEY(KEY_GUID(''Key_CTC''),'''+@LastName+''')
			, '+@Sex+'
			, 1, 0, GETDATE(), 1
			, CAST('''+@DOB+''' AS DATE)
			, '+@DobPrecision+');

SELECT @PersonID = IDENT_CURRENT(''Person'')
--PRINT @PersonID
UPDATE mst_Patient SET MovedToPatientTable = 1 WHERE Ptn_Pk = '+@Ptn_Pk+';

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
     VALUES
           (@PersonID
           ,'+@County+'
           ,'+@SubCounty+'
           ,'+@Ward+'
           ,'''+@Village+'''
           ,'''+@Location+'''
           ,'''+@SubLocation+'''
           ,''''
           ,'''+@NearestHealthCentre+'''
           ,1 , NULL ,0 ,1 ,GETDATE() ,NULL);

INSERT INTO [dbo].[PersonContact]
           ([PersonId]
           ,[PhysicalAddress]
           ,[MobileNumber]
           ,[AlternativeNumber]
           ,[EmailAddress]
           ,[Active]
           ,[DeleteFlag]
           ,[CreatedBy]
           ,[CreateDate]
           ,[AuditData])
     VALUES
           (@PersonID
           , ENCRYPTBYKEY(KEY_GUID(''Key_CTC''),'''+@PhysicalAddress+''')
           , ENCRYPTBYKEY(KEY_GUID(''Key_CTC''),'''+@MobileNumber+''')
           ,NULL
           ,NULL
           ,1 ,0 ,1 ,GETDATE() ,NULL);


INSERT INTO [dbo].[PatientMaritalStatus]
           ([PersonId]
           ,[MaritalStatusId]
           ,[Active]
           ,[DeleteFlag]
           ,[CreatedBy]
           ,[CreateDate]
           ,[AuditData])
     VALUES
           (@PersonID
           ,'+@MaritalStatus+'
           ,1 ,0 ,1 ,GETDATE() ,NULL);

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
           ,[AuditData]
           ,[RegistrationDate])
     VALUES
           ('+@Ptn_Pk+'
           ,@PersonID
           ,'''+@PatientIndex+'''
           ,'''+@PatientType+'''
           ,13057
           ,1
           , CAST('''+@DOB+''' AS DATE)
           ,'+@DobPrecision+'
           ,ENCRYPTBYKEY(KEY_GUID(''Key_CTC''),'''')
           ,0
           ,1
           ,GETDATE()
           ,NULL
           , CAST('''+@EnrollmentDate+''' AS DATE));

SELECT @PatientID = IDENT_CURRENT(''Patient'');


INSERT INTO [dbo].[PatientEnrollment]
           ([PatientId]
           ,[ServiceAreaId]
           ,[EnrollmentDate]
           ,[EnrollmentStatusId]
           ,[TransferIn]
           ,[CareEnded]
           ,[DeleteFlag]
           ,[CreatedBy]
           ,[CreateDate]
           ,[AuditData])
     VALUES
           (@PatientID
           ,1
           ,CAST('''+@EnrollmentDate+''' AS DATE)
           ,0
           ,(SELECT CASE WHEN '+@PatientType+' = 260 THEN 1 ELSE 0 END)
           ,0 ,0 ,1 ,GETDATE() ,NULL);
SELECT @PatientEnrollmentID = IDENT_CURRENT(''PatientEnrollment'');

INSERT INTO [dbo].[PatientIdentifier]
           ([PatientId]
           ,[PatientEnrollmentId]
           ,[IdentifierTypeId]
           ,[IdentifierValue]
           ,[DeleteFlag]
           ,[CreatedBy]
           ,[CreateDate]
           ,[Active]
           ,[AuditData])
     VALUES
           (@PatientID
           ,@PatientEnrollmentID
           ,1
           ,'''+@PatientEnrollmentID+'''
           ,0 ,1 ,GETDATE() ,1 ,NULL);


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
           ,[AuditData])
     VALUES
           (@PatientID
           ,1
           ,CAST('''+@EnrollmentDate+''' AS DATETIME)
           ,CAST('''+@EnrollmentDate+''' AS DATETIME)
           ,0
           ,CAST('''+@EnrollmentDate+''' AS DATETIME)
           ,NULL
           ,NULL
           ,316
           ,NULL
           ,GETDATE()
           ,0
           ,1
           ,NULL);

INSERT INTO [dbo].[ServiceEntryPoint]
           ([PatientId]
           ,[ServiceAreaId]
           ,[EntryPointId]
           ,[DeleteFlag]
           ,[CreatedBy]
           ,[CreateDate]
           ,[Active]
           ,[AuditData])
     VALUES
           (@PatientID
           ,1
           ,'+@EntryPoint+'
           ,0 ,1 ,GETDATE() ,0 ,NULL);

')




FETCH NEXT FROM @C INTO 
@Ptn_Pk,
@PatientIndex,
@FirstName,
@MiddleName,
@LastName,
@Sex,
@DOB,
@DobPrecision,
@County,
@SubCounty,
@Ward,
@Village,
@Location,
@SubLocation,
@NearestHealthCentre,
@PhysicalAddress,
@MobileNumber,
@AlternativeNumber,
@EmailAddress,
@PopulationType,
@PopulationCategory,
@EnrollmentDate,
@EntryPoint,
@PatientType,
@PatientEnrollmentID,
@MaritalStatus

END

CLOSE @C
DEALLOCATE @C

Close symmetric key Key_CTC

END