
declare @c as cursor, @v as varchar(max)
set @c = cursor for
select name from sys.views
open @c
fetch next from @c into @v
while @@FETCH_STATUS = 0
begin

EXEC('drop view ['+@v+']')

fetch next from @c into @v
end


/****** Object:  View [dbo].[psmart_HTSList]    Script Date: 6/6/2018 12:35:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[psmart_HTSList]
AS
SELECT    
    DISTINCT 
	  h.PersonId,
	  P.Id PatientId,
	  PatientEncounterID,
	 CASE WHEN  (SELECT top 1 i.IdentifierValue from PersonIdentifier i WHERE i.PersonId=P.PersonId AND i.IdentifierId IN(SELECT top 1 Id FROM Identifiers WHERE Code='CARD_SERIAL_NUMBER'))  IS NULL THEN ''
	 ELSE 
		(SELECT top 1 i.IdentifierValue from PersonIdentifier i WHERE i.PersonId=P.PersonId AND i.IdentifierId IN(SELECT top 1 Id FROM Identifiers WHERE Code='CARD_SERIAL_NUMBER'))  
	 END [CardSerialNumber],
	  CAST(DECRYPTBYKEY(ps.FirstName) AS VARCHAR(50)) FirstName,
	  CAST(DECRYPTBYKEY(ps.LastName) AS VARCHAR(50)) LastName,
	  CAST(DECRYPTBYKEY(ps.MidName) AS VARCHAR(50)) MidName,
	  P.DateOfBirth,
	 CASE WHEN
	   (SELECT top 1 LEFT(Name,1) FROM LookupItem WHERE id= ps.Sex) IS NULL THEN ''
	 ELSE
	  (SELECT top 1 LEFT(Name,1) FROM LookupItem WHERE id= ps.Sex) 
	 END Sex ,
	  CAST(DATEDIFF(DD,P.DateOfBirth,GETDATE())/365.25 as INT) [AGE],
	  p.DobPrecision,
	  CAST(DECRYPTBYKEY(C.MobileNumber) AS VARCHAR(50)) MobileNumber,
	 CAST(DECRYPTBYKEY(C.PhysicalAddress) AS VARCHAR(50))  PhysicalAddress,
	CASE WHEN  L.Village IS NULL THEN ''
	ELSE
		 L.Village
	 END Village,
	CASE WHEN  
	  (SELECT top 1 WardName FROM county WHERE WardId= L.Ward) IS NULL THEN ''
	ELSE
	 (SELECT top 1 WardName FROM county WHERE WardId= L.Ward) 
	END  Ward,
	CASE WHEN 
	  (SELECT top 1 Subcountyname FROM county WHERE SubcountyId= L.SubCounty) IS NULL THEN ''
	  ELSE
	    (SELECT top 1 Subcountyname FROM county WHERE SubcountyId= L.SubCounty)
	  END  SubCounty,
	CASE WHEN
	  (SELECT top 1 CountyName FROM county WHERE CountyId= L.County) IS NULL THEN ''
	ELSE
	(SELECT top 1 CountyName FROM county WHERE CountyId= L.County)
	END  County,
	CASE WHEN
	  L.LandMark IS NULL THEN ''
	ELSE
	  L.LandMark 
	 END LANDMARK,
	 CASE WHEN  L.NearestHealthCentre IS NULL THEN ''
	 ELSE
		 L.NearestHealthCentre 
	 END [NEARESTLANDMARK]
 
FROM   
         dbo.HtsEncounter h
INNER JOIN 
Person ps
ON
ps.Id= h.PersonId
INNER JOIN 
Patient P
ON
P.PersonId=ps.Id
LEFT JOIN 
PersonContact C
ON
C.PersonId=h.PersonId
LEFT JOIN
PersonLocation L
ON
L.PersonId=h.PersonId

WHERE CAST(DATEDIFF(DD,P.DateOfBirth,GETDATE())/365.25 as INT) < 15
GO
/****** Object:  View [dbo].[PSmart_CardDetails]    Script Date: 6/6/2018 12:35:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

------------ 
CREATE VIEW [dbo].[PSmart_CardDetails]
AS
SELECT       
	L.PersonId [PersonId],
	L.PatientId PatientId,
	L.CardSerialNumber CardSerialNumber,
	'ACTIVE' [STATUS],
	'' [REASON],
	'' [LAST_UPDATED],
	(SELECT top 1 PosID FROM mst_Facility WHERE DeleteFlag=0) [LAST_UPDATED_FACILITY]

FROM psmart_HTSList L
GO
/****** Object:  View [dbo].[PSmart_ClientEligibleList]    Script Date: 6/6/2018 12:35:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-----------

CREATE VIEW [dbo].[PSmart_ClientEligibleList]
AS
SELECT
DISTINCT
	e.PatientId PatientId
   ,e.FirstName [FIRSTNAME]
   ,e.MidName [MIDDLENAME]
   ,e.LastName[LASTNAME]
   ,e.sex [GENDER],
	
   --,DATEDIFF(YEAR, ptn.DateOfBirth, GETDATE()) [AGE],
  e.[AGE]
-- DATEDIFF(hour,ptn.DateOfBirth,GETDATE())/8766.0
FROM psmart_HTSList e
WHERE
	e.CardSerialNumber IS NULL OR e.CardSerialNumber=''

--INNER JOIN
--Patient p
--ON
--p.Id=e.PatientId
--INNER JOIN 
--Person ps 
--ON
--ps.Id=p.Id
----INNER JOIN Patient ptn
----	ON ptn.ptn_pk = h.Ptn_pk
----INNER JOIN Person p
----	ON p.Id = ptn.Id WHERE CAST(DATEDIFF(DD,ptn.DateOfBirth,GETDATE())/365.25 as INT) <15

--WHERE
--	e.EncounterTypeId IN(SELECT top 1 ItemId FROM LookupItemView WHERE ItemName='Hts-encounter')
--AND
--	CAST(DATEDIFF(DD,ps.DateOfBirth,GETDATE())/365.25 as INT) <15
	
GO
/****** Object:  View [dbo].[PSmart_ExternalPatientId]    Script Date: 6/6/2018 12:35:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
----------------

CREATE VIEW [dbo].[PSmart_ExternalPatientId]
AS
SELECT  
      p.Id Ptn_pk,
	  p.Id [PatientId],
	  p.PersonId [PersonId],
	  CASE WHEN H.CardSerialNumber is null then '' -- (SELECT IdentifierValue i FROM PersonIdentifier i WHERE i.PersonId=P.PersonId AND i.IdentifierId IN(SELECT Id FROM Identifiers WHERE Code='CARD_SERIAL_NUMBER')) IS NULL THEN ''
	  ELSE
	   H.CardSerialNumber -- (SELECT IdentifierValue i FROM PersonIdentifier i WHERE i.PersonId=P.PersonId AND i.IdentifierId IN(SELECT Id FROM Identifiers WHERE Code='CARD_SERIAL_NUMBER'))
	  END [CardSerialNumber],
	  CASE WHEN (SELECT IdentifierValue FROM PatientIdentifier WHERE PatientId=P.Id AND IdentifierTypeId IN(SELECT Id FROM Identifiers WHERE Code='GODS_NUMBER')) IS NULL THEN ''
	  ELSE
		(SELECT IdentifierValue FROM PatientIdentifier WHERE IdentifierTypeId IN(SELECT Id FROM Identifiers WHERE Code='GODS_NUMBER'))
	  END
	   [ID],
	  'GODS_NUMBER' [IDENTIFIER_TYPE],
	  (SELECT Top 1 PosID FROM mst_Facility WHERE DeleteFlag=0) [ASSIGNING_FACILITY] ,
	  'MPI' [ASSIGNING_AUTHORITY]
FROM    
      dbo.psmart_HTSList H
INNER JOIN 
	 dbo.Patient P
ON
     p.Id=H.PatientId
WHERE

	H.AGE<15

GO
/****** Object:  View [dbo].[PSmart_Immunization]    Script Date: 6/6/2018 12:35:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--- 

CREATE VIEW [dbo].[PSmart_Immunization]
AS


   SELECT 

		L.PersonId PersonId,
		L.PatientId PatientId,
		L.CardSerialNumber [CardSerialNumber],
		CASE WHEN i.[AntigenAdministered] IS NULL THEN ''
		ELSE
		 i.[AntigenAdministered]
		END  [NAME],
		CASE WHEN i.[DateAdministered] IS NULL THEN ''
		
		ELSE
		i.[DateAdministered]
		END  [DATE_ADMINISTERED]
   FROM 
     ImmunizationTracker i
	INNER JOIN 
	psmart_HTSList L
	ON
	L.PatientId=i.[PtnPk]

GO
/****** Object:  View [dbo].[PSmart_InternalPatientId]    Script Date: 6/6/2018 12:35:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

------------ 

CREATE VIEW [dbo].[PSmart_InternalPatientId]
AS

		SELECT 
		L.PatientId PatientId,
		L.PersonId,
		CASE WHEN L.CardSerialNumber IS NULL THEN '' --(SELECT IdentifierValue i FROM PersonIdentifier i WHERE i.PersonId=L.PersonId AND i.IdentifierId IN(SELECT Id FROM Identifiers WHERE Code='CARD_SERIAL_NUMBER')) IS NULL THEN ''
		ELSE
		  L.CardSerialNumber	-- (SELECT IdentifierValue i FROM PersonIdentifier i WHERE i.PersonId=L.PersonId AND i.IdentifierId IN(SELECT Id FROM Identifiers WHERE Code='CARD_SERIAL_NUMBER'))
		END [CardSerialNumber],
		'HTS_NUMBER' [IDENTIFIER_TYPE],
	    'HTS' [ASSIGNING_AUTHORITY],
	    (SELECT Top 1 PosID FROM mst_Facility WHERE DeleteFlag=0) [ASSIGNING_FACILITY],
			CASE WHEN (SELECT top 1 i.IdentifierValue FROM patientIdentifier i WHERE i.PatientId=L.PatientId AND i.IdentifierTypeId IN(SELECT top 1 Id FROM Identifiers WHERE Code='HTSNumber')) IS NULL THEN ''
		ELSE
			(SELECT top 1 i.IdentifierValue FROM patientIdentifier i WHERE i.PatientId=L.PatientId AND i.IdentifierTypeId IN(SELECT top 1 Id FROM Identifiers WHERE Code='HTSNumber'))
		END [ID]
	FROM psmart_HTSList L


	UNION

	SELECT 
		L.PatientId PatientId,
		L.PersonId,
		CASE WHEN L.CardSerialNumber IS NULL THEN '' -- (SELECT IdentifierValue i FROM PersonIdentifier i WHERE i.PersonId=L.PersonId AND i.IdentifierId IN(SELECT Id FROM Identifiers WHERE Code='CARD_SERIAL_NUMBER')) IS NULL THEN ''
		ELSE
		  L.CardSerialNumber	--(SELECT IdentifierValue i FROM PersonIdentifier i WHERE i.PersonId=L.PersonId AND i.IdentifierId IN(SELECT Id FROM Identifiers WHERE Code='CARD_SERIAL_NUMBER'))
		END [CardSerialNumber],
		'CARD_SERIAL_NUMBER' [IDENTIFIER_TYPE],
	    'CARD_REGISTRY' [ASSIGNING_AUTHORITY],
	    (SELECT Top 1 PosID FROM mst_Facility WHERE DeleteFlag=0) [ASSIGNING_FACILITY],
				CASE WHEN L.CardSerialNumber IS NULL THEN '' --(SELECT i.IdentifierValue FROM patientIdentifier i WHERE i.PatientId=L.PatientId AND i.IdentifierTypeId IN(SELECT top 1 Id FROM Identifiers WHERE Code='CARD_SERIAL_NUMBER')) IS NULL THEN ''
		ELSE
			L.CardSerialNumber-- (SELECT i.IdentifierValue FROM patientIdentifier i WHERE i.PatientId=L.PatientId AND i.IdentifierTypeId IN(SELECT top 1 Id FROM Identifiers WHERE Code='CARD_SERIAL_NUMBER'))
		END [ID]
	FROM psmart_HTSList L

	--	SELECT 
	--		DISTINCT
	
	--p.Ptn_Pk PatientId,
	--p.Ptn_Pk PersonId,
	--p.CardSerialNumber [CardSerialNumber],
	--'CARD_SERIAL_NUMBER' [IDENTIFIER_TYPE],
	--'CARD_REGISTRY' [ASSIGNING_AUTHORITY],
	--(SELECT Top 1 NationalId FROM mst_Facility WHERE DeleteFlag=0) [ASSIGNING_FACILITY],
	--p.CardSerialNumber [ID]
	--FROM 

	--[dbo].[DTL_FBCUSTOMFIELD_HTC_Lab_MOH_362] h
	--INNER JOIN 
	--mst_Patient p
	--ON
	--p.Ptn_Pk=h.Ptn_pk
	
	--UNION 
	--SELECT 
	--	DISTINCT
	
	--p.Ptn_Pk PatientId,
	--p.Ptn_Pk PersonId,
	--p.CardSerialNumber [CardSerialNumber],
	--'HEI_NUMBER' [IDENTIFIER_TYPE],
	--'MCH' [ASSIGNING_AUTHORITY],
	--(SELECT Top 1 NationalId FROM mst_Facility WHERE DeleteFlag=0) [ASSIGNING_FACILITY],
	--p.HEIIDNumber [ID]
	--FROM 

	--[dbo].[DTL_FBCUSTOMFIELD_HTC_Lab_MOH_362] h
	--INNER JOIN 
	--mst_Patient p
	--ON
	--p.Ptn_Pk=h.Ptn_pk WHERE p.HEIIDNumber IS NOT NULL

	UNION
SELECT 
		L.PatientId,
		L.PersonId,
		CASE WHEN L.CardSerialNumber IS NULL THEN '' --(SELECT IdentifierValue i FROM PersonIdentifier i WHERE i.PersonId=L.PersonId AND i.IdentifierId IN(SELECT Id FROM Identifiers WHERE Code='CARD_SERIAL_NUMBER')) IS NULL THEN ''
		ELSE
			L.CardSerialNumber --(SELECT IdentifierValue i FROM PersonIdentifier i WHERE i.PersonId=L.PersonId AND i.IdentifierId IN(SELECT Id FROM Identifiers WHERE Code='CARD_SERIAL_NUMBER'))
		END [CardSerialNumber],
		'CCC_NUMBER' [IDENTIFIER_TYPE],
	    'CCC' [ASSIGNING_AUTHORITY],
	    (SELECT Top 1 PosID FROM mst_Facility WHERE DeleteFlag=0) [ASSIGNING_FACILITY],
		CASE WHEN L.CardSerialNumber IS NULL THEN '' -- (SELECT i.IdentifierValue FROM patientIdentifier i WHERE i.PatientId=L.PatientId AND i.IdentifierTypeId IN(SELECT top 1 Id FROM Identifiers WHERE Code='CCCNumber')) IS NULL THEN ''
		ELSE
			L.CardSerialNumber ---	(SELECT i.IdentifierValue FROM patientIdentifier i WHERE i.PatientId=L.PatientId AND i.IdentifierTypeId IN(SELECT top 1 Id FROM Identifiers WHERE Code='CCCNumber'))
		END [ID]
	FROM psmart_HTSList L WHERE (SELECT i.IdentifierValue FROM patientIdentifier i WHERE i.PatientId=L.PatientId AND i.IdentifierTypeId IN(SELECT top 1 Id FROM Identifiers WHERE Code='CCCNumber')) IS NOT NULL

GO
/****** Object:  View [dbo].[LookupItemView]    Script Date: 6/6/2018 12:35:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[LookupItemView]
AS
SELECT        MasterId, ItemId, MasterName, ItemName, DisplayName, ItemDisplayName, OrdRank, ISNULL(ROW_NUMBER() OVER(ORDER BY ItemId DESC), -1) AS RowID
FROM            (SELECT        M.Id AS MasterId, I.Id AS ItemId, M.Name AS MasterName, I.Name AS ItemName, L.DisplayName, L.DisplayName AS ItemDisplayName, L.OrdRank
                          FROM            dbo.LookupMaster AS M INNER JOIN
                                                    dbo.LookupMasterItem AS L ON M.Id = L.LookupMasterId INNER JOIN
                                                    dbo.LookupItem AS I ON L.LookupItemId = I.Id) AS X



GO
/****** Object:  View [dbo].[psmart_MotherDetails]    Script Date: 6/6/2018 12:35:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--- 



CREATE VIEW [dbo].[psmart_MotherDetails]
AS

SELECT 
 
  L.PersonId PersonId,
  L.PatientId,
  L.CardSerialNumber,
	
	CASE WHEN (CAST(DECRYPTBYKEY((SELECT p.FirstName FROM Person p WHERE p.Id IN(SELECT r.PersonId FROM PersonRelationship r WHERE r.RelationshipTypeId IN(SELECT v.id FROM LookupItem v WHERE v.Name='mother') AND r.PatientId=L.PatientId))) AS VARCHAR(50))) IS NULL THEN ''
	ELSE
	 (CAST(DECRYPTBYKEY((SELECT p.FirstName FROM Person p WHERE p.Id IN(SELECT r.PersonId FROM PersonRelationship r WHERE r.RelationshipTypeId IN(SELECT v.id FROM LookupItem v WHERE v.Name='mother') AND r.PatientId=L.PatientId))) AS VARCHAR(50)))
	END [FIRST_NAME],
	CASE WHEN (CAST(DECRYPTBYKEY((SELECT p.MidName FROM Person p WHERE p.Id IN(SELECT r.PersonId FROM PersonRelationship r WHERE r.RelationshipTypeId IN(SELECT v.id FROM LookupItem v WHERE v.Name='mother') AND r.PatientId=L.PatientId))) AS VARCHAR(50))) IS NULL THEN ''
	ELSE
	 (CAST(DECRYPTBYKEY((SELECT p.MidName FROM Person p WHERE p.Id IN(SELECT r.PersonId FROM PersonRelationship r WHERE r.RelationshipTypeId IN(SELECT v.ItemId FROM LookupItemView v WHERE v.MasterName='Relationship' AND v.ItemName='mother') AND r.PatientId=L.PatientId))) AS VARCHAR(50)))
	END [MIDDLE_NAME],
	CASE WHEN (CAST(DECRYPTBYKEY((SELECT p.LastName FROM Person p WHERE p.Id IN(SELECT r.PersonId FROM PersonRelationship r WHERE r.RelationshipTypeId IN(SELECT v.ItemId FROM LookupItemView v WHERE v.MasterName='Relationship' AND v.ItemName='mother') AND r.PatientId=L.PatientId))) AS VARCHAR(50))) IS NULL THEN ''
	ELSE
	 (CAST(DECRYPTBYKEY((SELECT p.LastName FROM Person p WHERE p.Id IN(SELECT r.PersonId FROM PersonRelationship r WHERE r.RelationshipTypeId IN(SELECT v.ItemId FROM LookupItemView v WHERE v.MasterName='Relationship' AND v.ItemName='mother') AND r.PatientId=L.PatientId))) AS VARCHAR(50)))
	END [LAST_NAME]
	--isnull(CAST(DECRYPTBYKEY(f.RMiddleName ) AS VARCHAR(50)),'') MIDDLE_NAME,
	--isnull(CAST(DECRYPTBYKEY( f.RLastName ) AS VARCHAR(50)),'')LAST_NAME
FROM 
psmart_HTSList L

--LEFT JOIN 
--PersonRelationship R
--ON
--R.PatientId=L.PatientId
--WHERE R.RelationshipTypeId IN(SELECT v.ItemId FROM LookupItemView v WHERE v.MasterName='Relationship' AND v.ItemName='Mother')


--SELECT       
--	ptn.Ptn_Pk [PersonId],
--	ptn.CardSerialNumber [CardSerialNumber],
--	isnull(CAST(DECRYPTBYKEY(f.RFirstName ) AS VARCHAR(50)),'') [FIRST_NAME],
--	isnull(CAST(DECRYPTBYKEY(f.RMiddleName ) AS VARCHAR(50)),'') MIDDLE_NAME,
--	isnull(CAST(DECRYPTBYKEY( f.RLastName ) AS VARCHAR(50)),'')LAST_NAME
--FROM [dbo].[DTL_FBCUSTOMFIELD_HTC_Lab_MOH_362] h
--left JOIN 
--mst_Patient ptn
--ON
--ptn.Ptn_Pk=h.Ptn_pk
--LEFT JOIN dtl_FamilyInfo f
--ON
--f.Ptn_pk=h.Ptn_pk
--WHERE f.Sex=17 AND f.RelationshipType=10

--UNION

--SELECT       
--	ptn.Ptn_Pk [PersonId],
--	ptn.CardSerialNumber [CardSerialNumber],
--	isnull(CAST(DECRYPTBYKEY(f.RFirstName ) AS VARCHAR(50)),'')[FIRST_NAME],
--	isnull(CAST(DECRYPTBYKEY(f.RMiddleName ) AS VARCHAR(50)),'')MIDDLE_NAME,
--	isnull(CAST(DECRYPTBYKEY(f.RLastName) AS VARCHAR(50)),'') LAST_NAME
--FROM [dbo].[DTL_FBCUSTOMFIELD_HTC_Lab_MOH_362] h
--left JOIN 
--mst_Patient ptn
--ON
--ptn.Ptn_Pk=h.Ptn_pk
--LEFT JOIN dtl_FamilyInfo f
--ON
--f.Ptn_pk=h.Ptn_pk

GO
/****** Object:  View [dbo].[PSmart_MotherIdentifier]    Script Date: 6/6/2018 12:35:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

------------


CREATE VIEW [dbo].[PSmart_MotherIdentifier]
AS

SELECT 
 
  L.PersonId PersonId,
  L.CardSerialNumber,
	
	--CASE WHEN (SELECT IdentifierValue FROM PatientIdentifier i WHERE i.PatientId=(SELECT id FROM patient p WHERE p.PersonId=L.PersonId) AND i.IdentifierTypeId IN(SELECT Id FROM Identifiers WHERE code='CCCNumber')) IS NULL THEN '' 
	--ELSE
	--	(SELECT IdentifierValue FROM PatientIdentifier i WHERE i.PatientId=(SELECT id FROM patient p WHERE p.PersonId=L.PersonId) AND i.IdentifierTypeId IN(SELECT Id FROM Identifiers WHERE code='CCCNumber'))
	--END [ID],
	I.IdentifierValue [ID],
	-- 'CCC_NUMBER' IDENTIFIER_TYPE,
	'' IDENTIFIER_TYPE,
	--'CCC'  ASSIGNING_AUTHORITY,
	'' ASSIGNING_AUTHORITY,
	'' ASSIGNING_FACILITY -- (SELECT top 1 NationalId FROM mst_Facility WHERE DeleteFlag=0) ASSIGNING_FACILITY
FROM 
PersonRelationship R
INNER JOIN 

psmart_HTSList L
ON
L.PersonId=R.PersonId
INNER JOIN 
PatientIdentifier I
On
I.PatientId=L.PatientId
WHERE I.IdentifierTypeId IN(SELECT Id FROM Identifiers i WHERE i.Code='CCCNumber')
--INNER JOIN 
--Patient P
--ON
--P.id=L.PatientId

--LEFT JOIN 
--PersonRelationship R
--ON
--R.PatientId=L.PatientId
--WHERE R.RelationshipTypeId IN(SELECT v.ItemId FROM LookupItemView v WHERE v.MasterName='Relationship' AND v.ItemName='Mother')


--SELECT       
--	ptn.Ptn_Pk [PersonId],
--	ptn.CardSerialNumber [CardSerialNumber],
--	isnull(CAST(DECRYPTBYKEY(f.RFirstName ) AS VARCHAR(50)),'') [FIRST_NAME],
--	isnull(CAST(DECRYPTBYKEY(f.RMiddleName ) AS VARCHAR(50)),'') MIDDLE_NAME,
--	isnull(CAST(DECRYPTBYKEY( f.RLastName ) AS VARCHAR(50)),'')LAST_NAME
--FROM [dbo].[DTL_FBCUSTOMFIELD_HTC_Lab_MOH_362] h
--left JOIN 
--mst_Patient ptn
--ON
--ptn.Ptn_Pk=h.Ptn_pk
--LEFT JOIN dtl_FamilyInfo f
--ON
--f.Ptn_pk=h.Ptn_pk
--WHERE f.Sex=17 AND f.RelationshipType=10

--UNION

--SELECT       
--	ptn.Ptn_Pk [PersonId],
--	ptn.CardSerialNumber [CardSerialNumber],
--	isnull(CAST(DECRYPTBYKEY(f.RFirstName ) AS VARCHAR(50)),'')[FIRST_NAME],
--	isnull(CAST(DECRYPTBYKEY(f.RMiddleName ) AS VARCHAR(50)),'')MIDDLE_NAME,
--	isnull(CAST(DECRYPTBYKEY(f.RLastName) AS VARCHAR(50)),'') LAST_NAME
--FROM [dbo].[DTL_FBCUSTOMFIELD_HTC_Lab_MOH_362] h
--left JOIN 
--mst_Patient ptn
--ON
--ptn.Ptn_Pk=h.Ptn_pk
--LEFT JOIN dtl_FamilyInfo f
--ON
--f.Ptn_pk=h.Ptn_pk

GO
/****** Object:  View [dbo].[PSmart_MotherName]    Script Date: 6/6/2018 12:35:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-------------- 


CREATE VIEW [dbo].[PSmart_MotherName]
AS

SELECT 
 
  p.Id PersonId,
  L.CardSerialNumber,
	
CASE WHEN (CAST(DECRYPTBYKEY((SELECT FirstName FROM Person WHERE Id=R.PersonId)) AS VARCHAR(50))) IS NULL THEN '' 
	ELSE
	(CAST(DECRYPTBYKEY((SELECT FirstName FROM Person WHERE Id=R.PersonId)) AS VARCHAR(50))) END  [FIRST_NAME],
	CASE WHEN (CAST(DECRYPTBYKEY((SELECT MidName FROM Person WHERE Id=R.PersonId)) AS VARCHAR(50))) IS NULL THEN ''
	ELSE (CAST(DECRYPTBYKEY((SELECT MidName FROM Person WHERE Id=R.PersonId)) AS VARCHAR(50))) END [MIDDLE_NAME],
	CASE WHEN (CAST(DECRYPTBYKEY((SELECT LastName FROM Person WHERE Id=R.PersonId)) AS VARCHAR(50))) IS NULL THEN ''
	ELSE 
	(CAST(DECRYPTBYKEY((SELECT LastName FROM Person WHERE Id=R.PersonId)) AS VARCHAR(50))) END
	 [LAST_NAME]
	--isnull(CAST(DECRYPTBYKEY(f.RMiddleName ) AS VARCHAR(50)),'') MIDDLE_NAME,
	--isnull(CAST(DECRYPTBYKEY( f.RLastName ) AS VARCHAR(50)),'')LAST_NAME
FROM 
psmart_HTSList L
INNER JOIN 
Patient P
ON
P.id=L.PatientId

LEFT JOIN 
PersonRelationship R
ON
R.PatientId=L.PatientId
--WHERE R.RelationshipTypeId IN(SELECT v.ItemId FROM LookupItemView v WHERE v.MasterName='Relationship' AND v.ItemName='Mother')


--SELECT       
--	ptn.Ptn_Pk [PersonId],
--	ptn.CardSerialNumber [CardSerialNumber],
--	isnull(CAST(DECRYPTBYKEY(f.RFirstName ) AS VARCHAR(50)),'') [FIRST_NAME],
--	isnull(CAST(DECRYPTBYKEY(f.RMiddleName ) AS VARCHAR(50)),'') MIDDLE_NAME,
--	isnull(CAST(DECRYPTBYKEY( f.RLastName ) AS VARCHAR(50)),'')LAST_NAME
--FROM [dbo].[DTL_FBCUSTOMFIELD_HTC_Lab_MOH_362] h
--left JOIN 
--mst_Patient ptn
--ON
--ptn.Ptn_Pk=h.Ptn_pk
--LEFT JOIN dtl_FamilyInfo f
--ON
--f.Ptn_pk=h.Ptn_pk
--WHERE f.Sex=17 AND f.RelationshipType=10

--UNION

--SELECT       
--	ptn.Ptn_Pk [PersonId],
--	ptn.CardSerialNumber [CardSerialNumber],
--	isnull(CAST(DECRYPTBYKEY(f.RFirstName ) AS VARCHAR(50)),'')[FIRST_NAME],
--	isnull(CAST(DECRYPTBYKEY(f.RMiddleName ) AS VARCHAR(50)),'')MIDDLE_NAME,
--	isnull(CAST(DECRYPTBYKEY(f.RLastName) AS VARCHAR(50)),'') LAST_NAME
--FROM [dbo].[DTL_FBCUSTOMFIELD_HTC_Lab_MOH_362] h
--left JOIN 
--mst_Patient ptn
--ON
--ptn.Ptn_Pk=h.Ptn_pk
--LEFT JOIN dtl_FamilyInfo f
--ON
--f.Ptn_pk=h.Ptn_pk


GO
/****** Object:  View [dbo].[PSmart_NextOfKin]    Script Date: 6/6/2018 12:35:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

------------- 
CREATE VIEW [dbo].[PSmart_NextOfKin]
AS
SELECT       
	L.PatientId [PatientId],
	L.PersonId,
	'' ID,
	L.CardSerialNumber [CardSerialNumber],
	'' RELATIONSHIP,
	'' [ADDRESS],
	'' [PHONE_NUMBER],
	'' SEX,
	'' DATE_OF_BIRTH,
	'' CONTACT_ROLE
FROM  psmart_HTSList L


GO
/****** Object:  View [dbo].[psmart_NokName]    Script Date: 6/6/2018 12:35:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

----------

CREATE VIEW [dbo].[psmart_NokName]
AS
SELECT DISTINCT      
	L.PatientId [PersonId],
	L.CardSerialNumber [CardSerialNumber],
	'' ID,
 '' as FIRST_NAME,
	'' MIDDLE_NAME,
	''LAST_NAME
FROM psmart_HTSList L

GO
/****** Object:  View [dbo].[PSmart_PatientAddress]    Script Date: 6/6/2018 12:35:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

------ 

CREATE VIEW [dbo].[PSmart_PatientAddress]
AS
SELECT
	L.PersonId PersonId
   ,L.PatientId PatientId
   ,L.CardSerialNumber [CardSerialNumber]
   ,isnull(CAST(DECRYPTBYKEY(C.PhysicalAddress) AS VARCHAR(50)),'') AS POSTAL_ADDRESS
FROM 
 psmart_HTSList L
 LEFT JOIN 
 PatientContact C
 ON
 C.PersonId=L.PersonId


GO
/****** Object:  View [dbo].[PSmart_PatientIdentification]    Script Date: 6/6/2018 12:35:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-----------


CREATE VIEW [dbo].[PSmart_PatientIdentification]
AS
SELECT DISTINCT
	L.PersonId
   ,L.PatientId
   , CASE WHEN L.CardSerialNumber IS NULL THEN ''  --(SELECT IdentifierValue i FROM PersonIdentifier i WHERE i.PersonId=L.PersonId AND i.IdentifierId IN(SELECT Id FROM Identifiers WHERE Code='CARD_SERIAL_NUMBER')) IS NULL THEN ''
	 ELSE 
	  L.CardSerialNumber	--(SELECT IdentifierValue i FROM PersonIdentifier i WHERE i.PersonId=L.PersonId AND i.IdentifierId IN(SELECT Id FROM Identifiers WHERE Code='CARD_SERIAL_NUMBER'))
	 END [CardSerialNumber]
   ,case when
		 format(cast(L.DateOfBirth  as date),'yyyyMMdd') is null THEN ''
    ELSE
		format(cast(L.DateOfBirth  as date),'yyyyMMdd') 
	END  DATE_OF_BIRTH 
   ,case L.DobPrecision		
			when '0' then 'Estimated'
			when '1' then 'Exact'
			else ''	
		END
		AS DATE_OF_BIRTH_PRECISION
   ,
   L.Sex SEX
 --  ,CASE WHEN (SELECT DateOfDeath FROM PatientCareending WHERE patientId=L.PatientId AND  DateOfDeath IS NOT NULL AND PatientId=L.PatientId) IS NULL THEN ''
 --   ELSE
	--	(SELECT DateOfDeath	FROM PatientCareending WHERE patientId=L.PatientId AND  DateOfDeath IS NOT NULL AND PatientId=L.PatientId) 
	--END AS DEATH_DATE --format(cast(ptn.DateOfDeath   as date),'yyyyMMdd') AS DEATH_DATE
	,'' DEATH_DATE
   ,'' AS DEATH_INDICATOR
   ,CASE WHEN CAST(DECRYPTBYKEY(C.mobileNo) AS VARCHAR(50)) IS NULL THEN '' 
    ELSE 
	 CAST(DECRYPTBYKEY(C.mobileNo) AS VARCHAR(50))
	END PHONE_NUMBER
   ,CASE WHEN (SELECT Name FROM LookupItem WHERE id= m.MaritalStatusId) IS NULL THEN ''
   ELSE
    (SELECT Name FROM LookupItem WHERE id= m.MaritalStatusId)
   END MARITAL_STATUS
FROM psmart_HTSList L

LEFT JOIN 
	PatientContact C
ON
	c.PersonId=L.PersonId
LEFT JOIN
	PatientMaritalStatus m
ON
	m.PersonId=L.PersonId

--INNER JOIN Person AS p
--	ON p.Id = ptn.PersonId
--LEFT OUTER JOIN PatientCareending AS pe
--	ON pe.PatientId = ptn.Id
--LEFT OUTER JOIN PatientMaritalStatus AS m
--	ON m.PersonId = p.Id
--LEFT OUTER JOIN PersonContact AS c
--	ON c.PersonId = p.Id


GO
/****** Object:  View [dbo].[PSmart_PatientName]    Script Date: 6/6/2018 12:35:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---  ----

CREATE VIEW [dbo].[PSmart_PatientName]
AS
SELECT DISTINCT
	L.PersonId PersonId,
   L.PatientId PatientId,
    CASE WHEN L.CardSerialNumber IS NULL THEN ''  
	 ELSE 
		L.CardSerialNumber
	 END [CardSerialNumber]
   ,L.FirstName FIRST_NAME
   ,L.MidName MIDDLE_NAME
   ,L.LastName LAST_NAME
FROM psmart_HTSList L
  

GO
/****** Object:  View [dbo].[psmart_PhysicalAddress]    Script Date: 6/6/2018 12:35:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
----- 
CREATE VIEW [dbo].[psmart_PhysicalAddress]
AS
SELECT  
    DISTINCT     
	L.PersonId,
	L.PatientId,
		CASE WHEN L.CardSerialNumber IS NULL THEN ''
		ELSE
		  L.CardSerialNumber
		END [CardSerialNumber],
	 L.Village  [VILLAGE],
	L.Ward	[WARD],
	L.SubCounty [SUB_COUNTY],
	L.County [COUNTY],
	L.LandMark [NEAREST_LANDMARK]
FROM    
 psmart_HTSList L    

GO
/****** Object:  View [dbo].[psmart_ProviderDetails]    Script Date: 6/6/2018 12:35:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

----------- 


CREATE VIEW [dbo].[psmart_ProviderDetails]
AS
SELECT  
    DISTINCT     
	  L.PersonId PersonId,
	 L.PatientId PatientId, 
	 L.CardSerialNumber  [CardSerialNumber],    
      (SELECT UserFirstName +' '+ UserLastName FROM mst_User WHERE UserID=h.ProviderId) [NAME],
      convert(varchar, h.ProviderId) ID
FROM   
      psmart_HTSList L
INNER JOIN 
HtsEncounter h
ON
L.PersonId=h.PersonId

GO
/****** Object:  View [dbo].[PsmartEligibleList]    Script Date: 6/6/2018 12:35:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

------- 
CREATE VIEW [dbo].[PsmartEligibleList]
AS
SELECT
DISTINCT
	e.PatientId PatientId
   ,e.FirstName [FIRSTNAME]
   ,e.MidName [MIDDLENAME]
   ,e.LastName[LASTNAME]
   ,e.sex [GENDER],
	
   --,DATEDIFF(YEAR, ptn.DateOfBirth, GETDATE()) [AGE],
  e.[AGE]
-- DATEDIFF(hour,ptn.DateOfBirth,GETDATE())/8766.0
FROM psmart_HTSList e
WHERE
	e.CardSerialNumber IS NULL OR e.CardSerialNumber=''

--INNER JOIN
--Patient p
--ON
--p.Id=e.PatientId
--INNER JOIN 
--Person ps 
--ON
--ps.Id=p.Id
----INNER JOIN Patient ptn
----	ON ptn.ptn_pk = h.Ptn_pk
----INNER JOIN Person p
----	ON p.Id = ptn.Id WHERE CAST(DATEDIFF(DD,ptn.DateOfBirth,GETDATE())/365.25 as INT) <15

--WHERE
--	e.EncounterTypeId IN(SELECT top 1 ItemId FROM LookupItemView WHERE ItemName='Hts-encounter')
--AND
--	CAST(DATEDIFF(DD,ps.DateOfBirth,GETDATE())/365.25 as INT) <15
	
GO
/****** Object:  View [dbo].[psmartHIVTest]    Script Date: 6/6/2018 12:35:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-------- 




CREATE VIEW [dbo].[psmartHIVTest]
AS
SELECT  
    DISTINCT     
	  L.PersonId,
	  L.PatientId,
	  L.CardSerialNumber,
	   format(cast(E.CreateDate as date),'yyyyMMdd') [DATE],

      CASE WHEN  R.FinalResult IS NULL THEN ''
	   ELSE
	   ( SELECT top 1 rtrim(ltrim(UPPER(Name))) FROM LookupItem WHERE id= R.FinalResult )
	   END [RESULT],
	   CASE H.EncounterType
			when 1 then 'SCREENING'
			WHEN 2 THEN 'CONFIRMATORY'
			ELSE ''
	   END [TYPE],
      (SELECT top 1 PosID FROM mst_Facility WHERE DeleteFlag=0) FACILITY,
	  (SELECT Name FROM FacilityList WHERE MFLCode=(SELECT top 1 PosID FROM mst_Facility WHERE DeleteFlag=0)) [FACILITYNAME],

 --    case  (select top 1 Name from mst_ModDeCode where CodeID=396 AND ID= h.strategyHTS)
	    
	--	when 'HP' then 'Health facility patient'
	--	when 'NP' then 'Non-Patient'
	--	when 'VI' then 'Integrated VCT Sites'
	--	when 'VS' then 'Stand-alone VCT Sites'
	--	when 'HB' then 'Hom-based'
	--	when 'MO' then 'Mobile and Outreach'
	--	when 'Others' then 'Others'		
	--END [STRATEGY],    
	CASE WHEN H.TestingStrategy IS NULL THEN ''
	
	ELSE
	 (SELECT SUBSTRING(Name,0,CHARINDEX(':',Name,0)) FROM LookupItem WHERE id=H.TestingStrategy)
	END [STRATEGY],
      (SELECT UserFirstName +' '+ UserLastName FROM mst_User WHERE UserID=H.ProviderId) [NAME],
      convert(varchar(10), H.ProviderId) ID
FROM   
    psmart_HTSList L
INNER JOIN 
HtsEncounter H
ON
H.PersonId=L.PersonId
INNER JOIN HtsEncounterResult R
ON
R.HtsEncounterId=H.Id

INNER JOIN 
PatientEncounter E
ON
E.Id=H.PatientEncounterID



UNION ALL

SELECT 

	L.PersonId PersonId,
	L.PatientId PatientId,
	L.CardSerialNumber [CardSerialNumber],
	 format(cast(t.ResultDate as date),'yyyyMMdd') [DATE],
	rtrim(ltrim(UPPER(t.Result)))  [RESULT],
	t.ResultCategory [TYPE],
	t.MFLCode [FACILITY], 
	(SELECT Name FROM FacilityList WHERE MFLCode=t.MFLCode) [FACILITYNAME],
	t.Strategy [STRATEGY],
	t.ProviderName [NAME],
	convert(varchar(5), t.ProviderId) [ID]
FROM HIVTestTracker t
INNER JOIN 
psmart_HTSList L
ON
L.PatientId=t.Ptn_pk

GO
/****** Object:  View [dbo].[PatientServiceEnrollmentView]    Script Date: 6/6/2018 12:35:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[PatientServiceEnrollmentView]
AS
SELECT        dbo.PatientIdentifier.IdentifierValue AS EnrollmentNumber, dbo.LookupItemView.DisplayName AS ServiceArea, dbo.PatientEnrollment.EnrollmentDate, 
                         CAST((CASE dbo.PatientEnrollment.CareEnded WHEN 0 THEN 'Active' WHEN 1 THEN 'In-Active' END) AS varchar(50)) AS PatientStatus, dbo.PatientIdentifier.PatientId, dbo.Person.Id AS PersonId,ISNULL(ROW_NUMBER() OVER (ORDER BY PersonId DESC), - 1) AS Id
FROM            dbo.PatientIdentifier INNER JOIN
                         dbo.LookupItemView ON dbo.PatientIdentifier.IdentifierTypeId = dbo.LookupItemView.ItemId INNER JOIN
                         dbo.PatientEnrollment ON dbo.PatientIdentifier.PatientEnrollmentId = dbo.PatientEnrollment.Id INNER JOIN
                         dbo.Patient ON dbo.PatientEnrollment.PatientId = dbo.Patient.Id RIGHT OUTER JOIN
                         dbo.Person ON dbo.Patient.PersonId = dbo.Person.Id


GO
/****** Object:  View [dbo].[PregnancyOutcomeView]    Script Date: 6/6/2018 12:35:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[PregnancyOutcomeView]
AS
SELECT        dbo.PregnancyIndicator.Id, dbo.PregnancyIndicator.PatientId, dbo.PregnancyIndicator.PatientMasterVisitId, dbo.PregnancyIndicator.LMP, dbo.PregnancyIndicator.EDD,
                             (SELECT        TOP (1) DisplayName
                               FROM            dbo.LookupItemView
                               WHERE        (ItemId = dbo.PregnancyIndicator.PregnancyStatusId) AND (MasterName = 'PregnancyStatus')) AS PregnancyStatus,
                             (SELECT        TOP (1) DisplayName
                               FROM            dbo.LookupItemView AS LookupItemView_1
                               WHERE        (ItemId = dbo.Pregnancy.Outcome)) AS Outcome
FROM            dbo.PregnancyIndicator INNER JOIN
                         dbo.Pregnancy ON dbo.PregnancyIndicator.PatientId = dbo.Pregnancy.PatientId AND dbo.PregnancyIndicator.PatientMasterVisitId = dbo.Pregnancy.PatientMasterVisitId

GO
/****** Object:  View [dbo].[FormView]    Script Date: 6/6/2018 12:35:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 Create VIEW [dbo].[FormView]
AS 
Select	F.FeatureID		As FeatureId
	,	F.FeatureName
	,	F.ReportFlag
	,	F.DeleteFlag	As FeatureDeleteFlag
	,	F.AdminFlag
	,	Case When F.FeatureID> 1000 Then  F.Published Else 2 End As Published
	,	F.ModuleId
	,	F.MultiVisit
	,	F.RegistrationFormFlag
	,	F.ReferenceID	As ReferenceId
	,	F.CanLink
	,	V.VisitTypeID	As FormId
	,	V.VisitName		As FormName
	,	V.FormDescription
	,	V.Custom
	,	V.CategoryId 
	,	D.Code CategoryName
	,	V.DeleteFlag	As FormDeleteFlag
	,	(Select Count(Distinct GF.GroupID) 
	From lnk_GroupFeatures GF 
	Where GF.FeatureID = F.FeatureId Group BY GF.FeatureID) PermissionCount
From mst_Feature As F
Inner Join mst_VisitType As V On V.FeatureId = F.FeatureID
Left Outer Join( Select D.ID, D.Name, C.CodeID, D.Code From mst_Decode D Inner Join mst_Code C On C.CodeID=D.CodeID 
And C.Name='Form Category') D On D.ID= V.CategoryId

GO
/****** Object:  View [dbo].[FormFieldsView]    Script Date: 6/6/2018 12:35:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	   
CREATE VIEW [dbo].[FormFieldsView]
AS
Select	LF.Id
	,	LF.FeatureId
	,	F.FormId
	,	F.FormDescription
	,	F.FeatureName
	,	F.ReferenceID									FeatureReferenceId
	,	F.MultiVisit
	,	LF.SectionId
	,	S.SectionName
	,	S.SectionInfo
	,	S.IsGridView
	,	S.Seq											SectionOrder
	,	LF.FieldId
	,	Case Predefined
			When 1 Then '9999'
			Else '8888'
		End + convert(varchar, FieldId)					PaddedFieldId
	,	replace(LF.FieldLabel, '''', '')				FieldLabel
	,	LF.UserId
	,	LF.CreateDate
	,	LF.UpdateDate
	,	LF.Predefined
	,	lF.Seq											FieldOrder
	,	F.FeatureDeleteFlag								FeatureDeleteFlag
	,	CF.FieldName
	,	CF.FieldDesc
	,	CF.ControlId
	,	C.Name											ControlName
	,	C.ReferenceId									ControlReferenceId
	,	CF.CategoryId
	,	CF.CareEnd
	,	Case
			When LF.Predefined = 0 And isnull(S.IsGridView, 0) = 0 And CF.ControlId Not In (11, 12, 16) Then 'DTL_CUSTOMFIELD'
			When LF.Predefined = 0 And isnull(S.IsGridView, 0) = 1 And CF.ControlId Not In (11, 12, 16) Then 'DTL_CUSTOMFORM'
			Else Null
		End												PDFTableName
	,	CF.BindTable
	,	dbo.GetLookupName(CF.CategoryId, CF.BindTable)	BindCategory
	,	CF.PatientRegistration
	,	CF.DeleteFlag									FieldDeleteFlag
From Lnk_Forms LF
Inner Join FormView F On F.FeatureID = LF.FeatureId
Inner Join mst_CustomformField CF On CF.Id = LF.FieldId
Inner Join mst_Section S On S.SectionID = LF.SectionId And S.FeatureId = LF.FeatureID
Inner Join Mst_Control C On C.ControlID = CF.ControlId
Where LF.Predefined = 0 
Union All 
Select	LF.Id
	,	LF.FeatureId
	,	F.FormId
	,	F.FormDescription
	,	F.FeatureName
	,	F.ReferenceID										FeatureReferenceId
	,	F.MultiVisit
	,	LF.SectionId
	,	S.SectionName
	,	S.SectionInfo
	,	S.IsGridView
	,	S.Seq												SectionOrder
	,	LF.FieldId
	,	Case Predefined
			When 1 Then '9999'
			Else '8888'
		End + convert(varchar, FieldId)						PaddedFieldId
	,	replace(LF.FieldLabel, '''', '')					FieldLabel
	,	LF.UserId
	,	LF.CreateDate
	,	LF.UpdateDate
	,	LF.Predefined
	,	lF.Seq												FieldOrder
	,	F.FeatureDeleteFlag										FeatureDeleteFlag
	,	PF.BindField										FieldName
	,	Null												FieldDesc
	,	PF.ControlId
	,	C.Name											ControlName
	,	C.ReferenceId									ControlReferenceId
	,	PF.CategoryId
	,	Null												CareEnd
	,	upper(PF.PDFTableName)								PDFTableName
	,	PF.BindTable
	,	dbo.GetLookupName(PF.CategoryId, PF.PDFTableName)	BindCategory
	,	PF.PatientRegistration
	,	0													FieldDeleteFlag
From Lnk_Forms LF
Inner Join FormView F On F.FeatureID = LF.FeatureId
Inner Join Mst_PreDefinedFields PF On PF.Id = LF.FieldId 
Inner Join mst_Section S On  S.SectionID = LF.SectionId And S.FeatureId = LF.FeatureID
Inner Join Mst_Control C On C.ControlID = PF.ControlId
Where LF.Predefined = 1 





GO
/****** Object:  View [dbo].[PatientScreenigView]    Script Date: 6/6/2018 12:35:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[PatientScreenigView]
AS
SELECT DISTINCT a.ptn_pk, a.Id AS PatientId, c.Id AS PatientMasterVisitId, c.VisitDate, TBScreening.TBStatus, NutritionScreening.NutritionStatus, CaCxScreening.CaCx
FROM            dbo.Patient AS a INNER JOIN
dbo.PatientScreening AS b ON a.Id = b.PatientId INNER JOIN
dbo.PatientMasterVisit AS c ON b.PatientMasterVisitId = c.Id LEFT OUTER JOIN
    (SELECT DISTINCT b.PatientId, c.VisitDate, CASE WHEN n.MasterName = 'TBStatus' THEN n.itemname END AS TBStatus
    FROM            dbo.PatientScreening AS b INNER JOIN
                                dbo.PatientMasterVisit AS c ON b.PatientMasterVisitId = c.Id INNER JOIN
                                dbo.LookupItemView AS n ON b.ScreeningValueId = n.ItemId
    WHERE        (n.MasterName IN ('TBStatus'))) AS TBScreening ON b.PatientId = TBScreening.PatientId AND c.VisitDate = TBScreening.VisitDate LEFT OUTER JOIN
    (SELECT DISTINCT b.PatientId, c.VisitDate, CASE WHEN n.MasterName = 'NutritionStatus' THEN n.itemname END AS NutritionStatus
    FROM            dbo.PatientScreening AS b INNER JOIN
                                dbo.PatientMasterVisit AS c ON b.PatientMasterVisitId = c.Id INNER JOIN
                                dbo.LookupItemView AS n ON b.ScreeningValueId = n.ItemId
    WHERE        (n.MasterName IN ('NutritionStatus'))) AS NutritionScreening ON b.PatientId = NutritionScreening.PatientId AND c.VisitDate = NutritionScreening.VisitDate LEFT OUTER JOIN
    (SELECT DISTINCT b.PatientId, c.VisitDate, CASE WHEN n.MasterName = 'CaCxScreening' THEN n.itemname END AS CaCx
    FROM            dbo.PatientScreening AS b INNER JOIN
                                dbo.PatientMasterVisit AS c ON b.PatientMasterVisitId = c.Id INNER JOIN
                                dbo.LookupItemView AS n ON b.ScreeningValueId = n.ItemId
    WHERE        (n.MasterName IN ('CaCxScreening'))) AS CaCxScreening ON b.PatientId = CaCxScreening.PatientId AND c.VisitDate = CaCxScreening.VisitDate LEFT OUTER JOIN
    (SELECT DISTINCT b.PatientId, c.VisitDate, CASE WHEN n.MasterName = 'STIScreening' THEN n.itemname END AS STIScreening
    FROM            dbo.PatientScreening AS b INNER JOIN
                                dbo.PatientMasterVisit AS c ON b.PatientMasterVisitId = c.Id INNER JOIN
                                dbo.LookupItemView AS n ON b.ScreeningValueId = n.ItemId
    WHERE        (n.MasterName IN ('STIScreening'))) AS STIScreening ON b.PatientId = STIScreening.PatientId AND c.VisitDate = STIScreening.VisitDate

GO
/****** Object:  View [dbo].[FieldsView]    Script Date: 6/6/2018 12:35:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[FieldsView]
AS

Select	F.Id												As FieldId
	,	'8888' + convert(varchar, F.Id)						As PaddedFieldId
	,	F.FieldName
	,	F.FieldDesc
	,	dbo.GetLookupValues(F.CategoryId, F.BindTable, 0)	As FieldValue
	,	0													As Predefined
	,	F.CategoryId										As CodeId
	,	nullif(F.BindTable,
		'')													As BindTable
	,	dbo.GetLookupName(F.CategoryId, F.BindTable)		As BindCategory
	,	0													As ModuleId
	,	isnull(F.DeleteFlag, 0)								As FieldDeleteFlag
	,	F.ControlId
	,	C.Name												As ControlName
	,	C.ReferenceId										As ControlReferenceId
	,   C.DataType											As ControlDataType
	,	F.PatientRegistration
	,	F.CareEnd
	,	F.UserId
	,	F.UpdateDate
	,	(select isnull(count(L.FieldId),0) from lnk_conditionalfields L where L.ConfieldId = F.Id and L.Conpredefine =0)[ConditionalField]
From mst_CustomformField As F
Inner Join mst_control As C On C.ControlID = F.ControlId
Union All 
Select	F.Id												As FieldId
	,	'8888' + convert(varchar, F.Id)						As FieldId
	,	F.PDFName											As Fieldname
	,   F.PDFName											As FieldDesc
	,	dbo.GetLookupValues(F.CategoryId, F.BindTable, 0)	As FieldValue
	,	1													As Predefined
	,	F.CategoryId										As CodeId
	,	isnull(F.BindTable, '')								As BindTable
	,	dbo.GetLookupName(F.CategoryId, F.BindTable)		As BindCategory
	,	0													As ModuleId
	,	0													As FieldDeleteFlag
	,	F.ControlId
	,	C.Name												As ControlName
	,	C.ReferenceId										As ControlReferenceId
	,   C.DataType											As ControlDataType
	,	F.PatientRegistration
	,	Null												As CareEnd
	,	F.UserId
	,	F.UpdateDate
	,	(select isnull(count(L.FieldId),0) from Lnk_Conditionalfields L where L.ConfieldId = F.Id and L.Conpredefine =1)[ConditionalField]
From Mst_PreDefinedFields As F
Inner Join mst_control As C On C.ControlID = F.ControlId



GO
/****** Object:  View [dbo].[FieldsBusinessRuleView]    Script Date: 6/6/2018 12:35:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[FieldsBusinessRuleView]
AS
	Select	LBR.Id
		,	LBR.FieldId
		,	F.PaddedFieldId
		,	LBR.BusRuleId
		,	BR.Name					As BusRuleName
		,	BR.ReferenceId			As BusRuleReferenceId
		,	BR.DeleteFlag
		,	nullif(LBR.Value, '')	As Value
		,	nullif(LBR.Value1, '')	As Value1
		,	LBR.Predefined
		,	LBR.UserId
		,	LBR.CreateDate
		,	LBR.UpdateDate
		,	F.ControlName
		,	F.FieldName
		,	F.ControlReferenceId
		,	F.ControlId
	From lnk_fieldsBusinessRule As LBR
	Inner Join Mst_BusinessRule As BR On BR.Id = LBR.BusRuleId
	Inner Join FieldsView As F On F.FieldId = LBR.FieldId
	And F.predefined = LBR.Predefined




GO
/****** Object:  View [dbo].[vw_PersonGodsNumber]    Script Date: 6/6/2018 12:35:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[vw_PersonGodsNumber]
AS
SELECT        i.Id, i.Name, i.Code,i.DisplayName, i.DataType, i.PrefixType, i.SuffixType, p.PersonId,(SELECT Id FROM Patient WHERE PersonId=p.PersonId) PatientId, 
                         p.IdentifierId, p.IdentifierValue, p.DeleteFlag
FROM            dbo.Identifiers i INNER JOIN
                         dbo.PersonIdentifier p ON i.Id = p.IdentifierId
WHERE        (i.Name = 'GODS_NUMBER')

GO
/****** Object:  View [dbo].[API_DrugPrescription]    Script Date: 6/6/2018 12:35:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[API_DrugPrescription]
AS
SELECT
	o.Ptn_pk AS ptnpk
   ,(SELECT TOP 1 Id FROM Patient	WHERE ptn_pk = o.ptn_pk)	AS PatientId
   ,o.PatientMasterVisitId
   ,i.IdentifierValue [ID]
   ,(SELECT TOP 1	f.NationalId	FROM mst_Facility f	WHERE f.FacilityID=o.LocationID)	[SENDING_FACILITY]
   ,ISNULL((SELECT	Top 1 gn.IdentifierValue	FROM vw_PersonGodsNumber gn	WHERE gn.PatientId = i.patientId)	, '') EXT_ID
   ,'GODS_NUMBER' [EXT_IDENTIFIER_TYPE]
   ,'MPI' [EXT_ASSIGNING_AUTHOURITY]
   ,'CCC_NUMBER' [IDENTIFIER_TYPE]
   ,'CCC' [ASSIGNING_AUTHORITY]
   ,(SELECT top 1 Name	FROM mst_Decode	WHERE ID = o.ProgID)	INDICATION
   ,'' TREATMENT_INSTRUCTION
   ,CAST(DECRYPTBYKEY(p.NationalId) AS VARCHAR(50)) [ID2]
   ,'NATIONAL_ID' [IDENTIFIER_TYPE2]
   ,'GOK' [ASSIGNING_AUTHORITY2]
   ,o.ptn_pharmacy_pk
   ,CAST(DECRYPTBYKEY(g.FirstName) AS VARCHAR(50)) [FIRST_NAME]
   ,CAST(DECRYPTBYKEY(g.MidName) AS VARCHAR(50)) [MIDDLE_NAME]
   ,CAST(DECRYPTBYKEY(g.LastName) AS VARCHAR(50)) [LAST_NAME]
   ,o.OrderedByDate [TRANSACTION_DATETIME]
   ,'CA' [ORDER_CONTROL]
   ,o.ptn_pharmacy_pk [NUMBER]
   ,'IQCARE' [ENTITY]
   ,o.OrderedByDate [PHARMACY_ORDER_DATE]
   ,'CA' [ORDER_STATUS]
   ,(SELECT TOP 1	CAST(DECRYPTBYKEY(FirstName) AS VARCHAR(50))		FROM mst_user u		WHERE u.UserID = o.OrderedBy)	[ORDERING_PHYSICIAN_FIRST_NAME]
   ,(SELECT TOP 1 CAST(DECRYPTBYKEY(LastName) AS VARCHAR(50))		FROM mst_user u		WHERE u.UserID = o.OrderedBy)	[ORDERING_PHYSICIAN_LAST_NAME]
   ,d.PatientInstructions [NOTES]
   ,CASE
		WHEN d.Drug_Pk IN (SELECT Drug_Pk	FROM lnk_DrugGeneric g WHERE g.GenericID IN (SELECT	GenericID	FROM lnk_DrugTypeGeneric t
					WHERE t.DrugTypeId = 37)) THEN (SELECT TOP 1 ItemName	FROM LookupItemView		WHERE ItemId = a.RegimenId) --(SELECT g.GenericID FROM lnk_DrugGeneric g where g.Drug_pk= d.Drug_Pk AND g.GenericID IN(SELECT t.Drug_pk FROM lnk_DrugTypeGeneric t WHERE DrugTypeId=37)) THEN '' -- d.Drug_PK IN IN(SELECT top 1 mst_Drug m WHERE m.Drug_Pk IN()WHERE -- k.GenericId FROM lnk_DrugTypeGeneric k WHERE k.DrugTypeId=37) then (SELECT top 1 l.ItemName  FROM LookupItemView l WHERE ItemId=a.RegimenId)
		ELSE (SELECT TOP 1	GenericName	FROM mst_Generic m	WHERE m.GenericID IN (SELECT g.GenericID FROM lnk_DrugGeneric g	WHERE g.Drug_pk = d.Drug_pk))
	END [DRUG_NAME]
   ,'NASCOP_CODES' [CODING_SYSTEM]
   ,(SELECT Top 1	StrengthName FROM mst_Strength	WHERE StrengthId IN (SELECT TOP 1 StrengthId	FROM lnk_DrugStrength WHERE DrugId = d.Drug_Pk))	[STRENGTH]
   ,d.SingleDose [DOSAGE]
   ,(SELECT TOP 1	f.Name	FROM mst_Frequency f	WHERE f.ID = d.FrequencyID) [FREQUENCY]
   ,d.Duration [DURATION]
   ,d.OrderedQuantity [QUANTITY_PRESCRIBED]
   ,o.PharmacyNotes [PRESCRIPTION_NOTES]
FROM dtl_PatientPharmacyOrder d
INNER JOIN ord_PatientPharmacyOrder o	ON o.ptn_pharmacy_pk = d.ptn_pharmacy_pk
INNER JOIN Patient p	ON p.ptn_pk = o.Ptn_pk
INNER JOIN Person g	ON g.Id = p.PersonId
LEFT JOIN ARVTreatmentTracker a	ON a.PatientMasterVisitId = o.PatientMasterVisitId	AND a.PatientId = o.PatientId
INNER JOIN PatientIdentifier i	ON i.PatientId = p.Id
WHERE i.IdentifierTypeId = 1
AND o.PatientMasterVisitId IS NOT NULL
  
GO
/****** Object:  View [dbo].[FormFieldsBusinessRuleView]    Script Date: 6/6/2018 12:35:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE VIEW [dbo].[FormFieldsBusinessRuleView]
AS

		Select	tbl1.PaddedFieldId
				,tbl1.FieldId
				,tbl1.FieldLabel
				,tbl1.FeatureId
				,tbl1.Predefined
				,tbl2.BindField		As FieldName
				,upper(tbl2.PDFTableName)	As TableName
				,tbl2.ControlId
				,Ctrl.ReferenceId CtrlReferenceId
				,Ctrl.Name CtrlName
				,tbl3.TabID TabId
				,tbl3.SectionID
				,LFBR.BusRuleId
				,LFBR.BusRuleName
				,LFBR.BusRuleReferenceId
				,LFBR.DeleteFlag
				,LFBR.Value
				,LFBR.Value1
		From FormFieldsView As tbl1
		Inner Join Mst_PreDefinedFields As tbl2 On tbl1.FieldId = tbl2.Id
		Inner Join mst_control As Ctrl On Ctrl.ControlID = tbl2.ControlId
		Inner Join lnk_FormTabSection As tbl3 On tbl1.FeatureId = tbl3.FeatureID 
		Inner Join FieldsBusinessRuleView As LFBR On tbl1.PaddedFieldId = LFBR.PaddedFieldId
		Where  (tbl1.Predefined = 1)
			And (tbl1.Predefined = LFBR.Predefined )  
			And (tbl3.SectionID = tbl1.SectionId)                                                                                                                                          
		Union                                                                                                                                                      
		Select	tbl1.PaddedFieldId	
				,tbl1.FieldId
				,tbl1.FieldLabel
				,tbl1.FeatureId
				,tbl1.Predefined
				,tbl2.FieldName
				,'DTL_CUSTOMFORM'	As TableName
				,tbl2.ControlId
				,Ctrl.ReferenceId
				,Ctrl.Name CtrlName
				,tbl3.TabID TabId
				,tbl3.SectionID
				,LFBR.BusRuleId
				,LFBR.BusRuleName
				,LFBR.BusRuleReferenceId
				,LFBR.DeleteFlag
				,LFBR.Value
				,LFBR.Value1
		From FormFieldsView As tbl1
		Inner Join mst_CustomformField As tbl2 On tbl1.FieldId = tbl2.Id
		Inner Join mst_control As Ctrl On Ctrl.ControlID = tbl2.ControlId
		Inner Join lnk_FormTabSection As tbl3 On tbl1.FeatureId = tbl3.FeatureID		
		Inner Join FieldsBusinessRuleView As LFBR On tbl1.PaddedFieldId = LFBR.PaddedFieldId		
		Where (tbl1.Predefined = 0)
			And (tbl1.Predefined = LFBR.Predefined)
			And (tbl3.SectionID = tbl1.SectionId)





GO
/****** Object:  View [dbo].[PatientPopulationView]    Script Date: 6/6/2018 12:35:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[PatientPopulationView]
AS
     SELECT DISTINCT
            b.ptn_pk AS PatientPK,
            CASE
                WHEN a.PopulationType = 'General Population'
                THEN 'General Population'
                WHEN a.PopulationType = 'Key Population'
                THEN c.ItemName
            END AS PopulationCategory
     FROM dbo.PatientPopulation AS a
          INNER JOIN dbo.Patient AS b ON a.PersonId = b.PersonId
          LEFT OUTER JOIN dbo.LookupItemView AS c ON a.PopulationCategory = c.ItemId
     WHERE(a.DeleteFlag = 0);
GO
/****** Object:  View [dbo].[gcPatientView]    Script Date: 6/6/2018 12:35:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[gcPatientView]
AS
SELECT DISTINCT pt.Id
	,pt.PersonId
	,pt.ptn_pk
	,isnull((
			SELECT TOP 1 v.IdentifierValue
			FROM patientIdentifier v
			WHERE v.PatientId = pt.Id
				AND v.IdentifierTypeId IN (
					SELECT TOP 1 Id
					FROM identifiers z
					WHERE z.Code = 'CCCNumber'
					)
			), (
			SELECT TOP 1 isnull(PosID, '00000')
			FROM mst_Facility
			WHERE DeleteFlag = 0
			) + '-00000') AS EnrollmentNumber
	,pt.PatientIndex
	,CAST(DECRYPTBYKEY(pn.FirstName) AS VARCHAR(50)) AS FirstName
	,CAST(DECRYPTBYKEY(pn.MidName) AS VARCHAR(50)) AS MiddleName
	,CAST(DECRYPTBYKEY(pn.LastName) AS VARCHAR(50)) AS LastName
	,pn.Sex
	,pn.Active
	,pt.RegistrationDate
	,ISNULL(pe.EnrollmentDate, '01-01-1900') AS [EnrollmentDate ]
	,ISNULL(CAST((
				CASE pe.CareEnded
					WHEN 0--(SELECT top 1 i.IdentifierValue FROM patientIdentifier i WHERE i.PatientId=pt.Id AND pt.Id NOT IN(SELECT top 1 d.PatientId FROM PatientCareending d WHERE d.PatientId=pt.Id)) 
						THEN 'Active'
					WHEN 1
						THEN (
								SELECT TOP 1 ItemName
								FROM LookupItemView
								WHERE MasterName = 'CareEnded'
									AND ItemId = ptC.ExitReason
								)
					ELSE 'Not Enrolled'
					END
				) AS VARCHAR(50)), 'Active') AS PatientStatus
	,ptC.ExitReason
	,pt.DateOfBirth
	,CAST(DECRYPTBYKEY(pt.NationalId) AS VARCHAR(50)) AS NationalId
	,pt.FacilityId
	,pt.PatientType
	,pe.TransferIn
	,(CAST(DECRYPTBYKEY((SELECT top 1 MobileNumber FROM PersonContact WHERE PersonId=pn.Id)) AS VARCHAR(20))) AS MobileNumber
	,ISNULL((
			SELECT TOP (1) ScreeningValueId
			FROM dbo.PatientScreening
			WHERE (PatientId = pt.Id)
				AND (
					ScreeningTypeId IN (
						SELECT Id
						FROM dbo.LookupMaster
						WHERE (Name = 'TBStatus')
						)
					)
			ORDER BY Id DESC
			), 0) AS TBStatus
	,ISNULL((
			SELECT TOP (1) ScreeningValueId
			FROM dbo.PatientScreening AS PatientScreening_1
			WHERE (PatientId = pt.Id)
				AND (
					ScreeningTypeId IN (
						SELECT Id
						FROM dbo.LookupMaster AS LookupMaster_1
						WHERE (Name = 'NutritionStatus')
						)
					)
			ORDER BY Id DESC
			), 0) AS NutritionStatus
	,ISNULL((
			SELECT TOP (1) Categorization
			FROM dbo.PatientCategorization
			WHERE (PatientId = pt.Id)
			ORDER BY id DESC
			), 0) AS Categorization
	,ISNULL(pt.DobPrecision, 0) AS DobPrecision
FROM dbo.Patient AS pt
INNER JOIN dbo.Person AS pn ON pn.Id = pt.PersonId
INNER JOIN dbo.PatientEnrollment AS pe ON pt.Id = pe.PatientId
INNER JOIN dbo.PatientIdentifier AS pni ON pni.PatientId = pt.Id
INNER JOIN dbo.Identifiers ON pni.IdentifierTypeId = dbo.Identifiers.Id
LEFT OUTER JOIN (
	SELECT PatientId
		,ExitReason
	FROM dbo.PatientCareending
	
	UNION
	
	SELECT dbo.Patient.Id AS PatientId
		,CASE PatientExitReason
			WHEN 91
				THEN 526
			WHEN 93
				THEN 259
			WHEN 115
				THEN 260
			WHEN 118
				THEN 260
			WHEN 414
				THEN 526
			END AS ExitReason
	FROM dbo.dtl_PatientCareEnded
	INNER JOIN dbo.Patient ON dbo.dtl_PatientCareEnded.Ptn_Pk = dbo.Patient.ptn_pk
	WHERE  dbo.dtl_PatientCareEnded.CareEnded = 1
	) AS ptC ON pt.Id = ptC.PatientId
--LEFT OUTER JOIN dbo.PersonContact AS pc ON pc.PersonId = pn.Id
WHERE  (dbo.Identifiers.Name = 'CCC Registration Number') AND 
	(pn.DeleteFlag = 0)

	UNION

	SELECT DISTINCT ISNULL(NULL,pn.Id) Id
	,pn.Id PersonId
	,ISNULL(NULL,0 )ptn_pk
	,(SELECT TOP 1 isnull(PosID, '00000') FROM mst_Facility WHERE DeleteFlag = 0) + '-00000' AS EnrollmentNumber
	,ISNULL(NULL,'00000') PatientIndex
	,CAST(DECRYPTBYKEY(pn.FirstName) AS VARCHAR(50)) AS FirstName
	,CAST(DECRYPTBYKEY(pn.MidName) AS VARCHAR(50)) AS MiddleName
	,CAST(DECRYPTBYKEY(pn.LastName) AS VARCHAR(50)) AS LastName
	,pn.Sex
	,pn.Active
	,ISNULL(NULL,01-01-1900) RegistrationDate
	,ISNULL(NULL,'01-01-1900') AS [EnrollmentDate ]
	,'Not Enrolled' AS PatientStatus
	,NULL ExitReason
	,ISNULL(pn.DateOfBirth,'01-01-1900') DateOfBirth
	,ISNULL(NULL,CAST(DECRYPTBYKEY('99999999') as varchar(50))) AS NationalId
	,ISNULL(NULL,(SELECT top 1 FacilityID FROM mst_Facility WHERE DeleteFlag=0)) FacilityId
	,(SELECT top 1 Id FROM LookupItem WHERE Name='New') PatientType
	,(ISNULL(NULL,(SELECT transferIn FROM PatientEnrollment WHERE PatientId IN(SELECT Id FROM patient WHERE personId=pn.id)))) TransferIn
	,(CAST(DECRYPTBYKEY((SELECT top 1 MobileNumber FROM PersonContact WHERE PersonId=pn.Id)) AS VARCHAR(20))) AS MobileNumber
	,0 TBStatus
	,0 NutritionStatus
	,0 AS Categorization
	,ISNULL(pn.DobPrecision, 0) AS DobPrecision
FROM dbo.Person AS pn
WHERE
	 pn.Id NOT IN(SELECT p.PersonId FROM  Patient p WHERE p.Id IN(SELECT PatientId FROM PatientIdentifier WHERE IdentifierTypeId IN(SELECT top 1 Id FROM Identifiers WHERE Code='CCCNumber')))
GO
/****** Object:  View [dbo].[Mst_ItemType]    Script Date: 6/6/2018 12:35:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
 Created By Joseph Njung'e
 Return items types from the mst decode table

*/
CREATE VIEW [dbo].[Mst_ItemType]
AS

