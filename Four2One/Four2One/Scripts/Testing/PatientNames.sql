Open symmetric key Key_CTC decryption by password='ttwbvXWpqb5WOLfLrBgisw==';
WITH V4Patients AS (SELECT a.Ptn_Pk,  
	Convert(varchar(500), Decryptbykey([FirstName])) FirstName, 
	Convert(varchar(500), Decryptbykey([MiddleName])) MiddleName, 
	Convert(varchar(500), Decryptbykey([LastName])) LastName 
	FROM IQCareV4.dbo.mst_patient a 
	INNER JOIN IQCareV4.dbo.CCCPatientsBeingMigrated b ON a.Ptn_Pk = b.Ptn_Pk)
	
	,	V1Patients AS (SELECT Ptn_pk, Convert(varchar(500), Decryptbykey([FirstName])) FirstName,
	Convert(varchar(500), Decryptbykey([MidName])) MidName, 
	Convert(varchar(500), Decryptbykey([LastName])) LastName FROM 
	IQCareV1.dbo.Person),

LineList AS (
SELECT a.Ptn_pk
, CASE WHEN a.FirstName <> b.FirstName 
OR  a.MiddleName <> b.MidName 
OR a.[LastName] <> b.[LastName]
THEN 1 ELSE 0 END as DoesNotMatch
FROM 
V4Patients a LEFT JOIN V1Patients b ON a.Ptn_Pk = b.Ptn_Pk)

Select 
'Patient Names' DataElement
,COUNT(Ptn_Pk) Total
,SUM(DoesNotMatch) DoesNotMatch 
FROM LineList
GO
CLOSE symmetric key Key_CTC