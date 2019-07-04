WITH MMAS as (
SELECT a.Ptn_pk
, CAST(c.VisitDate as DATE) VisitDate
, ISNULL(a.ForgetMedicineSinceLastVisit,0) ForgotMedicine
, ISNULL(a.CarelessAboutTakingMedicine,0) CarelessAboutMedicine
, ISNULL(a.FeelWorseStopTakingMedicine,0) FeelWorse 
, ISNULL(a.FeelBetterStopTakingMedicine,0) FeelBetter

, ISNULL(a.TakeMedicineYesterday,0) TakeMedicine
, ISNULL(a.SymptomsUnderControl_StopTakingMedicine,0) StopMedicine 
, ISNULL(a.UnderPresureStickingYourTreatmentPlan,0) UnderPressure
, CASE b.Name 
	WHEN 'Never / Rarely' THEN 0
	WHEN 'Once in a while' THEN 0.25
	WHEN 'Sometimes' THEN 0.50
	WHEN 'Usually' THEN 0.75
	WHEN 'All the time' THEN 1.00
ELSE 0 END AS DifficultyRemembering
FROM dtl_HIVCE_PatientAdherenceManagement a 
left join mst_Decode b ON a.RememberingMedications = b.ID
inner join ord_Visit c ON a.Visit_Id = c.Visit_Id
WHERE (c.DeleteFlag = 0 or c.DeleteFlag is null))


INSERT INTO AdherenceAssessment 
(PatientId
, PatientMasterVisitId

, ForgetMedicine
, CarelessAboutMedicine
, FeelWorse
, FeelBetter

, TakeMedicine
, StopMedicine
, UnderPressure
, DifficultyRemembering

, CreatedBy
, CreateDate
, Deleteflag
, AuditData
)
select distinct 
b.Id PatientId
, c.Id PatientMasterVisitId 
, a.ForgotMedicine
, a.CarelessAboutMedicine
, a.FeelWorse
, a.FeelBetter

, CASE WHEN a.ForgotMedicine
			+ a.CarelessAboutMedicine
			+ a.FeelWorse
			+ a.FeelBetter=0 THEN NULL ELSE a.TakeMedicine END AS TakeMedicine
, CASE WHEN a.ForgotMedicine
			+ a.CarelessAboutMedicine
			+ a.FeelWorse
			+ a.FeelBetter=0 THEN NULL ELSE  a.StopMedicine END AS  StopMedicine
, CASE WHEN a.ForgotMedicine
			+ a.CarelessAboutMedicine
			+ a.FeelWorse
			+ a.FeelBetter=0 THEN NULL ELSE  a.UnderPressure END AS UnderPressure
, CASE WHEN a.ForgotMedicine
			+ a.CarelessAboutMedicine
			+ a.FeelWorse
			+ a.FeelBetter=0 THEN NULL ELSE  a.DifficultyRemembering END AS DifficultyRemembering

, c.CreatedBy
, c.CreateDate
, c.DeleteFlag
, NULL AuditData
from MMAS a
inner join Patient b on a.Ptn_pk = b.ptn_pk
inner join PatientMasterVisit c on b.id = c.PatientId
and cast(a.visitdate as date) = cast(c.visitdate as date)
and c.VisitType = 0
left join AdherenceAssessment d ON c.Id = d.PatientMasterVisitId
where d.PatientMasterVisitId IS NULL
GO

 WITH Adherence AS (
 SELECT 
 a.Ptn_Pk
 , a.VisitDate
 , CASE b.CotrimoxazoleAdhere 
	WHEN 1 THEN 68
	WHEN 2 THEN 70
	WHEN 3 THEN 71
	ELSE NULL END AS CTXAdherence
 , CASE c.ARVAdhere 
	WHEN 1 THEN 68
	WHEN 2 THEN 70
	WHEN 3 THEN 71 
	ELSE NULL END AS ARTAdherence
FROM 
ord_Visit a LEFT JOIN 
 dtl_Adherence_Reason b ON a.Visit_Id = b.Visit_pk  
 LEFT JOIN dtl_PatientAdherence c ON a.Visit_Id = c.Visit_Pk
 WHERE (a.DeleteFlag = 0 or a.DeleteFlag IS NULL)
AND coalesce(b.CotrimoxazoleAdhere, c.ARVAdhere) is not null)

INSERT INTO AdherenceOutcome
SELECT distinct b.Id PatientId
, c.Id PatientMasterVisitId
, a.AdherenceType
, a.Score
, null ScoreDescription
, 0 DeleteFlag
, c.CreatedBy
, c.CreateDate
, null AuditData
 FROM 
(SELECT Ptn_Pk
, 34 AdherenceType
, ARTAdherence Score
, CAST(VisitDate as DATE) VisitDate 
FROM Adherence
WHERE ARTAdherence IS NOT NULL
UNION
Select Ptn_PK
, 35 AdherenceType
, CTXAdherence Score
, CAST(VisitDate as DATE) FROM Adherence
WHERE CTXAdherence IS NOT NULL) a 
inner join Patient b on a.Ptn_pk = b.ptn_pk
inner join PatientMasterVisit c on b.id = c.PatientId
and cast(a.visitdate as date) = cast(c.visitdate as date)
and c.VisitType = 0
left join AdherenceOutcome d ON c.Id = d.PatientMasterVisitId
where d.PatientMasterVisitId IS NULL
GO