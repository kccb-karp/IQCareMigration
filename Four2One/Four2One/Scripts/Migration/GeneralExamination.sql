if not exists(select * from LookupItem where Name = N'Wasted')
INSERT [LookupItem] ([Name], [DisplayName], [DeleteFlag]) 
VALUES (N'Wasted'
, N'Wasted'
, 0)
GO

if not exists(select * from LookupMasterItem
where LookupMasterId = 93
and DisplayName = 'Wasted')
INSERT LookupMasterItem 
([LookupMasterId]
, [LookupItemId]
, [DisplayName]
, [OrdRank]) 
VALUES 
(93
, (select top 1 id from LookupItem where Name = N'Wasted')
, N'Wasted'
, CAST(13.00 AS Decimal(5, 2)))
GO


with GeneralExamination AS (
select a.Ptn_pk
, b.VisitDate
, CASE c.[Name] 
WHEN 'Jaudice' THEN 'Jaundice'
WHEN 'Normal' THEN 'None'
WHEN 'Lymph nodes (axillary inguinal)' THEN 'Lymph nodes axillary'
WHEN 'Wasted' THEN 'Wasted'
WHEN 'Pallor' THEN 'Pallor'
WHEN 'Lethargic' THEN 'Lethargic'
WHEN 'Oedema' THEN 'Oedema'
WHEN 'Dehydration' THEN 'Dehydration'
WHEN 'Cyanosis' THEN 'Cyanosis'
WHEN 'Finger clubbing' THEN 'Finger Clubbing'
ELSE NULL END AS Observation
from dtl_Multiselect_line a
inner join ord_Visit b ON a.Visit_Pk = b.Visit_Id
inner join mst_Decode c ON a.ValueID = c.ID 
where a.FieldName = 'GeneralConditions'
and (b.DeleteFlag = 0 or b.DeleteFlag is null))

, GeneralExam AS 
(Select
a.Ptn_pk
, a.VisitDate
, 93 ExaminationTypeId
, b.LookupItemId ExamId
FROM GeneralExamination a
INNER JOIN LookupMasterItem b ON a.Observation = b.DisplayName
AND b.LookupMasterId = 93)

, Skin AS
(select a.Ptn_pk
, a.FieldName
, b.VisitDate
, CASE c.[Name] 
WHEN 'Abscess' THEN 'Abscess'
WHEN 'eruption' THEN 'Skin Eruptions/Rashes'
WHEN 'Rash' THEN 'Skin Eruptions/Rashes'
WHEN 'Swellings' THEN 'Growths/Swellings'
WHEN 'Ulcers' THEN 'Ulcers'
ELSE NULL END AS Observation
from dtl_Multiselect_line a
inner join ord_Visit b ON a.Visit_Pk = b.Visit_Id
inner join mst_Decode c ON a.ValueID = c.ID 
where a.FieldName = 'SkinConditions'
and (b.DeleteFlag = 0 or b.DeleteFlag is null))

, SkinExam AS
(Select
a.Ptn_pk
, a.VisitDate
, 81 ExaminationTypeId
, b.LookupItemId ExamId
FROM Skin a
INNER JOIN LookupMasterItem b ON a.Observation = b.DisplayName
AND b.LookupMasterId = 81)

, ENTExamination AS (
select a.Ptn_pk
, a.FieldName
, b.VisitDate
, c.Name Observation
from dtl_Multiselect_line a
inner join ord_Visit b ON a.Visit_Pk = b.Visit_Id
inner join mst_Decode c ON a.ValueID = c.ID 
where a.FieldName = 'ENTConditions'
and (b.DeleteFlag = 0 or b.DeleteFlag is null))

, ENTExam AS (
Select
a.Ptn_pk
, a.VisitDate
, 83 ExaminationTypeId
, b.LookupItemId ExamId
FROM ENTExamination a
INNER JOIN LookupMasterItem b ON a.Observation = b.DisplayName
AND b.LookupMasterId = 83)

