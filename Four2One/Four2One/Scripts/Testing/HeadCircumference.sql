WITH V4HeadCircumference AS (
select a.Ptn_pk
, cast(b.VisitDate as date) VisitDate
, c.HeadCircumference 
from IQCareV4.dbo.CCCPatientsBeingMigrated a 
INNER JOIN ord_Visit b ON a.Ptn_pk = b.Ptn_Pk 
INNER JOIN dtl_PatientVitals c ON b.Visit_Id = c.Visit_pk
WHERE 
c.HeadCircumference between 30 and 70 AND 
(b.DeleteFlag = 0 or b.DeleteFlag is null))

, V1HeadCircumference AS (
SELECT c.ptn_pk
, cast(b.VisitDate as date) VisitDate
, CASE WHEN a.HeadCircumference = 0 THEN NULL ELSE a.HeadCircumference END AS HeadCircumference
FROM IQCareV1.dbo.PatientVitals a
INNER JOIN PatientMasterVisit b ON a.PatientMasterVisitId = b.Id
INNER JOIN Patient c ON a.PatientId = c.Id
WHERE a.HeadCircumference > 0)


, LineList as (
Select Distinct a.Ptn_pk
,a.VisitDate
,CASE
WHEN b.ptn_pk is NULL
OR a.HeadCircumference <> b.HeadCircumference THEN 1 ELSE 0
END AS DoesNotMatch

From V4HeadCircumference a left join V1HeadCircumference b
on a.ptn_pk = b.ptn_pk
and a.visitdate = b.visitdate)

Select
'Head Circumference' DataElement
,Count(Ptn_pk)Total
,Sum(DoesNotMatch)DoesNotMatch
From LineList 

