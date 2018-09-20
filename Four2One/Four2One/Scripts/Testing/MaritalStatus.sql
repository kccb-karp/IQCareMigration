WITH V4MaritalStatus AS (SELECT a.Ptn_Pk
, CASE WHEN b.[Name] LIKE '%Polygamous%' THEN 'Married Polygamous'
	WHEN b.[Name] LIKE '%Married%' THEN 'Married'
	WHEN b.[Name] LIKE '%Divorced%' THEN 'Divorced' 
	WHEN b.[Name] LIKE '%Single%' THEN 'Single'
	WHEN b.[Name] LIKE '%Cohabit%' THEN 'Cohabiting'
	WHEN b.[Name] LIKE '%Widowed%' THEN 'Widowed'
	WHEN b.[Name] LIKE '%Separated%' THEN 'Separated'
	WHEN b.[Name] LIKE '%Child%' THEN Null
	ELSE 'Unknown'
	END AS MaritalStatus
FROM mst_Patient a
LEFT JOIN mst_Decode b ON a.MaritalStatus = b.ID 
INNER JOIN CCCPatientsBeingMigrated c ON a.Ptn_Pk = c.Ptn_pk)

, V1MaritalStatus AS (
SELECT a.ptn_pk
, c.DisplayName MaritalStatus
FROM Patient a INNER JOIN [PatientMaritalStatus] b 
ON a.PersonId = b.PersonId
LEFT JOIN LookupItem c ON b.MaritalStatusId = c.Id)

, LineList AS (
SELECT a.Ptn_Pk
, CASE WHEN (a.MaritalStatus != b.MaritalStatus)
	OR (a.MaritalStatus is not null and b.MaritalStatus is null) THEN 1 ELSE 0 END AS DoesNotMatch
FROM V4MaritalStatus a LEFT JOIN V1MaritalStatus b 
ON a.Ptn_Pk = b.ptn_pk)

Select 'Marital Status' DataElement
, COUNT(Ptn_Pk) Total
, SUM(DoesNotMatch)DoesNotMatch
FROM LineList