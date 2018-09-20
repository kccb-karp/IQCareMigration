WITH Weights AS
(Select 
a.Ptn_Pk
, a.Weight
, CAST(b.VisitDate as date) VisitDate
FROM dtl_PatientVitals a INNER JOIN 
ord_Visit b ON a.Ptn_pk = b.Ptn_Pk and a.Visit_pk = b.Visit_Id
WHERE (b.DeleteFlag = 0 or b.DeleteFlag is null)
AND a.Weight BETWEEN 1 and 500)

, Weights_ AS 
(Select Ptn_pk
, MAX(Weight) Weight
, VisitDate
 FROM Weights 
 GROUP BY Ptn_pk, VisitDate)

 , Heights AS
(Select 
a.Ptn_Pk
, a.Height
, CAST(b.VisitDate as date) VisitDate
FROM dtl_PatientVitals a INNER JOIN 
ord_Visit b ON a.Ptn_pk = b.Ptn_Pk and a.Visit_pk = b.Visit_Id
WHERE (b.DeleteFlag = 0 or b.DeleteFlag is null)
AND a.Height BETWEEN 30 and 300)

, Heights_ AS 
(Select Ptn_pk
, MAX(Height) Height
, VisitDate
 FROM Heights 
 GROUP BY Ptn_pk, VisitDate)

 , Temp AS
(Select 
a.Ptn_Pk
, a.Temp
, CAST(b.VisitDate as date) VisitDate
FROM dtl_PatientVitals a INNER JOIN 
ord_Visit b ON a.Ptn_pk = b.Ptn_Pk and a.Visit_pk = b.Visit_Id
WHERE (b.DeleteFlag = 0 or b.DeleteFlag is null)
AND a.Temp BETWEEN 34 and 40)

, Temp_ AS 
(Select Ptn_pk
, MAX(Temp) Temp
, VisitDate
 FROM Temp 
 GROUP BY Ptn_pk, VisitDate)

 , RR AS
(Select 
a.Ptn_Pk
, a.RR
, CAST(b.VisitDate as date) VisitDate
FROM dtl_PatientVitals a INNER JOIN 
ord_Visit b ON a.Ptn_pk = b.Ptn_Pk and a.Visit_pk = b.Visit_Id
WHERE (b.DeleteFlag = 0 or b.DeleteFlag is null)
AND a.RR BETWEEN 5 and 50)

, RR_ AS 
(Select Ptn_pk
, MAX(RR) RR
, VisitDate
 FROM RR 
 GROUP BY Ptn_pk, VisitDate)

 , HR AS
(Select 
a.Ptn_Pk
, a.HR
, CAST(b.VisitDate as date) VisitDate
FROM dtl_PatientVitals a INNER JOIN 
ord_Visit b ON a.Ptn_pk = b.Ptn_Pk and a.Visit_pk = b.Visit_Id
WHERE (b.DeleteFlag = 0 or b.DeleteFlag is null)
AND a.HR BETWEEN 20 and 200)

, HR_ AS 
(Select Ptn_pk
, MAX(HR) HR
, VisitDate
 FROM HR 
 GROUP BY Ptn_pk, VisitDate)

, BPS AS
(Select 
a.Ptn_Pk
, a.BPSystolic
, CAST(b.VisitDate as date) VisitDate
FROM dtl_PatientVitals a INNER JOIN 
ord_Visit b ON a.Ptn_pk = b.Ptn_Pk and a.Visit_pk = b.Visit_Id
WHERE (b.DeleteFlag = 0 or b.DeleteFlag is null)
AND a.BPSystolic BETWEEN 0 and 500)

, BPS_ AS 
(Select Ptn_pk
, MAX(BPSystolic) BPSystolic
, VisitDate
 FROM BPS 
 GROUP BY Ptn_pk, VisitDate)

, BPD AS
(Select 
a.Ptn_Pk
, a.BPDiastolic
, CAST(b.VisitDate as date) VisitDate
FROM dtl_PatientVitals a INNER JOIN 
ord_Visit b ON a.Ptn_pk = b.Ptn_Pk and a.Visit_pk = b.Visit_Id
WHERE (b.DeleteFlag = 0 or b.DeleteFlag is null)
AND a.BPDiastolic BETWEEN 0 and 500)

, BPD_ AS 
(Select Ptn_pk
, MAX(BPDiastolic) BPDiastolic
, VisitDate
 FROM BPD
 GROUP BY Ptn_pk, VisitDate)

, MUAC AS
(Select 
a.Ptn_Pk
, a.MUAC
, CAST(b.VisitDate as date) VisitDate
FROM dtl_PatientVitals a INNER JOIN 
ord_Visit b ON a.Ptn_pk = b.Ptn_Pk and a.Visit_pk = b.Visit_Id
WHERE (b.DeleteFlag = 0 or b.DeleteFlag is null)
AND a.MUAC BETWEEN 5 and 50)