Select	ID As ItemTypeID,
		Name As ItemName,
		CreateDate,
		SRNo,
		DeleteFlag
From dbo.mst_Decode
Where CodeID = 202  ;
GO
/****** Object:  View [dbo].[vw_Master_ItemList]    Script Date: 6/6/2018 12:35:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



/*
 Created By Joseph Njung'e
 Return ItemList with the latest price and the price date.
*/
CREATE VIEW [dbo].[vw_Master_ItemList]
AS

With Items (ItemID, ItemName,ItemTypeID,ItemTypeName,DeleteFlag)As (
Select	Item_PK [ItemID],
		M.ItemName,
		M.ItemTypeID,
		I.ItemName ItemTypeName,
		M.DeleteFlag
From dbo.Mst_ItemMaster M
Inner Join
	Mst_ItemType I On I.ItemTypeID = M.ItemTypeID
Where I.DeleteFlag = 0
And M.DeleteFlag = 0 
Union All
Select	L.Id ItemID,
		L.Name ItemName,
		I.ItemTypeID,
		I.ItemName ItemTypeName,
		L.DeleteFlag
From mst_LabTestMaster L
Inner Join
	Mst_ItemType I On I.ItemName = 'Lab Tests'
Where I.DeleteFlag = 0
And L.DeleteFlag = 0 
Union All
Select	L.Id ItemID,
		L.Name ItemName,
		I.ItemTypeID,
		I.ItemName ItemTypeName,
		L.DeleteFlag
From Mst_ClinicalService L
Inner Join
	Mst_ItemType I On I.ItemName = 'Clinical Services'
Where I.DeleteFlag = 0
And L.DeleteFlag = 0 
Union All
Select	V.VisitTypeID ItemID,
		V.VisitName ItemName,
		I.ItemTypeID,
		I.ItemName ItemTypeName,
		V.DeleteFlag
From mst_VisitType V
Left Outer Join mst_Feature F On F.FeatureID = V.FeatureId And F.DeleteFlag = 0
Inner Join 
	Mst_ItemType I On I.ItemName = 'VisitType'
Where V.DeleteFlag = 0 
And I.DeleteFlag = 0
Union All
Select	W.WardID ItemID,
		W.WardName ItemName,
		I.ItemTypeID,
		I.ItemName ItemTypeName,
		W.DeleteFlag
From Mst_PatientWard W
Inner Join
	Mst_ItemType I On I.ItemName = 'Ward Admission'
Where I.DeleteFlag = 0
And W.DeleteFlag = 0
)
Select	I.ItemId,
		I.ItemName,
		I.ItemTypeId,
		I.ItemTypeName,
		CC.ItemSellingPrice UnitSellingPrice,
		CC.PriceDate,
		Isnull(CC.PharmacyPriceType,0)PharmacyPriceType, 
		CC.VersionStamp,
		Convert(bit,Isnull(DeleteFlag,0)) DeleteFlag
From Items I
Left Outer Join (
	Select	ItemSellingPrice,
			Max(EffectiveDate) PriceDate,
			ItemType,
			ItemId,
			PriceStatus,
			Max(Convert(bigint,VersionStamp))VersionStamp,
			Isnull(PharmacyPriceType,0) PharmacyPriceType
	From dbo.lnk_ItemCostConfiguration
	Where DeleteFlag = 0
	Group By	ItemSellingPrice,
				ItemType,
				ItemId,
				PriceStatus,
				PharmacyPriceType
	) CC On CC.ItemId = I.ItemID
And CC.ItemType = I.ItemTypeID
And CC.PriceStatus = 1 ;



