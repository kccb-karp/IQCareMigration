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

/* ARVTreatment Tracker */


Insert into ARVTreatmentTracker 
(PatientId
,ServiceAreaId
,PatientMasterVisitId
,RegimenId
,RegimenLineId
,TreatmentStatusId
,TreatmentStatusReasonId
,DeleteFlag
,CreateBy
,createdate)


select a.PatientId
, 0 ServiceAreaId
, a.PatientMasterVisitId
, ISNULL(f.ItemId,0) RegimenCodeId
, ISNULL(f.MasterId,0) RegimenLineID

, 541 TreatmentStatusID
, 0 TreatmentPlanReason
, 0 DeleteFlag
, 1 CreatedBy
, a.CreateDate
 from ord_PatientPharmacyOrder a 
inner join dtl_RegimenMap c ON a.ptn_pharmacy_pk = c.OrderID
left join mst_Regimen d ON c.RegimenId = d.RegimenID
left join mst_RegimenLine e ON d.RegimenLineID = e.ID
left join LookupItemView f ON d.RegimenCode = f.ItemName
left join ARVTreatmentTracker g ON a.PatientMasterVisitId = g.PatientMasterVisitId
inner join mst_patient h on a.ptn_pk = h.ptn_pk
where g.Id IS NULL
and (a.DeleteFlag = 0 or a.DeleteFlag is null)
and a.PatientId is not null
and (h.deleteflag = 0 or h.deleteflag is null)
go

declare @PharmacyEncounter varchar(50) = (select top 1 Id from lookupitem where Name = 'Pharmacy-encounter')
insert into PatientEncounter
select pmv.PatientId, @PharmacyEncounter, pmv.Id, pmv.start, pmv.start, 204, 0, 1, ord.createdate, null,0
from ord_patientpharmacyorder ord inner join patientmastervisit pmv on ord.PatientMasterVisitId = pmv.id
where patientmastervisitid is not null and not exists (select 1 from PatientEncounter where PatientId = pmv.PatientId 
and encountertypeid=@PharmacyEncounter and patientmastervisitid = pmv.Id)
go