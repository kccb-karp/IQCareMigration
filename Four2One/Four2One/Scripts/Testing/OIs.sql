WITH OIs1 AS (SELECT a.Ptn_Pk
, a.Visit_Id
, CASE WHEN COALESCE(d3Blue.Name, d3.Name) LIKE '%none%' OR COALESCE(d3Blue.Name, d3.Name) LIKE '%Not Documented%' THEN NULL
	WHEN Tb.Ptn_pk is not Null Then 'Pulmonary TB'
ELSE COALESCE(d3Blue.Name, d3.Name) END AS OI
FROM IQCareV4.dbo.ord_Visit a 

INNER JOIN IQCareV4.dbo.dtl_PatientDisease e ON a.Visit_Id = e.Visit_Pk 
LEFT JOIN IQCareV4.dbo.mst_HivDisease d3 ON e.Disease_Pk = d3.ID
LEFT JOIN IQCareV4.dbo.mst_BlueDecode d3Blue ON e.Disease_Pk = d3Blue.ID	AND d3Blue.CodeID = 4
LEFT JOIN 
(Select Ptn_pk, Visit_pk, TBRxStartDate 
From IQCareV4.dbo.dtl_PatientOtherTreatment Where TBStatus = 3) Tb 
On a.ptn_pk = Tb.ptn_pk and a.visit_id = Tb.visit_pk)


, OIs2 AS (select a.Ptn_pk
, a.Visit_Pk
, b.Name
from IQCareV4.dbo.dtl_Multiselect_line a
inner join IQCareV4.dbo.mst_Decode b on a.ValueID = b.ID
inner join IQCareV4.dbo.ord_Visit c on a.Visit_Pk = c.Visit_Id
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
INNER JOIN IQCareV4.dbo.ord_Visit b ON a.Visit_Id = b.Visit_Id
WHERE OI NOT IN ('Other','COUGH') AND 
(b.DeleteFlag = 0 or b.DeleteFlag is null))

, V4OIs AS (
SELECT 
a.Ptn_Pk
, a.VisitDate
, l.DisplayName OI
 FROM OIs a 
inner join IQCareV1.dbo.LookupItemView l on a.OI = l.DisplayName and l.MasterName LIKE 'WHOStage%Conditions'
inner join CCCPatientsBeingMigrated b ON a.Ptn_Pk = b.Ptn_pk
inner join CCCEncountersBeingMigrated c ON a.Ptn_Pk = c.Ptn_Pk and a.VisitDate = c.VisitDate
)
, V1OIs as (
select distinct d.ptn_pk
, cast(c.VisitDate as date) VisitDate 
, b.DisplayName OI FROM 
PatientOI a INNER JOIN LookupItemView b ON a.OIId = b.ItemId
INNER JOIN PatientMasterVisit c ON a.PatientMasterVisitId = c.Id
INNER JOIN Patient d ON a.PatientId = d.Id)

, Linelist as (
select a.Ptn_Pk
, case when b.ptn_pk is null
then 1 else 0 end as DoesNotMatch
FROM V4OIs a left join V1OIs b ON a.Ptn_Pk = b.ptn_pk and a.VisitDate = b.VisitDate
and a.OI = b.OI)

select 'Opportunistic Infections' DataElement
, COUNT(a.ptn_pk) total
, SUM(a. DoesNotMatch) DoesNotMatch
from Linelist a 