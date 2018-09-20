--Script to check Registration Date Migration

WITH V4Patients AS (
select a.Ptn_pk
, cast(a.RegistrationAtCCC as date) EnrollmentDate
from IQCareV4.dbo.CCCPatientsBeingMigrated a )

, V1Patients AS (
SELECT b.ptn_pk
,	cast(b.RegistrationDate as date) RegistrationDate
	FROM IQCareV1.dbo.Patient b),

LineList AS (
SELECT a.Ptn_pk
, CASE WHEN a.EnrollmentDate <> b.RegistrationDate THEN 1 ELSE 0 END as DoesNotMatch
FROM 
V4Patients a LEFT JOIN V1Patients b ON a.Ptn_Pk = b.Ptn_Pk)

Select 
'Enrollment Dates' DataElement
,COUNT(Ptn_Pk) Total
,SUM(DoesNotMatch) DoesNotMatch 
FROM LineList