, MUAC_ AS 
(Select Ptn_pk
, MAX(MUAC) MUAC
, VisitDate
 FROM MUAC
 GROUP BY Ptn_pk, VisitDate) 

 , Headcircumference AS
(Select 
a.Ptn_Pk
, a.Headcircumference
, CAST(b.VisitDate as date) VisitDate
FROM dtl_PatientVitals a INNER JOIN 
ord_Visit b ON a.Ptn_pk = b.Ptn_Pk and a.Visit_pk = b.Visit_Id
WHERE (b.DeleteFlag = 0 or b.DeleteFlag is null)
AND a.Headcircumference BETWEEN 30 and 70)

, Headcircumference_ AS 
(Select Ptn_pk
, MAX(Headcircumference) Headcircumference
, VisitDate
 FROM Headcircumference
 GROUP BY Ptn_pk, VisitDate) 

 , BMIz AS
(Select 
a.Ptn_Pk
, a.BMIz
, CAST(b.VisitDate as date) VisitDate
FROM dtl_PatientVitals a INNER JOIN 
ord_Visit b ON a.Ptn_pk = b.Ptn_Pk and a.Visit_pk = b.Visit_Id
WHERE (b.DeleteFlag = 0 or b.DeleteFlag is null)
AND a.BMIz > 0)

, BMIz_ AS 
(Select Ptn_pk
, MAX(BMIz) BMIz
, VisitDate
 FROM BMIz
 GROUP BY Ptn_pk, VisitDate) 


 , WeightForAge AS
(Select 
a.Ptn_Pk
, a.WeightForAge
, CAST(b.VisitDate as date) VisitDate
FROM dtl_PatientVitals a INNER JOIN 
ord_Visit b ON a.Ptn_pk = b.Ptn_Pk and a.Visit_pk = b.Visit_Id
WHERE (b.DeleteFlag = 0 or b.DeleteFlag is null)
AND a.WeightForAge > 0)

, WeightForAge_ AS 
(Select Ptn_pk
, MAX(WeightForAge) WeightForAge
, VisitDate
 FROM WeightForAge
 GROUP BY Ptn_pk, VisitDate) 

 , WeightForHeight AS
(Select 
a.Ptn_Pk
, a.WeightForHeight
, CAST(b.VisitDate as date) VisitDate
FROM dtl_PatientVitals a INNER JOIN 
ord_Visit b ON a.Ptn_pk = b.Ptn_Pk and a.Visit_pk = b.Visit_Id
WHERE (b.DeleteFlag = 0 or b.DeleteFlag is null)
AND a.WeightForHeight > 0)

, WeightForHeight_ AS 
(Select Ptn_pk
, MAX(WeightForHeight) WeightForHeight
, VisitDate
 FROM WeightForHeight
 GROUP BY Ptn_pk, VisitDate) 

, SPO2 AS (SELECT b.Ptn_pk
	, cast(d.visitdate as date) VisitDate
	,a.TestResults SPO2
	FROM dtl_PatientLabResults_Old a
	INNER JOIN ord_PatientLabOrder_Old b ON a.LabID = b.LabID
	INNER JOIN Mst_LabTest_Old c ON a.LabTestID = c.LabTestID
	INNER JOIN ord_Visit d ON b.VisitId = d.Visit_Id and b.Ptn_pk = d.Ptn_Pk
	WHERE c.LabName = N'SPO2(%)'
	and (d.DeleteFlag = 0 or d.DeleteFlag is null)
	and a.TestResults between 80 and 100
	)

