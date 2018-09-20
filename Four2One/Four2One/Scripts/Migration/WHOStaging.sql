WITH WHO_ AS (SELECT  
a.Ptn_Pk,
a.Visit_Id VisitID,
CAST(a.VisitDate as DATE) VisitDate
, CASE
	WHEN c.Name IN ('1','I','T1') THEN 1
	WHEN c.Name IN ('2','II','T2') THEN 2
	WHEN c.Name IN ('3','III','T3') THEN 3
	WHEN c.Name IN ('4','IV','T4') THEN 4
ELSE NULL END AS WHOStage	
FROM ord_Visit a
INNER JOIN dtl_PatientStage b ON a.Visit_Id = b.Visit_Pk AND a.Ptn_Pk = b.Ptn_pk
INNER JOIN mst_Decode c ON b.WHOStage =c.Id
INNER JOIN CCCEncountersBeingMigrated d ON a.Ptn_Pk = d.Ptn_pk and cast(a.VisitDate as date) = d.VisitDate
INNER JOIN CCCPatientsBeingMigrated e ON a.Ptn_Pk = e.Ptn_pk
)

, WHO AS (
SELECT Ptn_Pk
, VisitDate
, MAX(WHOStage) WHOStage FROM WHO_
GROUP BY Ptn_Pk, VisitDate)

INSERT INTO PatientWHOStage
Select b.Id PatientId 
, c.Id PatientMasterVisitId
, CASE a.WHOStage 
	WHEN 1 THEN 132
	WHEN 2 THEN 133
	WHEN 3 THEN 134
	WHEN 4 THEN 135
ELSE NULL END WHOStageID
FROM 
WHO a 
inner join Patient b on a.Ptn_pk = b.ptn_pk
inner join PatientMasterVisit c on b.id = c.PatientId
	and cast(a.visitdate as date) = cast(c.visitdate as date) and c.VisitType = 0
left join PatientWHOStage d ON c.Id = d.PatientMasterVisitId
where d.PatientMasterVisitId IS NULL
and CASE a.WHOStage WHEN 1 THEN 132
	WHEN 2 THEN 133
	WHEN 3 THEN 134
	WHEN 4 THEN 135
ELSE NULL END IS NOT NULL
GO

/*
135	WHOStage	Stage4
134	WHOStage	Stage3
133	WHOStage	Stage2
132	WHOStage	Stage1
*/

WITH OIs1 AS (SELECT a.Ptn_Pk
, a.Visit_Id
, CASE WHEN COALESCE(d3Blue.Name, d3.Name) LIKE '%none%' OR COALESCE(d3Blue.Name, d3.Name) LIKE '%Not Documented%' THEN NULL
	WHEN Tb.Ptn_pk is not Null Then 'Pulmonary TB'
ELSE COALESCE(d3Blue.Name, d3.Name) END AS OI
FROM ord_Visit a 

INNER JOIN dtl_PatientDisease e ON a.Visit_Id = e.Visit_Pk 
LEFT JOIN mst_HivDisease d3 ON e.Disease_Pk = d3.ID
LEFT JOIN mst_BlueDecode d3Blue ON e.Disease_Pk = d3Blue.ID	AND d3Blue.CodeID = 4
LEFT JOIN 
(Select Ptn_pk, Visit_pk, TBRxStartDate 
From dtl_PatientOtherTreatment Where TBStatus = 3) Tb 
On a.ptn_pk = Tb.ptn_pk and a.visit_id = Tb.visit_pk)


, OIs2 AS (select a.Ptn_pk
, a.Visit_Pk
, b.Name
from dtl_Multiselect_line a
inner join mst_Decode b on a.ValueID = b.ID
inner join ord_Visit c on a.Visit_Pk = c.Visit_Id
where FieldName LIKE 'WHOStage%'
and (c.DeleteFlag = 0 or c.DeleteFlag is null))

, OIs AS
(SELECT a.Ptn_Pk
, cast(b.visitdate as date) VisitDate
, CASE WHEN OI LIKE '%pulmonary%tb%' THEN 'Pulmonary TB' 
WHEN OI LIKE '%Oral%Candidiasis%' OR OI LIKE 'Thrush(oral/vaginal)' THEN 'Oral candidiasis thrush'
WHEN OI LIKE '%Weight%loss%' THEN 'Weight loss > 10%'
WHEN OI LIKE '%KS%Cutaneous%' THEN 'KS Cutaneous'
WHEN OI LIKE '%Esophageal%Candidiasis%' THEN 'Candidiasis Oesephogeal'
WHEN OI LIKE '%KS%Visceral%' THEN 'KS Visceral'
WHEN OI LIKE '%Cryptococcal%Meningitis%' THEN 'Extrapulmonary Cryptococcosis'
WHEN OI LIKE '%Zoster%' THEN 'Herpes zoster'
WHEN OI LIKE '%Genital%Ulcerative%Disease%' THEN 'Ulcerative gingivitis'
WHEN OI LIKE '%Herpes%Simplex%' THEN 'Chronic Herpes simplex'
WHEN OI LIKE '%DEmentia%' THEN 'Encephalopathy dementia'
WHEN OI LIKE '%Chronic%Diarrhoea%Wasting%' THEN 'Chronic diarrhoea wasting'
WHEN OI LIKE '%Other%Mycobacteria%' THEN 'Mycobacteria'


ELSE a.OI END AS OI
FROM (
Select * FROM OIs1 WHERE OI IS NOT NULL 
UNION
Select * FROM OIs2) a
INNER JOIN ord_Visit b ON a.Visit_Id = b.Visit_Id
WHERE OI NOT IN ('Other','COUGH') AND 
(b.DeleteFlag = 0 or b.DeleteFlag is null))

INSERT INTO PatientOI
(PatientId, PatientMasterVisitId, OIId, DeleteFlag, CreatedBy, CreateDate)
SELECT 
distinct b.Id PatientId
, c.Id PatientMasterVisitId
, l.ItemId OIId
, 0 DeleteFlag
, 1 CreatedBy
, c.CreateDate
 FROM OIs a 
inner join LookupItemView l on a.OI = l.DisplayName and l.MasterName LIKE 'WHOStage%Conditions'
inner join Patient b on a.Ptn_pk = b.ptn_pk
inner join PatientMasterVisit c on b.id = c.PatientId
and cast(a.visitdate as date) = cast(c.visitdate as date)
and c.VisitType = 0
left join PatientOI d ON c.Id = d.PatientMasterVisitId
where d.PatientMasterVisitId is null
GO