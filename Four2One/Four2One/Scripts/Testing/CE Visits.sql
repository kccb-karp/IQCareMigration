WITH V4Visits AS
(Select a.Ptn_Pk
, a.VisitDate
, a.CreateDate
FROM IQCareV4.dbo.CCCEncountersBeingMigrated a INNER JOIN 
IQCareV4.dbo.CCCPatientsBeingMigrated b ON a.Ptn_Pk = b.Ptn_Pk)

, V1Visit AS (
SELECT b.Ptn_Pk
, CAST(a.VisitDate as DATE) VisitDate
, CAST(a.CreateDate as DATE) CreateDate
FROM IQCareV1.dbo.PatientMasterVisit a INNER JOIN 
IQCareV1.dbo.Patient b
ON a.PatientId = b.Id
WHERE VisitType = 0)

, LineList AS (
Select a.Ptn_Pk
, a.VisitDate
, CASE WHEN b.ptn_pk is null or a.CreateDate != b.CreateDate THEN 1
ELSE 0 END AS DoesNotMatch

FROM V4Visits a LEFT JOIN V1Visit b
ON a.Ptn_Pk = b.Ptn_Pk
AND a.VisitDate = b.VisitDate)

Select 'Clinical Encounter Visits' DataElement
, COUNT(a.Ptn_Pk) Total
, SUM(DoesNotMatch) DoesNotMatch
FROM LineList a
