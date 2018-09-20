--Order

insert into ord_LabOrder
(Ptn_Pk, LocationId, VisitId,ModuleId 
,OrderedBy
, OrderDate
, ClinicalOrderNotes
, CreatedBy
, CreateDate
, OrderStatus
, UserId
, DeleteFlag
, PatientId
, PatientMasterVisitId)

select a.Ptn_pk
, a.LocationID
, a.VisitId
, 203 ModuleId
, 1 OrderedBy
, a.OrderedbyDate
, '' ClinicalOrderNotes
, 0 CreatedBy
, GETDATE() CreateDate
, 'Pending' OrderStatus
, 1 UserId
, 0 DeleteFlag
, c.Id PatientId
, d.Id PatientMasterVisitId
 from ord_PatientLabOrder_Old a 
inner join ord_visit b on a.VisitId = b.Visit_Id
inner join Patient c on a.Ptn_pk = c.ptn_pk
inner join PatientMasterVisit d on c.id = d.PatientId
and cast(b.visitdate as date) = cast(d.visitdate as date)
and d.VisitType = 0
left join ord_LabOrder e ON d.Id = e.PatientMasterVisitId
where (b.DeleteFlag = 0 or b.DeleteFlag is null)
and e.Id IS NULL 
and a.OrderedbyDate is not null

-- Order Test

insert into dtl_LabOrderTest
(LabOrderId, LabTestId, TestNotes, IsParent, DeleteFlag
, ResultStatus, UserId, StatusDate, CreateDate, CreatedBy)

select distinct 
d.Id LabOrderId
, e.Id LabTestId
, '' TestNotes
, 0 IsParent
, 0 DeleteFlag
, NULL ResultStatus
, 1 UserId
, getdate() StatusDate
, getdate() CreateDate
, 1 CreatedBy

from ord_PatientLabOrder_Old a inner join 
dtl_PatientLabResults_Old b on a.LabID = b.LabID
inner join Mst_LabTest_Old c ON b.LabTestID = c.LabTestID
inner join ord_LabOrder d on a.VisitId = d.VisitId
inner join mst_LabTestMaster e ON c.LabName = e.Name


-- Lab Tracker
insert into PatientLabTracker

select distinct
a.PatientId
, a.PatientMasterVisitId
, d.Name
, a.OrderDate
, 'Other' Reasons
, 1 CreatedBy 
, getdate() CreateDate
, NULL AuditData
, 0 DeleteFlag
, 'Pending' Results
, a.Id LabOrderId
, 0 ResultValues
, a.LocationID
, d.Id LabTestId
, NULL ResultTexts
, b.Id LabOrderTestid
, NULL ResultUnits
, getdate() resultDate
, NULL ResultOptions
 from ord_LabOrder a 
inner join dtl_LabOrderTest b on a.Id = b.LabOrderId
left join PatientLabTracker c ON a.PatientMasterVisitId = c.PatientMasterVisitId
inner join mst_LabTestMaster d ON b.LabTestId = d.Id
where c.Id IS NULL 

-- Results

insert into dtl_LabOrderTestResult
(
LabOrderId
, LabTestId
, LabOrderTestId
, ParameterId
, UserId
, DeleteFlag
, CreateDate
, CreatedBy
, StatusDate
)

select distinct
a.LabOrderId
, a.LabTestId
, a.Id LabOrderTestId
, b.Id ParameterId 
, 1 UserId
, 0 DeleteFlag
, GETDATE() CreateDate
, 1 CreatedBy
, GETDATE() StatusDate

from 
dtl_LabOrderTest a inner join Mst_LabTestParameter b on a.LabTestId = b.LabTestId
left join dtl_LabOrderTestResult  c ON a.Id = c.LabOrderTestId
where c.Id IS NULL
