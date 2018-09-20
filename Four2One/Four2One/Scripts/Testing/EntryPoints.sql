With V4Patients AS (
SELECT a.Ptn_pk
, CASE WHEN b.Name LIKE '%VCT%' THEN 'VCT'
	WHEN b.Name LIKE '%OPD%' OR b.Name LIKE '%Out%patient%' THEN 'OPD'
	WHEN b.Name LIKE '%MCH%' OR b.Name LIKE '%PMTCT%' THEN 'MCH'
	WHEN b.Name LIKE 'TB%' THEN 'TB'
	WHEN (b.Name LIKE '%Inpatient%' OR b.Name LIKE '%IPD%')
	AND CAST(DATEDIFF(dd, c.dob, c.RegistrationAtCCC)/365.25 as decimal(18,1)) < 15 THEN 'IPD-Child'
	WHEN (b.Name LIKE '%Inpatient%' OR b.Name LIKE '%IPD%')
	AND CAST(DATEDIFF(dd, c.dob, c.RegistrationAtCCC)/365.25 as decimal(18,1)) >= 15 THEN 'IPD-Adult'
	WHEN b.Name IS NULL THEN NULL
	ELSE 'Other'
	END AS EntryPoint

 from 
IQCareV4.dbo.mst_Patient a
left join IQCareV4.dbo.mst_decode b on a.ReferredFrom = b.ID and b.CodeID IN (17, 1089)
INNER JOIN IQCareV4.dbo.CCCPatientsBeingMigrated c ON a.Ptn_Pk = c.Ptn_Pk) 

, V1Patients AS (
	select p.Ptn_Pk 
	,pl.EntryPointId V1_EntryPointCode
	,li.Name EntryPoint
	from IQCareV1.[dbo].Patient p 
	inner join IQCareV1.[dbo].[ServiceEntryPoint] pl on p.id=pl.Patientid
	left join IQCareV1.[dbo].[LookupItem] li on li.id = pl.EntryPointId  )

, LineList AS (
SELECT a.Ptn_Pk
, CASE WHEN a.EntryPoint <> b.EntryPoint OR (a.EntryPoint IS NOT NULL AND b.EntryPoint IS NULL)
THEN 1 ELSE 0 END AS DoesNotMatch FROM 
V4Patients a LEFT JOIN V1Patients b ON a.Ptn_pk = b.Ptn_Pk)

SELECT 'Entry Points' DataElement
, COUNT(Ptn_Pk) Total
, SUM(DoesNotMatch) DoesNotMatch
FROM LineList