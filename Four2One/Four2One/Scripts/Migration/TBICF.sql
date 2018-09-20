IF EXISTS(Select Name FROM sys.tables WHERE NAME = 'tmp_ICFSymptoms')
DROP TABLE tmp_ICFSymptoms
EXEC('CREATE TABLE tmp_ICFSymptoms
(ptn_pk INT NULL
, VisitDate DATE NOT NULL
, Symptom Varchar(1000) NULL)')



IF EXISTS(Select Name FROM sys.tables Where Name = 'DTL_FBCUSTOMFIELD_Intensive_Case_Finding')

EXEC('INSERT INTO tmp_ICFSymptoms 
Select a.Ptn_Pk
, a.VisitDate
, b.Symptom

FROM ord_Visit a INNER JOIN (
Select ptn_pk
, visit_pk
, Symptom   
FROM (SELECT n.ptn_pk,
n.visit_pk,
''Cough'' Symptom
FROM DTL_FBCUSTOMFIELD_Intensive_Case_Finding n
WHERE n.Cough = 1
UNION SELECT DISTINCT n.ptn_pk,
		n.visit_pk,
		''Fever'' Symptom
FROM DTL_FBCUSTOMFIELD_Intensive_Case_Finding n
WHERE n.Fever = 1
UNION SELECT DISTINCT n.ptn_pk,
		n.visit_pk,
		''Weight Loss'' Symptom
FROM DTL_FBCUSTOMFIELD_Intensive_Case_Finding n
WHERE n.WeightLoss = 1
UNION SELECT DISTINCT n.ptn_pk,
		n.visit_pk,
		''Sweat'' Symptom
FROM DTL_FBCUSTOMFIELD_Intensive_Case_Finding n
WHERE n.Sweat = 1				   
UNION SELECT DISTINCT n.ptn_pk,
		n.visit_pk,
		''Contact TB'' Symptom
FROM DTL_FBCUSTOMFIELD_Intensive_Case_Finding n
WHERE n.ContactTB = 1				  
UNION SELECT DISTINCT n.ptn_pk,
		n.visit_pk,
		''No signs'' Symptom
FROM DTL_FBCUSTOMFIELD_Intensive_Case_Finding n
WHERE (n.Cough = 0
OR n.Cough IS NULL)
AND (n.WeightLoss = 0
OR n.WeightLoss IS NULL)
AND (n.Sweat = 0
OR n.Sweat IS NULL)					
AND (n.ContactTB = 0
OR n.ContactTB IS NULL)				
AND (n.Fever = 0
OR n.Fever IS NULL)
UNION SELECT DISTINCT a.ptn_pk,
		a.Visit_pk,
		b.Name Symptom
FROM dtl_PatientOtherTreatment a
INNER JOIN mst_BlueDecode b ON a.TBStatus = b.ID
WHERE b.Name NOT IN (''Not Done'')				
) a) b ON a.Visit_Id = b.Visit_Pk
WHERE a.DeleteFlag = 0 or a.DeleteFlag IS NULL')

--//IQCare 4.0 Clinical Encounter

IF EXISTS(Select Name FROM sys.tables WHERE NAME = 'dtl_Multiselect_line')
EXEC('INSERT INTO tmp_ICFSymptoms
SELECT a.Ptn_Pk
, a.VisitDate
, b.Symptom
FROM ord_Visit a INNER JOIN (
 SELECT Ptn_pk  
  ,Visit_Pk 
  , b.Name Symptom
 FROM dtl_Multiselect_line a  INNER JOIN mst_Decode b ON a.ValueID = b.ID
 WHERE FieldName IN (''TBAssessmentICF'')  
  AND (a.DeleteFlag IS NULL  OR a.DeleteFlag = 0)) b
 ON a.Visit_Id = b.Visit_Pk
 WHERE a.DeleteFlag = 0 or a.DeleteFlag IS NULL');

Exec('CREATE CLUSTERED INDEX [IDX_ICFCPK] ON 
[dbo].[tmp_ICFSymptoms] (VisitDate, Ptn_Pk ASC )
WITH (PAD_INDEX  = OFF
, STATISTICS_NORECOMPUTE  = OFF
, SORT_IN_TEMPDB = OFF
, IGNORE_DUP_KEY = OFF
, DROP_EXISTING = OFF
, ONLINE = OFF
, ALLOW_ROW_LOCKS  = ON
, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
');


WITH ICF AS(

select distinct ptn_pk
, visitdate
, max(case when symptom like '%cough%' then 1 else 0 end) as Cough
, max(case when symptom like '%fever%' then 1 else 0 end) as Fever
, max(case when symptom like '%weight%loss%' then 1 else 0 end) as WeightLoss
, max(case when symptom like '%night%' then 1 else 0 end) as NightSweats
, max(case when Symptom = 'TB Rx' THEN 1 ELSE 0 END) AS OnAntiTbDrugs
, max(0) OnIpt
, max(0) EverBeenOnIpt
 from tmp_ICFSymptoms
 group by ptn_pk, visitdate )

insert into PatientIcf
 select distinct d.Id PatientMasterVisitId
 , c.Id PatientId
 , a.Cough
 , a.Fever
 , a.WeightLoss
 , a.NightSweats
 , 0 DeleteFlag
 , d.CreatedBy
 , d.CreateDate
 , NULL AuditDate
 , a.OnAntiTbDrugs
 , a.OnIpt
 , a.EverBeenOnIpt
  from ICF a
inner join Patient c on a.Ptn_pk = c.ptn_pk
inner join PatientMasterVisit d on c.id = d.PatientId
and cast(a.visitdate as date) = cast(d.visitdate as date)
and d.VisitType = 0
left join PatientIcf e ON d.Id = e.PatientMasterVisitId
where e.PatientMasterVisitId IS NULL


IF EXISTS(Select Name FROM sys.tables WHERE NAME = 'tmp_ICFSymptoms')
DROP TABLE tmp_ICFSymptoms