GO
/****** Object:  View [dbo].[Mst_Consumables]    Script Date: 6/6/2018 12:35:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*
 Created By Joseph Njung'e
 Return DrugList from mst_itemmaster
 ItemTypeID 300	 = Pharmaceuticals
*/
CREATE VIEW [dbo].[Mst_Consumables]
AS
Select	D.Item_PK ,
		0 DrugID,
		D.ItemTypeID,
		D.ItemName ,
		D.DeleteFlag,
		D.CreatedBy UserID,
		D.CreateDate CreateDate,
		D.UpdateDate,		
		D.FDACode,
		D.Manufacturer,
		D.MaxStock,
		D.MinStock,
		D.PurchaseUnitPrice,
		D.QtyPerPurchaseUnit,		
		Isnull(CC.ItemSellingPrice,0)SellingUnitPrice,
		D.DispensingUnit,
		D.PurchaseUnit,
		CC.EffectiveDate,
		1 As Sequence
From dbo.Mst_ItemMaster D
Inner Join
	Mst_ItemType I On I.ItemTypeID= D.ItemTypeID
Inner Join  lnk_DrugGeneric DG On d.Item_PK=DG.Drug_pk
Inner Join lnk_DrugTypeGeneric DTG On DTG.GenericId = DG.GenericID
Inner join mst_DrugType DT On DT.DrugTypeID = DTG.DrugTypeId
Left Outer Join
	dbo.lnk_ItemCostConfiguration CC On CC.ItemId = D.Item_PK And CC.ItemType=D.ItemTypeID And CC.PriceStatus = 1
Where I.ItemName='Pharmaceuticals'  And DT.DrugTypeName In('Medical supplies');



GO
/****** Object:  View [dbo].[VW_Mst_ItemType]    Script Date: 6/6/2018 12:35:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
 Created By Joseph Njung'e
 Return items types from the mst decode table

*/
CREATE VIEW [dbo].[VW_Mst_ItemType]
AS

Select	ID As ItemTypeID,
		Name As ItemName,
		CreateDate,
		SRNo,
		DeleteFlag
From dbo.mst_Decode
Where CodeID = 202 



GO
/****** Object:  View [dbo].[VW_Mst_Drug]    Script Date: 6/6/2018 12:35:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
 Created By Joseph Njung'e
 Return DrugList from mst_itemmaster
 ItemTypeID 300	 = Pharmaceuticals
*/
CREATE VIEW [dbo].[VW_Mst_Drug]
AS
SELECT     D.Item_PK AS Drug_pk, D.ItemID AS DrugID, D.ItemTypeID, D.ItemName AS DrugName, D.DeleteFlag, D.CreatedBy AS UserID, D.CreateDate, D.UpdateDate, D.DispensingMargin, 
                      D.DispensingUnitPrice, D.FDACode, D.Manufacturer, D.MaxStock, D.MinStock, D.PurchaseUnitPrice, D.QtyPerPurchaseUnit, ISNULL(CC.ItemSellingPrice, 0) AS SellingUnitPrice, D.DispensingUnit, 
                      D.PurchaseUnit, CC.EffectiveDate, 1 AS Sequence, D.ItemInstructions
FROM         dbo.Mst_ItemMaster AS D INNER JOIN
                      dbo.VW_Mst_ItemType AS I ON I.ItemTypeID = D.ItemTypeID LEFT OUTER JOIN
                      dbo.lnk_ItemCostConfiguration AS CC ON CC.ItemId = D.Item_PK AND CC.ItemType = D.ItemTypeID AND CC.PriceStatus = 1
WHERE     (I.ItemName = 'Pharmaceuticals')

GO

/****** Object:  View [dbo].[vw_BillPaymentType]    Script Date: 6/6/2018 12:35:49 PM *****
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[vw_BillPaymentType]
AS
Select	TypeID ID,
		212 CodeID,
		TypeName PaymentName,
		Active
From Mst_BillPaymentType;
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vw_Billing_CashTransactions]
AS
Select		
		O.TransactionDate,
		O.AmountPayable Amount,
		O.Ptn_PK,
		O.userID CashierUserID,
		O.ReceiptNumber,
		'Cash Payment' As TransactionDescription
From dbo.ord_bill O
Inner Join
			dbo.vw_BillPaymentType PT On PT.ID = O.TransactionType
Where PT.PaymentName = 'Cash' And O.Ptn_PK > 0
Union All
Select B.RefundDate TransactionDate,
		 O.AmountPayable Amount,
		O.Ptn_PK,
		B.RefundBy CashierUserID,
		B.ReversalReference ReceiptNumber,
		'Cash Refund' As TransactionDescription
From dbo.ord_Bill_Reversals B 
Inner Join 
	dbo.ord_bill O On O.TransactionID = B.TransactionID 
And B.Refunded = 1 And B.RefundType='Cash' And O.Ptn_PK > 0
Union All
Select D.TransactionDate,
	Case D.TransactionType When 'Debit' Then  D.Amount Else D.Amount End Amount,
	D.Ptn_PK,
	D.UserID CashierUserID,
	D.ReferenceNumber,
	Case D.TransactionDescription When 'Deposit' Then 'Cash Deposit' Else 'Deposit Refund' End TransactionDescription
From dbo.dtl_BillDepositTransaction D 
Where D.TransactionDescription In ('Deposit','Refund') And D.DepositType='Cash' And D.Ptn_PK > 0;

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vw_Billing_BillTransaction]
AS
Select	T.TransactionID,
		T.Ptn_PK,
		T.BillID,	
		B.LocationID,	
		B.BillNumber,
		B.BillAmount,
		B.BillDate,
		T.TransactionDate,
		T.TransactionType,
		PT.PaymentName,
		T.RefNumber,
		T.Amount,
		T.AmountPayable,
		T.TenderedAmount,
		T.userID TransactedBy,
		T.ReceiptNumber,
		T.TransactionStatus,
		T.Reversed,
		Convert(bit,Case 
			When T.Reversed = 1 Or R.TransactionReversalID Is Not Null Then 0 
			Else
				 Case  When PT.PaymentName In('Cash','Deposit') Then 1  Else 0 End
			End)		Reversible,
		R.TransactionReversalID,
		R.RequestDate,
		R.UserID As RequestedBy,
		R.ReversalReason,
		R.ApprovalNotes,
		R.ApprovalDate,
		R.ApprovalStatus,
		R.ApprovedBy,
		R.ReversalReference,
		Convert(bit,Case 
			When R.Refunded = 1  Then 0 
			Else
				 Case  When PT.PaymentName In('Cash','Deposit') And T.Reversed = 1 Then 1  Else 0 End
			End)		Refundable,
		Isnull(R.Refunded,0) Refunded,
		R.RefundDate,
		R.RefundBy,
		R.RefundType
From dbo.ord_bill As T
Inner Join
	dbo.mst_Bill B On B.BillID=T.BillID
Inner Join
			dbo.vw_BillPaymentType PT On PT.ID = T.TransactionType
Left Outer Join
	dbo.ord_Bill_Reversals As R On R.TransactionID = T.TransactionID
Where  T.Ptn_PK > 0;
GO
*/


/****** Object:  View [dbo].[VW_PatientCareEnding]    Script Date: 6/6/2018 12:35:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VW_PatientCareEnding]
AS
     SELECT dbo.Patient.ptn_pk,
            dbo.PatientMasterVisit.VisitDate,
            dbo.PatientCareending.ExitReason,
            dbo.LookupItemView.ItemName AS [Patient CareEnd Reason],
            dbo.PatientCareending.TransferOutfacility AS LPTFTransfer,
            dbo.PatientCareending.DateOfDeath,
            dbo.PatientCareending.ExitDate AS CareEndedDate,
            dbo.PatientCareending.Id AS CareEndedID,
            dbo.PatientCareending.CareEndingNotes,
            dbo.PatientCareending.Active,
            dbo.PatientCareending.DeleteFlag
     FROM dbo.Patient
          INNER JOIN dbo.PatientCareending ON dbo.Patient.Id = dbo.PatientCareending.PatientId
          INNER JOIN dbo.PatientMasterVisit ON dbo.PatientCareending.PatientMasterVisitId = dbo.PatientMasterVisit.Id
          INNER JOIN dbo.LookupItemView ON dbo.PatientCareending.ExitReason = dbo.LookupItemView.ItemId;
GO
/****** Object:  View [dbo].[vw_AppointmentReasons]    Script Date: 6/6/2018 12:35:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
 Created By Joseph Njung'e
 Return items types from the mst decode table

*/
CREATE VIEW [dbo].[vw_AppointmentReasons]
AS

SELECT        Name, ID, DeleteFlag
FROM            mst_Decode
WHERE        (CodeID = 26) AND (DeleteFlag = 0)

GO
/****** Object:  View [dbo].[BlueCardAppointmentView]    Script Date: 6/6/2018 12:35:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[BlueCardAppointmentView]
AS
     SELECT Pat.Id PatientId,
            AppointmentId,
            FacilityName =
     (
         SELECT TOP 1 F.FacilityName
         FROM mst_Facility F
         WHERE F.FacilityID = PA.LocationID
     ),
            Pa.Visit_pk VisitId,
            AppDate AppointmentDate,
            AR.Name Reason,
            StatusName [AppointmentStatus],
            E.FirstName+' '+E.LastName AS Provider,
            PA.AppNote Description,
            ServiceArea =
     (
         SELECT ModuleName
         FROM mst_module M
         WHERE M.ModuleId = PA.ModuleID
     ),
            isnull(PA.UpdateDate, PA.CreateDate) StatusDate,ISNULL(ROW_NUMBER() OVER(ORDER BY Pat.Id DESC), -1) AS RowId
     FROM dtl_PatientAppointment PA
          INNER JOIN mst_patient P ON p.Ptn_Pk = PA.Ptn_pk
          INNER JOIN Patient Pat ON P.Ptn_Pk = Pat.ptn_pk
          LEFT OUTER JOIN vw_AppointmentReasons AR ON AR.ID = AppReason
          INNER JOIN
     (
         SELECT ID StatusID,
                Name StatusName
         FROM mst_decode
         WHERE codeId = 3
     ) ST ON ST.StatusID = PA.AppStatus
          INNER JOIN
     (
         SELECT UserId CreatedById,
                UserFirstName+' '+UserLastName CreatedBy
         FROM mst_User
     ) UC ON UC.CreatedById = PA.UserID
          LEFT OUTER JOIN
     (
         SELECT UserId UpdatedById,
                UserFirstName+' '+UserLastName UpdatedBy
         FROM mst_User
     ) MD ON MD.UpdatedById = PA.UpdateUserId
          LEFT OUTER JOIN mst_Employee E ON E.EmployeeID = PA.EmployeeID
     WHERE PA.DeleteFlag = 0
           AND P.DeleteFlag = 0;
GO
/****** Object:  View [dbo].[VWDiseaseSymptom]    Script Date: 6/6/2018 12:35:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VWDiseaseSymptom]
AS
SELECT     A.ID, A.Name, A.Name + ' - ' + '[Symptom]' AS Name1, A.SRNO, A.DeleteFlag, A.SystemId, '0' AS DiseaseFlag, B.ModuleId
FROM         dbo.mst_Symptom AS A LEFT OUTER JOIN
                      dbo.lnkModule_DiseaseICDCode AS B ON A.ID = B.DiseaseId
UNION
SELECT     A.ID, A.Name, A.Name + ' - ' + '[Disease]' AS Name1, A.SRNO, A.DeleteFlag, A.SystemId, '1' AS DiseaseFlag, B.ModuleId
FROM         dbo.mst_HivDisease AS A LEFT OUTER JOIN
                      dbo.lnkModule_DiseaseICDCode AS B ON A.ID = B.DiseaseId
GO
/****** Object:  View [dbo].[VW_AllMasters]    Script Date: 6/6/2018 12:35:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VW_AllMasters]
AS
SELECT     a.ID AS Id, a.Name, 'Mst_PMTCTDecode' AS TableName, a.CodeID AS CategoryId, b.Predefined, '' AS ModuleId
FROM         dbo.mst_pmtctDeCode AS a INNER JOIN
                      dbo.mst_pmtctCode AS b ON a.CodeID = b.CodeID AND (a.DeleteFlag = 0 OR
                      a.DeleteFlag IS NULL) AND a.SystemId <> 2
UNION
SELECT     Id, Name, 'Mst_ARVStatus' AS TableName, '' AS CategoryId, '' AS Predefined, '' AS ModuleId
FROM         dbo.mst_ARVStatus
WHERE     (DeleteFlag = 0) OR
                      (DeleteFlag IS NULL)
UNION
SELECT     ID, Name, 'mst_HIVCareStatus' AS TableName, '' AS CategoryId, '' AS Predefined, '' AS ModuleId
FROM         dbo.mst_HIVCareStatus
WHERE     (DeleteFlag = 0 OR
                      DeleteFlag IS NULL) AND (SystemId <> 2)
UNION
SELECT     ID, Name, 'mst_Provider' AS TableName, '' AS CategoryId, '' AS Predefined, '' AS ModuleId
FROM         dbo.mst_Provider
WHERE     (DeleteFlag = 0 OR
                      DeleteFlag IS NULL) AND (SystemId <> 2)
UNION
SELECT     ID AS Id, Name, 'mst_RelationshipType' AS TableName, '' AS CategoryId, '' AS Predefined, '' AS ModuleId
FROM         dbo.mst_RelationshipType
WHERE     (DeleteFlag = 0 OR
                      DeleteFlag IS NULL) AND (SystemId <> 2)
UNION
SELECT     ID AS Id, Name, 'mst_District' AS TableName, '' AS CategoryId, '' AS Predefined, '' AS ModuleId
FROM         dbo.mst_District
WHERE     (DeleteFlag = 0 OR
                      DeleteFlag IS NULL) AND (SystemId <> 2)
UNION
SELECT     ID AS Id, Name, 'mst_Reason' AS TableName, CategoryID AS CategoryId, '' AS Predefined, '' AS ModuleId
FROM         dbo.mst_Reason
WHERE     (DeleteFlag = 0 OR
                      DeleteFlag IS NULL) AND (SystemId <> 2)
UNION
SELECT     ID AS Id, Name, 'mst_Education' AS TableName, '' AS CategoryId, '' AS Predefined, '' AS ModuleId
FROM         dbo.mst_Education
WHERE     (DeleteFlag = 0 OR
                      DeleteFlag IS NULL) AND (SystemId <> 2)
UNION
SELECT     UserID AS Id, UserName, 'mst_User' AS TableName, '' AS CategoryId, '' AS Predefined, '' AS ModuleId
FROM         dbo.mst_User
WHERE     (DeleteFlag = 0) OR
                      (DeleteFlag IS NULL)
UNION
SELECT     a.ID AS Id, a.Name, 'mst_ModDeCode' AS TableName, a.CodeID AS CategoryId, b.Predefined, '' AS ModuleId
FROM         dbo.mst_ModDeCode AS a INNER JOIN
                      dbo.mst_ModCode AS b ON a.CodeID = b.CodeID AND (a.DeleteFlag = 0 OR
                      a.DeleteFlag IS NULL)
UNION
SELECT     EmployeeID AS Id, FirstName + ' ' + LastName AS Expr1, 'mst_Employee' AS TableName, '' AS CategoryId, '' AS Expr2, '' AS ModuleId
FROM         dbo.mst_Employee
WHERE     (DeleteFlag = 0) OR
                      (DeleteFlag IS NULL)
UNION
SELECT     ID AS Id, Name, 'mst_Occupation' AS TableName, '' AS CategoryId, '' AS Predefined, '' AS ModuleId
FROM         dbo.mst_Occupation
WHERE     (DeleteFlag = 0) OR
                      (DeleteFlag IS NULL)
UNION
SELECT     ID AS Id, Name, 'mst_Village' AS TableName, '' AS CategoryId, '' AS Predefined, '' AS ModuleId
FROM         dbo.mst_Village
WHERE     (DeleteFlag = 0 OR
                      DeleteFlag IS NULL) AND (SystemId <> 2)
UNION
SELECT     id AS Id, Name, 'mst_HIVAIDSCareTypes' AS TableName, '' AS CategoryId, '' AS Predefined, '' AS ModuleId
FROM         dbo.mst_HIVAIDSCareTypes
WHERE     (DeleteFlag = 0 OR
                      DeleteFlag IS NULL) AND (SystemId <> 2)
UNION
SELECT     Id, Name, 'mst_HIVDisclosure' AS TableName, '' AS CategoryId, '' AS Predefined, '' AS ModuleId
FROM         dbo.mst_HIVDisclosure
WHERE     (DeleteFlag = 0 OR
                      DeleteFlag IS NULL) AND (SystemId <> 2)
UNION
SELECT     Id, Name, 'mst_ARTSponsor' AS TableName, '' AS CategoryId, '' AS Predefined, '' AS ModuleId
FROM         dbo.mst_ARTSponsor
WHERE     (DeleteFlag = 0 OR
                      DeleteFlag IS NULL) AND (SystemId <> 2)
UNION
SELECT     ID, Name, 'mst_HivDisease' AS TableName, SectionID AS CategoryId, '' AS Predefined, '' AS ModuleId
FROM         dbo.mst_HivDisease
WHERE     (DeleteFlag = 0 OR
                      DeleteFlag IS NULL) AND (SystemId <> 2)
UNION
SELECT     AssessmentID, AssessmentName, 'mst_Assessment' AS TableName, AssessmentCategoryID AS CategoryId, '' AS Predefined, '' AS ModuleId
FROM         dbo.mst_Assessment
WHERE     (DeleteFlag = 0) OR
                      (DeleteFlag IS NULL)
UNION
SELECT     Id, Name, 'mst_Division' AS TableName, '' AS CategoryId, '' AS Predefined, '' AS ModuleId
FROM         dbo.mst_Division
WHERE     (DeleteFlag = 0 OR
                      DeleteFlag IS NULL) AND (SystemId <> 2)
UNION
SELECT     a.ID, a.Name, 'mst_DeCode' AS TableName, a.CodeID AS CategoryId, '1' AS Predefined, '' AS ModuleId
FROM         dbo.mst_Decode AS a INNER JOIN
                      dbo.mst_Code AS b ON a.CodeID = b.CodeID AND (a.DeleteFlag = 0 OR
                      a.DeleteFlag IS NULL) AND a.SystemId <> 2
UNION
SELECT     ID, Name, 'mst_Symptom' AS TableName, CategoryID AS CategoryId, '' AS Predefined, '' AS ModuleId
FROM         dbo.mst_Symptom
WHERE     (DeleteFlag = 0 OR
                      DeleteFlag IS NULL) AND (SystemId <> 2)
UNION
SELECT     ID AS Id, Name, 'Mst_AidsDefEvents' AS TableName, '' AS CategoryId, '' AS Predefined, '' AS ModuleId
FROM         dbo.Mst_AidsDefEvents
WHERE     (DeleteFlag = 0 OR
                      DeleteFlag IS NULL) AND (SystemId <> 2)
UNION
SELECT     ID AS Id, Name, 'mst_CouncellingTopic' AS TableName, '' AS CategoryId, '' AS Predefined, '' AS ModuleId
FROM         dbo.mst_CouncellingTopic
WHERE     (DeleteFlag = 0 OR
                      DeleteFlag IS NULL) AND (SystemId <> 2)
UNION
SELECT     ID AS Id, Name, 'mst_CouncellingType' AS TableName, '' AS CategoryId, '' AS Predefined, '' AS ModuleId
FROM         dbo.mst_CouncellingType
WHERE     (DeleteFlag = 0 OR
                      DeleteFlag IS NULL) AND (SystemId <> 2)
UNION
SELECT     ID AS Id, Name, 'mst_Province' AS TableName, '' AS CategoryId, '' AS Predefined, '' AS ModuleId
FROM         dbo.mst_Province
WHERE     (DeleteFlag = 0 OR
                      DeleteFlag IS NULL) AND (SystemId <> 2)
UNION
SELECT     Id, Name, 'mst_Ward' AS TableName, '' AS CategoryId, '' AS Predefined, '' AS ModuleId
FROM         dbo.mst_Ward
WHERE     (DeleteFlag = 0 OR
                      DeleteFlag IS NULL) AND (SystemId <> 2)
UNION
SELECT     ID, Name, 'Mst_ARVSideEffects' AS TableName, '' AS CategoryId, '' AS Predefined, '' AS ModuleId
FROM         dbo.Mst_ARVSideEffects
WHERE     (DeleteFlag = 0 OR
                      DeleteFlag IS NULL) AND (SystemId <> 2)
UNION
SELECT     ID, Name, 'mst_LPTF' AS TableName, '' AS CategoryId, '' AS Predefined, '' AS ModuleId
FROM         dbo.mst_LPTF
WHERE     (DeleteFlag = 0 OR
                      DeleteFlag IS NULL) AND (Systemid <> 2)
UNION
SELECT     Id, Name, 'mst_TBStatus' AS TableName, '' AS CategoryId, '' AS Predefined, '' AS ModuleId
FROM         dbo.mst_TBStatus
WHERE     (DeleteFlag = 0) OR
                      (DeleteFlag IS NULL)
UNION
SELECT     Id, Name, 'mst_YesNo' AS TableName, '' AS CategoryId, '' AS Predefined, '' AS ModuleId
FROM         dbo.mst_YesNo
WHERE     (DeleteFlag = 0) OR
                      (DeleteFlag IS NULL)
UNION
SELECT     Id, Name, 'mst_LostFollowReason' AS TableName, '' AS CategoryId, '' AS Predefined, '' AS ModuleId
FROM         dbo.mst_LostFollowreason
WHERE     (DeleteFlag = 0 OR
                      DeleteFlag IS NULL) AND (SystemId <> 2)
UNION
SELECT     ID, Name, 'dbo.VWDiseaseSymptom' AS TableName, '' AS CategoryId, '' AS Predefined, '' AS ModuleId
FROM         dbo.VWDiseaseSymptom
WHERE     (DeleteFlag = 0 OR
                      DeleteFlag IS NULL) AND (SystemId <> 2)
UNION
SELECT     a.ID, a.Name, 'mst_BlueDeCode' AS TableName, a.CodeID AS CategoryId, '' AS Predefined, b.ModuleID
FROM         dbo.mst_BlueDecode AS a INNER JOIN
                      dbo.mst_BlueCode AS b ON a.CodeID = b.CodeID AND (a.DeleteFlag = 0 OR
                      a.DeleteFlag IS NULL) AND a.SystemId <> 2
GO
/****** Object:  View [dbo].[VW_MasterTableLinking]    Script Date: 6/6/2018 12:35:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VW_MasterTableLinking]
AS
SELECT DISTINCT 
                      dbo.VW_AllMasters.CategoryId AS CodeId, dbo.VW_AllMasters.Id, dbo.VW_AllMasters.Name, dbo.VW_AllMasters.TableName, dbo.VW_AllMasters.Predefined, 
                      CASE VW_AllMasters.Predefined WHEN 1 THEN dbo.Mst_PredefinedFields.ModuleId WHEN 0 THEN 0 END AS ModuleId, 
                      CASE WHEN VW_AllMasters.Predefined = 1 THEN dbo.Mst_PreDefinedFields.PatientRegistration ELSE dbo.mst_CustomformField.PatientRegistration END AS PatientRegistration
FROM         dbo.VW_AllMasters LEFT OUTER JOIN
                      dbo.Mst_PreDefinedFields ON dbo.VW_AllMasters.TableName = dbo.Mst_PreDefinedFields.BindTable AND 
                      dbo.VW_AllMasters.CategoryId = dbo.Mst_PreDefinedFields.CategoryId LEFT OUTER JOIN
                      dbo.mst_CustomformField ON dbo.VW_AllMasters.TableName = dbo.mst_CustomformField.BindTable AND 
                      dbo.VW_AllMasters.CategoryId = dbo.mst_CustomformField.CategoryId
GO
/****** Object:  View [dbo].[VW_MasterCodeTableLinking]    Script Date: 6/6/2018 12:35:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VW_MasterCodeTableLinking]
AS

	Select a.CodeId, b.Name[CodeName], a.Id, a.Name, a.TableName, a.Predefined, a.ModuleId from [VW_MasterTableLinking] a inner join mst_code b
	on a.CodeId=b.CodeId where TableName = 'mst_Decode' group by a.CodeId, b.Name,a.Id, a.Name, a.TableName, a.Predefined, a.ModuleId
	union
	Select a.CodeId, b.Name[CodeName], a.Id, a.Name, a.TableName, a.Predefined, a.ModuleId from [VW_MasterTableLinking] a inner join mst_bluecode b
	on a.CodeId=b.CodeId where TableName = 'mst_blueDecode' group by a.CodeId, b.Name,a.Id, a.Name, a.TableName, a.Predefined, a.ModuleId
	union
	Select a.CodeId, b.Name[CodeName], a.Id, a.Name, a.TableName, a.Predefined, a.ModuleId from [VW_MasterTableLinking] a inner join mst_pmtctcode b
	on a.CodeId=b.CodeId where TableName = 'mst_pmtctDecode' group by a.CodeId, b.Name,a.Id, a.Name, a.TableName, a.Predefined, a.ModuleId
	union
	Select a.CodeId, b.Name[CodeName], a.Id, a.Name, a.TableName, a.Predefined, a.ModuleId from [VW_MasterTableLinking] a inner join mst_Education b
	on a.CodeId=b.Id  where TableName = 'mst_Education' group by a.CodeId, b.Name, a.Id, a.Name, a.TableName, a.Predefined, a.ModuleId
	union
	Select a.CodeId, b.Name[CodeName], a.Id, a.Name, a.TableName, a.Predefined, a.ModuleId from [VW_MasterTableLinking] a inner join Mst_ARVSideEffects b
	on a.CodeId=b.Id where TableName = 'Mst_ARVSideEffects' group by a.CodeId, b.Name, a.Id, a.Name, a.TableName, a.Predefined, a.ModuleId
	union
	Select a.CodeId, b.Name[CodeName], a.Id, a.Name, a.TableName, a.Predefined, a.ModuleId from [VW_MasterTableLinking] a inner join mst_RelationshipType b
	on a.CodeId=b.Id where TableName = 'mst_RelationshipType' group by a.CodeId, b.Name, a.Id, a.Name, a.TableName, a.Predefined, a.ModuleId
	union
	Select a.CodeId, b.Name[CodeName], a.Id, a.Name, a.TableName, a.Predefined, a.ModuleId from [VW_MasterTableLinking] a inner join mst_CouncellingTopic b
	on a.CodeId=b.Id where TableName = 'mst_CouncellingTopic' group by a.CodeId, b.Name, a.Id, a.Name, a.TableName, a.Predefined, a.ModuleId
	union
	Select a.CodeId, b.Name[CodeName], a.Id, a.Name, a.TableName, a.Predefined, a.ModuleId from [VW_MasterTableLinking] a inner join mst_CouncellingType b
	on a.CodeId=b.Id where TableName = 'mst_CouncellingType' group by a.CodeId, b.Name, a.Id, a.Name, a.TableName, a.Predefined, a.ModuleId
	union
	Select a.CodeId, b.Name[CodeName], a.Id, a.Name, a.TableName, a.Predefined, a.ModuleId from [VW_MasterTableLinking] a inner join mst_LostFollowReason b
	on a.CodeId=b.Id where TableName = 'mst_LostFollowReason' group by a.CodeId, b.Name, a.Id, a.Name, a.TableName, a.Predefined, a.ModuleId
	union
	Select a.CodeId, b.Name[CodeName], a.Id, a.Name, a.TableName, a.Predefined, a.ModuleId from [VW_MasterTableLinking] a inner join mst_Provider b
	on a.CodeId=b.Id where TableName = 'mst_Provider' group by a.CodeId, b.Name, a.Id, a.Name, a.TableName, a.Predefined, a.ModuleId
	union
	Select a.CodeId, b.Name[CodeName], a.Id, a.Name, a.TableName, a.Predefined, a.ModuleId from [VW_MasterTableLinking] a inner join mst_HIVAIDSCareTypes b
	on a.CodeId=b.Id where TableName = 'mst_HIVAIDSCareTypes' group by a.CodeId, b.Name, a.Id, a.Name, a.TableName, a.Predefined, a.ModuleId
	union
	Select a.CodeId, b.Name[CodeName], a.Id, a.Name, a.TableName, a.Predefined, a.ModuleId from [VW_MasterTableLinking] a inner join mst_HIVCareStatus b
	on a.CodeId=b.Id where TableName = 'mst_HIVCareStatus' group by a.CodeId, b.Name, a.Id, a.Name, a.TableName, a.Predefined, a.ModuleId
	union
	Select a.CodeId, b.Name[CodeName], a.Id, a.Name, a.TableName, a.Predefined, a.ModuleId from [VW_MasterTableLinking] a inner join mst_LPTF b
	on a.CodeId=b.Id where TableName = 'mst_LPTF' group by a.CodeId, b.Name, a.Id, a.Name, a.TableName, a.Predefined, a.ModuleId
	union
	Select a.CodeId, b.Name[CodeName], a.Id, a.Name, a.TableName, a.Predefined, a.ModuleId from [VW_MasterTableLinking] a inner join dbo.mst_ARTSponsor b
	on a.CodeId=b.Id where TableName = 'mst_ARTSponsor' group by a.CodeId, b.Name, a.Id, a.Name, a.TableName, a.Predefined, a.ModuleId
	union
	Select a.CodeId, b.Name[CodeName], a.Id, a.Name, a.TableName, a.Predefined, a.ModuleId from [VW_MasterTableLinking] a inner join dbo.mst_HIVDisclosure b
	on a.CodeId=b.Id where TableName = 'mst_HIVDisclosure' group by a.CodeId, b.Name, a.Id, a.Name, a.TableName, a.Predefined, a.ModuleId
	union
	Select a.CodeId, b.Name[CodeName], a.Id, a.Name, a.TableName, a.Predefined, a.ModuleId from [VW_MasterTableLinking] a inner join dbo.mst_TBStatus b
	on a.CodeId=b.Id where TableName = 'mst_TBStatus' group by a.CodeId, b.Name, a.Id, a.Name, a.TableName, a.Predefined, a.ModuleId
	union
	Select a.CodeId, b.Name[CodeName], a.Id, a.Name, a.TableName, a.Predefined, a.ModuleId from [VW_MasterTableLinking] a inner join dbo.mst_Reason b
	on a.CodeId=b.Id where TableName = 'mst_Reason' group by a.CodeId, b.Name, a.Id, a.Name, a.TableName, a.Predefined, a.ModuleId
	union
	Select a.CodeId, b.Name[CodeName], a.Id, a.Name, a.TableName, a.Predefined, a.ModuleId from [VW_MasterTableLinking] a inner join dbo.mst_ModCode b
	on a.CodeId=b.CodeId where TableName = 'mst_ModCode' group by a.CodeId, b.Name, a.Id, a.Name, a.TableName, a.Predefined, a.ModuleId
	union
	Select a.CodeId, b.Name[CodeName], a.Id, a.Name, a.TableName, a.Predefined, a.ModuleId from [VW_MasterTableLinking] a inner join dbo.mst_HivDisease b
	on a.CodeId=b.Id where TableName = 'mst_HivDisease' group by a.CodeId, b.Name, a.Id, a.Name, a.TableName, a.Predefined, a.ModuleId
	union
	Select a.CodeId, b.AssessmentName[CodeName], a.Id, a.Name, a.TableName, a.Predefined, a.ModuleId from [VW_MasterTableLinking] a inner join dbo.mst_Assessment b
	on a.CodeId=b.AssessmentId where TableName = 'mst_Assessment' group by a.CodeId, b.AssessmentName, a.Id, a.Name, a.TableName, a.Predefined, a.ModuleId
	union
	Select a.CodeId, b.Name[CodeName], a.Id, a.Name, a.TableName, a.Predefined, a.ModuleId from [VW_MasterTableLinking] a inner join dbo.mst_District b
	on a.CodeId=b.Id where TableName = 'mst_District' group by a.CodeId, b.Name, a.Id, a.Name, a.TableName, a.Predefined, a.ModuleId
	union
	Select a.CodeId, b.Name[CodeName], a.Id, a.Name, a.TableName, a.Predefined, a.ModuleId from [VW_MasterTableLinking] a inner join dbo.mst_Symptom b
	on a.CodeId=b.Id where TableName = 'mst_Symptom' group by a.CodeId, b.Name, a.Id, a.Name, a.TableName, a.Predefined, a.ModuleId
	union
	Select a.CodeId, b.Name[CodeName], a.Id, a.Name, a.TableName, a.Predefined, a.ModuleId from [VW_MasterTableLinking] a inner join dbo.mst_TBStatus b
	on a.CodeId=b.Id where TableName = 'mst_TBStatus' group by a.CodeId, b.Name, a.Id, a.Name, a.TableName, a.Predefined, a.ModuleId

GO
/****** Object:  View [dbo].[RegimenMapView]    Script Date: 6/6/2018 12:35:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[RegimenMapView]
AS
SELECT ROW_NUMBER() OVER(PARTITION BY R.Ptn_Pk ORDER BY V.VisitDate ASC) as RowNumber,p.Id as patientId,p.ptn_pk,R.Visit_Pk,R.RegimenMap_Pk,ISNULL(R.RegimenType,'NA') as RegimenType,R.UserID,V.VisitDate,(SELECT DATEDIFF(YEAR,p.DOB,GETDATE()) FROM mst_Patient p WHERE p.Ptn_Pk=R.Ptn_Pk) age,R.DeleteFlag

FROM  dtl_RegimenMap R INNER JOIN 
patient p
ON
p.ptn_pk=R.Ptn_Pk
inner join ord_Visit V 
on V.Visit_Id = R.Visit_Pk

WHERE R.RegimenType<>''

GO
/****** Object:  View [dbo].[PatientTreatmentTrackerView]    Script Date: 6/6/2018 12:35:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[PatientTreatmentTrackerView]
AS
SELECT a.Id, a.PatientId, p.ptn_pk, a.ServiceAreaId, a.PatientMasterVisitId, a.RegimenStartDate, a.RegimenId,
(SELECT  Name + '(' + DisplayName + ')' AS Expr1
                               FROM            dbo.LookupItem
                               WHERE        (Id = a.RegimenId)) AS Regimen, a.RegimenLineId,
                             (SELECT        Name
                               FROM            dbo.LookupItem AS LookupItem_3
                               WHERE        (Id = a.RegimenLineId)) AS RegimenLine, a.DrugId, a.RegimenStatusDate, a.TreatmentStatusId,
                             (SELECT        Name
                               FROM            dbo.LookupItem AS LookupItem_2
                               WHERE        (Id = a.TreatmentStatusId)) AS TreatmentStatus, a.ParentId, a.CreateBy AS CreatedBy, a.CreateDate, a.DeleteFlag, a.TreatmentStatusReasonId,
                             (SELECT        Name
                               FROM            dbo.LookupItem AS LookupItem_1
                               WHERE        (Id = a.TreatmentStatusReasonId)) AS TreatmentReason, dbo.ord_PatientPharmacyOrder.DispensedByDate,
                             (SELECT        TOP 1 isnull(M.visitDate, M.Start)
                               FROM            PATIENTMASTERVISIT M
                               WHERE        M.PatientId = a.PatientId) AS VisitDate
FROM            dbo.ARVTreatmentTracker AS a INNER JOIN
                         dbo.Patient AS p ON p.Id = a.PatientId INNER JOIN
                         dbo.ord_PatientPharmacyOrder ON a.PatientMasterVisitId = dbo.ord_PatientPharmacyOrder.PatientMasterVisitId
UNION ALL
SELECT        R.RegimenMap_Pk, R.patientId, R.ptn_pk, 0 AS ServiceAreaId, 0 AS PatientmasterVisitId,
(SELECT TOP 1 p.DispensedByDate  FROM  ord_PatientPharmacyOrder p WHERE p.VisitID = R.Visit_Pk) AS RegimenStartDate, 

ISNULL((SELECT TOP 1 id FROM LookupItem WHERE Name IN 
--(CASE R.RegimenType 
(CASE (isnull(ascii(SUBSTRING(R.regimentype, 1, 1)),0) +
	   isnull(ascii(SUBSTRING(R.regimentype, 2, 1)),0) +
	   isnull(ascii(SUBSTRING(R.regimentype, 3, 1)),0) +
	   isnull(ascii(SUBSTRING(R.regimentype, 4, 1)),0) +
	   isnull(ascii(SUBSTRING(R.regimentype, 5, 1)),0) +
	   isnull(ascii(SUBSTRING(R.regimentype, 6, 1)),0) +
	   isnull(ascii(SUBSTRING(R.regimentype, 7, 1)),0) +
	   isnull(ascii(SUBSTRING(R.regimentype, 8, 1)),0) +
	   isnull(ascii(SUBSTRING(R.regimentype, 9, 1)),0) +
	   isnull(ascii(SUBSTRING(R.regimentype, 10, 1)),0) +
	   isnull(ascii(SUBSTRING(R.regimentype, 11, 1)),0) +
	   isnull(ascii(SUBSTRING(R.regimentype, 12, 1)),0) +
	   isnull(ascii(SUBSTRING(R.regimentype, 13, 1)),0))
WHEN 779 /*'3TC/AZT/NVP'*/ THEN CASE WHEN R.age >= 15 THEN 'AF1A' ELSE 'CF1A' END /*'AZT + 3TC + NVP'*/ 
WHEN 760 /*'3TC/AZT/EFV'*/ THEN CASE WHEN R.age >= 15 THEN 'AF1B' ELSE 'CF1B' END /*'AZT + 3TC + EFV '*/
WHEN 758/*'3TC/AZT/DTG'*/ THEN CASE WHEN R.age >= 15 THEN 'AF1D' END /*'AZT + 3TC + DTG '*/
WHEN 762 /*'3TC/NVP/TDF'*/ THEN CASE WHEN R.age >= 15 THEN 'AF2A' ELSE 'CF4A' END /*TDF + 3TC + NVP*/
WHEN 743 /*'3TC/EFV/TDF'*/ THEN CASE WHEN R.age >= 15 THEN 'AF2B' ELSE 'CF4B' END /*'TDF + 3TC + EFV'*/ 
  --WHEN 914 /*'3TC/ATV/r/TDF'*/ THEN CASE WHEN R.age >= 15 THEN 'AF2D' ELSE 'CF4D' END /*'TDF + 3TC + ATV/r'*/
  --WHEN 753 /*'3TC/ATV/TDF'*/ THEN CASE WHEN R.age >= 15 THEN 'AF2D' ELSE 'CF4D' END /*'TDF + 3TC + ATV/r'*/
  WHEN 741 /*'3TC/DTG/TDF'*/ THEN CASE WHEN R.age >= 15 THEN 'AF2E' END /*'TDF + 3TC + DTG'*/
  WHEN 867 /*'3TC/LOPr/TDF'*/ THEN CASE WHEN R.age >= 15 THEN 'AF2F' ELSE 'CF4C' END /*'TDF + 3TC + LPV/r'*/ 
  WHEN 921 /*'3TC/LPV/r/TDF'*/ THEN CASE WHEN R.age >= 15 THEN 'AF2F' ELSE 'CF4C' END /*'TDF + 3TC + LPV/r'*/
  --WHEN 741 /*'3TC/RAL/TDF'*/ THEN CASE WHEN R.age >= 15 THEN 'AF2G' END /*'TDF + 3TC + RAL'*/
