WITH Pharmacy AS (

select a.ptn_pharmacy_pk
, d.PatientId
, d.Id PatientMasterVisitId
 from ord_PatientPharmacyOrder
a inner join ord_visit b on a.VisitID = b.Visit_Id
inner join Patient c on a.Ptn_pk = c.ptn_pk
inner join PatientMasterVisit d on c.Id = d.PatientId and 
cast(b.visitdate as date) = cast(d.visitdate as date)
and d.VisitType = 0
inner join mst_Patient e ON a.ptn_pk = e.ptn_pk
where a.PatientMasterVisitId is null
and (e.deleteflag = 0 or e.deleteflag is null))

UPDATE ord_PatientPharmacyOrder
SET PatientId = B.PatientId
, PatientMasterVisitId = B.PatientMasterVisitId
FROM ord_PatientPharmacyOrder A
INNER JOIN Pharmacy B
    ON A.ptn_pharmacy_pk = B.ptn_pharmacy_pk
WHERE A.PatientId IS NULL
GO

IF EXISTS (Select name from sys.tables where name = 'Dispensed')
DROP TABLE Dispensed
GO

CREATE TABLE Dispensed
(Ptn_Pk INT NULL
, PatientId INT NULL
, OrderedByDate datetime null
, PatientMasterVisitId INT NULL
, ProgID varchar(100) null
, RegimenLine varchar(100) null
, RegimenType varchar(100) null
, age varchar(100) null
, createdate datetime null)
GO

insert into Dispensed
Select distinct b.Ptn_pk
, b.PatientId
, b.OrderedByDate
, b.PatientMasterVisitId
, c.Name ProgID
, b.RegimenLine
, case when h.DrugName like '%tenofovir%Lamivudine%dolutegravir%' then '3TC/TDF/DTG' 
when h.DrugName like '%Tenofovi%Lamivudine%Efavirenz%' then 'TDF/3TC/EFV'
when h.DrugName like '%DOLUTEGRAVIR%LAMIVUDINE%TENOFOVIR%' then '3TC/TDF/DTG'
else
REPLACE(REPLACE(REPLACE(a.RegimenType, 'LOPr','LPV/r'),'ATR/RTV','ATV/r'),'DVT','DTG') end RegimenType
 
, CASE WHEN DATEDIFF(dd, d.DOB, b.OrderedByDate)/365.25 < 15 THEN 'CHILD' ELSE 'ADULT' END AS Age
, b.CreateDate

FROM dtl_RegimenMap a LEFT JOIN ord_PatientPharmacyOrder b ON a.OrderID = b.ptn_pharmacy_pk
LEFT JOIN mst_Decode c ON b.ProgID = c.ID
LEFT JOIN CCCPatientsBeingMigrated d ON a.Ptn_Pk = d.Ptn_pk
LEFT JOIN mst_Regimen e ON a.RegimenId = e.RegimenID
LEFT JOIN LookupItemView f ON e.RegimenCode = f.ItemName
left join dtl_PatientPharmacyOrder g on b.ptn_pharmacy_pk = g.ptn_pharmacy_pk
left join mst_drug h on g.Drug_Pk = h.Drug_pk
WHERE (a.RegimenId is null or f.ItemId is null)
AND (b.DeleteFlag = 0 OR b.DeleteFlag IS NULL)

insert into ARVTreatmentTracker
(PatientId
, ServiceAreaId
, PatientMasterVisitId
, RegimenId
, RegimenLineId
, DrugId
, TreatmentStatusId
, ParentId
, DeleteFlag
, CreateBy
, CreateDate
, TreatmentStatusReasonId)

select * from (
select distinct a.PatientId
, 0 ServiceAreaId
, a.PatientMasterVisitId
, c.ItemId RegimenId
, e.LookupItemId RegimenLineId
, 0 DrugId
, 541 TreatmentStatusId
, 0 ParentId
, 0 DeleteFlag
, 4210 CreateBy
, isnull(a.CreateDate, getdate()) CreateDate
, 0 TreatmentStatusReasonId
 from Dispensed a 
INNER JOIN RegimenMap421 b ON a.RegimenType = b.Regimen AND a.Age = b.Age
INNER JOIN LookupItemView c ON b.RegimenCode = c.ItemName
INNER JOIN LookupMasterItem e ON c.MasterName = REPLACE(e.DisplayName, ' ','')
LEFT JOIN ARVTreatmentTracker d ON a.PatientMasterVisitId = d.PatientMasterVisitId
WHERE d.Id IS NULL
AND a.PatientId IS NOT NULL

union

select distinct a.PatientId
, 0 ServiceAreaId
, a.PatientMasterVisitId
, f.ItemId RegimenCodeId
, i.LookupItemId RegimenLineID
, 0 DrugId
, 541 TreatmentStatusID
, 0 ParentId
, 0 DeleteFlag
, 4210 CreatedBy
, isnull(a.CreateDate, getdate()) CreateDate
, 0 TreatmentPlanReason

 from ord_PatientPharmacyOrder a 
inner join dtl_RegimenMap c ON a.ptn_pharmacy_pk = c.OrderID
left join mst_Regimen d ON c.RegimenId = d.RegimenID
left join mst_RegimenLine e ON d.RegimenLineID = e.ID
inner join LookupItemView f ON d.RegimenCode = f.ItemName
INNER JOIN LookupMasterItem i ON f.MasterName = REPLACE(i.DisplayName, ' ','')
left join ARVTreatmentTracker g ON a.PatientMasterVisitId = g.PatientMasterVisitId
inner join mst_patient h on a.ptn_pk = h.ptn_pk
where g.Id IS NULL
and (a.DeleteFlag = 0 or a.DeleteFlag is null)
and a.PatientId is not null
and (h.deleteflag = 0 or h.deleteflag is null)) a
order by a.PatientMasterVisitId;

declare @PharmacyEncounter varchar(100) = (select top 1 Id from lookupitem where Name = 'Pharmacy-encounter')
insert into PatientEncounter
select pmv.PatientId, @PharmacyEncounter, pmv.Id, pmv.start, pmv.start, 204, 0, 1, pmv.createdate, null,0
from ord_patientpharmacyorder ord inner join patientmastervisit pmv on ord.PatientMasterVisitId = pmv.id
where patientmastervisitid is not null and not exists (select 1 from PatientEncounter where PatientId = pmv.PatientId 
and encountertypeid=@PharmacyEncounter and patientmastervisitid = pmv.Id);

IF EXISTS (Select name from sys.tables where name = 'Dispensed')
DROP TABLE Dispensed
GO