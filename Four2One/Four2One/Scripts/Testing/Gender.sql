With V4Patients AS (
select Ptn_Pk, Sex Gender
from IQCareV4.dbo.CCCPatientsBeingMigrated)

, V1Patients AS (
select Ptn_Pk 
,case when sex = 52 then  'Female' Else 'Male' End as Gender
from IQCareV1.dbo.Person ),

LineList AS (
SELECT a.Ptn_pk
, CASE WHEN a.Gender <> b.Gender THEN 1 ELSE 0 END as DoesNotMatch
FROM 
V4Patients a LEFT JOIN V1Patients b ON a.Ptn_Pk = b.Ptn_Pk)

Select 
'Gender' DataElement
,COUNT(Ptn_Pk) Total
,SUM(DoesNotMatch) DoesNotMatch 
FROM LineList
