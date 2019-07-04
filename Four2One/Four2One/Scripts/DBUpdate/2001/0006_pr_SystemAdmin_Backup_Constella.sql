IF  EXISTS (SELECT * FROM sys.objects WHERE object_id 
= OBJECT_ID(N'[dbo].[pr_SystemAdmin_Backup_Constella]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].pr_SystemAdmin_Backup_Constella
GO

CREATE PROCEDURE [dbo].[pr_SystemAdmin_Backup_Constella] @FileName VARCHAR(500)
	,@LocationId INT
	,@Deidentified INT
	,@dbKey VARCHAR(50) = null
AS
DECLARE @InstanceName VARCHAR(1000)
DECLARE @dir VARCHAR(500)
DECLARE @Ver VARCHAR(20)
DECLARE @Loc VARCHAR(200)
DECLARE @Tsql VARCHAR(500)

SET @Tsql = 'Open symmetric key Key_CTC decryption by password='+ '''ttwbvXWpqb5WOLfLrBgisw=='''  + ''

PRINT @Tsql

EXEC (@Tsql)

SET @Loc = ''

SELECT @Ver = isnull(appver, '')
FROM appadmin
WHERE id = 1

IF @LocationId > 0
	SELECT @Loc = isnull(FacilityName, '')
	FROM mst_facility
	WHERE facilityid = @LocationId

IF @Deidentified = 1
BEGIN
	SET @InstanceName = '\IQCare-Deidentified-' + @Ver + ' ' + @Loc + '' + convert(VARCHAR, getdate(), 23)
		--SET @InstanceName = 'iqcare_backup_Deidt' + @Loc + convert(VARCHAR, getdate(), 23)
END
ELSE
BEGIN
	SET @InstanceName = '\IQCare-' + @Ver + ' ' + @Loc + '' + convert(VARCHAR, getdate(), 23)
		--SET @InstanceName = 'iqcare_backup' + @Loc + convert(VARCHAR, getdate(), 23)
END

--PRINT @InstanceName;
DECLARE @dbname VARCHAR(100)

SELECT @dbname = db_name()

PRINT @FileName

SELECT @@Version AS [version]
	,@@SERVICENAME AS nameInstance

PRINT 'deleting all old files'

--delete all backups from directory specified
SET @dir = 'EXECUTE master.sys.xp_delete_file 0,N''' + @FileName + ''',N''bak'',N''' + convert(VARCHAR, dateadd(dd, - 14, getdate()), 106) + ''''

EXEC (@dir)

PRINT 'backing up database'

SET @TSQL = 'BACKUP DATABASE [' + @dbname + '] TO  DISK = ''' + @FileName + @InstanceName + '.bak' + ''' WITH NOFORMAT, INIT,  NAME = ''' + @InstanceName + ''', SKIP, REWIND, NOUNLOAD, STATS = 10'

PRINT @TSQL

EXEC (@TSQL)

PRINT 'restoring database'

--
IF EXISTS (
		SELECT TOP 1 NAME
		FROM sys.databases
		WHERE NAME = 'IQCare_Bck'
		)
BEGIN
	EXEC ('DROP DATABASE IQCare_Bck')
END

IF CHARINDEX('2012', @@VERSION) > 0
BEGIN
	EXEC ('CREATE DATABASE IQCare_Bck; ' + 'RESTORE DATABASE IQCare_Bck '
	 + ' FROM DISK = ''' + @FileName + @InstanceName + '.bak''' 
	 + ' WITH REPLACE, ' 
	 + ' MOVE ''TestDataBase_IQCare'' TO '''+@FileName+'\IQCare_Bck.mdf'', ' 
	 + ' MOVE ''TestDataBase_IQCare_log'' TO '''+@FileName+'\IQCare_Bck_log.ldf''')
END
ELSE
BEGIN
	EXEC ('CREATE DATABASE IQCare_Bck; ' + 'RESTORE DATABASE IQCare_Bck ' + ' FROM DISK = ''' + @FileName + @InstanceName + '.bak''' 
	+ ' WITH REPLACE, ' 
	+ ' MOVE ''TestDataBase_IQCare'' TO ''C:\IQCareDBBackup\IQCare_Bck.mdf'', ' 
	+ ' MOVE ''TestDataBase_IQCare_log'' TO ''C:\IQCareDBBackup\IQCare_Bck_log.ldf''')
END

CLOSE symmetric KEY Key_CTC

IF @Deidentified = 1
BEGIN
	SET @Tsql = 'USE IQCare_Bck;  Open symmetric key Key_CTC decryption by password = ' + @dbKey + ''

	EXEC (@Tsql)

	OPEN symmetric KEY Key_CTC decryption BY password = 'ttwbvXWpqb5WOLfLrBgisw=='

	SELECT *
	FROM sys.openkeys;

	SELECT [KEY_GUID]
	FROM sys.symmetric_keys
	WHERE [Name] = 'Key_CTC';


	UPDATE IQCare_Bck.dbo.mst_patient
	SET FirstName = encryptbykey(key_guid('Key_CTC'), 'FName')
		,MiddleName = encryptbykey(key_guid('Key_CTC'), '')
		,LastName = encryptbykey(key_guid('Key_CTC'), 'LName')
		,Address = encryptbykey(key_guid('Key_CTC'), 'Address')
		,Phone = encryptbykey(key_guid('Key_CTC'), '')

	UPDATE IQCare_Bck.dbo.dtl_patientcontacts
	SET GuardianName = encryptbykey(key_guid('Key_CTC'), 'GName')
		,GuardianInformation = encryptbykey(key_guid('Key_CTC'), 'GInfo')
		,EmergContactName = 'EContactName'
		,EmergContactPhone = ''
		,EmergContactAddress = 'EAddress'
		,TenCellLeader = encryptbykey(key_guid('Key_CTC'), 'TCellLeader')
		,TenCellLeaderAddress = encryptbykey(key_guid('Key_CTC'), 'TCellLeaderAdd')
		,TreatmentSupportName = 'TSuppName'
		,CommunitySupportGroup = 'ComSuppGroup'
		,TreatmentSupportAddress = 'TSuppAddress'

	UPDATE IQCare_Bck.dbo.dtl_FamilyInfo
	SET RFirstName = encryptbykey(key_guid('Key_CTC'), 'RFName')
		,RLastName = encryptbykey(key_guid('Key_CTC'), 'RLName');

    UPDATE IQCare_Bck.dbo.Person 
	SET FirstName = encryptbykey(key_guid('Key_CTC'), 'FName')
	, MidName = encryptbykey(key_guid('Key_CTC'), 'MName')
	, LastName = encryptbykey(key_guid('Key_CTC'), 'LName');

	UPDATE IQCare_Bck.dbo.PersonContact
	SET PhysicalAddress = encryptbykey(key_guid('Key_CTC'), 'Address')
	, MobileNumber = encryptbykey(key_guid('Key_CTC'), '+254700000000')
	, AlternativeNumber = NULL
	, EmailAddress = NULL;
		--CLOSE symmetric KEY Key_CTC
END

PRINT 'create final backup'

--delete all backups from directory specified
SET @dir = 'EXECUTE master.sys.xp_delete_file 0,N''' + @FileName + ''',N''bak'',N''' + convert(VARCHAR, dateadd(dd, - 14, getdate()), 106) + ''''

EXEC (@dir)

SET @TSQL = 'BACKUP DATABASE IQCare_Bck TO  DISK = ''' + @FileName + @InstanceName + '.bak' + ''' WITH NOFORMAT, INIT,  NAME = ''' + @InstanceName + ''', SKIP, REWIND, NOUNLOAD, STATS = 10'

PRINT @TSQL

EXEC (@TSQL)

PRINT 'drop temp database'

EXEC ('DROP DATABASE IQCare_Bck')

GO