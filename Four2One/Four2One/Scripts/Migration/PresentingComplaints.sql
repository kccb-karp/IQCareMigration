if exists(select name from sys.tables where name = N'dtl_FB_PresentingComplaints')
begin

with Presenting_Complaints AS (
select a.Ptn_Pk
, a.Visit_Id
, c.Name Complaint
, cast(a.VisitDate as date) OnsetDate
, cast(a.VisitDate as date) VisitDate
FROM ord_Visit a INNER JOIN 
dtl_PatientSymptoms b ON a.Visit_Id = b.Visit_pk
LEFT JOIN mst_Symptom c ON b.SymptomID = c.ID
LEFT JOIN mst_SymptomCategory d ON c.CategoryID = d.SymptomCategoryID
where d.SymptomCategoryName = 'PresentingComplaints'
and (a.DeleteFlag = 0 or a.DeleteFlag is null)

union
select a.Ptn_pk
, a.Visit_Pk
, b.Name 
, cast(a.DateField1 as date) OnsetDate 
, cast(c.VisitDate as date) VisitDate
FROM
dtl_Multiselect_line a
inner join mst_DeCode b on a.ValueID= b.Id
inner join ord_VIsit c on a.Visit_Pk = c.Visit_Id
where FieldName = 'PresentingComplaints'
and (c.DeleteFlag = 0 or c.DeleteFlag is null)

UNION
select a.Ptn_pk
, a.Visit_Pk
, b.Name Complaint
, cast(c.visitdate as date) OnsetDate 
, cast(c.VisitDate as date) VisitDate
from dtl_FB_PresentingComplaints a 
inner join mst_ModDeCode b on a.PresentingComplaints = b.Id 
inner join ord_Visit c ON a.Visit_Pk = c.Visit_Id
where c.DeleteFlag = 0 or c.DeleteFlag is null
)

, LookupItems AS 
(select ItemId, ItemName FROM LookupItemView 
where MasterName = 'presentingcomplaints')

insert into PresentingComplaints
select distinct c.Id PatientId
, d.Id PatientMasterVisitId 
, b.ItemId PresentingComplaintsId
, a.OnsetDate
, 0 DeleteFlag
, d.CreatedBy
, d.CreateDate
FROM Presenting_Complaints a 
inner join LookupItems b on a.Complaint = b.ItemName
inner join Patient c on a.Ptn_pk = c.ptn_pk
inner join PatientMasterVisit d on c.id = d.PatientId
and cast(a.visitdate as date) = cast(d.visitdate as date)
and d.VisitType = 0
left join PresentingComplaints e ON d.Id = e.PatientMasterVisitId
where e.PatientMasterVisitId IS NULL

UPDATE ComplaintsHistory
SET AnyComplaint = 1 
WHERE PatientMasterVisitId IN (Select DISTINCT PatientMasterVisitId FROM PresentingComplaints)

end 

else 

begin

with Presenting_Complaints AS (
select a.Ptn_Pk
, a.Visit_Id
, c.Name Complaint
, cast(a.VisitDate as date) OnsetDate
, cast(a.VisitDate as date) VisitDate
FROM ord_Visit a INNER JOIN 
dtl_PatientSymptoms b ON a.Visit_Id = b.Visit_pk
LEFT JOIN mst_Symptom c ON b.SymptomID = c.ID
LEFT JOIN mst_SymptomCategory d ON c.CategoryID = d.SymptomCategoryID
where d.SymptomCategoryName = 'PresentingComplaints'
and (a.DeleteFlag = 0 or a.DeleteFlag is null)

union
select a.Ptn_pk
, a.Visit_Pk
, b.Name 
, cast(a.DateField1 as date) OnsetDate 
, cast(c.VisitDate as date) VisitDate
FROM
dtl_Multiselect_line a
inner join mst_DeCode b on a.ValueID= b.Id
inner join ord_VIsit c on a.Visit_Pk = c.Visit_Id
where FieldName = 'PresentingComplaints'
and (c.DeleteFlag = 0 or c.DeleteFlag is null)
)

, LookupItems AS 
(select ItemId, ItemName FROM LookupItemView 
where MasterName = 'presentingcomplaints')

insert into PresentingComplaints
select distinct c.Id PatientId
, d.Id PatientMasterVisitId 
, b.ItemId PresentingComplaintsId
, a.OnsetDate
, 0 DeleteFlag
, d.CreatedBy
, d.CreateDate
FROM Presenting_Complaints a 
inner join LookupItems b on a.Complaint = b.ItemName
inner join Patient c on a.Ptn_pk = c.ptn_pk
inner join PatientMasterVisit d on c.id = d.PatientId
and cast(a.visitdate as date) = cast(d.visitdate as date)
and d.VisitType = 0
left join PresentingComplaints e ON d.Id = e.PatientMasterVisitId
where e.PatientMasterVisitId IS NULL


UPDATE ComplaintsHistory
SET AnyComplaint = 1 
WHERE PatientMasterVisitId IN (Select DISTINCT PatientMasterVisitId FROM PresentingComplaints)

end