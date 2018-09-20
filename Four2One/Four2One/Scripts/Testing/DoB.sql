With V4Patients AS (
select Ptn_Pk, DoB 
from IQCareV4.dbo.CCCPatientsBeingMigrated)

, V1Patients AS (
select Ptn_Pk, DateOfBirth 
from IQCareV1.dbo.Person ),

LineList AS (
SELECT a.Ptn_pk
, CASE WHEN a.DOB <> b.DateOfBirth THEN 1 ELSE 0 END as DoesNotMatch
FROM 
V4Patients a LEFT JOIN V1Patients b ON a.Ptn_Pk = b.Ptn_Pk)

Select 
'Date of Birth' DataElement
,COUNT(Ptn_Pk) Total
,SUM(DoesNotMatch) DoesNotMatch 
FROM LineList