, SPO2_ AS 
(Select Ptn_pk
, MAX(SPO2) SPO2
, VisitDate
 FROM SPO2
 GROUP BY Ptn_pk, VisitDate) 

 , CCCEncountersBeingMigrated AS (
Select 
a.Ptn_Pk
, case when a.visitdate > getdate() 
	then cast(a.CreateDate as date) 
	else cast(a.VisitDate as date) 
	end as VisitDate
, MIN(CAST(a.CreateDate as date)) CreateDate
FROM 
ord_Visit a
INNER JOIN mst_VisitType b ON a.VisitType = b.VisitTypeID
Where 
(a.DeleteFlag = 0 OR a.DeleteFlag iS NULL)
AND a.VisitType NOT IN (0,4,5,6,12,18,19)
AND b.VisitName NOT IN 
('Contact Tracking Form'
,'Councelling'
,'HEI Follow Up Card'
,'HEI Part II'
,'HTS Lab Form'
,'Laboratory Results'
,'Maternal and Exposed Infant I'
,'Maternal And Exposed Infant II'
,'Maternal And Exposed Infant III'
,'TB Initial and Continuation Phase'
,'TB Patient Profile'
,'Adolescent and Youth Psychosocial form'
,'Cervical Cancer Screening Form'
,'HIVCE - Alcohol Depression Screening'
,'HIVCE - ART Readiness Assessment'
,'HIVCE - Treatment Preparation')
AND b.VisitName NOT LIKE '%enrollment%'
AND YEAR(visitdate) >= 2000
GROUP BY 
ptn_pk
, case when a.visitdate > getdate() 
	then cast(a.CreateDate as date) 
	else cast(a.VisitDate as date) 
	end)

 , Vitals AS (
Select a.Ptn_Pk
, a.VisitDate
, ISNULL(b.Weight,0) Weight
, ISNULL(c.Height, 0) Height
, ISNULL(d.Temp, 0) Temp
, ISNULL(e.RR, 0) RR
, ISNULL(f.HR, 0) HR
, ISNULL(CASE WHEN h.BPDiastolic > g.BPSystolic THEN h.BPDiastolic ELSE g.BPSystolic END,0) AS BPS
, ISNULL(CASE WHEN h.BPDiastolic > g.BPSystolic THEN g.BPSystolic ELSE h.BPDiastolic END,0) AS BPD
, ISNULL(i.WeightForAge,0) WeightForAge
, ISNULL(j.WeightForHeight,0) WeightForHeight
, ISNULL(k.BMIz,0) BMIz
, ISNULL(l.Headcircumference,0) Headcircumference
, ISNULL(m.SPO2,0) SPO2
, ISNULL(n.MUAC,0) MUAC
, ISNULL(CAST(b.[Weight]/((c.[Height]/100.0)*(c.[Height]/100.0)) AS decimal(18, 1)),0) BMI 

 FROM CCCEncountersBeingMigrated a 
LEFT JOIN Weights_ b ON a.Ptn_Pk = b.Ptn_Pk AND a.VisitDate = b.VisitDate
LEFT JOIN Heights_ c ON a.Ptn_Pk = c.Ptn_Pk AND a.VisitDate = c.VisitDate
LEFT JOIN Temp_ d ON a.Ptn_Pk = d.Ptn_pk AND a.VisitDate = d.VisitDate
LEFT JOIN RR_ e ON a.Ptn_Pk = e.Ptn_pk AND a.VisitDate = e.VisitDate
LEFT JOIN HR_ f ON a.Ptn_Pk = f.Ptn_pk AND a.VisitDate = f.VisitDate
LEFT JOIN BPS_ g ON a.Ptn_Pk = g.Ptn_pk AND a.VisitDate = g.VisitDate
LEFT JOIN BPD_ h ON a.Ptn_Pk = h.Ptn_pk AND a.VisitDate = h.VisitDate
LEFT JOIN WeightForAge_ i ON a.Ptn_Pk = i.Ptn_pk AND a.VisitDate = i.VisitDate
LEFT JOIN WeightForHeight_ j ON a.Ptn_Pk = j.Ptn_pk AND a.VisitDate = j.VisitDate
LEFT JOIN BMIz_ k ON a.Ptn_Pk = k.Ptn_pk AND a.VisitDate = k.VisitDate
LEFT JOIN Headcircumference_ l ON a.Ptn_Pk = l.Ptn_pk AND a.VisitDate = l.VisitDate
LEFT JOIN SPO2_ m ON a.Ptn_Pk = m.Ptn_pk AND a.VisitDate = m.VisitDate
LEFT JOIN MUAC_ n ON a.Ptn_Pk = n.Ptn_pk AND a.VisitDate = n.VisitDate)

INSERT INTO PatientVitals
select 
distinct c.Id PatientId
, d.Id PatientMasterVisitId
, a.Temp
, a.RR
, a.HR
, a.BPD
, a.BPS
, a.Height
, a.[Weight]
, a.MUAC
, a.SPO2
, a.BMI
, a.HeadCircumference
, a.BMIz
, a.WeightForAge
, a.WeightForHeight
, 0 Active
, d.VisitDate
, 0 DeleteFlag
, d.CreatedBy
, cast(a.visitdate as datetime) CreateDate
, NULL AuditData
 from
Vitals a 
inner join Patient c on a.Ptn_pk = c.ptn_pk
inner join PatientMasterVisit d on c.id = d.PatientId
and cast(a.visitdate as date) = cast(d.visitdate as date) and d.VisitType = 0
left join PatientVitals e ON d.Id = e.PatientMasterVisitId
where e.PatientMasterVisitId IS NULL
ORDER BY CreateDate

GO


declare @TriageEncounter varchar(50) = (select top 1 Id from lookupitem where Name = 'Triage-encounter');
insert into PatientEncounter 
select a.patientid, @TriageEncounter, a.PatientMasterVisitId, a.createdate, a.createdate
, 203, 0, 1, a.createdate, null, 0 
from PatientVitals a 
where not exists (select 1 from PatientEncounter 
where PatientId = a.patientid and encountertypeid=@TriageEncounter 
and patientmastervisitid = a.PatientMasterVisitId)
GO