, ChestExamination AS (
select a.Ptn_pk
, a.FieldName
, b.VisitDate
, CASE c.[Name] 
WHEN 'Decreased breath' THEN 'Reduced Breath sounds'
ELSE c.Name END AS Observation
from dtl_Multiselect_line a
inner join ord_Visit b ON a.Visit_Pk = b.Visit_Id
inner join mst_Decode c ON a.ValueID = c.ID 
where a.FieldName = 'ChestLungsConditions'
and (b.DeleteFlag = 0 or b.DeleteFlag is null))

, ChestExam AS (
Select
a.Ptn_pk
, a.VisitDate
, 84 ExaminationTypeId
, b.LookupItemId ExamId
FROM ChestExamination a
INNER JOIN LookupMasterItem b ON a.Observation = b.DisplayName
AND b.LookupMasterId = 84)

, CVSExamination AS (
select a.Ptn_pk
, a.FieldName
, b.VisitDate
, c.Name Observation
from dtl_Multiselect_line a
inner join ord_Visit b ON a.Visit_Pk = b.Visit_Id
inner join mst_Decode c ON a.ValueID = c.ID 
where a.FieldName = 'CardiovascularConditions'
and (b.DeleteFlag = 0 or b.DeleteFlag is null))

, CVSExam AS (
Select
a.Ptn_pk
, a.VisitDate
, 85 ExaminationTypeId
, b.LookupItemId ExamId
FROM CVSExamination a
INNER JOIN LookupMasterItem b ON a.Observation = b.DisplayName
AND b.LookupMasterId = 85)

, AbdomenExamination AS (
select a.Ptn_pk
, a.FieldName
, b.VisitDate
, CASE c.Name WHEN 'Distention' THEN 'Distension' ELSE c.Name END Observation
from dtl_Multiselect_line a
inner join ord_Visit b ON a.Visit_Pk = b.Visit_Id
inner join mst_Decode c ON a.ValueID = c.ID 
where a.FieldName = 'AbdomenConditions'
and (b.DeleteFlag = 0 or b.DeleteFlag is null))

, AbdomenExam AS (
Select
a.Ptn_pk
, a.VisitDate
, 86 ExaminationTypeId
, b.LookupItemId ExamId
FROM AbdomenExamination a
INNER JOIN LookupMasterItem b ON a.Observation = b.DisplayName
AND b.LookupMasterId = 86)

, CNSExamination AS (
select a.Ptn_pk
, a.FieldName
, b.VisitDate
, c.Name Observation
from dtl_Multiselect_line a
inner join ord_Visit b ON a.Visit_Pk = b.Visit_Id
inner join mst_Decode c ON a.ValueID = c.ID 
where a.FieldName = 'CNSConditions'
and (b.DeleteFlag = 0 or b.DeleteFlag is null))

, CNSExam AS (Select
a.Ptn_pk
, a.VisitDate
, 87 ExaminationTypeId
, b.LookupItemId ExamId
FROM CNSExamination a
INNER JOIN LookupMasterItem b ON a.Observation = b.DisplayName
AND b.LookupMasterId = 87)

INSERT INTO PhysicalExamination
Select
 c.Id PatientId
, d.Id PatientMasterVisitId
, a.ExaminationTypeId
, a.ExamId
, 0 DeleteFlag
, d.CreatedBy
, d.CreateDate
, NULL FindingId
, Null FindingNotes 

FROM (Select * FROM SkinExam
UNION
Select * FROM GeneralExam
UNION
Select * FROM ENTExam
UNION
Select * FROM ChestExam
UNION 
Select * FROM CVSExam
UNION
Select * FROM AbdomenExam
UNION 
Select * FROM CNSExam) a

inner join Patient c on a.Ptn_pk = c.ptn_pk
inner join PatientMasterVisit d on c.id = d.PatientId
and cast(a.visitdate as date) = cast(d.visitdate as date)
and d.VisitType = 0
left join PhysicalExamination e ON d.Id = e.PatientMasterVisitId
where e.PatientMasterVisitId IS NULL
GO