WHEN 933 /*'FTC/ATV/r/TDF'*/ THEN CASE WHEN R.age >= 15 THEN 'AF2H' END /*'TDF + FTC + ATV/r'*/
WHEN 738 /*'3TC/ABC/NVP'*/ THEN CASE WHEN R.age >= 15 THEN 'AF4A' ELSE 'CF2A' END /*'ABC + 3TC + NVP'*/
WHEN 719 /*'3TC/ABC/EFV'*/ THEN CASE WHEN R.age >= 15 THEN 'AF4B' ELSE 'CF2B' END /*'ABC + 3TC + EFV'*/
  WHEN 717 /*'3TC/ABC/DTG'*/ THEN CASE WHEN R.age >= 15 THEN 'AF4C' END /*'ABC + 3TC + DTG'*/
WHEN 938 /*'3TC/AZT/LPV/r'*/ THEN CASE WHEN R.age >= 15 THEN 'AS1A' ELSE 'CS1A' END /*'AZT + 3TC + LPV/r'*/ 
WHEN 884 /*'3TC/AZT/LOPr'*/ THEN CASE WHEN R.age >= 15 THEN 'AS1A' ELSE 'CS1A' END /*'AZT + 3TC + LPV/r'*/ 
WHEN 770 /*'3TC/AZT/ATV'*/ THEN CASE WHEN R.age >= 15 THEN 'AS1B' ELSE 'CS1B' END /*'AZT + 3TC + ATV/r'*/ 
WHEN 931 /*'3TC/AZT/ATV/r'*/ THEN CASE WHEN R.age >= 15 THEN 'AS1B' ELSE 'CS1B' END /*'AZT + 3TC + ATV/r'*/
  WHEN 921 /*'3TC/TDF/LPV/r'*/ THEN CASE WHEN R.age >= 15 THEN 'AS2A' END /*'TDF + 3TC + LPV/r'*/
  WHEN 867 /*'3TC/TDF/LOPr'*/ THEN CASE WHEN R.age >= 15 THEN 'AS2A' END /*'TDF + 3TC + LPV/r'*/
  WHEN 753 /*'3TC/TDF/ATV'*/ THEN CASE WHEN R.age >= 15 THEN 'AS2C' END /*'TDF + 3TC + ATV/r'*/ 
  WHEN 914 /*'3TC/TDF/ATV/r'*/ THEN CASE WHEN R.age >= 15 THEN 'AS2C' END /*'TDF + 3TC + ATV/r'*/
WHEN 843 /*'3TC/ABC/LOPr'*/ THEN CASE WHEN R.age >= 15 THEN 'AS5A' ELSE 'CS2A' END /*'ABC + 3TC + LPV/r'*/ 
WHEN 897 /*'3TC/ABC/LPV/r'*/ THEN CASE WHEN R.age >= 15 THEN 'AS5A' ELSE 'CS2A' END /*'ABC + 3TC + LPV/r'*/ 
WHEN 890 /*'3TC/ABC/ATV/r'*/ THEN CASE WHEN R.age >= 15 THEN 'AS5B' ELSE 'CS2C' END /*'ABC + 3TC + ATV/r'*/
WHEN 729 /*'3TC/ABC/ATV'*/ THEN CASE WHEN R.age >= 15 THEN 'AS5B' ELSE 'CS2C' END /*'ABC + 3TC + ATV/r'*/

  --WHEN 758 /*'3TC/AZT/RAL'*/ THEN CASE WHEN R.age < 15 THEN 'CF1E' END /*'AZT + 3TC + RAL'*/
  --WHEN 717 /*'3TC/ABC/RAL'*/ THEN CASE WHEN R.age < 15 THEN 'CF2F' END /*'ABC + 3TC + RAL'*/
END)), 0) AS RegimenId, 

