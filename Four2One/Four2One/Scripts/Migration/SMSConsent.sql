/* 
SMSConsent	DateOfConsent

ConsentedToSMS	DateConsented
ConsentedtoSMS	ConsentedDate

SMSConsented	Dateofconsent
SMSConsented	DateConsented
SMSConsented	DateSMSConsented
SMSConsented	
SMSConsented	ConsentedDate
SMSConsented	DateOfSMSConsent
*/

IF EXISTS(SELECT name FROM sys.tables WHERE name = N'x_SMSConsent')
	DROP TABLE x_SMSConsent;
	
	CREATE TABLE x_SMSConsent
	(PatientPK INT NOT NULL
	, DateOfConsent DATE NULL);

	IF EXISTS(Select name from sys.columns where name = N'SMSConsent')
	BEGIN TRY 
			EXEC('INSERT INTO x_SMSConsent 
			SELECT DISTINCT 
			Ptn_pk 
			, DateOfConsent
			from DTL_FBCUSTOMFIELD_Patient_Registration
			WHERE SMSConsent = 1')
	END TRY
	BEGIN CATCH

	END CATCH

	IF EXISTS(Select name from sys.columns where name = N'SMSConsented')
	BEGIN TRY 
			EXEC('INSERT INTO x_SMSConsent 
			SELECT DISTINCT 
			Ptn_pk 
			, DateOfConsent
			from DTL_FBCUSTOMFIELD_Patient_Registration
			WHERE SMSConsented = 1')
	END TRY
	BEGIN CATCH

	END CATCH

	IF EXISTS(Select name from sys.columns where name = N'SMSConsented')
	BEGIN TRY 
			EXEC('INSERT INTO x_SMSConsent 
			SELECT DISTINCT 
			Ptn_pk 
			, DateConsented
			from DTL_FBCUSTOMFIELD_Patient_Registration
			WHERE SMSConsented = 1')
	END TRY
	BEGIN CATCH

	END CATCH

	IF EXISTS(Select name from sys.columns where name = N'SMSConsented')
	BEGIN TRY 
			EXEC('INSERT INTO x_SMSConsent 
			SELECT DISTINCT 
			Ptn_pk 
			, DateSMSConsented
			from DTL_FBCUSTOMFIELD_Patient_Registration
			WHERE SMSConsented = 1')
	END TRY
	BEGIN CATCH

	END CATCH

	IF EXISTS(Select name from sys.columns where name = N'SMSConsented')
	BEGIN TRY 
			EXEC('INSERT INTO x_SMSConsent 
			SELECT DISTINCT 
			Ptn_pk 
			, DateOfSMSConsent
			from DTL_FBCUSTOMFIELD_Patient_Registration
			WHERE SMSConsented = 1')
	END TRY
	BEGIN CATCH

	END CATCH

	IF EXISTS(Select name from sys.columns where name = N'SMSConsented')
	BEGIN TRY 
			EXEC('INSERT INTO x_SMSConsent 
			SELECT DISTINCT 
			Ptn_pk 
			, ConsentedDate
			from DTL_FBCUSTOMFIELD_Patient_Registration
			WHERE SMSConsented = 1')
	END TRY
	BEGIN CATCH

	END CATCH

	IF EXISTS(Select name from sys.columns where name = N'ConsentedToSMS')
	BEGIN TRY 
			EXEC('INSERT INTO x_SMSConsent 
			SELECT DISTINCT 
			Ptn_pk 
			, DateConsented
			from DTL_FBCUSTOMFIELD_Patient_Registration
			WHERE ConsentedToSMS = 1')
	END TRY
	BEGIN CATCH

	END CATCH

	IF EXISTS(Select name from sys.columns where name = N'ConsentedToSMS')
	BEGIN TRY 
			EXEC('INSERT INTO x_SMSConsent 
			SELECT DISTINCT 
			Ptn_pk 
			, ConsentedDate
			from DTL_FBCUSTOMFIELD_Patient_Registration
			WHERE ConsentedToSMS = 1')
	END TRY
	BEGIN CATCH

	END CATCH

	
INSERT INTO PatientConsent

([PatientId]
,[PatientMasterVisitId]
,[ServiceAreaId]
,[ConsentType]
,[ConsentDate]
,[Active]
,[DeleteFlag]
,[CreatedBy]
,[CreateDate]
)


SELECT b.Id PatientId 
, 0 PatientMasterVisitId
, 258 ServiceAreaId
, 284 ConsentTypeId
, CAST(COALESCE(a.DateOfConsent, b.CreateDate) as DATE) DateOfConsent
, 1 Active
, 0 DeleteFlag
, b.CreatedBy
, b.CreateDate


FROM x_SMSConsent a 
INNER JOIN Patient b ON a.PatientPK = b.Ptn_pk
LEFT JOIN PatientConsent c on b.Id = c.PatientId

WHERE c.Id IS NULL;



IF EXISTS(SELECT name FROM sys.tables WHERE name = N'x_SMSConsent')
	DROP TABLE x_SMSConsent;