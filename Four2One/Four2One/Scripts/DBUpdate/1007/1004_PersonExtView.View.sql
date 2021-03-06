/****** Object:  View [dbo].[PersonExtView]    Script Date: 07-Jun-2018 18:39:51 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[PersonExtView]'))
DROP VIEW [dbo].[PersonExtView]
GO
/****** Object:  View [dbo].[PersonExtView]    Script Date: 07-Jun-2018 18:39:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[PersonExtView]'))
EXEC dbo.sp_executesql @statement = N'



CREATE VIEW [dbo].[PersonExtView]
AS

	SELECT DISTINCT  Isnull(P.Id,0) Id 
	,pn.Id PersonId
	,0 ptn_pk
	,(SELECT TOP 1 isnull(convert(varchar(10),PosID), ''00000'') FROM mst_Facility WHERE DeleteFlag = 0) + ''-00000'' AS EnrollmentNumber
	,''00000'' PatientIndex
	,CAST(DECRYPTBYKEY(pn.FirstName) AS VARCHAR(50)) AS FirstName
	,CAST(DECRYPTBYKEY(pn.MidName) AS VARCHAR(50)) AS MiddleName
	,CAST(DECRYPTBYKEY(pn.LastName) AS VARCHAR(50)) AS LastName
	,pn.Sex
	,pn.Active
	,convert(datetime,''1900-06-15'') RegistrationDate
	,convert(datetime,''1900-06-15'') AS [EnrollmentDate]
	,''Not Enrolled'' AS PatientStatus
	,NULL ExitReason
	,ISNULL(pn.DateOfBirth,convert(datetime,''1900-06-15'') ) DateOfBirth
	,CAST(DECRYPTBYKEY(''99999999'') as varchar(50)) AS NationalId
	,(SELECT top 1 convert(int,PosID) FROM mst_Facility WHERE DeleteFlag=0) FacilityId
	,(SELECT top 1 Id FROM LookupItem WHERE Name=''New'') PatientType
	,Cast(0 as bit) TransferIn
	,(CAST(DECRYPTBYKEY((SELECT top 1 MobileNumber FROM PersonContact WHERE PersonId=pn.Id)) AS VARCHAR(20))) AS MobileNumber
	,0 TBStatus
	,0 NutritionStatus
	,0 AS Categorization
	,ISNULL(pn.DobPrecision, 0) AS DobPrecision
FROM dbo.Person AS pn left Outer Join Patient P on Pn.Id = P.PersonId
WHERE
	 pn.Id NOT IN(SELECT PersonId FROM Patient Where Id  in (Select patientID from PatientIdentifier where IdentifierTypeId= (Select Id From Identifiers where code=''CCCNUMBER'')))



' 
GO