ISNULL(
--(CASE R.RegimenType 
(CASE (isnull(ascii(SUBSTRING(R.regimentype, 1, 1)),0) +
	   isnull(ascii(SUBSTRING(R.regimentype, 2, 1)),0) +
	   isnull(ascii(SUBSTRING(R.regimentype, 3, 1)),0) +
	   isnull(ascii(SUBSTRING(R.regimentype, 4, 1)),0) +
	   isnull(ascii(SUBSTRING(R.regimentype, 5, 1)),0) +
	   isnull(ascii(SUBSTRING(R.regimentype, 6, 1)),0) +
	   isnull(ascii(SUBSTRING(R.regimentype, 7, 1)),0) +
	   isnull(ascii(SUBSTRING(R.regimentype, 8, 1)),0) +
	   isnull(ascii(SUBSTRING(R.regimentype, 9, 1)),0) +
	   isnull(ascii(SUBSTRING(R.regimentype, 10, 1)),0) +
	   isnull(ascii(SUBSTRING(R.regimentype, 11, 1)),0) +
	   isnull(ascii(SUBSTRING(R.regimentype, 12, 1)),0) +
	   isnull(ascii(SUBSTRING(R.regimentype, 13, 1)),0))
WHEN 779/*'3TC/AZT/NVP'*/ THEN CASE WHEN R.age >= 15 THEN (SELECT TOP 1 Name FROM lookupitem WHERE Name = 'AF1A') ELSE(SELECT TOP 1 Name FROM lookupitem WHERE Name = 'CF1A') END + '(AZT + 3TC + NVP)' 
WHEN 760/*'3TC/AZT/EFV'*/ THEN CASE WHEN R.age >= 15 THEN (SELECT TOP 1 Name FROM lookupitem WHERE Name = 'AF1B') ELSE(SELECT TOP 1 Name FROM lookupitem WHERE Name = 'CF1B') END + '(AZT + 3TC + EFV)'
WHEN 758/*'3TC/AZT/DTG'*/ THEN CASE WHEN R.age >= 15 THEN (SELECT TOP 1 Name FROM lookupitem WHERE Name = 'AF1D') END + '(AZT + 3TC + DTG)'
WHEN 762/*'3TC/NVP/TDF'*/ THEN CASE WHEN R.age >= 15 THEN (SELECT TOP 1 Name FROM lookupitem WHERE Name = 'AF2A') ELSE(SELECT TOP 1 Name FROM lookupitem WHERE Name = 'CF4A') END + '(TDF + 3TC + NVP)' 
WHEN 743/*'3TC/EFV/TDF'*/ THEN CASE WHEN R.age >= 15 THEN (SELECT TOP 1 Name FROM lookupitem WHERE Name = 'AF2B') ELSE(SELECT TOP 1 Name FROM lookupitem WHERE Name = 'CF4B') END + '(TDF + 3TC + EFV)'
WHEN 741/*'3TC/DTG/TDF'*/ THEN CASE WHEN R.age >= 15 THEN (SELECT TOP 1 Name FROM lookupitem WHERE Name = 'AF2E') END + '(TDF + 3TC + DTG)'
WHEN 867/*'3TC/LOPr/TDF'*/ THEN CASE WHEN R.age >= 15 THEN (SELECT TOP 1 Name FROM lookupitem WHERE Name = 'AF2F') ELSE(SELECT TOP 1 Name FROM lookupitem WHERE Name = 'CF4C') END + '(TDF + 3TC + LPV/r)' 
WHEN 921/*'3TC/LPV/r/TDF'*/ THEN CASE WHEN R.age >= 15 THEN (SELECT TOP 1 Name FROM lookupitem WHERE Name = 'AF2F') ELSE(SELECT TOP 1 Name FROM lookupitem WHERE Name = 'CF4C') END + '(TDF + 3TC + LPV/r)'
WHEN 933/*'FTC/ATV/r/TDF'*/ THEN CASE WHEN R.age >= 15 THEN (SELECT TOP 1 Name FROM lookupitem WHERE Name = 'AF2H') END + '(TDF + FTC + ATV/r)'
WHEN 738/*'3TC/ABC/NVP'*/ THEN CASE WHEN R.age >= 15 THEN (SELECT TOP 1 Name FROM lookupitem WHERE Name = 'AF4A') ELSE(SELECT TOP 1 Name FROM lookupitem WHERE Name = 'CF2A') END + '(ABC + 3TC + NVP)'
WHEN 719/*'3TC/ABC/EFV'*/ THEN CASE WHEN R.age >= 15 THEN (SELECT TOP 1 Name FROM lookupitem WHERE Name = 'AF4B') ELSE(SELECT TOP 1 Name FROM lookupitem WHERE Name = 'CF2B') END + '(ABC + 3TC + EFV)'
WHEN 717/*'3TC/ABC/DTG'*/ THEN CASE WHEN R.age >= 15 THEN (SELECT TOP 1 Name FROM lookupitem WHERE Name = 'AF4C') END + '(ABC + 3TC + DTG)'
WHEN 938/*'3TC/AZT/LPV/r'*/ THEN CASE WHEN R.age >= 15 THEN (SELECT TOP 1 Name FROM lookupitem WHERE Name = 'AS1A') ELSE(SELECT TOP 1 Name FROM lookupitem WHERE Name = 'CS1A') END + '(AZT + 3TC + LPV/r)'
WHEN 884/*'3TC/AZT/LOPr'*/ THEN CASE WHEN R.age >= 15 THEN (SELECT TOP 1 Name FROM lookupitem WHERE Name = 'AS1A') ELSE(SELECT TOP 1 Name FROM lookupitem WHERE Name = 'CS1A') END + '(AZT + 3TC + LPV/r)' 
WHEN 770/*'3TC/AZT/ATV'*/ THEN CASE WHEN R.age >= 15 THEN (SELECT TOP 1 Name FROM lookupitem WHERE Name = 'AS1B') ELSE(SELECT TOP 1 Name FROM lookupitem WHERE Name = 'CS1B') END + '(AZT + 3TC + ATV/r)'
WHEN 931/*'3TC/AZT/ATV/r'*/ THEN CASE WHEN R.age >= 15 THEN (SELECT TOP 1 Name FROM lookupitem WHERE Name = 'AS1B') ELSE(SELECT TOP 1 Name FROM lookupitem WHERE Name = 'CS1B') END + '(AZT + 3TC + ATV/r)'
WHEN 921/*'3TC/TDF/LPV/r'*/ THEN CASE WHEN R.age >= 15 THEN (SELECT TOP 1 Name FROM lookupitem WHERE Name = 'AS2A') END + '(TDF + 3TC + LPV/r)'
WHEN 867/*'3TC/TDF/LOPr'*/ THEN CASE WHEN R.age >= 15 THEN (SELECT TOP 1 Name FROM lookupitem WHERE Name = 'AS2A') END + '(TDF + 3TC + LPV/r)'
WHEN 753/*'3TC/TDF/ATV'*/ THEN CASE WHEN R.age >= 15 THEN (SELECT TOP 1 Name FROM lookupitem WHERE Name = 'AS2C') END + '(TDF + 3TC + ATV/r)'
WHEN 914/*'3TC/TDF/ATV/r'*/ THEN CASE WHEN R.age >= 15 THEN (SELECT TOP 1 Name FROM lookupitem WHERE Name = 'AS2C') END + '(TDF + 3TC + ATV/r)'
WHEN 843/*'3TC/ABC/LOPr'*/ THEN CASE WHEN R.age >= 15 THEN (SELECT TOP 1 Name FROM lookupitem WHERE Name = 'AS5A') ELSE(SELECT TOP 1 Name FROM lookupitem WHERE Name = 'CS2A') END + '(ABC + 3TC + LPV/r)' 
WHEN 897/*'3TC/ABC/LPV/r'*/ THEN CASE WHEN R.age >= 15 THEN (SELECT TOP 1 Name FROM lookupitem WHERE Name = 'AS5A') ELSE(SELECT TOP 1 Name FROM lookupitem WHERE Name = 'CS2A') END + '(ABC + 3TC + LPV/r)' 
WHEN 890/*'3TC/ABC/ATV/r'*/ THEN CASE WHEN R.age >= 15 THEN (SELECT TOP 1 Name FROM lookupitem WHERE Name = 'AS5B') ELSE(SELECT TOP 1 Name FROM lookupitem WHERE Name = 'CS2C') END + '(ABC + 3TC + ATV/r)' 
WHEN 729/*'3TC/ABC/ATV'*/ THEN CASE WHEN R.age >= 15 THEN (SELECT TOP 1 Name FROM lookupitem WHERE Name = 'AS5B') ELSE(SELECT TOP 1 Name FROM lookupitem WHERE Name = 'CS2C') END + '(ABC + 3TC + ATV/r)'
 

END), 
(SELECT TOP 1 Name FROM lookupitem WHERE Name = 'Unknown')) AS Regimen, 

ISNULL((SELECT TOP 1 id FROM LookupItem WHERE Name IN (SELECT CASE MasterName 
WHEN 'AdultFirstLineRegimen' THEN 'AdultARTFirstLine' WHEN 'AdultSecondlineRegimen' THEN 'AdultARTSecondLine' WHEN 'AdultThirdlineRegimen' THEN 'AdultARTThirdLine' WHEN 'PaedsFirstLineRegimen' THEN 'PaedsARTFirstLine' WHEN 'PaedsSecondlineRegimen' THEN 'PaedsARTSecondLine' WHEN 'PaedsThirdlineRegimen' THEN 'PaedsARTThirdLine' END
FROM LookupItemView
WHERE ItemName IN 
--(CASE R.RegimenType 
(CASE (isnull(ascii(SUBSTRING(R.regimentype, 1, 1)),0) +
	   isnull(ascii(SUBSTRING(R.regimentype, 2, 1)),0) +
	   isnull(ascii(SUBSTRING(R.regimentype, 3, 1)),0) +
	   isnull(ascii(SUBSTRING(R.regimentype, 4, 1)),0) +
	   isnull(ascii(SUBSTRING(R.regimentype, 5, 1)),0) +
	   isnull(ascii(SUBSTRING(R.regimentype, 6, 1)),0) +
	   isnull(ascii(SUBSTRING(R.regimentype, 7, 1)),0) +
	   isnull(ascii(SUBSTRING(R.regimentype, 8, 1)),0) +
	   isnull(ascii(SUBSTRING(R.regimentype, 9, 1)),0) +
	   isnull(ascii(SUBSTRING(R.regimentype, 10, 1)),0) +
	   isnull(ascii(SUBSTRING(R.regimentype, 11, 1)),0) +
	   isnull(ascii(SUBSTRING(R.regimentype, 12, 1)),0) +
	   isnull(ascii(SUBSTRING(R.regimentype, 13, 1)),0)) 
WHEN 779 /*'3TC/AZT/NVP'*/ THEN CASE WHEN R.age >= 15 THEN 'AF1A' ELSE 'CF1A' END /*'AZT + 3TC + NVP'*/ 
WHEN 760 /*'3TC/AZT/EFV'*/ THEN CASE WHEN R.age >= 15 THEN 'AF1B' ELSE 'CF1B' END /*'AZT + 3TC + EFV '*/
WHEN 758/*'3TC/AZT/DTG'*/ THEN CASE WHEN R.age >= 15 THEN 'AF1D' END /*'AZT + 3TC + DTG '*/
WHEN 762 /*'3TC/NVP/TDF'*/ THEN CASE WHEN R.age >= 15 THEN 'AF2A' ELSE 'CF4A' END /*TDF + 3TC + NVP*/
WHEN 743 /*'3TC/EFV/TDF'*/ THEN CASE WHEN R.age >= 15 THEN 'AF2B' ELSE 'CF4B' END /*'TDF + 3TC + EFV'*/ 
  --WHEN 914 /*'3TC/ATV/r/TDF'*/ THEN CASE WHEN R.age >= 15 THEN 'AF2D' ELSE 'CF4D' END /*'TDF + 3TC + ATV/r'*/
  --WHEN 753 /*'3TC/ATV/TDF'*/ THEN CASE WHEN R.age >= 15 THEN 'AF2D' ELSE 'CF4D' END /*'TDF + 3TC + ATV/r'*/
  WHEN 741 /*'3TC/DTG/TDF'*/ THEN CASE WHEN R.age >= 15 THEN 'AF2E' END /*'TDF + 3TC + DTG'*/
  WHEN 867 /*'3TC/LOPr/TDF'*/ THEN CASE WHEN R.age >= 15 THEN 'AF2F' ELSE 'CF4C' END /*'TDF + 3TC + LPV/r'*/ 
  WHEN 921 /*'3TC/LPV/r/TDF'*/ THEN CASE WHEN R.age >= 15 THEN 'AF2F' ELSE 'CF4C' END /*'TDF + 3TC + LPV/r'*/
  --WHEN 741 /*'3TC/RAL/TDF'*/ THEN CASE WHEN R.age >= 15 THEN 'AF2G' END /*'TDF + 3TC + RAL'*/
WHEN 933 /*'FTC/ATV/r/TDF'*/ THEN CASE WHEN R.age >= 15 THEN 'AF2H' END /*'TDF + FTC + ATV/r'*/
WHEN 738 /*'3TC/ABC/NVP'*/ THEN CASE WHEN R.age >= 15 THEN 'AF4A' ELSE 'CF2A' END /*'ABC + 3TC + NVP'*/
WHEN 719 /*'3TC/ABC/EFV'*/ THEN CASE WHEN R.age >= 15 THEN 'AF4B' ELSE 'CF2B' END /*'ABC + 3TC + EFV'*/
  WHEN 717 /*'3TC/ABC/DTG'*/ THEN CASE WHEN R.age >= 15 THEN 'AF4C' END /*'ABC + 3TC + DTG'*/
WHEN 938 /*'3TC/AZT/LPV/r'*/ THEN CASE WHEN R.age >= 15 THEN 'AS1A' ELSE 'CS1A' END /*'AZT + 3TC + LPV/r'*/ 
WHEN 884 /*'3TC/AZT/LOPr'*/ THEN CASE WHEN R.age >= 15 THEN 'AS1A' ELSE 'CS1A' END /*'AZT + 3TC + LPV/r'*/ 
WHEN 770 /*'3TC/AZT/ATV'*/ THEN CASE WHEN R.age >= 15 THEN 'AS1B' ELSE 'CS1B' END /*'AZT + 3TC + ATV/r'*/ 
WHEN 931 /*'3TC/AZT/ATV/r'*/ THEN CASE WHEN R.age >= 15 THEN 'AS1B' ELSE 'CS1B' END /*'AZT + 3TC + ATV/r'*/
  WHEN 921 /*'3TC/TDF/LPV/r'*/ THEN CASE WHEN R.age >= 15 THEN 'AS2A' END /*'TDF + 3TC + LPV/r'*/
  WHEN 867 /*'3TC/TDF/LOPr'*/ THEN CASE WHEN R.age >= 15 THEN 'AS2A' END /*'TDF + 3TC + LPV/r'*/
  WHEN 753 /*'3TC/TDF/ATV'*/ THEN CASE WHEN R.age >= 15 THEN 'AS2C' END /*'TDF + 3TC + ATV/r'*/ 
  WHEN 914 /*'3TC/TDF/ATV/r'*/ THEN CASE WHEN R.age >= 15 THEN 'AS2C' END /*'TDF + 3TC + ATV/r'*/
WHEN 843 /*'3TC/ABC/LOPr'*/ THEN CASE WHEN R.age >= 15 THEN 'AS5A' ELSE 'CS2A' END /*'ABC + 3TC + LPV/r'*/ 
WHEN 897 /*'3TC/ABC/LPV/r'*/ THEN CASE WHEN R.age >= 15 THEN 'AS5A' ELSE 'CS2A' END /*'ABC + 3TC + LPV/r'*/ 
WHEN 890 /*'3TC/ABC/ATV/r'*/ THEN CASE WHEN R.age >= 15 THEN 'AS5B' ELSE 'CS2C' END /*'ABC + 3TC + ATV/r'*/
WHEN 729 /*'3TC/ABC/ATV'*/ THEN CASE WHEN R.age >= 15 THEN 'AS5B' ELSE 'CS2C' END /*'ABC + 3TC + ATV/r'*/ 

END))),
(SELECT TOP 1 Id FROM lookupitem WHERE Name = 'Unknown')) AS RegimenLineId, 

ISNULL((SELECT  TOP 1 Name FROM LookupItem WHERE Name IN (SELECT CASE MasterName WHEN 'AdultFirstLineRegimen' THEN 'AdultARTFirstLine' WHEN 'AdultSecondlineRegimen' THEN 'AdultARTSecondLine' WHEN 'AdultThirdlineRegimen' THEN 'AdultARTThirdLine' WHEN 'PaedsFirstLineRegimen' THEN 'PaedsARTFirstLine' WHEN 'PaedsSecondlineRegimen' THEN 'PaedsARTSecondLine' WHEN 'PaedsThirdlineRegimen' THEN 'PaedsARTThirdLine' END FROM LookupItemView WHERE ItemName IN 
(CASE (isnull(ascii(SUBSTRING(R.regimentype, 1, 1)),0) +
	   isnull(ascii(SUBSTRING(R.regimentype, 2, 1)),0) +
	   isnull(ascii(SUBSTRING(R.regimentype, 3, 1)),0) +
	   isnull(ascii(SUBSTRING(R.regimentype, 4, 1)),0) +
	   isnull(ascii(SUBSTRING(R.regimentype, 5, 1)),0) +
	   isnull(ascii(SUBSTRING(R.regimentype, 6, 1)),0) +
	   isnull(ascii(SUBSTRING(R.regimentype, 7, 1)),0) +
	   isnull(ascii(SUBSTRING(R.regimentype, 8, 1)),0) +
	   isnull(ascii(SUBSTRING(R.regimentype, 9, 1)),0) +
	   isnull(ascii(SUBSTRING(R.regimentype, 10, 1)),0) +
	   isnull(ascii(SUBSTRING(R.regimentype, 11, 1)),0) +
	   isnull(ascii(SUBSTRING(R.regimentype, 12, 1)),0) +
	   isnull(ascii(SUBSTRING(R.regimentype, 13, 1)),0)) 
WHEN 779 /*'3TC/AZT/NVP'*/ THEN CASE WHEN R.age >= 15 THEN 'AF1A' ELSE 'CF1A' END /*'AZT + 3TC + NVP'*/ 
WHEN 760 /*'3TC/AZT/EFV'*/ THEN CASE WHEN R.age >= 15 THEN 'AF1B' ELSE 'CF1B' END /*'AZT + 3TC + EFV '*/
WHEN 758/*'3TC/AZT/DTG'*/ THEN CASE WHEN R.age >= 15 THEN 'AF1D' END /*'AZT + 3TC + DTG '*/
WHEN 762 /*'3TC/NVP/TDF'*/ THEN CASE WHEN R.age >= 15 THEN 'AF2A' ELSE 'CF4A' END /*TDF + 3TC + NVP*/
WHEN 743 /*'3TC/EFV/TDF'*/ THEN CASE WHEN R.age >= 15 THEN 'AF2B' ELSE 'CF4B' END /*'TDF + 3TC + EFV'*/ 
  --WHEN 914 /*'3TC/ATV/r/TDF'*/ THEN CASE WHEN R.age >= 15 THEN 'AF2D' ELSE 'CF4D' END /*'TDF + 3TC + ATV/r'*/
  --WHEN 753 /*'3TC/ATV/TDF'*/ THEN CASE WHEN R.age >= 15 THEN 'AF2D' ELSE 'CF4D' END /*'TDF + 3TC + ATV/r'*/
  WHEN 741 /*'3TC/DTG/TDF'*/ THEN CASE WHEN R.age >= 15 THEN 'AF2E' END /*'TDF + 3TC + DTG'*/
  WHEN 867 /*'3TC/LOPr/TDF'*/ THEN CASE WHEN R.age >= 15 THEN 'AF2F' ELSE 'CF4C' END /*'TDF + 3TC + LPV/r'*/ 
  WHEN 921 /*'3TC/LPV/r/TDF'*/ THEN CASE WHEN R.age >= 15 THEN 'AF2F' ELSE 'CF4C' END /*'TDF + 3TC + LPV/r'*/
  --WHEN 741 /*'3TC/RAL/TDF'*/ THEN CASE WHEN R.age >= 15 THEN 'AF2G' END /*'TDF + 3TC + RAL'*/
WHEN 933 /*'FTC/ATV/r/TDF'*/ THEN CASE WHEN R.age >= 15 THEN 'AF2H' END /*'TDF + FTC + ATV/r'*/
WHEN 738 /*'3TC/ABC/NVP'*/ THEN CASE WHEN R.age >= 15 THEN 'AF4A' ELSE 'CF2A' END /*'ABC + 3TC + NVP'*/
WHEN 719 /*'3TC/ABC/EFV'*/ THEN CASE WHEN R.age >= 15 THEN 'AF4B' ELSE 'CF2B' END /*'ABC + 3TC + EFV'*/
  WHEN 717 /*'3TC/ABC/DTG'*/ THEN CASE WHEN R.age >= 15 THEN 'AF4C' END /*'ABC + 3TC + DTG'*/
WHEN 938 /*'3TC/AZT/LPV/r'*/ THEN CASE WHEN R.age >= 15 THEN 'AS1A' ELSE 'CS1A' END /*'AZT + 3TC + LPV/r'*/ 
WHEN 884 /*'3TC/AZT/LOPr'*/ THEN CASE WHEN R.age >= 15 THEN 'AS1A' ELSE 'CS1A' END /*'AZT + 3TC + LPV/r'*/ 
WHEN 770 /*'3TC/AZT/ATV'*/ THEN CASE WHEN R.age >= 15 THEN 'AS1B' ELSE 'CS1B' END /*'AZT + 3TC + ATV/r'*/ 
WHEN 931 /*'3TC/AZT/ATV/r'*/ THEN CASE WHEN R.age >= 15 THEN 'AS1B' ELSE 'CS1B' END /*'AZT + 3TC + ATV/r'*/
  WHEN 921 /*'3TC/TDF/LPV/r'*/ THEN CASE WHEN R.age >= 15 THEN 'AS2A' END /*'TDF + 3TC + LPV/r'*/
  WHEN 867 /*'3TC/TDF/LOPr'*/ THEN CASE WHEN R.age >= 15 THEN 'AS2A' END /*'TDF + 3TC + LPV/r'*/
  WHEN 753 /*'3TC/TDF/ATV'*/ THEN CASE WHEN R.age >= 15 THEN 'AS2C' END /*'TDF + 3TC + ATV/r'*/ 
  WHEN 914 /*'3TC/TDF/ATV/r'*/ THEN CASE WHEN R.age >= 15 THEN 'AS2C' END /*'TDF + 3TC + ATV/r'*/
WHEN 843 /*'3TC/ABC/LOPr'*/ THEN CASE WHEN R.age >= 15 THEN 'AS5A' ELSE 'CS2A' END /*'ABC + 3TC + LPV/r'*/ 
WHEN 897 /*'3TC/ABC/LPV/r'*/ THEN CASE WHEN R.age >= 15 THEN 'AS5A' ELSE 'CS2A' END /*'ABC + 3TC + LPV/r'*/ 
WHEN 890 /*'3TC/ABC/ATV/r'*/ THEN CASE WHEN R.age >= 15 THEN 'AS5B' ELSE 'CS2C' END /*'ABC + 3TC + ATV/r'*/
WHEN 729 /*'3TC/ABC/ATV'*/ THEN CASE WHEN R.age >= 15 THEN 'AS5B' ELSE 'CS2C' END /*'ABC + 3TC + ATV/r'*/ 
END))),
(SELECT TOP 1 Name FROM lookupitem WHERE Name = 'Unknown')) AS RegimenLine, 
NULL AS DrugId, NULL AS RegimenStatusDate, (CASE R.RowNumber WHEN 1 THEN
                             (SELECT        TOP 1 ItemId
                               FROM            LookupItemView
                               WHERE        ItemName = 'Start Treatment') ELSE
                             (SELECT        TOP 1 ItemId
                               FROM            LookupItemView
                               WHERE        ItemName = 'Continue current treatment') END) AS TreatmentStatusId, 
                         (CASE R.RowNumber WHEN 1 THEN 'Start Treatment' ELSE 'Continue Current Treatment' END) AS TreatmentStatus, 0 AS ParentId, R.UserID, R.VisitDate, 
                         R.DeleteFlag, 0 AS TreatmentStatusReasonid, NULL AS TreatmentReason,
                             (SELECT        TOP 1 p.DispensedByDate
                               FROM            ord_PatientPharmacyOrder p
                               WHERE        p.VisitID = R.Visit_Pk) AS DispensedByDate,
                             (SELECT        TOP 1 D .visitDate
                               FROM            ord_Visit D
                               WHERE        D .ptn_pk = R.ptn_pk)
FROM            RegimenMapView R INNER JOIN
                         ord_PatientPharmacyOrder o ON o.VisitID = R.Visit_Pk
WHERE        R.RegimenType <> '' AND R.RegimenType IS NOT NULL AND o.DispensedByDate IS NOT NULL

GO
/****** Object:  View [dbo].[VW_Drug]    Script Date: 6/6/2018 12:35:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VW_Drug]
AS
SELECT     dbo.mst_Drug.Drug_pk, dbo.mst_Drug.DrugName, dbo.fn_GetDrugTypeId_futures(dbo.mst_Drug.Drug_pk) AS DrugTypeId, 
                      dbo.fn_GetDrugTypeName_futures(dbo.mst_Drug.Drug_pk) AS DrugTypeName, dbo.fn_GetFixedDoseDrugAbbrevation(dbo.mst_Drug.Drug_pk) 
                      AS [Generic Abbrevation], dbo.mst_Drug.DrugID AS [Item Code], dbo.mst_Drug.FDACode AS [FDA Code], Mst_DispensingUnit_1.Name AS [Dispensing Unit], 
                      Mst_DispensingUnit_1.Id AS [Dispensing Unit Id], dbo.mst_Drug.MaxStock, dbo.mst_Drug.MinStock, dbo.Mst_DispensingUnit.Id AS PurchaseUnitId, 
                      dbo.Mst_DispensingUnit.Name AS [Purchase Unit], dbo.mst_Drug.QtyPerPurchaseUnit AS [Purchase Unit Qty], 
                      dbo.mst_Drug.PurchaseUnitPrice AS [Purchase Unit Price], dbo.Mst_Manufacturer.Id AS ManufacturerId, dbo.Mst_Manufacturer.Name AS [Manufacturer Name], 
                      dbo.mst_Drug.DispensingUnitPrice AS [Dispensing Unit Cost], dbo.mst_Drug.DispensingMargin AS [Dispensing Margin], 
                      dbo.mst_Drug.SellingUnitPrice AS [Selling Price], dbo.mst_Generic.GenericID, dbo.mst_Generic.GenericName
FROM         dbo.lnk_DrugGeneric LEFT OUTER JOIN
                      dbo.mst_Generic ON dbo.lnk_DrugGeneric.GenericID = dbo.mst_Generic.GenericID RIGHT OUTER JOIN
                      dbo.mst_Drug ON dbo.lnk_DrugGeneric.Drug_pk = dbo.mst_Drug.Drug_pk LEFT OUTER JOIN
                      dbo.Mst_Manufacturer ON dbo.mst_Drug.Manufacturer = dbo.Mst_Manufacturer.Id LEFT OUTER JOIN
                      dbo.Mst_DispensingUnit ON dbo.mst_Drug.PurchaseUnit = dbo.Mst_DispensingUnit.Id LEFT OUTER JOIN
                      dbo.Mst_DispensingUnit AS Mst_DispensingUnit_1 ON dbo.mst_Drug.DispensingUnit = Mst_DispensingUnit_1.Id
WHERE     (dbo.mst_Drug.DeleteFlag = 0) OR
                      (dbo.mst_Drug.DeleteFlag IS NULL) AND (dbo.mst_Generic.DeleteFlag IS NULL) OR
                      (dbo.mst_Generic.DeleteFlag = 0)
GO
/****** Object:  View [dbo].[VW_PatientPharmacy]    Script Date: 6/6/2018 12:35:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VW_PatientPharmacy]
AS
SELECT        dbo.ord_PatientPharmacyOrder.Ptn_pk, dbo.ord_PatientPharmacyOrder.VisitID, dbo.ord_PatientPharmacyOrder.LocationID, 
                         dbo.ord_PatientPharmacyOrder.OrderedBy, dbo.ord_PatientPharmacyOrder.OrderedByDate, dbo.ord_PatientPharmacyOrder.DispensedBy, 
                         dbo.ord_PatientPharmacyOrder.DispensedByDate, dbo.ord_PatientPharmacyOrder.ProgID, dbo.ord_PatientPharmacyOrder.OrderType, 
                         dbo.ord_PatientPharmacyOrder.Height, dbo.ord_PatientPharmacyOrder.Weight, dbo.ord_PatientPharmacyOrder.ProviderID, 
                         dbo.ord_PatientPharmacyOrder.PharmacyPeriodTaken, dbo.VW_Drug.Drug_pk, dbo.VW_Drug.DrugName, dbo.dtl_RegimenMap.RegimenType, 
                         dbo.dtl_RegimenMap.RegimenId, dbo.dtl_PatientPharmacyOrder.Duration, dbo.dtl_PatientPharmacyOrder.OrderedQuantity, 
                         dbo.dtl_PatientPharmacyOrder.DispensedQuantity, dbo.dtl_PatientPharmacyOrder.Prophylaxis, dbo.ord_Visit.VisitDate, dbo.ord_Visit.VisitType, 
                         dbo.ord_PatientPharmacyOrder.ptn_pharmacy_pk, dbo.VW_Drug.DrugTypeId, dbo.VW_Drug.DrugTypeName AS DrugType, Stock.Quantity AS ActualQtyDispensed, 
                         Stock.ExpiryDate, dbo.Mst_Store.Id AS StoreId, dbo.Mst_Store.Name AS StoreName, dbo.Mst_Batch.ID AS BatchId, dbo.Mst_Batch.Name AS BatchNo, 
                         ISNULL(Bill.SellingPrice, 0) AS SellingPrice, ISNULL(Bill.CostPrice, 0) AS CostPrice, Bill.Margin, Bill.BillAmount, dbo.VW_Drug.[Item Code], dbo.VW_Drug.[FDA Code], 
                         dbo.VW_Drug.[Dispensing Unit], dbo.VW_Drug.[Dispensing Unit Id], dbo.VW_Drug.MaxStock, dbo.VW_Drug.MinStock, dbo.VW_Drug.PurchaseUnitId, 
                         dbo.VW_Drug.[Purchase Unit], dbo.dtl_PatientPharmacyOrder.FrequencyID, dbo.dtl_PatientPharmacyOrder.TreatmentPhase, 
                         dbo.dtl_PatientPharmacyOrder.WhyPartial, dbo.dtl_PatientPharmacyOrder.Month, dbo.ord_PatientPharmacyOrder.HoldMedicine, 
                         dbo.ord_PatientPharmacyOrder.RegimenLine, dbo.ord_PatientPharmacyOrder.PharmacyNotes, dbo.dtl_PatientPharmacyOrder.StrengthID, 
                         dbo.ord_PatientPharmacyOrder.CreateDate, dbo.ord_PatientPharmacyOrder.EmployeeID, dbo.ord_PatientPharmacyOrder.Signature, dbo.mst_Strength.StrengthName,
                          dbo.mst_Frequency.Name AS FrequencyName, dbo.VW_Drug.[Selling Price] AS UnitSellingPrice, dbo.VW_Drug.GenericID, dbo.VW_Drug.GenericName, 
                         dbo.dtl_PatientPharmacyOrder.SingleDose, dbo.dtl_PatientPharmacyOrder.Financed, dbo.dtl_PatientPharmacyOrder.PrintPrescriptionStatus, 
                         dbo.dtl_PatientPharmacyOrder.PatientInstructions, dbo.ord_PatientPharmacyOrder.ReportingID, dbo.dtl_PatientPharmacyOrder.pillCount, 
                         dbo.mst_Frequency.multiplier AS FreqMultiplier
FROM            dbo.dtl_RegimenMap RIGHT OUTER JOIN
                         dbo.mst_Strength RIGHT OUTER JOIN
                         dbo.mst_Frequency RIGHT OUTER JOIN
                         dbo.ord_PatientPharmacyOrder INNER JOIN
                         dbo.ord_Visit ON dbo.ord_PatientPharmacyOrder.VisitID = dbo.ord_Visit.Visit_Id INNER JOIN
                         dbo.dtl_PatientPharmacyOrder ON dbo.ord_PatientPharmacyOrder.ptn_pharmacy_pk = dbo.dtl_PatientPharmacyOrder.ptn_pharmacy_pk ON 
                         dbo.mst_Frequency.ID = dbo.dtl_PatientPharmacyOrder.FrequencyID ON dbo.mst_Strength.StrengthId = dbo.dtl_PatientPharmacyOrder.StrengthID LEFT OUTER JOIN
                         dbo.VW_Drug ON dbo.dtl_PatientPharmacyOrder.Drug_Pk = dbo.VW_Drug.Drug_pk ON 
                         dbo.dtl_RegimenMap.OrderID = dbo.ord_PatientPharmacyOrder.ptn_pharmacy_pk LEFT OUTER JOIN
                             (SELECT        Ptn_Pharmacy_Pk, ItemId, BatchId, ExpiryDate, StoreId, SUM(Quantity) AS Quantity
                               FROM            dbo.Dtl_StockTransaction
                               WHERE        (Ptn_Pharmacy_Pk IS NOT NULL)
                               GROUP BY Ptn_Pharmacy_Pk, ItemId, BatchId, ExpiryDate, StoreId) AS Stock ON dbo.dtl_PatientPharmacyOrder.ptn_pharmacy_pk = Stock.Ptn_Pharmacy_Pk AND 
                         dbo.dtl_PatientPharmacyOrder.Drug_Pk = Stock.ItemId AND dbo.dtl_PatientPharmacyOrder.BatchNo = Stock.BatchId AND 
                         dbo.dtl_PatientPharmacyOrder.ExpiryDate = Stock.ExpiryDate LEFT OUTER JOIN
                         dbo.Mst_Store ON dbo.Mst_Store.Id = Stock.StoreId LEFT OUTER JOIN
                         dbo.Mst_Batch ON dbo.Mst_Batch.ID = Stock.BatchId LEFT OUTER JOIN
                             (SELECT        PharmacyId, ItemId, BatchId, VisitId, SUM(SellingPrice) AS SellingPrice, CostPrice, Margin, SUM(BillAmount) AS BillAmount
                               FROM            dbo.Dtl_PatientBillTransaction
                               GROUP BY PharmacyId, ItemId, BatchId, VisitId, CostPrice, Margin) AS Bill ON dbo.dtl_PatientPharmacyOrder.ptn_pharmacy_pk = Bill.PharmacyId AND 
                         dbo.dtl_PatientPharmacyOrder.Drug_Pk = Bill.ItemId AND dbo.dtl_PatientPharmacyOrder.BatchNo = Bill.BatchId AND 
                         dbo.ord_PatientPharmacyOrder.VisitID = Bill.VisitId
WHERE        (dbo.ord_Visit.DeleteFlag = 0) OR
                         (dbo.ord_Visit.DeleteFlag IS NULL)

GO
/****** Object:  View [dbo].[facilityStatisticsView]    Script Date: 6/6/2018 12:35:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW 
 [dbo].[facilityStatisticsView]
AS
SELECT        (SELECT        1 AS Expr1) AS Id,
                             (SELECT        ISNULL(COUNT(PT.Id), 0) AS Expr1
                               FROM            dbo.Patient AS PT INNER JOIN
                         dbo.PatientEnrollment AS PE ON PT.Id = PE.PatientId INNER JOIN
                         dbo.PatientIdentifier AS PI ON PT.Id = PI.PatientId AND PE.Id = PI.PatientEnrollmentId INNER JOIN
                         dbo.Identifiers AS IDE ON IDE.Id = PI.IdentifierTypeId
WHERE        (PT.DeleteFlag = 0) AND (IDE.Name = 'CCC Registration Number') AND (PT.PatientType =
                             (SELECT        TOP (1) ItemId
                               FROM            dbo.LookupItemView
                               WHERE        (MasterName = 'PatientType') AND (ItemName = 'New')))) AS TotalCumulativePatients,
                             (SELECT        COUNT(DISTINCT PatientId) AS Expr1
                               FROM            dbo.PatientTreatmentTrackerView
                               WHERE        (DATEDIFF(DAY, CreateDate, GETDATE()) <= 90) AND (RegimenLine IS NOT NULL)) +
                             (SELECT        COUNT(DISTINCT Ptn_Pk) AS Expr1
                               FROM            dbo.dtl_RegimenMap AS r
                               WHERE        (Ptn_Pk NOT IN
                                                             (SELECT        ptn_pk
                                                               FROM            dbo.PatientTreatmentTrackerView AS PatientTreatmentTrackerView_1)) AND (DATEDIFF(DAY, CreateDate, GETDATE()) <= 90)) AS TotalActiveOnArt,
                             (SELECT        ISNULL(COUNT(PT.Id), 0) AS Expr1
FROM            dbo.Patient AS PT INNER JOIN
                         dbo.PatientEnrollment AS PE ON PT.Id = PE.PatientId INNER JOIN
                         dbo.PatientIdentifier AS PI ON PT.Id = PI.PatientId AND PE.Id = PI.PatientEnrollmentId INNER JOIN
                         dbo.Identifiers AS IDE ON PI.IdentifierTypeId = IDE.Id
WHERE        (PT.PatientType =
                             (SELECT        TOP (1) ItemId
                               FROM            dbo.LookupItemView
                               WHERE        (MasterName = 'PatientType') AND (ItemName = 'Transfer-In'))) AND (PT.DeleteFlag = 0) AND (IDE.Name = 'CCC Registration Number')) AS TotalTransferIn,
                             (SELECT        ISNULL(COUNT(*), 0) AS Expr1
                               FROM            dbo.PatientCareending
                               WHERE        (ExitReason IN
                                                             (SELECT        Id
                                                               FROM            dbo.LookupItem AS LookupItem_3
                                                               WHERE        (Name = 'Transfer Out')))) +
                             (SELECT        COUNT(DISTINCT Ptn_Pk) AS Expr1
                               FROM            dbo.dtl_PatientCareEnded
                               WHERE        (PatientExitReason IN (118, 349))) AS TotalPatientsTransferedOut,
                             (SELECT        ISNULL(COUNT(*), 0) AS Expr1
                               FROM            dbo.dtl_PatientPharmacyOrder
                               WHERE        (Drug_Pk IN (460, 1095, 1015968, 969, 970, 971, 972, 973, 974, 975, 976, 977, 978, 979, 1005, 1006, 1010, 1011, 1012, 1013, 1014, 1015)) AND (DispensedQuantity > 0) AND (DATEDIFF(Day, 
                                                         CreateDate, GETDATE()) <= 90)) AS TotalOnCtxDapson,
                             (SELECT        ISNULL(COUNT(*), 0) AS Expr1
                               FROM            dbo.PatientCareending AS PatientCareending_1
                               WHERE        (ExitReason IN
                                                             (SELECT        Id
                                                               FROM            dbo.LookupItem AS LookupItem_2
                                                               WHERE        (Name = 'Death')))) +
                             (SELECT        COUNT(DISTINCT Ptn_Pk) AS Expr1
                               FROM            dbo.dtl_PatientCareEnded AS dtl_PatientCareEnded_1
                               WHERE        (PatientExitReason = 93)) AS TotalPatientsDead,
                             (SELECT        ISNULL(COUNT(PT.Id), 0) AS Expr1
FROM            dbo.Patient AS PT INNER JOIN
                         dbo.PatientEnrollment AS PE ON PT.Id = PE.PatientId INNER JOIN
                         dbo.PatientIdentifier AS PI ON PT.Id = PI.PatientId AND PE.Id = PI.PatientEnrollmentId INNER JOIN
                         dbo.Identifiers AS IDE ON PI.IdentifierTypeId = IDE.Id
WHERE        (PT.PatientType =
                             (SELECT        TOP (1) ItemId
                               FROM            dbo.LookupItemView
                               WHERE        (MasterName = 'PatientType') AND (ItemName = 'Transit'))) AND (PT.DeleteFlag = 0) AND (IDE.Name = 'CCC Registration Number')) AS TotalTransit,
                             (SELECT        ISNULL(COUNT(DISTINCT Ptn_Pk), 0) AS Expr1
                               FROM            dbo.dtl_PatientCareEnded AS p
                               WHERE        (PatientExitReason = 91)) AS LostToFollowUp,
							    (SELECT COUNT(DISTINCT PatientId) FROM PatientIdentifier I WHERE I.IdentifierTypeId IN(SELECT id FROM Identifiers WHERE Code='CCCNumber') AND I.PatientId IN(SELECT TOP 1 PatientId from ord_PatientPharmacyOrder O WHERE DATEDIFF(day,O.DispensedByDate,GETDATE())>90 ORDER BY DispensedByDate DESC) AND I.PatientId NOT IN(SELECT PatientId FROM PatientCareending)) TotalUndocumentedLTFU
GO
/****** Object:  View [dbo].[TestingSummaryStatistics]    Script Date: 6/6/2018 12:35:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[TestingSummaryStatistics]
AS
SELECT        ROW_NUMBER() OVER (ORDER BY Name) AS Id, Name, Value
FROM (SELECT 'Contacts with known status' AS Name, COUNT(*) AS Value 
FROM dbo.PersonRelationship PR LEFT OUTER JOIN (
	SELECT PersonId, TestingResult, row_number() Over (Partition By PersonId Order By TestingDate Desc) RowNum FROM HIVTesting
) C on C.PersonId = PR.PersonId AND C.RowNum = 1
WHERE (PR.BaselineResult IN (SELECT ItemId FROM dbo.LookupItemView WHERE (MasterName = 'BaseLineHivStatus') AND (ItemName <> 'Unknown') AND (ItemName <> 'Never Tested'))) OR C.TestingResult <> (SELECT TOP 1 ItemId FROM dbo.LookupItemView WHERE (MasterName = 'HivTestingResult') AND (ItemName = 'Never Tested'))

UNION ALL

SELECT 'Contacts with unknown status' AS Name, COUNT(*) AS Value 
FROM dbo.PersonRelationship PR
LEFT OUTER JOIN (SELECT PersonId, TestingResult, row_number() Over (Partition By PersonId Order By TestingDate Desc) RowNum FROM dbo.HIVTesting
) C on PR.PersonId = C.PersonId AND C.RowNum = 1
WHERE (PR.BaselineResult IN (SELECT ItemId FROM dbo.LookupItemView WHERE (MasterName = 'BaseLineHivStatus') AND (ItemName = 'Unknown' OR ItemName = 'Never Tested')) AND c.PersonId IS NULL) OR C.TestingResult = (SELECT TOP 1 ItemId FROM dbo.LookupItemView WHERE (MasterName = 'HivTestingResult') AND (ItemName = 'Never Tested'))

UNION ALL

SELECT 'Total Listed' AS Name, COUNT(*) AS Value
FROM dbo.PersonRelationship

UNION ALL

SELECT 'Total Positive' AS Name, COUNT(*) AS total
FROM dbo.PersonRelationship PR LEFT OUTER JOIN (
SELECT PersonId, TestingResult, row_number() Over (Partition By PersonId Order By TestingDate Desc) RowNum FROM HIVTesting
) C ON C.PersonId = PR.PersonId AND c.RowNum = 1
WHERE (BaselineResult = (SELECT ItemId FROM dbo.LookupItemView WHERE (MasterName = 'BaseLineHivStatus') AND (ItemName = 'Tested Positive'))) OR C.TestingResult =  (SELECT TOP 1 ItemId FROM dbo.LookupItemView WHERE (MasterName = 'HivTestingResult') AND (ItemName = 'Tested Positive'))

UNION ALL 

SELECT 'Linked to Care' AS Name, COUNT(*) AS Value FROM PatientLinkage) TestingSummaryStatistics
GO
/****** Object:  View [dbo].[VW_LabTest]    Script Date: 6/6/2018 12:35:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[VW_LabTest]
AS


	Select	P.Id	ParameterId
			,P.ParameterName
			,P.ReferenceId ParameterReferenceId
			,T.Id	LabTestId
			,T.Name	LabTestName
			,T.ReferenceId TestReferenceId
			,T.IsGroup
			,T.DepartmentId
			,D.LabDepartmentName
			, T.DeleteFlag TestDeleteFlag
			,T.Active TestActive
			,P.DeleteFlag ParameterDeleteFlag
	From mst_LabTestMaster T
	Inner Join Mst_LabTestParameter P On T.Id = P.LabTestId
	Left Outer Join mst_LabDepartment D On T.DepartmentId = D.LabDepartmentID


GO
/****** Object:  View [dbo].[VW_PatientLaboratory]    Script Date: 6/6/2018 12:35:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[VW_PatientLaboratory]
AS

	Select	O.Id				LabId
		,o.Ptn_Pk
		,O.LocationId
		,O.OrderedBy		OrderedByName
		,O.OrderNumber
		,o.OrderDate		OrderedByDate
		,Ot.ResultBy		ReportedByName
		,OT.ResultDate		ReportedByDate
		,O.OrderedBy		CheckedbyName
		,o.OrderDate		CheckedbyDate
		,O.PreClinicLabDate
		,LT.ParameterName	TestName
		,LT.ParameterId		TestId
		,LT.LabTestId		[Test GroupId]
		,lt.LabTestName		[Test GroupName]
		,LT.DepartmentId	LabDepartmentId
		,LT.LabDepartmentName
		,0					LabTypeId
		,'Additional Lab'	LabTypeName
		,R.ResultValue		TestResults
		,R.ResultText		TestResults1
		,R.ResultOptionId	 TestResultId
		,R.ResultOption		[Parameter Result]
		,R.Undetectable
		,R.DetectionLimit
		,R.ResultUnit
		,R.HasResult
		,V.VisitDate
		,Null				LabPeriod
		,LT.TestReferenceId
		,LT.ParameterReferenceId		
	From dbo.ord_LabOrder O
	Inner Join dtl_LabOrderTest OT On OT.LabOrderId = O.Id
	Inner Join dtl_LabOrderTestResult R On R.LabOrderTestId = OT.Id
	Inner Join VW_LabTest LT On LT.ParameterId = R.ParameterId
	Inner Join ord_Visit V On v.Visit_Id = O.VisitId
	Where (V.DeleteFlag = 0)	Or (V.DeleteFlag IS NULL)


GO
/****** Object:  View [dbo].[ServiceAreaFormView]    Script Date: 6/6/2018 12:35:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[ServiceAreaFormView]
AS
Select Distinct	F.FeatureID		As FeatureId
	,	F.FeatureName
	,	F.ReportFlag
	,	F.FeatureDeleteFlag	As FeatureDeleteFlag
	,	F.AdminFlag
	,	F.Published
	,	F.ModuleId
	,	F.MultiVisit
	,	F.RegistrationFormFlag
	,	F.ReferenceID	As ReferenceId
	,	F.CanLink
	,	F.FormId
	,	F.FormName
	,	F.FormDescription
	,	F.Custom
	,	F.CategoryId
	,	F.CategoryName Code
	,	F.FormDeleteFlag
	,	PermissionCount PermCount
From FormView As F
--Inner Join mst_VisitType As V On V.FeatureId = F.FeatureID
--Left Outer Join( Select D.ID, D.Name, C.CodeID, D.Code From mst_Decode D Inner Join mst_Code C On C.CodeID=D.CodeID And C.Name='Form Category') D On D.ID= V.CategoryId
Where (F.FeatureDeleteFlag = 0)
	And (F.AdminFlag = 0)
	And (F.FormDeleteFlag = 0)
	Or (F.FeatureDeleteFlag Is Null)
	And (F.AdminFlag Is Null)
	And (F.FormDeleteFlag Is Null)
Union
Select	Distinct F.FeatureID		As FeatureId
	,	F.FeatureName
	,	F.ReportFlag
	,	F.FeatureDeleteFlag
	,	F.AdminFlag
	,	F. Published
	,	L.ModuleId
	,	F.MultiVisit
	,	F.RegistrationFormFlag
	,	F.ReferenceId
	,	F.CanLink
	,	F.FormId
	,	F.FormName
	,	F.FormDescription
	,	F.Custom
	,	F.CategoryId
	,	F.CategoryName Code
	,	F.FormDeleteFlag
	,	PermissionCount PermCount
From FormView As F
--Inner Join mst_VisitType As V On V.FeatureId = F.FeatureID
Inner Join lnk_SplFormModule L On L.FeatureId = F.FeatureID
--Left Outer Join( Select D.ID, D.Name, C.CodeID, D.Code From mst_Decode D Inner Join mst_Code C On C.CodeID=D.CodeID And C.Name='Form Category') D On D.ID= V.CategoryId
Where (F.FeatureDeleteFlag = 0)
	And (F.AdminFlag = 0)
	And (F.FormDeleteFlag = 0)
	Or (F.FeatureDeleteFlag Is Null)
	And (F.AdminFlag Is Null)
	And (F.FormDeleteFlag Is Null)




GO
/****** Object:  View [dbo].[PersonView]    Script Date: 6/6/2018 12:35:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[PersonView]
AS
SELECT        Id, CAST(DECRYPTBYKEY(FirstName) AS VARCHAR(50)) AS FirstName, CAST(DECRYPTBYKEY(MidName) AS VARCHAR(50)) AS MiddleName, CAST(DECRYPTBYKEY(LastName) AS VARCHAR(50)) AS LastName, 
                         Sex, Active, DeleteFlag, CreateDate, CreatedBy, AuditData, DateOfBirth, DobPrecision
FROM            dbo.Person


GO
/****** Object:  View [dbo].[PatientRelationshipView]    Script Date: 6/6/2018 12:35:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create VIEW [dbo].[PatientRelationshipView]
AS
Select 
	 P.Id PatientId
	,P.PersonId PatientPersonId
	,PD.FirstName PatientFirstName
	,PD.MiddleName PatientMiddleName
	,PD.LastName PatientLastName
	,(Select Top 1		Name	From LookupItem LI		Where LI.Id = PD.Sex)	PatientSex
	,isnull(PD.DateOfBirth, P.DateOfBirth) PatientDOB
	,R.FirstName RelativeFirstName
	,R.[MiddleName] RelativeMiddleName
	,R.LastName RelativeLastName
	,(Select Top 1	Name	From LookupItem LI	Where LI.Id = R.Sex)	RelativeSex
	,R.DateOfBirth RelativeDateOfBirth
	,(Select Top 1	Name From LookupItem LI	Where LI.Id = PR.RelationshipTypeId) Relationship

From Patient P
Inner Join PersonRelationship PR On P.Id = PR.PatientId
Inner Join PersonView R On R.Id = PR.PersonId
Inner Join PersonView PD On PD.Id = P.PersonId
Where p.DeleteFlag = 0
And PR.DeleteFlag = 0
And R.DeleteFlag = 0 

GO
/****** Object:  View [dbo].[ord_PatientLabOrder]    Script Date: 6/6/2018 12:35:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*
CREATE VIEW [dbo].[ord_PatientLabOrder]
AS
Select	Id As LabID,
		Null As OldLabID,
		Ptn_Pk,
		LocationId,
		OrderedBy As OrderedbyName,
		OrderDate As OrderedbyDate,
		(
			Select Top (1)
				ResultBy
			From dbo.dtl_LabOrderTest
			Where (LabOrderId = lo.Id) And ResultBy Is Not Null
		)
		As ReportedbyName,
		(
			Select Top (1)
				ResultDate
			From dbo.dtl_LabOrderTest As R
			Where (LabOrderId = lo.Id) And R.ResultDate Is Not Null
		)
		As ReportedbyDate,
		Null As CheckedbyName,
		Null As CheckedbyDate,
		PreClinicLabDate,
		DeleteFlag,
		UserId,
		CreateDate,
		UpdateDate,
		VisitId,
		Null As LabPeriod,
		OrderNumber As LabNumber
From dbo.ord_LabOrder As lo

GO
*/

/*
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[VW_IQCareAudit]
AS
SELECT OV.Visit_Id, OV.Ptn_Pk, OV.LocationID, OV.VisitDate, OV.VisitType, TA.OperationType, TA.TableType, TA.TableName, TA.FieldName, 
dbo.fn_GetfieldSelectedValue(TA.TableName,replace(replace(TA.FieldName, '[',''),']',''), TA.FieldType, TA.OldValue)[OldValue],
dbo.fn_GetfieldSelectedValue(TA.TableName,replace(replace(TA.FieldName, '[',''),']',''), TA.FieldType, TA.NewValue)[NewValue], TA.UserID,
TA.CreateDate FROM dbo.ord_Visit OV INNER JOIN
     dbo.tbl_IQCareAudit TA ON OV.Visit_Id = TA.VisitId 
UNION     
Select OV.Visit_Id, OV.Ptn_Pk, OV.LocationID, OV.VisitDate, OV.VisitType, TA.OperationType, TA.TableType, TA.TableName, TA.FieldName, 
dbo.fn_GetfieldSelectedValue(TA.TableName,replace(replace(TA.FieldName, '[',''),']',''), TA.FieldType, TA.OldValue)[OldValue],
dbo.fn_GetfieldSelectedValue(TA.TableName,replace(replace(TA.FieldName, '[',''),']',''), TA.FieldType, TA.NewValue)[NewValue],TA.UserID, 
TA.CreateDate from dbo.tbl_IQCareAudit TA inner join 
     dbo.ord_PatientLabOrder OPL ON TA.LabId = OPL.LabID 
     inner join dbo.ord_Visit OV on OV.Visit_Id = OPL.VisitId 
UNION
Select OV.Visit_Id, OV.Ptn_Pk, OV.LocationID, OV.VisitDate, OV.VisitType, TA.OperationType, TA.TableType, TA.TableName, TA.FieldName, 
dbo.fn_GetfieldSelectedValue(TA.TableName,replace(replace(TA.FieldName, '[',''),']',''), TA.FieldType, TA.OldValue)[OldValue],
dbo.fn_GetfieldSelectedValue(TA.TableName,replace(replace(TA.FieldName, '[',''),']',''), TA.FieldType, TA.NewValue)[NewValue],TA.UserID, 
TA.CreateDate from dbo.tbl_IQCareAudit TA inner join 
     dbo.ord_PatientPharmacyOrder OPO ON TA.pharmacyId = OPO.ptn_pharmacy_pk
     inner join dbo.ord_Visit OV on OV.Visit_Id = OPO.VisitId 
UNION
Select TA.VisitId, TA.PtnId, OV.LocationID, OV.RegistrationDate, ord.VisitType, TA.OperationType, TA.TableType, TA.TableName, TA.FieldName, 
dbo.fn_GetfieldSelectedValue(TA.TableName,replace(replace(TA.FieldName, '[',''),']',''), TA.FieldType, TA.OldValue)[OldValue],
dbo.fn_GetfieldSelectedValue(TA.TableName,replace(replace(TA.FieldName, '[',''),']',''), TA.FieldType, TA.NewValue)[NewValue],
TA.UserID, TA.CreateDate from dbo.tbl_IQCareAudit TA inner join 
     dbo.mst_patient OV ON TA.ptnId = OV.ptn_pk and TA.TableName='mst_patient'
     inner join dbo.ord_Visit ord on ord.ptn_pk=TA.ptnId 

UNION
Select TA.VisitId, TA.PtnId, OV.LocationID, OV.RegistrationDate, 12, TA.OperationType, TA.TableType, TA.TableName, TA.FieldName, 
dbo.fn_GetfieldSelectedValue(TA.TableName,replace(replace(TA.FieldName, '[',''),']',''), TA.FieldType, TA.OldValue)[OldValue],
dbo.fn_GetfieldSelectedValue(TA.TableName,replace(replace(TA.FieldName, '[',''),']',''), TA.FieldType, TA.NewValue)[NewValue],
TA.UserID, TA.CreateDate from dbo.tbl_IQCareAudit TA inner join 
     dbo.mst_patient OV ON TA.ptnId = OV.ptn_pk and TA.VisitId = 0
 
UNION ALL
Select TA.VisitId, TA.PtnId, TA.LocationID, TA.UpdateDate, NULL, TA.OperationType, TA.TableType, TA.TableName,TA.FieldName,TA.OldValue,TA.NewValue,
TA.UserID,TA.CreateDate from dbo.tbl_IQCareAudit TA where TA.ptnId is NULL and TA.LocationID is NULL and TA.VisitID IS NULL and TA.PharmacyId is NULL and 
TA.LabId is NULL

*/

GO
/****** Object:  View [dbo].[VW_Generic]    Script Date: 6/6/2018 12:35:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VW_Generic]
AS
SELECT     dbo.mst_Generic.GenericID, dbo.mst_Generic.GenericName, dbo.mst_Generic.GenericAbbrevation, dbo.mst_DrugType.DrugTypeID, 
                      dbo.mst_DrugType.DrugTypeName, dbo.mst_Generic.DeleteFlag
FROM         dbo.mst_Generic INNER JOIN
                      dbo.lnk_DrugTypeGeneric ON dbo.mst_Generic.GenericID = dbo.lnk_DrugTypeGeneric.GenericId RIGHT OUTER JOIN
                      dbo.mst_DrugType ON dbo.lnk_DrugTypeGeneric.DrugTypeId = dbo.mst_DrugType.DrugTypeID
WHERE     (dbo.mst_Generic.DeleteFlag = 0) OR
                      (dbo.mst_Generic.DeleteFlag IS NULL)
GO
/****** Object:  View [dbo].[VW_PatientPharmacyNonARV]    Script Date: 6/6/2018 12:35:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VW_PatientPharmacyNonARV]
AS
SELECT     dbo.ord_PatientPharmacyOrder.Ptn_pk, dbo.ord_PatientPharmacyOrder.VisitID, dbo.ord_PatientPharmacyOrder.LocationID, 
                      dbo.ord_PatientPharmacyOrder.OrderedBy, dbo.ord_PatientPharmacyOrder.OrderedByDate, dbo.ord_PatientPharmacyOrder.DispensedBy, 
                      dbo.ord_PatientPharmacyOrder.DispensedByDate, dbo.ord_PatientPharmacyOrder.OrderType, dbo.ord_PatientPharmacyOrder.Height, 
                      dbo.ord_PatientPharmacyOrder.ProgID, dbo.ord_PatientPharmacyOrder.Weight, dbo.ord_PatientPharmacyOrder.ProviderID, 
                      dbo.ord_PatientPharmacyOrder.PharmacyPeriodTaken, dbo.ord_Visit.VisitDate, dbo.ord_Visit.VisitType, dbo.VW_Generic.GenericID, dbo.VW_Generic.GenericName, 
                      dbo.VW_Drug.Drug_pk, dbo.VW_Drug.DrugName, dbo.dtl_PatientPharmacyOrderNonARV.Duration, dbo.dtl_PatientPharmacyOrderNonARV.OrderedQuantity, 
                      dbo.dtl_PatientPharmacyOrderNonARV.DispensedQuantity, dbo.dtl_PatientPharmacyOrderNonARV.Prophylaxis, 
                      CASE dbo.dtl_patientpharmacyorderNonARV.drug_pk WHEN '0' THEN dbo.VW_Generic.DrugTypeName WHEN NULL 
                      THEN dbo.VW_Generic.DrugTypeName ELSE dbo.VW_Drug.DrugTypeName END AS DrugType, 
                      CASE dbo.dtl_patientpharmacyorderNonARV.drug_pk WHEN '0' THEN dbo.VW_Generic.DrugTypeID WHEN NULL 
                      THEN dbo.VW_Generic.DrugTypeID ELSE dbo.VW_Drug.DrugTypeID END AS DrugTypeId, dbo.ord_PatientPharmacyOrder.ptn_pharmacy_pk
FROM         dbo.ord_PatientPharmacyOrder INNER JOIN
                      dbo.dtl_PatientPharmacyOrderNonARV ON dbo.ord_PatientPharmacyOrder.ptn_pharmacy_pk = dbo.dtl_PatientPharmacyOrderNonARV.ptn_pharmacy_pk INNER JOIN
                      dbo.ord_Visit ON dbo.ord_PatientPharmacyOrder.VisitID = dbo.ord_Visit.Visit_Id LEFT OUTER JOIN
                      dbo.VW_Generic ON dbo.dtl_PatientPharmacyOrderNonARV.GenericID = dbo.VW_Generic.GenericID LEFT OUTER JOIN
                      dbo.VW_Drug ON dbo.dtl_PatientPharmacyOrderNonARV.Drug_Pk = dbo.VW_Drug.Drug_pk
WHERE     (dbo.ord_Visit.DeleteFlag = 0) OR
                      (dbo.ord_Visit.DeleteFlag IS NULL)
GO
/****** Object:  View [dbo].[VW_PatientLaboratoryTransaction]    Script Date: 6/6/2018 12:35:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VW_PatientLaboratoryTransaction]
AS
SELECT  Ptn_pk, 
		labid,
		replace(
		replace(
			(SELECT testname as t FROM VW_PatientLaboratory 
				WHERE Ptn_pk = results.Ptn_pk
				and  labid = Results.labid 
				FOR XML PATH ('t'))
			,'<t>','')
			,'</t>',' ') AS testname
		
FROM    dbo.VW_PatientLaboratory results
GROUP BY Ptn_pk, 
		labid
GO
/****** Object:  View [dbo].[VW_PatientPharmacyTransaction]    Script Date: 6/6/2018 12:35:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VW_PatientPharmacyTransaction]
AS
SELECT  Ptn_pk, 
		drug_pk,
		ptn_pharmacy_pk AS PharmacyId, 
		BatchId,
		MAX(DrugName) AS DrugName
FROM    dbo.VW_PatientPharmacy
GROUP BY Ptn_pk,drug_pk, ptn_pharmacy_pk, BatchId, ExpiryDate
GO
/****** Object:  View [dbo].[Api_PatientsView]    Script Date: 6/6/2018 12:35:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[Api_PatientsView]
AS
SELECT ISNULL(ROW_NUMBER() OVER(ORDER BY PersonId ASC), -1) AS RowID, *
FROM (
SELECT
	   P.[Id] PersonId,
	   PT.Id PatientId,
	   PT.ptn_pk,
	   CAST(DECRYPTBYKEY(P.[FirstName]) AS VARCHAR(50)) AS [FirstName], 
	   CAST(DECRYPTBYKEY(P.[MidName]) AS VARCHAR(50)) AS [MidName],
	   CAST(DECRYPTBYKEY(P.[LastName]) AS VARCHAR(50)) AS [LastName],
	   P.Sex,
	   Gender = (SELECT TOP 1 ItemName FROM LookupItemView WHERE ItemId = P.Sex AND MasterName = 'Gender'),
	   PT.[DateOfBirth],
	   PT.[DobPrecision],
	   PatientType = CASE(SELECT ItemName FROM LookupItemView WHERE ItemId = PT.PatientType AND MasterName = 'PatientType') WHEN 'New' THEN 'NEW' WHEN 'Transfer-In' THEN 'TRANSFER-IN' WHEN 'Transit' THEN 'TRANSIT' ELSE '' END,
	   CAST(DECRYPTBYKEY(PT.[NationalId]) AS VARCHAR(50)) AS [NationalId],
	   [RegistrationDate],
	   PE.EnrollmentDate,
	   pni.IdentifierValue,
	   SE.Id ServiceAreaId,
	   SE.Name ServiceAreaName,
	   CAST(DECRYPTBYKEY(PC.PhysicalAddress) AS VARCHAR(50)) AS PhysicalAddress,
	   CAST(DECRYPTBYKEY(PC.MobileNumber) AS VARCHAR(50)) AS MobileNumber,
	   PMS.MaritalStatusId,
	   MaritalStatusName = (SELECT TOP 1 ItemName FROM LookupItemView WHERE ItemId = PMS.MaritalStatusId AND MasterName = 'MaritalStatus'),
	   PL.LandMark 
	   
FROM [dbo].[Person] P
INNER JOIN dbo.Patient AS PT ON P.Id = PT.PersonId
INNER JOIN dbo.PatientEnrollment AS PE ON PT.Id = PE.PatientId 
INNER JOIN dbo.PatientIdentifier AS pni ON pni.PatientId = PT.Id 
INNER JOIN dbo.Identifiers ON pni.IdentifierTypeId = dbo.Identifiers.Id
INNER JOIN dbo.ServiceArea SE ON SE.Id = PE.ServiceAreaId
LEFT JOIN dbo.PersonContact PC ON PC.PersonId = P.Id
LEFT JOIN [dbo].[PatientMaritalStatus] PMS ON PMS.PersonId = P.Id
LEFT JOIN [dbo].[PersonLocation] PL ON PL.PersonId = P.Id
--WHERE PL.DeleteFlag = 0 AND PMS.DeleteFlag = 0 AND PC.DeleteFlag = 0 AND pni.DeleteFlag = 0 AND PT.DeleteFlag = 0

union all
SELECT
	PR.Id PersonId, 
	PT.Id PatientId,
	NULL AS ptn_pk,
	CAST(DECRYPTBYKEY(PR.FirstName) AS VARCHAR(50)) AS [FirstName],
	CAST(DECRYPTBYKEY(PR.MidName) AS VARCHAR(50)) AS MidName,
	CAST(DECRYPTBYKEY(PR.LastName) AS VARCHAR(50)) AS LastName,
	PR.Sex,
	Gender = (SELECT TOP 1 ItemName FROM LookupItemView WHERE ItemId = PR.Sex AND MasterName = 'Gender'),
	PR.DateOfBirth,
	PR.DobPrecision,
	NULL as PatientType,
	NULL as NationalId,
	NULL as RegistrationDate,
	NULL as EnrollmentDate,
	null as IdentifierValue,
	null as ServiceAreaId,
	null as ServiceAreaName,
	CAST(DECRYPTBYKEY(PC.PhysicalAddress) AS VARCHAR(50)) AS PhysicalAddress,
	CAST(DECRYPTBYKEY(PC.MobileNumber) AS VARCHAR(50)) AS MobileNumber,
	PMS.MaritalStatusId,
	MaritalStatusName = (SELECT TOP 1 ItemName FROM LookupItemView WHERE ItemId = PMS.MaritalStatusId AND MasterName = 'MaritalStatus'),
	PL.LandMark 
FROM Person PR
LEFT JOIN Patient PT ON PR.Id = PT.PersonId
LEFT JOIN [dbo].[PatientMaritalStatus] PMS ON PMS.PersonId = PR.Id
LEFT JOIN [dbo].[PersonLocation] PL ON PL.PersonId = PR.Id
LEFT JOIN dbo.PersonContact PC ON PC.PersonId = PR.Id
WHERE PT.Id IS NULL) B
GO
/****** Object:  View [dbo].[HTS_EncountersView]    Script Date: 6/6/2018 12:35:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[HTS_EncountersView]
AS
SELECT DISTINCT
ISNULL(ROW_NUMBER() OVER(ORDER BY PE.Id ASC), -1) AS RowID,
HE.Id EncounterId,
PE.Id,
PE.PatientId,
PE.EncounterStartTime EncounterDate,
ISNULL(CAST((CASE HE.EncounterType WHEN 1 THEN 'Initial Test' WHEN 2 THEN 'Repeat Test' END) AS VARCHAR(50)),'Initial') AS TestType,
Provider = (SELECT TOP 1 (UserFirstName + ' ' + UserLastName) FROM [dbo].[mst_User] WHERE UserID = HE.ProviderId),
ResultOne = (SELECT TOP 1 ItemName FROM [dbo].[LookupItemView] WHERE ItemId = (SELECT TOP 1 RoundOneTestResult FROM [dbo].[HtsEncounterResult] WHERE HtsEncounterId = HE.Id ORDER BY Id DESC)),
ResultTwo = (SELECT TOP 1 ItemName FROM [dbo].[LookupItemView] WHERE ItemId = (SELECT TOP 1 RoundTwoTestResult FROM [dbo].[HtsEncounterResult] WHERE HtsEncounterId = HE.Id ORDER BY Id DESC)),
FinalResult = (SELECT TOP 1 ItemName FROM [dbo].[LookupItemView] WHERE ItemId = (SELECT TOP 1 FinalResult FROM [dbo].[HtsEncounterResult] WHERE HtsEncounterId = HE.Id ORDER BY Id DESC)),
Consent = (SELECT TOP 1 ItemName FROM [dbo].[LookupItemView] WHERE ItemId = (SELECT TOP 1 ConsentValue FROM PatientConsent PC WHERE PC.PatientMasterVisitId = PM.Id AND PC.ConsentType = (SELECT TOP 1 ItemId FROM LookupItemView WHERE ItemName = 'ConsentToBeTested') order by Id DESC)),
PartnerListingConsent = (SELECT TOP 1 ItemName FROM [dbo].[LookupItemView] WHERE ItemId = (SELECT TOP 1 ConsentValue FROM PatientConsent PC WHERE PC.PatientMasterVisitId = PM.Id AND PC.ConsentType = (SELECT TOP 1 ItemId FROM LookupItemView WHERE ItemName = 'ConsentToListPartners') order by Id DESC))

FROM [dbo].[PatientEncounter] PE
INNER JOIN [dbo].[PatientMasterVisit] PM ON PM.Id = PE.PatientMasterVisitId
INNER JOIN [dbo].[HtsEncounter] HE ON PE.Id = HE.PatientEncounterID
GO
/****** Object:  View [dbo].[HTS_PartnersView]    Script Date: 6/6/2018 12:35:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[HTS_PartnersView]
AS
SELECT
	ISNULL(ROW_NUMBER() OVER(ORDER BY PR.Id ASC), -1) AS RowID,
	PR.PersonId,
	PR.PatientId,
	CAST(DECRYPTBYKEY(P.[FirstName]) AS VARCHAR(50)) AS [FirstName],
	CAST(DECRYPTBYKEY(P.[MidName]) AS VARCHAR(50)) AS [MidName],
	CAST(DECRYPTBYKEY(P.[LastName]) AS VARCHAR(50)) AS [LastName],
	P.DateOfBirth,
	P.Sex,
	Gender = (SELECT TOP 1 ItemName FROM LookupItemView WHERE ItemId = P.Sex AND MasterName = 'Gender'),
	PR.RelationshipTypeId,
	RelationshipType = (SELECT TOP 1 ItemName FROM LookupItemView WHERE ItemId = PR.RelationshipTypeId AND MasterName = 'Relationship')

FROM [dbo].[PersonRelationship] PR
INNER JOIN dbo.Patient AS PT ON PT.Id = PR.PatientId
INNER JOIN [dbo].[Person] P ON P.Id = PR.PersonId


GO
/****** Object:  View [dbo].[HTS_LAB_Register]    Script Date: 6/6/2018 12:35:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[HTS_LAB_Register]
AS
SELECT DISTINCT ISNULL(ROW_NUMBER() OVER (ORDER BY PE.Id ASC), - 1) AS RowID, P.Id PatientID, p.Ptn_pk AS PatientPK, CONVERT(varchar(50), decryptbykey(Per.firstname)) + ' ' + CONVERT(varchar(50), 
decryptbykey(Per.middlename)) + ' ' + CONVERT(varchar(50), decryptbykey(Per.lastname)) AS PatientName, PE.EncounterStartTime VisitDate, p.dateofbirth AS DOB, DATEdiff(yy, p.dateofbirth, PE.EncounterStartTime) AS Age, 
Gender =
    (SELECT        TOP 1 ItemName
      FROM            [dbo].[LookupItemView]
      WHERE        ItemId = per.sex), ISNULL(CAST((CASE HE.EncounterType WHEN 1 THEN 'Initial Test' WHEN 2 THEN 'Repeat Test' END) AS VARCHAR(50)), 'Initial') AS TestType, clientSelfTestesd =
    (SELECT        TOP 1 CASE ItemName WHEN 'Yes' THEN 'Y' WHEN 'NO' THEN 'N' ELSE NULL END
      FROM            [dbo].[LookupItemView]
      WHERE        ItemId = he.EverSelfTested), StrategyHTS =
    (SELECT        TOP 1 ItemName
      FROM            [dbo].[LookupItemView]
      WHERE        ItemId = he.TestEntryPoint), ClientTestedAs =
    (SELECT        TOP 1 CASE ItemName WHEN 'C: Couple (includes polygamous)' THEN 'Couple' ELSE 'Individual' END
      FROM            [dbo].[LookupItemView]
      WHERE        ItemId = he.TestedAs), CoupleDiscordant =
    (SELECT        TOP 1 ItemName
      FROM            [dbo].[LookupItemView]
      WHERE        ItemId = he.CoupleDiscordant), TestedBefore =
    (SELECT        TOP 1 ItemName
      FROM            [dbo].[LookupItemView]
      WHERE        ItemId = he.evertested), MonthsSinceLastTest WhenLastTested, MaritalStatus =
    (SELECT        TOP 1 ItemName
      FROM            [dbo].[LookupItemView]
      WHERE        ItemId = ms.maritalstatusid), kits.onekitid AS TestKitName1, kits.onelotnumber AS TestKitLotNumber1, kits.oneexpirydate AS TestKitExpiryDate1, ResultOne =
    (SELECT        TOP 1 ItemName
      FROM            [dbo].[LookupItemView]
      WHERE        ItemId = her.RoundOneTestResult), kits.twokitid AS TestKitName_2, kits.twolotnumber AS TestKitLotNumber_2, kits.twoexpirydate AS TestKitExpiryDate_2, CASE WHEN dis.itemname IS NULL 
THEN 'NA' ELSE dis.itemname END AS Disability, kits.FinalTestOneResult, kits.FinalTestTwoResult AS FinalResultTestTwo, ResultTwo =
    (SELECT        TOP 1 ItemName
      FROM            [dbo].[LookupItemView]
      WHERE        ItemId = her.RoundTwoTestResult), finalResultHTS =
    (SELECT        TOP 1 ItemName
      FROM            [dbo].[LookupItemView]
      WHERE        ItemId = her.FinalResult), FinalResultsGiven =
    (SELECT        TOP 1 ItemName
      FROM            [dbo].[LookupItemView]
      WHERE        ItemId = he.FinalResultGiven), /*Disability =  (SELECT TOP 1 ItemName FROM [dbo].[LookupItemView] WHERE ItemId = dis.disabilityid),*/ Consent =
    (SELECT        TOP 1 CASE ItemName WHEN 'Yes' THEN 1 ELSE 0 END
      FROM            [dbo].[LookupItemView]
      WHERE        ItemId =
                                    (SELECT        TOP 1 ConsentValue
                                      FROM            PatientConsent PC
                                      WHERE        PC.PatientMasterVisitId = PM.Id AND PC.ConsentType =
                                                                    (SELECT        TOP 1 ItemId
                                                                      FROM            LookupItemView
                                                                      WHERE        ItemName = 'ConsentToBeTested'))), he.EncounterRemarks AS Remarks, NULL AS TCAHTS, NULL AS TBScreeningHTS, 
CASE pop.PopulationCategory WHEN 'General Population' THEN 'N/A' ELSE PopulationCategory END AS KeyPop
FROM            [dbo].[PatientEncounter] PE INNER JOIN
                         patient p ON p.id = pe.patientid INNER JOIN
                         personview per ON per.id = p.personid LEFT JOIN
                         [dbo].[PatientPopulationView] pop ON pop.PatientPK = p.ptn_pk INNER JOIN
                         [dbo].[PatientMasterVisit] PM ON PM.Id = PE.PatientMasterVisitId INNER JOIN
                         [dbo].[HtsEncounter] HE ON PE.Id = HE.PatientEncounterID INNER JOIN
                         [dbo].[HtsEncounterResult] HER ON HtsEncounterId = HE.Id LEFT JOIN
                         [PatientMaritalStatus] ms ON ms.personid = p.personid LEFT JOIN
                             (SELECT        TOP 1 personid, l.itemname
                               FROM            [dbo].[ClientDisability] d, [dbo].[LookupItemView] l
                               WHERE        l.itemid = d .disabilityid) dis ON dis.personid = p.personid LEFT JOIN
                             (SELECT DISTINCT 
                                                         e.personid, one.kitid AS onekitid, one.kitlotnumber AS onelotnumber, one.Outcome AS FinalTestOneResult, two.Outcome AS FinalTestTwoResult, one.expirydate AS oneexpirydate, two.kitid AS twokitid, 
                                                         two.kitlotnumber AS twolotnumber, two.expirydate AS twoexpirydate
                               FROM            [Testing] t INNER JOIN
                                                         [HtsEncounter] e ON t .htsencounterid = e.id FULL OUTER JOIN
                                                             (SELECT distinct  htsencounterid, b.ItemName kitid, kitlotnumber, expirydate, PersonId, l.ItemName AS outcome
																FROM [Testing] t inner join  [HtsEncounter] e on t.HtsEncounterId=e.id inner join  [LookupItemView] l on l.itemid=t.Outcome
																inner join lookupitemview b on b.itemid=t.KitId WHERE  e.encountertype = 1 and t.testround =1) one ON one.personid = e.PersonId FULL OUTER JOIN
                                                             (SELECT distinct htsencounterid, b.ItemName kitid, kitlotnumber, expirydate, PersonId, l.ItemName AS outcome
																FROM  [Testing] t inner join  [HtsEncounter] e on t.HtsEncounterId=e.id inner join  [LookupItemView] l on l.itemid=t.Outcome
																inner join lookupitemview b on b.itemid=t.KitId WHERE  e.encountertype = 2) two ON two.personid = e.PersonId) kits ON kits.personid = p.personid



GO
/****** Object:  View [dbo].[vw_HIVTesting_Services_Referral_Linkage_Register]    Script Date: 6/6/2018 12:35:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vw_HIVTesting_Services_Referral_Linkage_Register]
AS
SELECT DISTINCT ISNULL(ROW_NUMBER() OVER (ORDER BY PE.Id ASC), - 1) AS RowID, he.id, firstname + ' ' + MiddleName + ' ' + lastname AS PatientName, PE.PatientId, p.ptn_pk AS Ptn_pk, p.dateofbirth, DATEdiff(yy, p.dateofbirth, 
PE.EncounterStartTime) AS Age, Gender =
    (SELECT DISTINCT ItemName
      FROM            [dbo].[LookupItemView]
      WHERE        ItemId = per.sex), PE.EncounterStartTime Date, ploc.LandMark AS landmark, pcon.MobileNumber AS PhoneNumber, link.Facility AS FacilityName, NULL AS Occupation, NULL AS IndexClientType, 
CASE pop.PopulationCategory WHEN 'General Population' THEN 'NA' ELSE PopulationCategory END AS KeyPop, refer.referralDate AS ReferalDate, link.healthworker AS handedOverTo, link.cadre AS handedOverToCadre, 
tout.datetracingdone AS [TracingDate], tout.TraceType AS tracingtype, pcons.itemname AS ConsentValue, tout.Outcome, tout.Remarks AS Remarks, link.linkagedate AS dateEnrolled, link.cccnumber AS CCCNumber
FROM            [dbo].[PatientEncounter] PE INNER JOIN
                         patient p ON p.id = pe.patientid INNER JOIN
                         PersonView per ON per.id = p.personid LEFT JOIN
                         PersonLocation ploc ON ploc.personid = per.id LEFT JOIN
                         PersonContact pcon ON pcon.personid = per.id LEFT JOIN
                         PatientPopulationView pop ON pop.PatientPK = p.ptn_pk INNER JOIN
                         [dbo].[PatientMasterVisit] PM ON PM.Id = PE.PatientMasterVisitId LEFT JOIN
                             (SELECT DISTINCT l.itemname, PatientMasterVisitId
                               FROM            PatientConsent t, [dbo].[LookupItemView] l
                               WHERE        l.itemid = t .ConsentValue) pcons ON pcons.PatientMasterVisitId = pm.id INNER JOIN
                         [dbo].[HtsEncounter] HE ON PE.Id = HE.PatientEncounterID inner JOIN
                             (SELECT DISTINCT PersonId, PatientId, cast(LinkageDate AS date) LinkageDate, CCCNumber, Facility, Enrolled, HealthWorker, Cadre
                               FROM            [dbo].[PatientLinkage]) link ON link.personid = per.id INNER JOIN
                         [dbo].[HtsEncounterResult] HER ON HtsEncounterId = HE.Id LEFT JOIN
                             (SELECT DISTINCT personid, datetracingdone, l.itemname TraceType, j.itemname Outcome, Remarks
                               FROM            [dbo].[Tracing] t LEFT JOIN
                                                         [dbo].[LookupItemView] l ON l.itemid = t .mode LEFT JOIN
                                                         [dbo].[LookupItemView] j ON j.itemid = t .outcome) tout ON tout.PersonID = per.id LEFT JOIN
                             (SELECT DISTINCT he.personid, cast(referralDate AS Date) referralDate
                               FROM            [dbo].[HtsEncounterResult] her, [HtsEncounter] he, [LookupItemView] look, Referral ref
                               WHERE        her.HtsEncounterId = he.Id AND he.PersonId = ref.PersonId AND her.FinalResult = look.ItemId AND ItemName = 'Positive') refer ON refer.personid = per.id

GO
/****** Object:  View [dbo].[HTS_EncountersDetailView]    Script Date: 6/6/2018 12:35:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[HTS_EncountersDetailView]
AS
SELECT DISTINCT
ISNULL(ROW_NUMBER() OVER(ORDER BY PE.Id ASC), -1) AS RowID,
HE.PersonId PersonId,
HE.Id EncounterId,
PE.Id PatientEncounterId,
PE.PatientId PatientId,
PE.EncounterStartTime EncounterDate,
ISNULL(CAST((CASE HE.EncounterType WHEN 1 THEN 'Initial Test' WHEN 2 THEN 'Repeat Test' END) AS VARCHAR(50)),'Initial') AS TestType,
Provider = (SELECT TOP 1 (UserFirstName + ' ' + UserLastName) FROM [dbo].[mst_User] WHERE UserID = HE.ProviderId),
ResultOne = (SELECT TOP 1 ItemName FROM [dbo].[LookupItemView] WHERE ItemId = (SELECT TOP 1 RoundOneTestResult FROM [dbo].[HtsEncounterResult] WHERE HtsEncounterId = HE.Id ORDER BY Id DESC)),
ResultTwo = (SELECT TOP 1 ItemName FROM [dbo].[LookupItemView] WHERE ItemId = (SELECT TOP 1 RoundTwoTestResult FROM [dbo].[HtsEncounterResult] WHERE HtsEncounterId = HE.Id ORDER BY Id DESC)),
FinalResult = (SELECT TOP 1 ItemName FROM [dbo].[LookupItemView] WHERE ItemId = (SELECT TOP 1 FinalResult FROM [dbo].[HtsEncounterResult] WHERE HtsEncounterId = HE.Id ORDER BY Id DESC)),
Consent = (SELECT TOP 1 ItemName FROM [dbo].[LookupItemView] WHERE ItemId = (SELECT TOP 1 ConsentValue FROM PatientConsent PC WHERE PC.PatientMasterVisitId = PM.Id AND PC.ConsentType = (SELECT TOP 1 ItemId FROM LookupItemView WHERE ItemName = 'ConsentToBeTested') order by Id DESC)),
PartnerListingConsent = (SELECT TOP 1 ItemName FROM [dbo].[LookupItemView] WHERE ItemId = (SELECT TOP 1 ConsentValue FROM PatientConsent PC WHERE PC.PatientMasterVisitId = PM.Id AND PC.ConsentType = (SELECT TOP 1 ItemId FROM LookupItemView WHERE ItemName = 'ConsentToListPartners') order by Id DESC)),
PartnerListingConsentDeclineReason = (SELECT TOP 1 ItemName FROM [dbo].[LookupItemView] WHERE MasterName = 'ReasonsPartner' AND ItemId = (SELECT TOP 1 DeclineReason FROM PatientConsent PC WHERE PC.PatientMasterVisitId = PM.Id AND PC.ConsentType = (SELECT TOP 1 ItemId FROM LookupItemView WHERE ItemName = 'ConsentToListPartners') order by Id DESC)),
ServiceEntryPoint = (SELECT TOP 1 ItemName FROM [dbo].[LookupItemView] WHERE ItemId = HE.TestEntryPoint),
EverTested = (SELECT TOP 1 ItemName FROM [dbo].[LookupItemView] WHERE ItemId = HE.EverTested),
HE.MonthsSinceLastTest MonthsSinceLastTest,
EverSelfTested = (SELECT TOP 1 ItemName FROM [dbo].[LookupItemView] WHERE ItemId = HE.EverSelfTested),
TestedAs = (SELECT TOP 1 ItemName FROM [dbo].[LookupItemView] WHERE ItemId = HE.TestedAs),
CoupleDiscordant = (SELECT TOP 1 ItemName FROM [dbo].[LookupItemView] WHERE ItemId = HE.CoupleDiscordant),
HE.EncounterRemarks EncounterRemarks,
FinalResultGiven = (SELECT TOP 1 ItemName FROM [dbo].[LookupItemView] WHERE ItemId = HE.FinalResultGiven),
TestingStrategy = (SELECT TOP 1 ItemName FROM [dbo].[LookupItemView] WHERE ItemId = HE.TestingStrategy),
TBScreening = (SELECT TOP 1 ItemName FROM [dbo].[LookupItemView] WHERE ItemId = (SELECT TOP 1 ScreeningValueId FROM PatientScreening PTS WHERE PTS.PatientMasterVisitId = PM.Id AND PTS.ScreeningTypeId = (SELECT TOP 1 MasterId FROM LookupItemView WHERE MasterName = 'TbScreening')))

FROM [dbo].[PatientEncounter] PE
INNER JOIN [dbo].[PatientMasterVisit] PM ON PM.Id = PE.PatientMasterVisitId
INNER JOIN [dbo].[HtsEncounter] HE ON PE.Id = HE.PatientEncounterID

GO
/****** Object:  View [dbo].[PersonTracingView]    Script Date: 6/6/2018 12:35:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[PersonTracingView]
AS
SELECT        Id, PersonID, DateTracingDone AS TracingDate,
                             (SELECT        TOP (1) ItemName
                               FROM            dbo.LookupItemView
                               WHERE        (ItemId = dbo.Tracing.Mode)) AS TracingMode,
                             (SELECT        TOP (1) ItemName
                               FROM            dbo.LookupItemView AS LookupItemView_2
                               WHERE        (ItemId = dbo.Tracing.Outcome)) AS TracingOutcome, DateBookedTesting,
                             (SELECT        TOP (1) ItemName
                               FROM            dbo.LookupItemView AS LookupItemView_1
                               WHERE        (ItemId = dbo.Tracing.Consent)) AS Consent,
							   DeleteFlag
FROM            dbo.Tracing
GO
/****** Object:  View [dbo].[API_PatientVitalsView]    Script Date: 6/6/2018 12:35:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[API_PatientVitalsView]
AS
Select dbo.PatientVitals.id
	  ,dbo.PatientVitals.PatientId
	  ,dbo.PatientVitals.PatientMasterVisitId
	  ,dbo.PatientVitals.Height
	  ,'CMS' As HeightUnits
	  ,dbo.PatientVitals.Weight
	  ,'KGS' As WeightUnits
	  ,format(cast(isnull(dbo.PatientMasterVisit.VisitDate, dbo.PatientMasterVisit.start) As datetime), 'yyyyMMddhhmmss') As VisitDate
From dbo.PatientVitals
Inner Join dbo.PatientMasterVisit On dbo.PatientVitals.PatientMasterVisitId = dbo.PatientMasterVisit.id

GO
/****** Object:  View [dbo].[AppointmentSummaryView]    Script Date: 6/6/2018 12:35:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[AppointmentSummaryView]
AS
select CONVERT(int, row_number() OVER (ORDER BY AppointmentDate)) Id, AppointmentDate, Count(*) Total, sum(CASE Name WHEN 'Missed' THEN 1 ELSE 0 END)
 Missed, sum(CASE Name WHEN 'Met' THEN 1 ELSE 0 END) Met, sum(CASE Name WHEN 'Pending' THEN 1 ELSE 0 END) Pending, 
sum(CASE Name WHEN 'Previously Missed' THEN 1 ELSE 0 END) PreviouslyMissed
from (
select PA.appointmentDate, L.name from PatientAppointment PA INNER JOIN LookupItem L ON L.Id = PA.StatusId WHERE PA.DeleteFlag = 0
UNION ALL
select a.appdate,b.Name from dtl_patientappointment a inner join mst_decode b on a.appstatus = b.id where a.deleteflag=0) Appointments
GROUP BY AppointmentDate

GO
/****** Object:  View [dbo].[dtl_PatientLabResults]    Script Date: 6/6/2018 12:35:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
CREATE VIEW [dbo].[dtl_PatientLabResults]
AS
Select	lr.LabOrderId As 'LabID',
		lo.LocationId,
		lr.LabTestId,
		lr.ParameterId,
		lr.ResultValue As 'TestResults',
		lr.ResultText As 'TestResults1',
		lr.ResultOptionId As 'TestResultId',
		1 As 'Financed',
		lr.ResultUnitId As 'Units',
		lr.UserId,
		lr.CreateDate,
		lo.UpdateDate,
		Null As 'TabId',
		d.TestNotes As 'RequestNotes',
		D.ResultNotes,
		D.ResultBy,
		D.ResultDate
From dbo.dtl_LabOrderTestResult As lr
Inner Join dbo.ord_LabOrder As lo On lr.LabOrderId = lo.Id
Inner Join dbo.dtl_LabOrderTest As d On lr.LabOrderTestId = d.Id


GO
*/

/****** Object:  View [dbo].[FormBusinessRuleView]    Script Date: 6/6/2018 12:35:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

  

CREATE VIEW [dbo].[FormBusinessRuleView]
As

Select	FB.Id
	,	FB.BusRuleId
	,	R.Name			As BusRuleName
	,	R.DeleteFlag	As BusRuleDeleteFlag
	,	R.ReferenceId	As BusRuleReferenceId
	,	FB.Value MinValue
	,	FB.Value1 MaxValue
	,	FB.SetType
	,	F.FeatureID		As FeatureId
	,	F.FeatureName	As FeatureName
	,	F.ReferenceID	As FormReferenceId
	,	F.FeatureTypeId
	,	D.Code			As FormTypeReferenceId
	,	T.VisitTypeID FormId
	,	T.VisitName	FormName
	,	F.MultiVisit
	,	T.Custom
From lnk_featureBusinessRule As FB
Inner Join mst_Feature As F On F.FeatureID = FB.FeatureId
Inner Join mst_VisitType T On T.FeatureId = F.FeatureID
Inner Join Mst_BusinessRule As R On R.Id = FB.BusRuleId
Inner Join mst_Decode D On D.ID= F.FeatureTypeId

	 


GO
/****** Object:  View [dbo].[Laboratory_ViralLoad]    Script Date: 6/6/2018 12:35:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[Laboratory_ViralLoad]
AS
SELECT        labTrac.Id, labTrac.patientId, PatientLabTracker_1.ResultValues, PatientLabTracker_1.FacilityId
FROM            (SELECT        MAX(Id) AS Id, patientId
                          FROM            dbo.PatientLabTracker
                          GROUP BY patientId, LabTestId
                          HAVING         (LabTestId = 3)) AS labTrac INNER JOIN
                         dbo.PatientLabTracker AS PatientLabTracker_1 ON labTrac.Id = PatientLabTracker_1.Id
                        WHERE        (PatientLabTracker_1.Results = 'Complete')
GO
/****** Object:  View [dbo].[lnk_LabValue]    Script Date: 6/6/2018 12:35:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
CREATE VIEW [dbo].[lnk_LabValue]
AS
Select	Id
		,ParameterId	As 'SubTestID'
		,MinBoundary	As 'MinBoundaryValue'
		,MaxBoundary	As 'MaxBoundaryValue'
		,MinNormalRange
		,MaxNormalRange
		,Null			As 'TextNormalRange'
		,1				As 'UserID'
		,Null			
		As 'CreateDate'
		,Null			As 'UpdateDate'
		,DefaultUnit
		,UnitId
		,DeleteFlag
From dbo.dtl_LabTestParameterConfig
GO

*/



/*
CREATE VIEW [dbo].[lnk_parameterresult]
AS
Select	Id As 'ResultID',
		ParameterId,
		Value As 'Result',
		1 As 'UserID',
		Null As 'CreateDate',
		Null As 'UpdateDate',
		DeleteFlag
From dbo.dtl_LabTestParameterResultOption


GO
*/


/*
CREATE VIEW [dbo].[lnk_TestParameter]
AS
Select	Id As 'SubTestID',
		ParameterName As 'SubTestName',
		LabTestId As 'TestID',
		0 As 'ControlID',
		0 As 'SerialNumber',
		DeleteFlag,
		UserId,
		CreateDate,
		UpdateDate,
		Null As 'LoincCode',
		Null
		As 'Sequence'
From dbo.Mst_LabTestParameter


GO
*/


/****** Object:  View [dbo].[LookupView]    Script Date: 6/6/2018 12:35:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[LookupView]
AS
	Select	Id
		,	D.Name
		,	D.CodeID					LookupId
		,	C.Name						LookupName
		,	convert(bit, D.DeleteFlag)	Deleted
		,	'MST_DECODE'				Category
		,	D.SRNo						OrdRank
	From mst_Decode D
	Inner Join Mst_Code C On C.CodeID = D.CodeID
	Where D.SystemId In (0 , 1)
	Union All
	Select	Id
		,	D.Name
		,	D.CodeID					LookupId
		,	C.Name						LookupName
		,	convert(bit, D.DeleteFlag)	Deleted
		,	'MST_MODDECODE'				Category
		,	D.SRNo						OrdRank
	From mst_ModDecode D
	Inner Join Mst_ModCode C On C.CodeID = D.CodeID
	Where D.SystemId In (0 , 1)
	Union All
	Select	Id
		,	D.Name
		,	D.CodeID					LookupId
		,	C.Name						LookupName
		,	convert(bit, D.DeleteFlag)	Deleted
		,	'MST_BLUEDECODE'			Category
		,	D.SRNo						OrdRank
	From mst_BlueDecode D
	Inner Join Mst_BlueCode C On C.CodeID = D.CodeID
	Where D.SystemId In (0 , 1)
	Union All
	Select	Id
		,	D.Name
		,	D.CodeID					LookupId
		,	C.Name						LookupName
		,	convert(bit, D.DeleteFlag)	Deleted
		,	'PMTCTDECODE'				Category
		,	D.SRNo						OrdRank
	From mst_pmtctDeCode D
	Inner Join mst_pmtctCode C On C.CodeID = D.CodeID
	Where D.SystemId In (0 , 1)


GO
/****** Object:  View [dbo].[mst_LabTest]    Script Date: 6/6/2018 12:35:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*
CREATE VIEW [dbo].[mst_LabTest]
AS
Select	Id As LabTestID,
		Name As LabName,
		DepartmentId As LabDepartmentID,
		1 As LabTypeID,
		1 As Sequence,
		ltm.DeleteFlag,
		ltm.Active,
		1 As UserID,
		ltm.CreateDate,
		null UpdateDate,
		ltm.IsGroup,
		'Text' DataType
From dbo.mst_LabTestMaster ltm
GO
*/

CREATE VIEW [dbo].[PatientBaselineView]
AS
SELECT DISTINCT 
                         dbo.PatientHivDiagnosis.PatientId, dbo.PatientHivDiagnosis.Id, dbo.PatientHivDiagnosis.PatientMasterVisitId, dbo.PatientTransferIn.ServiceAreaId, 
                         dbo.PatientTransferIn.TransferInDate, dbo.PatientTransferIn.TreatmentStartDate, ISNULL(dbo.PatientTransferIn.CurrentTreatment, 0) AS CurrentTreatment,
                             (SELECT        Name + ' (' + DisplayName + ')' AS Expr1
                               FROM            dbo.LookupItem
                               WHERE        (Id = dbo.PatientTransferIn.CurrentTreatment)) AS CurrentTreatmentName, dbo.PatientTransferIn.FacilityFrom, dbo.PatientTransferIn.MFLCode, 
                         ISNULL(dbo.PatientTransferIn.CountyFrom, 0) AS CountyFrom, dbo.PatientTransferIn.TransferInNotes, dbo.PatientHivDiagnosis.HIVDiagnosisDate, 
                         dbo.PatientHivDiagnosis.EnrollmentDate, ISNULL(dbo.PatientHivDiagnosis.EnrollmentWHOStage, 0) AS EnrollmentWHOStage,
                             (SELECT        Name
                               FROM            dbo.LookupItem AS LookupItem_3
                               WHERE        (Id = dbo.PatientHivDiagnosis.EnrollmentWHOStage)) AS EnrollmentWHOStageName, dbo.PatientHivDiagnosis.ARTInitiationDate,
                             (SELECT        TOP (1) DispensedByDate
                               FROM            dbo.ord_PatientPharmacyOrder
                               WHERE        (PatientId = dbo.PatientHivDiagnosis.PatientId) AND (ptn_pharmacy_pk IN
                                                             (SELECT        ptn_pharmacy_pk
                                                               FROM            dbo.dtl_PatientPharmacyOrder
                                                               WHERE        (Prophylaxis = 0)))
                               ORDER BY ptn_pharmacy_pk) AS ARTInitiationDateNew, dbo.PatientTreatmentInitiation.DateStartedOnFirstLine, dbo.PatientTreatmentInitiation.Cohort, 
                         ISNULL(dbo.PatientTreatmentInitiation.Regimen, 0) AS Regimen,
                             (SELECT        Name + ' (' + DisplayName + ')' AS Expr1
                               FROM            dbo.LookupItem AS LookupItem_2
                               WHERE        (Id = dbo.PatientTreatmentInitiation.Regimen)) AS RegimenName, dbo.PatientTreatmentInitiation.BaselineViralload, 
                         dbo.PatientTreatmentInitiation.BaselineViralloadDate, dbo.PatientBaselineAssessment.HBVInfected, dbo.PatientBaselineAssessment.Pregnant, 
                         dbo.PatientBaselineAssessment.TBinfected, dbo.PatientBaselineAssessment.WHOStage,
                             (SELECT        Name
                               FROM            dbo.LookupItem AS LookupItem_1
                               WHERE        (Id = dbo.PatientBaselineAssessment.WHOStage)) AS WhoStageName, dbo.PatientBaselineAssessment.BreastFeeding, 
                         dbo.PatientBaselineAssessment.CD4Count, dbo.PatientBaselineAssessment.MUAC, dbo.PatientBaselineAssessment.Weight, 
                         dbo.PatientBaselineAssessment.Height, dbo.PatientBaselineAssessment.BMI, dbo.PatientTreatmentInitiation.ldl, dbo.PatientHivDiagnosis.HistoryARTUse
FROM            dbo.PatientHivDiagnosis LEFT OUTER JOIN
                         dbo.PatientTransferIn ON dbo.PatientHivDiagnosis.PatientId = dbo.PatientTransferIn.PatientId LEFT OUTER JOIN
                         dbo.PatientTreatmentInitiation ON dbo.PatientHivDiagnosis.PatientId = dbo.PatientTreatmentInitiation.PatientId LEFT OUTER JOIN
                         dbo.PatientBaselineAssessment ON dbo.PatientHivDiagnosis.PatientId = dbo.PatientBaselineAssessment.PatientId

GO
/****** Object:  View [dbo].[PatientICFView]    Script Date: 6/6/2018 12:35:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[PatientICFView]
AS
     SELECT Ptn_pk,
            Visit_Pk,
            Symptom,
            SymptomCategory
     FROM
     (
         SELECT Ptn_pk,
                Visit_Pk,
                'Presumed TB' AS Symptom,
                'TB Screening' AS SymptomCategory
         FROM dbo.DTL_FBCUSTOMFIELD_Intensive_Case_Finding AS n
         WHERE(Cough = 1)
         UNION
         SELECT DISTINCT
                Ptn_pk,
                Visit_Pk,
                'Presumed TB' AS Symptom,
                'TB Screening' AS SymptomCategory
         FROM dbo.DTL_FBCUSTOMFIELD_Intensive_Case_Finding AS n
         WHERE(Fever = 1)
         UNION
         SELECT DISTINCT
                Ptn_pk,
                Visit_Pk,
                'Presumed TB' AS Symptom,
                'TB Screening' AS SymptomCategory
         FROM dbo.DTL_FBCUSTOMFIELD_Intensive_Case_Finding AS n
         WHERE(WeightLoss = 1)
         UNION
         SELECT DISTINCT
                Ptn_pk,
                Visit_Pk,
                'Presumed TB' AS Symptom,
                'TB Screening' AS SymptomCategory
         FROM dbo.DTL_FBCUSTOMFIELD_Intensive_Case_Finding AS n
         WHERE(Sweat = 1)
         UNION
         SELECT DISTINCT
                Ptn_pk,
                Visit_Pk,
                'Presumed TB' AS Symptom,
                'TB Screening' AS SymptomCategory
         FROM dbo.DTL_FBCUSTOMFIELD_Intensive_Case_Finding AS n
         WHERE(ContactTB = 1)
         UNION
         SELECT DISTINCT
                Ptn_pk,
                Visit_Pk,
                'No signs' AS Symptom,
                'TB Screening' AS SymptomCategory
         FROM dbo.DTL_FBCUSTOMFIELD_Intensive_Case_Finding AS n
         WHERE(Cough = 0
               OR Cough IS NULL)
              AND (WeightLoss = 0
                   OR WeightLoss IS NULL)
              AND (Sweat = 0
                   OR Sweat IS NULL)
              AND (ContactTB = 0
                   OR ContactTB IS NULL)
              AND (Fever = 0
                   OR Fever IS NULL)
         UNION
         SELECT DISTINCT
                a.Ptn_pk,
                a.Visit_pk,
                b.Name AS Symptom,
                'TB Screening' AS SymptomCategory
         FROM dbo.dtl_PatientOtherTreatment AS a
              INNER JOIN dbo.mst_BlueDecode AS b ON a.TBStatus = b.ID
         WHERE(b.Name NOT IN('Not Done', 'TB Rx'))
         UNION
         SELECT Ptn_pk,
                Visit_Pk,
                'Yellow Urine' AS Symptom,
                'IPT Workup' AS SymptomCategory
         FROM dbo.DTL_FBCUSTOMFIELD_Intensive_Case_Finding AS n
         WHERE(YellowUrine = 1)
         UNION
         SELECT DISTINCT
                Ptn_pk,
                Visit_Pk,
                'Numbness Adult' AS Symptom,
                'IPT Workup' AS SymptomCategory
         FROM dbo.DTL_FBCUSTOMFIELD_Intensive_Case_Finding AS n
         WHERE(NumbnessAdult = 1)
         UNION
         SELECT DISTINCT
                Ptn_pk,
                Visit_Pk,
                'Numbness Peads' AS Symptom,
                'IPT Workup' AS SymptomCategory
         FROM dbo.DTL_FBCUSTOMFIELD_Intensive_Case_Finding AS n
         WHERE(NumbnessPead = 1)
         UNION
         SELECT DISTINCT
                Ptn_pk,
                Visit_Pk,
                'Yellow Eyes' AS Symptom,
                'IPT Workup' AS SymptomCategory
         FROM dbo.DTL_FBCUSTOMFIELD_Intensive_Case_Finding AS n
         WHERE(YellowEyes = 1)
         UNION
         SELECT DISTINCT
                Ptn_pk,
                Visit_Pk,
                'Tender Abdomen' AS Symptom,
                'IPT Workup' AS SymptomCategory
         FROM dbo.DTL_FBCUSTOMFIELD_Intensive_Case_Finding AS n
         WHERE(TenderAbdomen = 1)
         UNION
         SELECT b.ptn_pk,
                a.PatientMasterVisitId AS visit_pk,
                CASE
                    WHEN a.Cough = 1
                         OR a.NightSweats = 1
                         OR a.WeightLoss = 1
                         OR a.Fever = 1
                    THEN 'Presumed TB'
                    ELSE 'No signs'
                END AS Symptom,
                'TB Screening' AS SymptomCategory
         FROM dbo.PatientIcf AS a
              INNER JOIN dbo.PatientMasterVisit AS v ON v.Id = a.PatientMasterVisitId
                                                        AND a.PatientId = v.PatientId
              INNER JOIN dbo.Patient AS b ON a.PatientId = b.Id
                                             AND v.PatientId = b.Id
         UNION
         SELECT b.ptn_pk,
                a.PatientMasterVisitId AS visit_pk,
                'Yellow Urine' AS Symptom,
                'IPT Workup' AS SymptomCategory
         FROM dbo.PatientIptWorkup AS a
              INNER JOIN dbo.PatientMasterVisit AS v ON v.Id = a.PatientMasterVisitId
                                                        AND a.PatientId = v.PatientId
              INNER JOIN dbo.Patient AS b ON a.PatientId = b.Id
                                             AND v.PatientId = b.Id
         WHERE(a.YellowColouredUrine = 1)
         UNION
         SELECT b.ptn_pk,
                a.PatientMasterVisitId AS visit_pk,
                'Numbness' AS Symptom,
                'IPT Workup' AS SymptomCategory
         FROM dbo.PatientIptWorkup AS a
              INNER JOIN dbo.PatientMasterVisit AS v ON v.Id = a.PatientMasterVisitId
                                                        AND a.PatientId = v.PatientId
              INNER JOIN dbo.Patient AS b ON a.PatientId = b.Id
                                             AND v.PatientId = b.Id
         WHERE(a.Numbness = 1)
         UNION
         SELECT b.ptn_pk,
                a.PatientMasterVisitId AS visit_pk,
                'Yellow Eyes' AS Symptom,
                'IPT Workup' AS SymptomCategory
         FROM dbo.PatientIptWorkup AS a
              INNER JOIN dbo.PatientMasterVisit AS v ON v.Id = a.PatientMasterVisitId
                                                        AND a.PatientId = v.PatientId
              INNER JOIN dbo.Patient AS b ON a.PatientId = b.Id
                                             AND v.PatientId = b.Id
         WHERE(a.YellownessOfEyes = 1)
         UNION
         SELECT b.ptn_pk,
                a.PatientMasterVisitId AS visit_pk,
                'Tender Abdomen' AS Symptom,
                'IPT Workup' AS SymptomCategory
         FROM dbo.PatientIptWorkup AS a
              INNER JOIN dbo.PatientMasterVisit AS v ON v.Id = a.PatientMasterVisitId
                                                        AND a.PatientId = v.PatientId
              INNER JOIN dbo.Patient AS b ON a.PatientId = b.Id
                                             AND v.PatientId = b.Id
         WHERE(a.AbdominalTenderness = 1)
     ) AS a_1;
GO
/****** Object:  View [dbo].[PatientIdentifierView]    Script Date: 6/6/2018 12:35:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[PatientIdentifierView] as
Select  B.Id
	  ,A.Id PatientId
	  ,A.PersonId
	  ,A.Ptn_PK Ptn_Pk
	  ,C.Id IdentifierId
	  ,C.Code IdentifierCode
	  ,C.Name IdentifierName
	  ,B.IdentifierValue
	  ,B.Active IdentifierActive
	  ,B.AssigningFacility
	  ,B.PatientEnrollmentId EnrollmentId
	  ,AssigningAuthority
From Patient A
Inner Join PatientIdentifier B On A.Id = B.PatientId
Inner Join Identifiers C On C.Id = B.IdentifierTypeId
Where B.DeleteFlag = 0
And A.DeleteFlag = 0
And C.DeleteFlag = 0
And C.IdentifierType = 1



GO
/****** Object:  View [dbo].[PatientPersonView]    Script Date: 6/6/2018 12:35:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[PatientPersonView]
AS


Select A.Id
	, A.PersonId
	, A.ptn_pk
	, A.PatientIndex
	,(Select Top 1 Name From Lookupitem Where Id = A.PatientType) PatientTypeName
	,A.PatientType
	,A.FacilityId
	  ,cast(decryptbykey(FirstName) As varchar(50)) As FirstName
	  ,cast(decryptbykey(MidName) As varchar(50)) As MiddleName
	  ,cast(decryptbykey(LastName) As varchar(50)) As LastName
	  ,(Select Top 1 Name From Lookupitem Where Id = B.Sex)  SexName
	  , B.Sex
	  ,A.Active
	  ,A.DeleteFlag
	  ,A.CreateDate
	  ,A.CreatedBy
	  ,A.AuditData
	  ,Isnull(A.DateOfBirth,B.DateOfBirth) DateOfBirth
	  ,Isnull(A.DobPrecision,B.DobPrecision) DobPrecision
	  ,cast(decryptbykey(A.NationalId) As varchar(50)) As NationalId
	  ,A.RegistrationDate
From Patient A inner join dbo.Person B On A.PersonId=B.Id




GO
/****** Object:  View [dbo].[PatientRegistrationView]    Script Date: 6/6/2018 12:35:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[PatientRegistrationView]
AS
SELECT        Id, ptn_pk, PersonId, PatientIndex, PatientType, FacilityId, Active, DateOfBirth, DobPrecision, CAST(DECRYPTBYKEY(NationalId) AS VARCHAR(50)) AS NationalId, DeleteFlag, CreatedBy, CreateDate, AuditData, 
                         RegistrationDate
FROM            dbo.Patient

GO
/****** Object:  View [dbo].[PatientStabilitySummary]    Script Date: 6/6/2018 12:35:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[PatientStabilitySummary]
AS
SELECT        ROW_NUMBER() OVER (ORDER BY Category) AS Id, count(*) AS Value, Category
FROM            (SELECT        CASE WHEN C.Id IS NULL OR
                                                    C.Categorization = 2 THEN 'Unstable' ELSE 'Stable' END AS Category
                          FROM            PatientEnrollment PE INNER JOIN
                                                    dbo.Patient PT ON PT.Id = pe.PatientId INNER JOIN
                                                    dbo.PatientIdentifier PI ON PE.Id = PI.PatientEnrollmentId INNER JOIN
                                                    dbo.Identifiers IE ON PI.IdentifierTypeId = IE.Id LEFT OUTER JOIN
                                                        (SELECT        PatientId, Id, Categorization, row_number() OVER (Partition BY PatientId
                                                          ORDER BY DateAssessed DESC) RowNum
                          FROM            PatientCategorization) C ON C.PatientId = Pe.PatientId AND C.RowNum = 1
WHERE        ServiceAreaId = 1 AND IE.Name = 'CCC Registration Number' AND PT.DeleteFlag = 0 AND DATEDIFF(MONTH, PE.EnrollmentDate, GETDATE()) > 12 AND PE.CareEnded = 0
UNION ALL
select case when (LUI.Name = 'Stage1' OR LUI.Name = 'Stage2') AND (PB.CD4Count > 200) Then 'Well'
when (LUI.Name = 'Stage3' OR LUI.Name = 'Stage4') OR (PB.CD4Count <= 200) Then 'Advanced'
ELSE 'Unknown (Missing Baseline WHO Stage or CD4)' END AS Category 
from PatientBaselineAssessment PB 
inner join LookUpItem LUI on PB.WHOStage = LUI.Id
inner join PatientEnrollment PE on PB.PatientId = PE.PatientID
where DATEDIFF(MONTH, PE.EnrollmentDate, GETDATE()) <= 12 AND PE.CareEnded = 0
) AS Categorization
GROUP BY Category

GO
/****** Object:  View [dbo].[PatientTreatmentSupporterView]    Script Date: 6/6/2018 12:35:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[PatientTreatmentSupporterView]
AS
SELECT        Id, PersonId, SupporterId, CAST(DECRYPTBYKEY(MobileContact) AS VARCHAR(50)) AS MobileContact, DeleteFlag, CreatedBy, CreateDate, AuditData
FROM            dbo.PatientTreatmentSupporter


GO
/****** Object:  View [dbo].[PatientView]    Script Date: 6/6/2018 12:35:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[PatientView]
AS
Select	Ptn_Pk
	,	cast(decryptbykey(FirstName) As varchar(50))	As FirstName
	,	cast(decryptbykey(LastName) As varchar(50))		As LastName
	,	cast(decryptbykey(MiddleName) As varchar(50))	As MiddleName
	,	cast(decryptbykey(FirstName) As varchar(50)) + ' '+Isnull(cast(decryptbykey(MiddleName) As varchar(50)) ,'') + cast(decryptbykey(LastName) As varchar(50))		As PatientName
	,	LocationId
	,	IQNumber
	,	RegistrationDate
	,	DOB
	,	Case Sex
			When 16 Then 'Male'
			Else 'Female'
		End												As Sex
	,	DobPrecision
	,	DateOfDeath
	,	MaritalStatus
	,	Sex												As SexId
	,	Nullif(Convert(varchar(100), Decryptbykey([Address])),'') As [Address]
	,	Nullif(Convert(varchar(100), Decryptbykey(Phone)),'') As Phone
	,	PatientFacilityId
	,	UserId
	,	CreateDate
	,	UpdateDate
	,	DeleteFlag
	,	Status
	,	PatientEnrollmentID
	,CardSerialNumber
From mst_Patient
Where (DeleteFlag = 0 Or DeleteFlag Is Null)
GO


/****** Object:  View [dbo].[PatientVisitView]    Script Date: 6/6/2018 12:35:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


Create VIEW [dbo].[PatientVisitView]
AS
Select	V.Visit_Id		VisitId
	,	VisitName
	,	V.Ptn_Pk		PatientId
	,	V.LocationID	LocationId
	,	V.VisitDate
	,	Isnull(V.DataQuality,0) DataQuality
	,	Isnull(V.Signature,0) [Signature]
	,	V.CreateDate
	,	V.UserID		UserId
	,	Cast(Isnull(V.DeleteFlag,0) as bit) DeleteFlag
From Ord_visit V
Inner Join mst_VisitType T On T.VisitTypeID = V.VisitType
Where V.Ptn_Pk > 0


GO
/****** Object:  View [dbo].[PersonContactView]    Script Date: 6/6/2018 12:35:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[PersonContactView]
AS
SELECT        Id, PersonId, CAST(DECRYPTBYKEY(PhysicalAddress) AS VARCHAR(50)) AS PhysicalAddress, CAST(DECRYPTBYKEY(MobileNumber) AS VARCHAR(50)) AS MobileNumber, 
                         CAST(DECRYPTBYKEY(AlternativeNumber) AS VARCHAR(50)) AS AlternativeNumber, CAST(DECRYPTBYKEY(EmailAddress) AS VARCHAR(50)) AS EmailAddress, Active, DeleteFlag, CreatedBy, CreateDate
FROM            dbo.PersonContact


GO
/****** Object:  View [dbo].[PersonIdentifierView]    Script Date: 6/6/2018 12:35:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[PersonIdentifierView] as
Select B.Id
	  ,A.Id PersonId
	  ,P.Id PatientId
	  ,P.Ptn_PK Ptn_Pk
	  ,C.Id IdentifierId
	  ,C.Code IdentifierCode
	  ,C.Name IdentifierName
	  ,B.IdentifierValue
	  ,B.Active IdentifierActive
	  ,B.AssigningFacility
	  ,isnull(C.AssigningAuthority, '') AssigningAuthority
From Person A
Inner Join PersonIdentifier B On A.Id = B.PersonId
Inner Join Identifiers C On C.Id = B.IdentifierId
Left Outer Join Patient P On P.PersonId = A.Id
Where B.DeleteFlag = 0
And A.DeleteFlag = 0
And C.DeleteFlag = 0
And C.IdentifierType = 2




GO
/****** Object:  View [dbo].[PSmartAuthUser]    Script Date: 6/6/2018 12:35:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-------   
CREATE VIEW [dbo].[PSmartAuthUser]
AS
SELECT        
	UserID as userId,
	UserName,
	UserFirstName +' '+ UserLastName [DisplayName],
	[Password],
	(SELECT top 1 PosID FROM mst_Facility WHERE DeleteFlag=0) FACILITY
FROM 
	dbo.mst_User where DeleteFlag = 0


GO
/****** Object:  View [dbo].[ServiceAreaBusinessRuleView]    Script Date: 6/6/2018 12:35:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE VIEW [dbo].[ServiceAreaBusinessRuleView]
AS
Select	SR.Id
	,	SR.BusRuleId
	,	R.Name			As BusRuleName
	,	R.DeleteFlag	As BusRuleDeleteFlag
	,	R.ReferenceId	As BusRuleReferenceId
	,	SR.Value
	,	SR.Value1
	,	SR.SetType
	,	M.ModuleId		As ModuleId
	,	M.ModuleName	
	,	M.DisplayName	
	,	M.CanEnroll	
From lnk_ServiceBusinessRule As SR
Inner Join mst_module As M On M.ModuleId = SR.ModuleId
Inner Join Mst_BusinessRule As R On R.Id = SR.BusRuleId


GO
/****** Object:  View [dbo].[view_patientVisit]    Script Date: 6/6/2018 12:35:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[view_patientVisit]
AS
SELECT        TOP (100) PERCENT dbo.PatientMasterVisit.id AS visitID, 'Green Card' AS VisitName, dbo.PatientMasterVisit.patientId, dbo.PatientMasterVisit.visitDate, 
                         dbo.mst_User.UserName, dbo.PatientMasterVisit.DeleteFlag
FROM            dbo.PatientMasterVisit INNER JOIN
                         dbo.mst_User ON dbo.PatientMasterVisit.createdBy = dbo.mst_User.UserID
WHERE        (dbo.PatientMasterVisit.visitDate IS NOT NULL) AND (dbo.PatientMasterVisit.DeleteFlag IS NULL OR
                         dbo.PatientMasterVisit.DeleteFlag = 0 AND dbo.PatientMasterVisit.VisitType NOT IN(SELECT Id FROM LookupItem WHERE Name='Enrollment'))



GO
/****** Object:  View [dbo].[vw_BillingPricePlan]    Script Date: 6/6/2018 12:35:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vw_BillingPricePlan]
AS

Select	D.ID Id,
		D.Name ,
		D.SRNo OrdRank,
		D.Code Code,
		D.CodeID CodeId,
		D.DeleteFlag
From mst_Decode D Inner Join mst_Code C On D.CodeID = C.CodeID And C.Name='Billing Price Plans';


GO
/****** Object:  View [dbo].[VW_FieldCareEndConditionalField]    Script Date: 6/6/2018 12:35:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VW_FieldCareEndConditionalField]
AS
SELECT Lnk_Forms.FieldId, Lnk_Forms.FieldLabel, dbo.lnk_CareEndConditionalFields.FieldId AS ConditionalFieldId,dbo.lnk_CareEndConditionalFields.FieldLabel AS ConditionalFieldLabel, 
CASE Lnk_Forms.Predefined WHEN 1 THEN Mst_PredefinedFields_1.PdfName WHEN 0 THEN Mst_CustomFormField_1.FieldName END AS FieldName, 
CASE Lnk_Forms.Predefined WHEN 1 THEN Mst_PredefinedFields_1.PdfTableName WHEN 0 THEN 'dtl_CustomField' END AS FieldSavingTable, 
CASE dbo.lnk_CareEndConditionalFields.Predefined WHEN 1 THEN dbo.Mst_PredefinedFields.PdfName WHEN 0 THEN dbo.Mst_CustomFormField.FieldName END AS ConditionalFieldName,
CASE dbo.lnk_CareEndConditionalFields.Predefined WHEN 1 THEN dbo.Mst_PredefinedFields.PdfTableName WHEN 0 THEN 'dtl_CustomField' END AS ConditionalFieldSavingTable,
CASE Lnk_Forms.Predefined WHEN 1 THEN Mst_PredefinedFields_1.ControlId WHEN 0 THEN Mst_CustomFormField_1.ControlId END AS FieldControlId, 
CASE Lnk_Forms.Predefined WHEN 1 THEN Mst_PredefinedFields_1.BindTable WHEN 0 THEN 'Mst_ModDecode' END AS FieldBindTable, 
CASE Lnk_Forms.Predefined WHEN 1 THEN Mst_PredefinedFields_1.ModuleId  WHEN 0 THEN 0 END AS FieldModuleId, 
CASE Lnk_Forms.Predefined WHEN 1 THEN Mst_PredefinedFields_1.CategoryId WHEN 0 THEN 0 END AS FieldCategoryId, 
CASE Lnk_Forms.Predefined WHEN 1 THEN Mst_PredefinedFields_1.BindField WHEN 0 THEN '' END AS FieldBindField, 
CASE dbo.lnk_CareEndConditionalFields.Predefined WHEN 1 THEN dbo.Mst_PredefinedFields.ControlId WHEN 0 THEN dbo.Mst_CustomFormField.ControlId END AS ConditionalFieldControlId,
CASE dbo.lnk_CareEndConditionalFields.Predefined WHEN 1 THEN dbo.Mst_PredefinedFields.BindTable WHEN 0 THEN dbo.Mst_CustomFormField.BindTable END AS ConditionalFieldBindTable,
CASE dbo.lnk_CareEndConditionalFields.Predefined WHEN 1 THEN dbo.Mst_PredefinedFields.ModuleId WHEN 0 THEN 0 END AS ConditionalFieldModuleId, 
CASE dbo.lnk_CareEndConditionalFields.Predefined WHEN 1 THEN dbo.Mst_PredefinedFields.CategoryId WHEN 0 THEN dbo.Mst_CustomFormField.CategoryId END AS ConditionalFieldCategoryId,
CASE dbo.lnk_CareEndConditionalFields.Predefined WHEN 1 THEN dbo.Mst_PredefinedFields.BindField WHEN 0 THEN '' END AS ConditionalFieldBindField, 
Lnk_Forms.FeatureId, dbo.mst_Section.SectionID AS FieldSectionId, dbo.mst_Section.SectionName AS FieldSectionName, 
dbo.lnk_CareEndConditionalFields.SectionId AS ConditionalFieldSectionId, Lnk_Forms.Predefined AS FieldPredefined, 
dbo.lnk_CareEndConditionalFields.Predefined AS ConditionalFieldPredefined, dbo.mst_Section.Seq AS FieldSectionSequence, 
dbo.lnk_CareEndConditionalFields.Seq AS ConditionalFieldSequence
FROM dbo.Mst_PreDefinedFields AS Mst_PreDefinedFields_1 RIGHT OUTER JOIN
dbo.mst_CustomformField AS mst_CustomformField_1 RIGHT OUTER JOIN
dbo.lnk_CareEndConditionalFields RIGHT OUTER JOIN
(SELECT FeatureId, SectionId, FieldId, FieldLabel, UserId, CreateDate, Predefined, Seq
FROM  dbo.Lnk_Forms AS z
UNION
SELECT     a.FeatureId, a.SectionId, b.FieldId, b.FieldLabel, b.UserId, b.CreateDate, b.Predefined, b.Seq
FROM dbo.Lnk_Forms AS a INNER JOIN
dbo.lnk_CareEndConditionalFields AS b ON a.FieldId = b.ConfieldId) AS Lnk_Forms LEFT OUTER JOIN
dbo.mst_Section ON Lnk_Forms.SectionId = dbo.mst_Section.SectionID ON dbo.lnk_CareEndConditionalFields.Conpredefine = Lnk_Forms.Predefined AND 
dbo.lnk_CareEndConditionalFields.ConfieldId = Lnk_Forms.FieldId LEFT OUTER JOIN
dbo.mst_CustomformField ON dbo.lnk_CareEndConditionalFields.FieldId = dbo.mst_CustomformField.Id LEFT OUTER JOIN
dbo.Mst_PreDefinedFields ON dbo.lnk_CareEndConditionalFields.FieldId = dbo.Mst_PreDefinedFields.Id ON mst_CustomformField_1.Id = Lnk_Forms.FieldId ON 
Mst_PreDefinedFields_1.Id = Lnk_Forms.FieldId
UNION
SELECT     dbo.Lnk_CareEndForm.FieldId, dbo.Lnk_CareEndForm.FieldLabel, dbo.lnk_CareEndConditionalFields.FieldId AS ConditionalFieldId, 
dbo.lnk_CareEndConditionalFields.FieldLabel AS ConditionalFieldLabel, 
CASE dbo.Lnk_CareEndForm.Predefined WHEN 1 THEN Mst_PredefinedFields_1.PdfName WHEN 0 THEN Mst_CustomFormField_1.FieldName END AS FieldName, 
CASE dbo.Lnk_CareEndForm.Predefined WHEN 1 THEN Mst_PredefinedFields_1.PdfTableName WHEN 0 THEN 'dt_CustomField' END AS FieldSavingTable, 
CASE dbo.lnk_CareEndConditionalFields.Predefined WHEN 1 THEN dbo.Mst_PredefinedFields.PdfName WHEN 0 THEN dbo.Mst_CustomFormField.FieldName END AS ConditionalFieldName,
CASE dbo.lnk_CareEndConditionalFields.Predefined WHEN 1 THEN dbo.Mst_PredefinedFields.PdfTableName WHEN 0 THEN 'dtl_CustomField' END AS ConditionalFieldSavingTable,
CASE dbo.Lnk_CareEndForm.Predefined WHEN 1 THEN Mst_PredefinedFields_1.ControlId WHEN 0 THEN Mst_CustomFormField_1.ControlId END AS FieldControlId, 
CASE dbo.Lnk_CareEndForm.Predefined WHEN 1 THEN Mst_PredefinedFields_1.BindTable WHEN 0 THEN 'Mst_ModDecode' END AS FieldBindTable, 
CASE dbo.Lnk_CareEndForm.Predefined WHEN 1 THEN Mst_PredefinedFields_1.ModuleId WHEN 0 THEN 0 END AS FieldModuleId, 
CASE dbo.Lnk_CareEndForm.Predefined WHEN 1 THEN Mst_PredefinedFields_1.CategoryId WHEN 0 THEN 0 END AS FieldCategoryId, 
CASE dbo.Lnk_CareEndForm.Predefined WHEN 1 THEN Mst_PredefinedFields_1.BindField WHEN 0 THEN '' END AS FieldBindField, 
CASE dbo.lnk_CareEndConditionalFields.Predefined WHEN 1 THEN dbo.Mst_PredefinedFields.ControlId WHEN 0 THEN dbo.Mst_CustomFormField.ControlId END AS ConditionalFieldControlId,
CASE dbo.lnk_CareEndConditionalFields.Predefined WHEN 1 THEN dbo.Mst_PredefinedFields.BindTable WHEN 0 THEN dbo.Mst_CustomFormField.BindTable END AS
ConditionalFieldBindTable, 
CASE dbo.lnk_CareEndConditionalFields.Predefined WHEN 1 THEN dbo.Mst_PredefinedFields.ModuleId WHEN 0 THEN 0 END AS ConditionalFieldModuleId, 
CASE dbo.lnk_CareEndConditionalFields.Predefined WHEN 1 THEN dbo.Mst_PredefinedFields.CategoryId WHEN 0 THEN dbo.Mst_CustomFormField.CategoryId END AS
ConditionalFieldCategoryId, 
CASE dbo.lnk_CareEndConditionalFields.Predefined WHEN 1 THEN dbo.Mst_PredefinedFields.BindField WHEN 0 THEN '' END AS ConditionalFieldBindField, 
dbo.Lnk_CareEndForm.FeatureId, dbo.mst_Section.SectionID AS FieldSectionId, dbo.mst_Section.SectionName AS FieldSectionName, 
dbo.lnk_CareEndConditionalFields.SectionId AS ConditionalFieldSectionId, dbo.Lnk_CareEndForm.Predefined AS FieldPredefined, 
dbo.lnk_CareEndConditionalFields.Predefined AS ConditionalFieldPredefined, dbo.mst_Section.Seq AS FieldSectionSequence, 
dbo.lnk_CareEndConditionalFields.Seq AS ConditionalFieldSequence
FROM dbo.Mst_PreDefinedFields AS Mst_PreDefinedFields_1 RIGHT OUTER JOIN
dbo.mst_CustomformField AS mst_CustomformField_1 RIGHT OUTER JOIN
dbo.lnk_CareEndConditionalFields RIGHT OUTER JOIN
dbo.Lnk_CareEndForm LEFT OUTER JOIN
dbo.mst_Section ON dbo.Lnk_CareEndForm.SectionId = dbo.mst_Section.SectionID ON 
dbo.lnk_CareEndConditionalFields.Conpredefine = dbo.Lnk_CareEndForm.Predefined AND 
dbo.lnk_CareEndConditionalFields.ConfieldId = dbo.Lnk_CareEndForm.FieldId LEFT OUTER JOIN
dbo.mst_CustomformField ON dbo.lnk_CareEndConditionalFields.FieldId = dbo.mst_CustomformField.Id LEFT OUTER JOIN
dbo.Mst_PreDefinedFields ON dbo.lnk_CareEndConditionalFields.FieldId = dbo.Mst_PreDefinedFields.Id ON 
mst_CustomformField_1.Id = dbo.Lnk_CareEndForm.FieldId ON Mst_PreDefinedFields_1.Id = dbo.Lnk_CareEndForm.FieldId
GO
/****** Object:  View [dbo].[VW_FieldConditionalField]    Script Date: 6/6/2018 12:35:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[VW_FieldConditionalField]
AS
SELECT     Lnk_Forms.FieldId, Lnk_Forms.FieldLabel, dbo.Lnk_Conditionalfields.FieldId AS ConditionalFieldId, dbo.Lnk_Conditionalfields.FieldLabel AS ConditionalFieldLabel, 
                      CASE Lnk_Forms.Predefined WHEN 1 THEN Mst_PredefinedFields_1.PdfName WHEN 0 THEN Mst_CustomFormField_1.FieldName END AS FieldName, 
                      CASE Lnk_Forms.Predefined WHEN 1 THEN Mst_PredefinedFields_1.PdfTableName WHEN 0 THEN 'dt_CustomField' END AS FieldSavingTable, 
                      CASE dbo.Lnk_ConditionalFields.Predefined WHEN 1 THEN dbo.Mst_PredefinedFields.PdfName WHEN 0 THEN dbo.Mst_CustomFormField.FieldName END AS ConditionalFieldName,
                      CASE dbo.Lnk_ConditionalFields.Predefined WHEN 1 THEN dbo.Mst_PredefinedFields.PdfTableName WHEN 0 THEN 'dtl_CustomField' END AS ConditionalFieldSavingTable,
                      CASE Lnk_Forms.Predefined WHEN 1 THEN Mst_PredefinedFields_1.ControlId WHEN 0 THEN Mst_CustomFormField_1.ControlId END AS FieldControlId, 
                      CASE Lnk_Forms.Predefined WHEN 1 THEN Mst_PredefinedFields_1.BindTable WHEN 0 THEN 'Mst_ModDecode' END AS FieldBindTable, 
                      CASE Lnk_Forms.Predefined WHEN 1 THEN Mst_PredefinedFields_1.ModuleId WHEN 0 THEN 0 END AS FieldModuleId, 
                      CASE Lnk_Forms.Predefined WHEN 1 THEN Mst_PredefinedFields_1.CategoryId WHEN 0 THEN 0 END AS FieldCategoryId, 
                      CASE Lnk_Forms.Predefined WHEN 1 THEN Mst_PredefinedFields_1.BindField WHEN 0 THEN '' END AS FieldBindField, 
                      CASE dbo.Lnk_ConditionalFields.Predefined WHEN 1 THEN dbo.Mst_PredefinedFields.ControlId WHEN 0 THEN dbo.Mst_CustomFormField.ControlId END AS ConditionalFieldControlId,
                      CASE dbo.Lnk_ConditionalFields.Predefined WHEN 1 THEN dbo.Mst_PredefinedFields.BindTable WHEN 0 THEN dbo.Mst_CustomFormField.BindTable END AS ConditionalFieldBindTable,
                      CASE dbo.Lnk_ConditionalFields.Predefined WHEN 1 THEN dbo.Mst_PredefinedFields.ModuleId  WHEN 0 THEN 0 END AS ConditionalFieldModuleId, 
                      CASE dbo.Lnk_ConditionalFields.Predefined WHEN 1 THEN dbo.Mst_PredefinedFields.CategoryId WHEN 0 THEN dbo.Mst_CustomFormField.CategoryId END AS ConditionalFieldCategoryId,
                      CASE dbo.Lnk_ConditionalFields.Predefined WHEN 1 THEN dbo.Mst_PredefinedFields.BindField WHEN 0 THEN '' END AS ConditionalFieldBindField, 
                      Lnk_Forms.FeatureId, dbo.mst_Section.SectionID AS FieldSectionId, dbo.mst_Section.SectionName AS FieldSectionName, 
                      dbo.Lnk_Conditionalfields.SectionId AS ConditionalFieldSectionId, Lnk_Forms.Predefined AS FieldPredefined, 
                      dbo.Lnk_Conditionalfields.Predefined AS ConditionalFieldPredefined, dbo.mst_Section.Seq AS FieldSectionSequence, 
                      dbo.Lnk_Conditionalfields.Seq AS ConditionalFieldSequence, Lnk_Forms.TabId AS TabId, Lnk_Forms.TabName AS TabName
					  FROM dbo.Mst_PreDefinedFields AS Mst_PreDefinedFields_1 RIGHT OUTER JOIN
                      dbo.mst_CustomformField AS mst_CustomformField_1 RIGHT OUTER JOIN
                      dbo.Lnk_Conditionalfields RIGHT OUTER JOIN
                          (SELECT z.FeatureId, z.SectionId, z.FieldId, z.FieldLabel, z.UserId, z.CreateDate, z.Predefined, z.Seq, lnkTab.TabId, mstTab.TabName
                            FROM dbo.Lnk_Forms AS z 
							 INNER JOIN dbo.lnk_FormTabSection lnkTab on z.FeatureId=lnkTab.FeatureId and z.SectionId=lnkTab.SectionId          
							 INNER JOIN dbo.Mst_FormBuilderTab mstTab on lnkTab.TabId=mstTab.TabId
                            UNION
                            SELECT a.FeatureId, a.SectionId, b.FieldId, b.FieldLabel, b.UserId, b.CreateDate, b.Predefined, b.Seq,lnkTab.TabId, mstTab.TabName
                            FROM dbo.Lnk_Forms AS a INNER JOIN
                            dbo.Lnk_Conditionalfields AS b ON a.FieldId = b.ConfieldId 
							INNER JOIN dbo.lnk_FormTabSection lnkTab on a.FeatureId=lnkTab.FeatureId and a.SectionId=lnkTab.SectionId          
							INNER JOIN dbo.Mst_FormBuilderTab mstTab on lnkTab.TabId=mstTab.TabId) AS Lnk_Forms LEFT OUTER JOIN
                      dbo.mst_Section ON Lnk_Forms.SectionId = dbo.mst_Section.SectionID ON dbo.Lnk_Conditionalfields.Conpredefine = Lnk_Forms.Predefined AND 
                      dbo.Lnk_Conditionalfields.ConfieldId = Lnk_Forms.FieldId LEFT OUTER JOIN
                      dbo.mst_CustomformField ON dbo.Lnk_Conditionalfields.FieldId = dbo.mst_CustomformField.Id LEFT OUTER JOIN
                      dbo.Mst_PreDefinedFields ON dbo.Lnk_Conditionalfields.FieldId = dbo.Mst_PreDefinedFields.Id ON mst_CustomformField_1.Id = Lnk_Forms.FieldId ON 
                      Mst_PreDefinedFields_1.Id = Lnk_Forms.FieldId
UNION
					  SELECT     dbo.Lnk_CareEndForm.FieldId, dbo.Lnk_CareEndForm.FieldLabel, dbo.lnk_CareEndConditionalFields.FieldId AS ConditionalFieldId, 
                      dbo.lnk_CareEndConditionalFields.FieldLabel AS ConditionalFieldLabel, 
                      CASE dbo.Lnk_CareEndForm.Predefined WHEN 1 THEN Mst_PredefinedFields_1.PdfName WHEN 0 THEN Mst_CustomFormField_1.FieldName END AS FieldName, 
                      CASE dbo.Lnk_CareEndForm.Predefined WHEN 1 THEN Mst_PredefinedFields_1.PdfTableName WHEN 0 THEN 'dt_CustomField' END AS FieldSavingTable, 
                      CASE dbo.lnk_CareEndConditionalFields.Predefined WHEN 1 THEN dbo.Mst_PredefinedFields.PdfName WHEN 0 THEN dbo.Mst_CustomFormField.FieldName END AS ConditionalFieldName,
                       CASE dbo.lnk_CareEndConditionalFields.Predefined WHEN 1 THEN dbo.Mst_PredefinedFields.PdfTableName WHEN 0 THEN 'dtl_CustomField' END AS ConditionalFieldSavingTable,
                       CASE dbo.Lnk_CareEndForm.Predefined WHEN 1 THEN Mst_PredefinedFields_1.ControlId WHEN 0 THEN Mst_CustomFormField_1.ControlId END AS FieldControlId, 
                      CASE dbo.Lnk_CareEndForm.Predefined WHEN 1 THEN Mst_PredefinedFields_1.BindTable WHEN 0 THEN 'Mst_ModDecode' END AS FieldBindTable, 
                      CASE dbo.Lnk_CareEndForm.Predefined WHEN 1 THEN Mst_PredefinedFields_1.ModuleId WHEN 0 THEN 0 END AS FieldModuleId, 
                      CASE dbo.Lnk_CareEndForm.Predefined WHEN 1 THEN Mst_PredefinedFields_1.CategoryId WHEN 0 THEN 0 END AS FieldCategoryId, 
                      CASE dbo.Lnk_CareEndForm.Predefined WHEN 1 THEN Mst_PredefinedFields_1.BindField WHEN 0 THEN '' END AS FieldBindField, 
                      CASE dbo.lnk_CareEndConditionalFields.Predefined WHEN 1 THEN dbo.Mst_PredefinedFields.ControlId WHEN 0 THEN dbo.Mst_CustomFormField.ControlId END AS ConditionalFieldControlId,
                       CASE dbo.lnk_CareEndConditionalFields.Predefined WHEN 1 THEN dbo.Mst_PredefinedFields.BindTable WHEN 0 THEN dbo.Mst_CustomFormField.BindTable END AS
                       ConditionalFieldBindTable, 
                      CASE dbo.lnk_CareEndConditionalFields.Predefined WHEN 1 THEN dbo.Mst_PredefinedFields.ModuleId WHEN 0 THEN 0 END AS ConditionalFieldModuleId, 
                      CASE dbo.lnk_CareEndConditionalFields.Predefined WHEN 1 THEN dbo.Mst_PredefinedFields.CategoryId WHEN 0 THEN dbo.Mst_CustomFormField.CategoryId END AS
                       ConditionalFieldCategoryId, 
                      CASE dbo.lnk_CareEndConditionalFields.Predefined WHEN 1 THEN dbo.Mst_PredefinedFields.BindField WHEN 0 THEN '' END AS ConditionalFieldBindField, 
                      dbo.Lnk_CareEndForm.FeatureId, dbo.mst_Section.SectionID AS FieldSectionId, dbo.mst_Section.SectionName AS FieldSectionName, 
                      dbo.lnk_CareEndConditionalFields.SectionId AS ConditionalFieldSectionId, dbo.Lnk_CareEndForm.Predefined AS FieldPredefined, 
                      dbo.lnk_CareEndConditionalFields.Predefined AS ConditionalFieldPredefined, dbo.mst_Section.Seq AS FieldSectionSequence, 
                      dbo.lnk_CareEndConditionalFields.Seq AS ConditionalFieldSequence, '' AS TabId, '' AS TabName
					  FROM  dbo.Mst_PreDefinedFields AS Mst_PreDefinedFields_1 RIGHT OUTER JOIN
                      dbo.mst_CustomformField AS mst_CustomformField_1 RIGHT OUTER JOIN
                      dbo.lnk_CareEndConditionalFields RIGHT OUTER JOIN
                      dbo.Lnk_CareEndForm LEFT OUTER JOIN
                      dbo.mst_Section ON dbo.Lnk_CareEndForm.SectionId = dbo.mst_Section.SectionID ON 
                      dbo.lnk_CareEndConditionalFields.Conpredefine = dbo.Lnk_CareEndForm.Predefined AND 
                      dbo.lnk_CareEndConditionalFields.ConfieldId = dbo.Lnk_CareEndForm.FieldId LEFT OUTER JOIN
                      dbo.mst_CustomformField ON dbo.lnk_CareEndConditionalFields.FieldId = dbo.mst_CustomformField.Id LEFT OUTER JOIN
                      dbo.Mst_PreDefinedFields ON dbo.lnk_CareEndConditionalFields.FieldId = dbo.Mst_PreDefinedFields.Id ON 
                      mst_CustomformField_1.Id = dbo.Lnk_CareEndForm.FieldId ON Mst_PreDefinedFields_1.Id = dbo.Lnk_CareEndForm.FieldId

GO
/****** Object:  View [dbo].[vw_GenNewId]    Script Date: 6/6/2018 12:35:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
create view [dbo].[vw_GenNewId] as 
select 	Random_String =
	substring(x,(abs(checksum(newid()))%37)+1,1)+
	substring(x,(abs(checksum(newid()))%37)+1,1)+
	substring(x,(abs(checksum(newid()))%37)+1,1)+
	substring(x,(abs(checksum(newid()))%37)+1,1)+	
	substring(x,(abs(checksum(newid()))%37)+1,1)+
	substring(x,(abs(checksum(newid()))%37)+1,1)+
	substring(x,(abs(checksum(newid()))%37)+1,1)+
	substring(x,(abs(checksum(newid()))%37)+1,1)+
	substring(x,(abs(checksum(newid()))%37)+1,1)+
	substring(x,(abs(checksum(newid()))%37)+1,1)+
	substring(x,(abs(checksum(newid()))%37)+1,1)
from   (select x='49ABCFGHIJKDEL5678MNOPQRSTUVWXYZ0123') a
GO
/****** Object:  View [dbo].[VW_ICDList]    Script Date: 6/6/2018 12:35:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VW_ICDList]
AS
SELECT     dbo.lnk_FieldICDCode.FieldId, dbo.Mst_ICDCodeBlocks.Code + ' ' + dbo.Mst_ICDCodeBlocks.Name AS BlockName, 
                      dbo.Mst_ICDCodeSubBlock.Code + ' ' + dbo.Mst_ICDCodeSubBlock.Name AS SubBlockName, 
                      dbo.mst_ICDCodes.Code + ' ' + dbo.mst_ICDCodes.Name AS ICDCodeName, dbo.Mst_ICDCodeBlocks.BlockId, dbo.Mst_ICDCodeSubBlock.SubBlockId, 
                      dbo.mst_ICDCodes.Id, 
                      CASE WHEN dbo.Lnk_FieldICDCode.BlockId > 0 THEN dbo.Mst_ICDCodeBlocks.Code + ' ' + dbo.Mst_ICDCodeBlocks.Name WHEN dbo.Lnk_FieldICDCode.SubBlockId >
                       0 THEN dbo.Mst_ICDCodeSubBlock.Code + ' ' + dbo.Mst_ICDCodeSubBlock.Name WHEN dbo.Lnk_FieldICDCode.CodeId > 0 THEN dbo.mst_ICDCodes.Code + ' ' + dbo.mst_ICDCodes.Name
                       END AS BindField, dbo.lnk_FieldICDCode.Predefined, dbo.lnk_FieldICDCode.DeleteFlag
FROM         dbo.lnk_FieldICDCode LEFT OUTER JOIN
                      dbo.mst_ICDCodes ON dbo.lnk_FieldICDCode.CodeId = dbo.mst_ICDCodes.Id LEFT OUTER JOIN
                      dbo.Mst_ICDCodeSubBlock ON dbo.lnk_FieldICDCode.SubBlockId = dbo.Mst_ICDCodeSubBlock.SubBlockId LEFT OUTER JOIN
                      dbo.Mst_ICDCodeBlocks ON dbo.lnk_FieldICDCode.BlockId = dbo.Mst_ICDCodeBlocks.BlockId
GO
/****** Object:  View [dbo].[vw_LabTestParameterUnits]    Script Date: 6/6/2018 12:35:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[vw_LabTestParameterUnits]
AS
SELECT        ID UnitId, Name UnitName, DeleteFlag
FROM            dbo.mst_Decode
WHERE        (CodeID = 30)



GO


/****** Object:  View [dbo].[VW_PatientCareEnd]    Script Date: 6/6/2018 12:35:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VW_PatientCareEnd]  
AS  
SELECT     dbo.dtl_PatientCareEnded.Ptn_Pk, dbo.dtl_PatientCareEnded.MissedAppDate, dbo.dtl_PatientCareEnded.CareEnded, dbo.dtl_PatientCareEnded.ARTended,   
                      dbo.dtl_PatientCareEnded.ARTenddate, mst_Decode_1.Name AS [ART End Reason], dbo.dtl_PatientCareEnded.ARTendreason,   
                      dbo.dtl_PatientCareEnded.PatientExitReason, mst_Decode_2.Name AS [Patient CareEnd Reason], dbo.dtl_PatientCareEnded.DroppedOutReason,   
                      dbo.mst_StoppedReason.Name AS [Patient Stopped Reason], dbo.dtl_PatientCareEnded.DroppedOutReasonOther AS [Patient Stopped Reason Other],   
                      dbo.dtl_PatientCareEnded.DeathDate, dbo.dtl_PatientCareEnded.DeathReason, dbo.mst_Decode.Name AS [Patient Death Reason],   
                      dbo.dtl_PatientCareEnded.DeathReasonDescription AS [Patient Death Reason Other], dbo.dtl_PatientCareEnded.LocationId, dbo.dtl_PatientCareEnded.LPTFTransfer,   
                      dbo.mst_LPTF.Name AS [LPTF Patient Transfered To], dbo.dtl_PatientCareEnded.PMTCTCareEnded, dbo.dtl_PatientCareEnded.CareEndedID,   
                      dbo.dtl_PatientCareEnded.CareEndedDate, dbo.dtl_PatientTrackingCare.ModuleId  
FROM         dbo.dtl_PatientCareEnded LEFT OUTER JOIN  
                      dbo.dtl_PatientTrackingCare ON dbo.dtl_PatientCareEnded.TrackingId = dbo.dtl_PatientTrackingCare.TrackingID LEFT OUTER JOIN  
                      dbo.mst_LPTF ON dbo.dtl_PatientCareEnded.LPTFTransfer = dbo.mst_LPTF.ID LEFT OUTER JOIN  
                      dbo.mst_Decode ON dbo.dtl_PatientCareEnded.DeathReason = dbo.mst_Decode.ID LEFT OUTER JOIN  
                      dbo.mst_StoppedReason ON dbo.dtl_PatientCareEnded.DroppedOutReason = dbo.mst_StoppedReason.Id LEFT OUTER JOIN  
                      dbo.mst_Decode AS mst_Decode_2 ON dbo.dtl_PatientCareEnded.PatientExitReason = mst_Decode_2.ID LEFT OUTER JOIN  
                      dbo.mst_Decode AS mst_Decode_1 ON dbo.dtl_PatientCareEnded.ARTendreason = mst_Decode_1.ID
GO
/****** Object:  View [dbo].[VW_PatientClinicalEncounter]    Script Date: 6/6/2018 12:35:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[VW_PatientClinicalEncounter]
AS
SELECT     TOP (100) PERCENT dbo.ord_Visit.VisitDate, dbo.mst_VisitType.VisitName AS [Visit Type], dbo.ord_Visit.Ptn_Pk, 
                      CASE dbo.dtl_PatientHIVPrevCareIE.PrevARVExposure WHEN 1 THEN 'Yes' ELSE 'No' END AS PrevARVExposure, 
                      dbo.dtl_PatientHivPrevCareIE.PrevSingleDoseNVP AS PrevNVPExposure, dbo.dtl_PatientHivPrevCareIE.PrevSingleDoseNVPDate1 AS PrevNVPDate1, 
                      dbo.dtl_PatientHivPrevCareIE.PrevSingleDoseNVPDate2 AS PrevNVPDate2, dbo.dtl_PatientHivPrevCareIE.PrevARVRegimen1Name, 
                      dbo.dtl_PatientHivPrevCareIE.PrevARVRegimen1Months, dbo.dtl_PatientHivPrevCareIE.PrevARVRegimen2Name, 
                      dbo.dtl_PatientHivPrevCareIE.PrevARVRegimen2Months, dbo.dtl_PatientHivPrevCareIE.PrevARVRegimen3Name, 
                      dbo.dtl_PatientHivPrevCareIE.PrevARVRegimen3Months, dbo.dtl_PatientHivPrevCareIE.PrevARVRegimen4Name, 
                      dbo.dtl_PatientHivPrevCareIE.PrevARVRegimen4Months, dbo.ord_Visit.VisitType, 
                      CASE dbo.dtl_PatientHIVPrevCareIE.PrevARVRegimen WHEN '1' THEN 'Yes' ELSE 'No' END AS PreviousARVRegimen, dbo.dtl_PatientHivPrevCareIE.PrevLowestCD4, 
                      dbo.dtl_PatientHivPrevCareIE.PrevLowestCD4Percent, dbo.dtl_PatientHivPrevCareIE.PrevLowestCD4Date, dbo.dtl_PatientHivPrevCareIE.PrevMostRecentCD4, 
                      dbo.dtl_PatientHivPrevCareIE.PrevMostRecentCD4Percent, dbo.dtl_PatientHivPrevCareIE.PrevMostRecentCD4Date, 
                      dbo.dtl_PatientHivPrevCareIE.PrevARVsCD4 AS CD4PriorStARV, dbo.dtl_PatientHivPrevCareIE.PrevARVsCD4Percent AS CD4PriorStARVPercent, 
                      dbo.dtl_PatientHivPrevCareIE.PrevARVsCD4Date AS CD4PriorStARVDate, dbo.dtl_PatientHivPrevCareIE.PrevMostRecentViralLoad AS PreTherapyVL, 
                      dbo.dtl_PatientHivPrevCareIE.PrevMostRecentViralLoadDate AS PreTherapyVLDate, dbo.dtl_PatientHivPrevCareIE.CurrentART AS HistoricalART, 
                      dbo.dtl_PatientHivPrevCareIE.longTermMedsSulfa, dbo.dtl_PatientHivPrevCareIE.longTermMedsSulfaDesc, dbo.dtl_PatientHivPrevCareIE.longTermMedsOther1, 
                      dbo.dtl_PatientHivPrevCareIE.longTermMedsOther2, dbo.dtl_PatientHivPrevCareIE.longTermTBMed, dbo.dtl_PatientHivPrevCareIE.longTermTBMedDesc, 
                      dbo.dtl_PatientHivPrevCareIE.longTermTBStartDate, dbo.dtl_PatientHivPrevCareIE.longTermMedsOther1Desc, 
                      dbo.dtl_PatientHivPrevCareIE.longTermMedsOther2Desc, dbo.dtl_PatientHivPrevCareIE.longTermMedsOther3desc, dbo.dtl_PatientClinicalStatus.DateHIVDiagnosis, 
                      CASE dbo.dtl_PatientClinicalStatus.HIVDiagnosisVerified WHEN '1' THEN 'Yes' WHEN '0' THEN 'No' END AS HIVDiagnosisVerified, 
                      CASE dbo.dtl_PatientClinicalStatus.Disclosure WHEN '1' THEN 'Yes' WHEN '0' THEN 'No' END AS Discloused, 
                      CASE dbo.dtl_PatientClinicalStatus.Pregnant WHEN '1' THEN 'Yes' WHEN '0' THEN 'No' END AS [Pregnancy Status], dbo.dtl_PatientClinicalStatus.LMP, 
                      dbo.dtl_PatientClinicalStatus.EDD AS [Pregnancy EDD], dbo.mst_HIVDisclosure.Name AS DisclosureTo, dbo.dtl_PatientVitals.Temp, dbo.dtl_PatientVitals.RR, 
                      dbo.dtl_PatientVitals.HR, dbo.dtl_PatientVitals.BPDiastolic, dbo.dtl_PatientVitals.BPSystolic, dbo.dtl_PatientVitals.Height, dbo.dtl_PatientVitals.Weight, 
                      dbo.dtl_PatientVitals.Pain, mst_Decode_2.Name AS WABStage, mst_Decode_1.Name AS WHOStage, dbo.mst_HivDisease.Name AS PatientHIVDisease, 
                      dbo.dtl_PatientDisease.DateOfDisease, dbo.dtl_PatientDisease.DiseaseDesc, dbo.mst_Assessment.AssessmentName AS Assessment, 
                      dbo.dtl_PatientAssessment.Description1 AS AssessmentDescription1, dbo.dtl_PatientAssessment.Description2 AS AssessmentDescription2, 
                      dbo.dtl_PatientClinicalNotes.ClinicalNotes, mst_Decode_3.Name AS TherapyPlan, mst_Reason_1.Name AS TherapyChangeReason, 
                      dbo.mst_Symptom.Name AS Symptoms, dbo.dtl_PatientSymptoms.SymptomDescription, mst_Decode_4.Name AS Allergy, dbo.dtl_PatientAllergy.AllergyNameOther, 
                      dbo.dtl_PatientAdherence.MissedLastWeek AS [Adherence_Missed Last Week], dbo.dtl_PatientAdherence.MissedLastMonth AS [Adherence_Missed Last_month], 
                      dbo.dtl_PatientAdherence.MissedReasonOther AS Adherence_Missed_other_reason, dbo.dtl_PatientAdherence.NumDOTPerWeek AS Adherence_Dot_per_week, 
                      dbo.dtl_PatientAdherence.NumHomeVisitsPerWeek AS Adherence_home_visit_per_weeks, dbo.dtl_PatientAdherence.SupportGroup AS Adherence_support_Group, 
                      dbo.dtl_PatientAdherence.InterruptedDate AS Adherence_Interrupted_date, dbo.dtl_PatientAdherence.InterruptedNumDays AS Adherence_Interrupted_Num_days, 
                      dbo.dtl_PatientAdherence.StoppedDate AS Adherence_stopped_date, dbo.dtl_PatientAdherence.StoppedNumDays AS Adherence_stopped_num_days, 
                      dbo.dtl_PatientAdherence.HerbalMeds AS Adherence_HerbalsMeds, dbo.dtl_Adherence_Missed_Reason.Other_Desc AS Adherence_Reason, 
                      dbo.dtl_PatientDisease.Disease_Pk, dbo.dtl_PatientAssessment.AssessmentID, dbo.dtl_PatientARTRestart.RestartDate AS [Patient ART Restart], 
                      dbo.ord_Visit.Visit_Id, dbo.dtl_PatientAppointment.AppDate, dbo.mst_Decode.Name AS [Appointment Reason], mst_Decode_5.Name AS [Appointment Status], 
                      dbo.dtl_PatientHivPrevCareEnrollment.ARTStartDate AS HistoricalARTStDate
FROM         dbo.dtl_PatientHivPrevCareEnrollment INNER JOIN
                      dbo.dtl_PatientAppointment ON dbo.dtl_PatientHivPrevCareEnrollment.ptn_pk = dbo.dtl_PatientAppointment.Ptn_pk LEFT OUTER JOIN
                      dbo.mst_Decode AS mst_Decode_5 ON dbo.dtl_PatientAppointment.AppStatus = mst_Decode_5.ID LEFT OUTER JOIN
                      dbo.mst_Decode ON dbo.dtl_PatientAppointment.AppReason = dbo.mst_Decode.ID RIGHT OUTER JOIN
                      dbo.ord_Visit ON dbo.dtl_PatientAppointment.Ptn_pk = dbo.ord_Visit.Ptn_Pk AND dbo.dtl_PatientAppointment.LocationID = dbo.ord_Visit.LocationID AND 
                      dbo.dtl_PatientAppointment.Visit_pk = dbo.ord_Visit.Visit_Id LEFT OUTER JOIN
                      dbo.dtl_PatientARTRestart ON dbo.ord_Visit.Ptn_Pk = dbo.dtl_PatientARTRestart.Ptn_Pk AND dbo.ord_Visit.Visit_Id = dbo.dtl_PatientARTRestart.Visit_Pk AND 
                      dbo.ord_Visit.LocationID = dbo.dtl_PatientARTRestart.LocationId LEFT OUTER JOIN
                      dbo.dtl_PatientAdherence ON dbo.ord_Visit.Visit_Id = dbo.dtl_PatientAdherence.Visit_Pk AND dbo.ord_Visit.Ptn_Pk = dbo.dtl_PatientAdherence.ptn_pk AND 
                      dbo.ord_Visit.LocationID = dbo.dtl_PatientAdherence.LocationID LEFT OUTER JOIN
                      dbo.dtl_Adherence_Missed_Reason ON dbo.ord_Visit.Ptn_Pk = dbo.dtl_Adherence_Missed_Reason.Ptn_pk AND 
                      dbo.ord_Visit.LocationID = dbo.dtl_Adherence_Missed_Reason.LocationID AND dbo.ord_Visit.Visit_Id = dbo.dtl_Adherence_Missed_Reason.Visit_pk LEFT OUTER JOIN
                      dbo.dtl_PatientAllergy LEFT OUTER JOIN
                      dbo.mst_Decode AS mst_Decode_4 ON dbo.dtl_PatientAllergy.AllergyID = mst_Decode_4.ID ON dbo.ord_Visit.LocationID = dbo.dtl_PatientAllergy.LocationID AND 
                      dbo.ord_Visit.Ptn_Pk = dbo.dtl_PatientAllergy.Ptn_Pk AND dbo.ord_Visit.Visit_Id = dbo.dtl_PatientAllergy.Visit_Pk LEFT OUTER JOIN
                      dbo.dtl_PatientSymptoms LEFT OUTER JOIN
                      dbo.mst_Symptom ON dbo.dtl_PatientSymptoms.SymptomID = dbo.mst_Symptom.ID ON dbo.ord_Visit.LocationID = dbo.dtl_PatientSymptoms.LocationID AND 
                      dbo.ord_Visit.Ptn_Pk = dbo.dtl_PatientSymptoms.Ptn_pk AND dbo.ord_Visit.Visit_Id = dbo.dtl_PatientSymptoms.Visit_pk LEFT OUTER JOIN
                      dbo.dtl_PatientArvTherapy LEFT OUTER JOIN
                      dbo.mst_Reason AS mst_Reason_1 ON dbo.dtl_PatientArvTherapy.TherapyReasonCode = mst_Reason_1.ID LEFT OUTER JOIN
                      dbo.mst_Decode AS mst_Decode_3 ON dbo.dtl_PatientArvTherapy.TherapyPlan = mst_Decode_3.ID ON 
                      dbo.ord_Visit.LocationID = dbo.dtl_PatientArvTherapy.LocationID AND dbo.ord_Visit.Ptn_Pk = dbo.dtl_PatientArvTherapy.ptn_pk AND 
                      dbo.ord_Visit.Visit_Id = dbo.dtl_PatientArvTherapy.Visit_pk LEFT OUTER JOIN
                      dbo.dtl_PatientClinicalNotes ON dbo.ord_Visit.LocationID = dbo.dtl_PatientClinicalNotes.LocationID AND 
                      dbo.ord_Visit.Ptn_Pk = dbo.dtl_PatientClinicalNotes.Ptn_pk AND dbo.ord_Visit.Visit_Id = dbo.dtl_PatientClinicalNotes.Visit_pk LEFT OUTER JOIN
                      dbo.dtl_PatientAssessment LEFT OUTER JOIN
                      dbo.mst_Assessment ON dbo.dtl_PatientAssessment.AssessmentID = dbo.mst_Assessment.AssessmentID ON 
                      dbo.ord_Visit.LocationID = dbo.dtl_PatientAssessment.LocationID AND dbo.ord_Visit.Ptn_Pk = dbo.dtl_PatientAssessment.Ptn_pk AND 
                      dbo.ord_Visit.Visit_Id = dbo.dtl_PatientAssessment.Visit_pk LEFT OUTER JOIN
                      dbo.dtl_PatientDisease LEFT OUTER JOIN
                      dbo.mst_HivDisease ON dbo.dtl_PatientDisease.Disease_Pk = dbo.mst_HivDisease.ID ON dbo.ord_Visit.LocationID = dbo.dtl_PatientDisease.LocationID AND 
                      dbo.ord_Visit.Ptn_Pk = dbo.dtl_PatientDisease.Ptn_Pk AND dbo.ord_Visit.Visit_Id = dbo.dtl_PatientDisease.Visit_Pk LEFT OUTER JOIN
                      dbo.mst_Decode AS mst_Decode_1 RIGHT OUTER JOIN
                      dbo.dtl_PatientStage ON mst_Decode_1.ID = dbo.dtl_PatientStage.WHOStage LEFT OUTER JOIN
                      dbo.mst_Decode AS mst_Decode_2 ON dbo.dtl_PatientStage.WABStage = mst_Decode_2.ID ON dbo.ord_Visit.LocationID = dbo.dtl_PatientStage.LocationID AND 
                      dbo.ord_Visit.Ptn_Pk = dbo.dtl_PatientStage.Ptn_pk AND dbo.ord_Visit.Visit_Id = dbo.dtl_PatientStage.Visit_Pk LEFT OUTER JOIN
                      dbo.dtl_PatientVitals ON dbo.ord_Visit.LocationID = dbo.dtl_PatientVitals.LocationID AND dbo.ord_Visit.Ptn_Pk = dbo.dtl_PatientVitals.Ptn_pk AND 
                      dbo.ord_Visit.Visit_Id = dbo.dtl_PatientVitals.Visit_pk LEFT OUTER JOIN
                      dbo.mst_HIVDisclosure RIGHT OUTER JOIN
                      dbo.dtl_PatientDisclosure ON dbo.mst_HIVDisclosure.Id = dbo.dtl_PatientDisclosure.DisclosureID ON 
                      dbo.ord_Visit.LocationID = dbo.dtl_PatientDisclosure.LocationID AND dbo.ord_Visit.Ptn_Pk = dbo.dtl_PatientDisclosure.Ptn_pk AND 
                      dbo.ord_Visit.Visit_Id = dbo.dtl_PatientDisclosure.Visit_pk LEFT OUTER JOIN
                      dbo.dtl_PatientClinicalStatus ON dbo.ord_Visit.LocationID = dbo.dtl_PatientClinicalStatus.LocationID AND 
                      dbo.ord_Visit.Visit_Id = dbo.dtl_PatientClinicalStatus.Visit_pk AND dbo.ord_Visit.Ptn_Pk = dbo.dtl_PatientClinicalStatus.Ptn_pk LEFT OUTER JOIN
                      dbo.dtl_PatientHivPrevCareIE ON dbo.ord_Visit.LocationID = dbo.dtl_PatientHivPrevCareIE.LocationID AND 
                      dbo.ord_Visit.Ptn_Pk = dbo.dtl_PatientHivPrevCareIE.Ptn_pk AND dbo.ord_Visit.Visit_Id = dbo.dtl_PatientHivPrevCareIE.Visit_pk LEFT OUTER JOIN
                      dbo.mst_VisitType ON dbo.ord_Visit.VisitType = dbo.mst_VisitType.VisitTypeID
WHERE     (dbo.ord_Visit.VisitType = 18 OR
                      dbo.ord_Visit.VisitType = 19 OR
                      dbo.ord_Visit.VisitType = 17) AND (dbo.ord_Visit.DeleteFlag IS NULL)
ORDER BY dbo.ord_Visit.VisitDate DESC

GO
/****** Object:  View [dbo].[VW_PatientDetail]    Script Date: 6/6/2018 12:35:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[VW_PatientDetail]
AS
SELECT     dbo.mst_Patient.Ptn_Pk, dbo.mst_Patient.LocationID, dbo.mst_Facility.FacilityName AS [Patient Location], dbo.mst_Patient.PatientEnrollmentID, 
                      dbo.mst_Patient.PatientClinicID, dbo.mst_Patient.DOB, dbo.mst_LPTF.Name AS [Transfered From Facility], dbo.mst_Patient.TransferIn AS Transfered, 
                      dbo.mst_Decode.Name AS Gender, DATEDIFF(dd, dbo.mst_Patient.DOB, GETDATE()) / 365 AS Age, dbo.mst_LPTF.ARFunded AS [PEPFAR Funded Site], 
                      dbo.mst_Facility.PepFarStartDate, dbo.Lnk_PatientProgramStart.StartDate AS [Registration Date], dbo.mst_Patient.ARTStartDate, dbo.mst_Patient.Sex, 
                      dbo.mst_Patient.FirstName, dbo.mst_Patient.MiddleName, dbo.mst_Patient.LastName, dbo.mst_Patient.Address, dbo.mst_Patient.Phone, 
                      dbo.mst_Patient.ANCNumber, dbo.mst_Patient.PMTCTNumber, dbo.mst_Patient.AdmissionNumber, dbo.mst_Patient.OutpatientNumber, 
                      dbo.Lnk_PatientProgramStart.ModuleId, dbo.mst_Patient.CountryId, dbo.mst_Patient.PosId, dbo.mst_Patient.SatelliteId, 
                      mst_Facility_1.FacilityID AS [CTC TransferIn FacilityID], mst_Facility_1.FacilityName AS [CTC TransferIn FacilityName], 
                      mst_Facility_1.PepFarStartDate AS [CTC TransferIn FacilityPEPFar Funding], dbo.fn_GetPatientStatus(dbo.mst_Patient.Ptn_Pk, dbo.Lnk_PatientProgramStart.ModuleId) 
                      AS [Patient Status], dbo.mst_Province.Name AS Province, dbo.mst_District.Name AS District, dbo.mst_Division.Name AS Division, dbo.mst_Ward.Name AS Ward, 
                      dbo.mst_Village.Name AS Village, dbo.dtl_PatientHivPrevCareIE.CurrentART AS [Previous ART Regimen], 
                      dbo.dtl_PatientHivPrevCareIE.CurrentARTStartDate AS [Previous ART StartDate], ISNULL(dbo.dtl_PatientHivPrevCareIE.CurrentARTStartDate, 
                      dbo.mst_Patient.ARTStartDate) AS [Track1-ARTStartDate], dbo.fn_GetPatientARTStatus_Futures(dbo.mst_Patient.Ptn_Pk) AS ARTStatus, dbo.mst_Patient.IQNumber, 
                      dbo.mst_Patient.NearestHealthCentre, dbo.mst_Patient.Landmark
FROM         dbo.mst_Patient INNER JOIN
                      dbo.mst_Facility ON dbo.mst_Patient.LocationID = dbo.mst_Facility.FacilityID INNER JOIN
                      dbo.mst_Decode ON dbo.mst_Patient.Sex = dbo.mst_Decode.ID INNER JOIN
                      dbo.Lnk_PatientProgramStart ON dbo.mst_Patient.Ptn_Pk = dbo.Lnk_PatientProgramStart.Ptn_pk LEFT OUTER JOIN
                      dbo.dtl_PatientHivPrevCareIE ON dbo.mst_Patient.Ptn_Pk = dbo.dtl_PatientHivPrevCareIE.Ptn_pk LEFT OUTER JOIN
                      dbo.mst_Ward ON dbo.mst_Patient.Ward = dbo.mst_Ward.Id LEFT OUTER JOIN
                      dbo.mst_Division ON dbo.mst_Patient.Division = dbo.mst_Division.Id LEFT OUTER JOIN
                      dbo.mst_Province ON dbo.mst_Patient.Province = dbo.mst_Province.ID LEFT OUTER JOIN
                      dbo.mst_District ON dbo.mst_Patient.DistrictName = dbo.mst_District.ID LEFT OUTER JOIN
                      dbo.mst_Village ON dbo.mst_Patient.VillageName = dbo.mst_Village.ID LEFT OUTER JOIN
                      dbo.mst_Facility AS mst_Facility_1 ON dbo.mst_Patient.SatelliteId = mst_Facility_1.SatelliteID AND dbo.mst_Patient.PosId = mst_Facility_1.PosID AND 
                      dbo.mst_Patient.CountryId = mst_Facility_1.CountryID LEFT OUTER JOIN
                      dbo.mst_LPTF ON dbo.mst_Patient.LPTFTransferId = dbo.mst_LPTF.ID
WHERE     (dbo.mst_Patient.DeleteFlag = 0) OR
                      (dbo.mst_Patient.DeleteFlag IS NULL)


GO
/****** Object:  View [dbo].[VW_PatientVisit]    Script Date: 6/6/2018 12:35:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VW_PatientVisit]
AS
SELECT     dbo.ord_Visit.Visit_Id, dbo.ord_Visit.Ptn_Pk, dbo.ord_Visit.LocationID, dbo.ord_Visit.VisitDate, dbo.mst_VisitType.VisitName, dbo.ord_Visit.DataQuality, 
                      dbo.ord_Visit.VisitType, dbo.mst_Decode.Name AS [Type of Visit], dbo.mst_VisitType.VisitTypeID
FROM         dbo.ord_Visit LEFT OUTER JOIN
                      dbo.mst_Decode ON dbo.ord_Visit.TypeofVisit = dbo.mst_Decode.ID LEFT OUTER JOIN
                      dbo.mst_VisitType ON dbo.ord_Visit.VisitType = dbo.mst_VisitType.VisitTypeID
WHERE     (dbo.ord_Visit.DeleteFlag = 0) AND (dbo.mst_Decode.CodeID = 1003) OR
                      (dbo.ord_Visit.DeleteFlag IS NULL)
GO
/****** Object:  View [dbo].[VW_PurchaseOrder]    Script Date: 6/6/2018 12:35:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VW_PurchaseOrder]
AS
SELECT     dbo.ord_PurchaseOrder.OrderNo, dbo.ord_PurchaseOrder.POId, dbo.ord_PurchaseOrder.OrderDate, dbo.Mst_Supplier.SupplierName, 
                      Mst_Store_1.Id AS RequestStoreId, Mst_Store_1.Name AS RequestStoreName, dbo.Mst_Store.Id AS ProvidingStoreId, dbo.Mst_Store.Name AS ProvidingStoreName, 
                      dbo.mst_Drug.Drug_pk, dbo.Mst_DispensingUnit.Name AS Unit, dbo.Mst_DispensingUnit.Id AS UnitId, dbo.Dtl_PurchaseItem.Quantity AS OrderedQuantity, 
                      dbo.Mst_Batch.ID AS BatchId, dbo.Mst_Batch.Name AS BatchName, 
                      CASE WHEN dbo.Ord_PurchaseOrder.SourceStoreId > 0 THEN 'Inter Store Transfer' ELSE 'Purchase from ' + dbo.Mst_Supplier.SupplierName END AS Summary, 
                      dbo.Ord_GRNote.RecievedDate AS GRNRecivedDate, dbo.Dtl_GRNote.RecievedQuantity AS ReceivedQuantity, dbo.mst_Drug.SellingUnitPrice, 
                      dbo.mst_Drug.DispensingMargin, dbo.mst_Drug.DispensingUnitPrice, dbo.mst_Drug.DrugName AS ItemName, dbo.Dtl_GRNote.ExpiryDate
FROM         dbo.Dtl_GRNote INNER JOIN
                      dbo.Ord_GRNote ON dbo.Dtl_GRNote.GRNId = dbo.Ord_GRNote.GRNId LEFT OUTER JOIN
                      dbo.Mst_Batch ON dbo.Dtl_GRNote.BatchID = dbo.Mst_Batch.ID RIGHT OUTER JOIN
                      dbo.ord_PurchaseOrder INNER JOIN
                      dbo.Dtl_PurchaseItem ON dbo.ord_PurchaseOrder.POId = dbo.Dtl_PurchaseItem.POId INNER JOIN
                      dbo.mst_Drug ON dbo.Dtl_PurchaseItem.ItemId = dbo.mst_Drug.Drug_pk ON dbo.Ord_GRNote.POId = dbo.ord_PurchaseOrder.POId LEFT OUTER JOIN
                      dbo.Mst_Supplier ON dbo.ord_PurchaseOrder.SupplierID = dbo.Mst_Supplier.Id LEFT OUTER JOIN
                      dbo.Mst_Store ON dbo.ord_PurchaseOrder.SourceStoreID = dbo.Mst_Store.Id LEFT OUTER JOIN
                      dbo.Mst_Store AS Mst_Store_1 ON dbo.ord_PurchaseOrder.DestinStoreID = Mst_Store_1.Id LEFT OUTER JOIN
                      dbo.Mst_DispensingUnit ON dbo.mst_Drug.DispensingUnit = dbo.Mst_DispensingUnit.Id
GO
/****** Object:  View [dbo].[VW_RegistrationConditionalField]    Script Date: 6/6/2018 12:35:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VW_RegistrationConditionalField]
AS
SELECT     Lnk_Forms.FieldId, Lnk_Forms.FieldLabel, dbo.lnk_PatientRegconditionalfields.FieldId AS ConditionalFieldId, 
                      dbo.lnk_PatientRegconditionalfields.FieldLabel AS ConditionalFieldLabel, 
                      CASE Lnk_Forms.Predefined WHEN 1 THEN Mst_PredefinedFields_1.PdfName WHEN 0 THEN Mst_CustomFormField_1.FieldName END AS FieldName, 
                      CASE Lnk_Forms.Predefined WHEN 1 THEN Mst_PredefinedFields_1.PdfTableName WHEN 0 THEN 'dt_CustomField' END AS FieldSavingTable, 
                      CASE dbo.lnk_PatientRegconditionalfields.Predefined WHEN 1 THEN dbo.Mst_PredefinedFields.PdfName WHEN 0 THEN dbo.Mst_CustomFormField.FieldName END AS
                       ConditionalFieldName, 
                      CASE dbo.lnk_PatientRegconditionalfields.Predefined WHEN 1 THEN dbo.Mst_PredefinedFields.PdfTableName WHEN 0 THEN 'dtl_CustomField' END AS ConditionalFieldSavingTable,
                       CASE Lnk_Forms.Predefined WHEN 1 THEN Mst_PredefinedFields_1.ControlId WHEN 0 THEN Mst_CustomFormField_1.ControlId END AS FieldControlId, 
                      CASE Lnk_Forms.Predefined WHEN 1 THEN Mst_PredefinedFields_1.BindTable WHEN 0 THEN 'Mst_ModDecode' END AS FieldBindTable, 
                      CASE Lnk_Forms.Predefined WHEN 1 THEN Mst_PredefinedFields_1.ModuleId WHEN 0 THEN 0 END AS FieldModuleId, 
                      CASE Lnk_Forms.Predefined WHEN 1 THEN Mst_PredefinedFields_1.CategoryId WHEN 0 THEN 0 END AS FieldCategoryId, 
                      CASE Lnk_Forms.Predefined WHEN 1 THEN Mst_PredefinedFields_1.BindField WHEN 0 THEN '' END AS FieldBindField, 
                      CASE dbo.lnk_PatientRegconditionalfields.Predefined WHEN 1 THEN dbo.Mst_PredefinedFields.ControlId WHEN 0 THEN dbo.Mst_CustomFormField.ControlId END AS ConditionalFieldControlId,
                       CASE dbo.lnk_PatientRegconditionalfields.Predefined WHEN 1 THEN dbo.Mst_PredefinedFields.BindTable WHEN 0 THEN dbo.Mst_CustomFormField.BindTable END AS
                       ConditionalFieldBindTable, 
                      CASE dbo.lnk_PatientRegconditionalfields.Predefined WHEN 1 THEN dbo.Mst_PredefinedFields.ModuleId WHEN 0 THEN 0 END AS ConditionalFieldModuleId, 
                      CASE dbo.lnk_PatientRegconditionalfields.Predefined WHEN 1 THEN dbo.Mst_PredefinedFields.CategoryId WHEN 0 THEN dbo.Mst_CustomFormField.CategoryId END AS
                       ConditionalFieldCategoryId, 
                      CASE dbo.lnk_PatientRegconditionalfields.Predefined WHEN 1 THEN dbo.Mst_PredefinedFields.BindField WHEN 0 THEN '' END AS ConditionalFieldBindField, 
                      Lnk_Forms.FeatureId, dbo.mst_Section.SectionID AS FieldSectionId, dbo.mst_Section.SectionName AS FieldSectionName, 
                      dbo.lnk_PatientRegconditionalfields.SectionId AS ConditionalFieldSectionId, Lnk_Forms.Predefined AS FieldPredefined, 
                      dbo.lnk_PatientRegconditionalfields.Predefined AS ConditionalFieldPredefined, dbo.mst_Section.Seq AS FieldSectionSequence, 
                      dbo.lnk_PatientRegconditionalfields.Seq AS ConditionalFieldSequence, dbo.Mst_PreDefinedFields.ModuleId, 
                      CASE dbo.lnk_PatientRegconditionalfields.Predefined WHEN 1 THEN dbo.Mst_PredefinedFields.PatientRegistration WHEN 0 THEN dbo.Mst_CustomFormField.PatientRegistration
                       END AS ConditionalPatRegistration
FROM         dbo.Mst_PreDefinedFields AS Mst_PreDefinedFields_1 RIGHT OUTER JOIN
                      dbo.mst_Decode ON Mst_PreDefinedFields_1.ModuleId = dbo.mst_Decode.ModuleId AND 
                      Mst_PreDefinedFields_1.CategoryId = dbo.mst_Decode.CodeID RIGHT OUTER JOIN
                      dbo.mst_CustomformField AS mst_CustomformField_1 RIGHT OUTER JOIN
                      dbo.lnk_PatientRegconditionalfields RIGHT OUTER JOIN
                          (SELECT     FeatureId, SectionId, FieldId, FieldLabel, UserId, CreateDate, Predefined, Seq
                            FROM          dbo.Lnk_Forms AS z
                            UNION
                            SELECT     a.FeatureId, a.SectionId, b.FieldId, b.FieldLabel, b.UserId, b.CreateDate, b.Predefined, b.Seq
                            FROM         dbo.Lnk_Forms AS a INNER JOIN
                                                  dbo.lnk_PatientRegconditionalfields AS b ON a.FieldId = b.ConfieldId) AS Lnk_Forms LEFT OUTER JOIN
                      dbo.mst_Section ON Lnk_Forms.SectionId = dbo.mst_Section.SectionID ON dbo.lnk_PatientRegconditionalfields.Conpredefine = Lnk_Forms.Predefined AND 
                      dbo.lnk_PatientRegconditionalfields.ConfieldId = Lnk_Forms.FieldId LEFT OUTER JOIN
                      dbo.mst_CustomformField ON dbo.lnk_PatientRegconditionalfields.FieldId = dbo.mst_CustomformField.Id LEFT OUTER JOIN
                      dbo.Mst_PreDefinedFields ON dbo.lnk_PatientRegconditionalfields.FieldId = dbo.Mst_PreDefinedFields.Id ON mst_CustomformField_1.Id = Lnk_Forms.FieldId AND 
                      mst_CustomformField_1.PatientRegistration = 1 ON Mst_PreDefinedFields_1.Id = Lnk_Forms.FieldId AND dbo.Mst_PreDefinedFields.PatientRegistration = 1
GO
/****** Object:  View [dbo].[VW_UserDesignationTransaction]    Script Date: 6/6/2018 12:35:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[VW_UserDesignationTransaction]
AS
SELECT dbo.mst_User.UserID
	,LTRIM(RTRIM(dbo.mst_User.UserLastName)) + ' ' + LTRIM(RTRIM(dbo.mst_User.UserFirstName)) AS UserName
	,dbo.mst_User.Email
	,LTRIM(RTRIM(dbo.mst_Designation.NAME)) AS Designation
	,dbo.mst_User.DeleteFlag 
FROM dbo.mst_Designation
INNER JOIN dbo.mst_User ON dbo.mst_Designation.Id = dbo.mst_User.Designation

GO
/****** Object:  View [dbo].[vw_UserList]    Script Date: 6/6/2018 12:35:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_UserList]
AS
SELECT        U.UserID AS UserId, U.UserName AS SystemUserName, U.UserFirstName + ' ' + U.UserLastName AS Name, E.FirstName + ' ' + E.LastName AS EmployeeName, ISNULL(U.DeleteFlag, 0) AS UserDeleteFlag, 
                         E.EmployeeID AS EmployeeId, E.DesignationID AS DesignationId,
                             (SELECT        TOP (1) Name
                               FROM            dbo.mst_Designation AS D
                               WHERE        (Id = E.DesignationID)) AS Designation, ISNULL(E.DeleteFlag, 0) AS EmployeeDeleteFlag
FROM            dbo.mst_User AS U LEFT OUTER JOIN
                         dbo.mst_Employee AS E ON U.EmployeeId = E.EmployeeID

GO
/****** Object:  View [dbo].[vw_WaitingQueue]    Script Date: 6/6/2018 12:35:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[vw_WaitingQueue]
AS
Select	D.ID QueueId,
		C.CodeID,
		D.Name As QueueName
From dbo.mst_Decode D
Inner Join
	dbo.mst_Code C On D.CodeID = C.CodeID
Where (C.DeleteFlag = 0)
And (C.Name = 'Waiting List');
GO