/*

TODO

select Ptn_pk
, YellowEyes
, YellowUrine
, NumbnessAdult
, NumbnessPead
, TenderAbdomen
, PainAbdomen
, IPTStartDate from DTL_FBCUSTOMFIELD_Intensive_Case_Finding
WHERE IPTStartDate is not null
*/

WITH IPTStart AS (
Select a.Ptn_pk PatientPK
, Min(Coalesce(a.DispensedByDate, b.visitdate)) IPTStartDate
, MAX(Coalesce(a.DispensedByDate, b.visitdate)) LastIPTDispense
, Max(a.DrugName) Medication    
From VW_PatientPharmacy a      
Inner Join ord_visit b On a.VisitID = b.visit_id   
inner join CCCPatientsBeingMigrated c on a.Ptn_pk = c.Ptn_pk    
Where a.DrugName LIKE 'Isoniazid%' Group By a.Ptn_pk)

, Discountinued AS (
select a.Ptn_Pk PatientPK
, MAX(c.Name) DiscontinuationReason
, MAX(COALESCE(CASE WHEN YEAR(INHEndDate) < 2000 THEN NULL ELSE a.INHEndDate END, b.VisitDate)) INHDiscontinuedDate
from dtl_TBScreening a 
INNER JOIN ord_Visit b ON a.Visit_Pk = b.Visit_Id
INNER JOIN mst_Decode c ON a.IPTDiscontinued = c.ID
WHERE b.DeleteFlag = 0 OR b.DeleteFlag IS NULL
GROUP BY a.Ptn_Pk)

, Outcomes AS  
(Select a.PatientPK  
, CASE WHEN DATEDIFF(MM, a.IPTStartDate, c.LastVisit) > 6 	
	AND d.PatientPK IS NULL	
	THEN 'TC' 
	WHEN d.PatientPK IS NOT NULL THEN 'Discontinued'
	ELSE NULL END AS IPTOutcome
, CASE WHEN d.PatientPK IS NOT NULL THEN d.DiscontinuationReason ELSE NULL END AS ReasonForDiscountinuation  
, CASE WHEN DATEDIFF(MM, a.IPTStartDate, c.LastVisit) > 6 	
	AND d.PatientPK IS NULL
	THEN DATEADD(MM, 6, a.IPTStartDate) 
	WHEN d.PatientPK IS NOT NULL THEN d.INHDiscontinuedDate
	ELSE NULL END AS DateOfOutcome  
FROM IPTStart a INNER JOIN CCCPatientsBeingMigrated b ON a.PatientPK = b.Ptn_pk  
INNER JOIN (Select Ptn_Pk, max(visitdate) LastVisit FROM CCCEncountersBeingMigrated GROUP BY Ptn_Pk) c
on a.patientpk = c.Ptn_Pk
LEFT JOIN Discountinued d ON a.PatientPK = d.PatientPK
) 

, tmp_IPT AS (
SELECT a.PatientPK
, CAST(a.IPTStartDate as DATE) IPTStartDate
, CAST(a.LastIPTDispense as DATE) LastIPTDispense
, DATEDIFF(mm, a.IPTStartDate, a.LastIPTDispense) MonthsOnIPT 
, a.Medication
, b.IPTOutcome
, CAST(b.DateOfOutcome as DATE) DateOfOutcome
, b.ReasonForDiscountinuation
FROM 
IPTStart a LEFT JOIN Outcomes b ON a.PatientPK = b.PatientPK)

, StartIPT AS (
Select a.PatientPK
, a.IPTStartDate
  FROM tmp_IPT a inner join CCCEncountersBeingMigrated b ON a.PatientPK = b.Ptn_Pk
AND a.IPTStartDate = b.VisitDate)


insert into PatientIptWorkup
(PatientId
,PatientMasterVisitId
, YellowColouredUrine
, Numbness
, YellownessOfEyes
, AbdominalTenderness
, LiverFunctionTests
, DeleteFLag
, CreatedBy
, CreateDate
, StartIpt
, IptStartDate)

Select b.Id PatientId
, c.Id PatientMasterVisitId
, 0 YellowColouredUrine
, 0 Numbness
, 0 YellownessOfEyes
, 0 AbdominalTenderness
, '' LiverFunctionTests
, 0 DeleteFLag
, c.CreatedBy
, c.CreateDate
, 1 StartIpt
, a.IPTStartDate
FROM StartIPT a
INNER JOIN Patient b on a.PatientPK = b.ptn_pk
inner join PatientMasterVisit c on b.id = c.PatientId
and cast(a.IPTStartDate as date) = cast(c.visitdate as date)
and c.VisitType = 0
left join PatientIptWorkup d ON c.Id = d.PatientMasterVisitId
where d.PatientMasterVisitId IS NULL
go


UPDATE PatientIcf
SET EverBeenOnIpt = 1
WHERE PatientMasterVisitId IN 
(select PatientMasterVisitId
FROM PatientIptWorkup WHERE StartIpt = 1)
GO