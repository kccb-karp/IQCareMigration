IF EXISTS(select name from sys.tables
where name = N'x_Pregnancy')
DROP TABLE x_Pregnancy
GO

Create Table x_Pregnancy
(Ptn_Pk int not null
, VisitDate date not null
, Pregnant int not null
, LMP Date null
, EDD Date null)
GO

insert into x_Pregnancy
Select a.Ptn_Pk
, CAST(b.VisitDate as DATE) VisitDate
, CASE WHEN a.Pregnant = '1' OR a.Pregnant = '89' THEN 82
WHEN a.Pregnant = 91 Then 85
WHEN a.Pregnant = 92 Then 86
WHEN a.Pregnant IS NULL THEN NULL ELSE 84 END AS Pregnant
,CASE WHEN a.LMP = CAST('' AS datetime) THEN NULL ELSE CAST(a.LMP as DATE) END AS LMP
,CASE WHEN a.EDD = CAST('' AS datetime) THEN NULL ELSE CAST(a.EDD as DATE) END AS EDD
FROM dtl_PatientClinicalStatus a INNER JOIN ord_Visit b 
ON a.Ptn_Pk = b.Ptn_Pk AND a.Visit_Pk = b.Visit_Id
inner join mst_Patient c on a.Ptn_pk = c.Ptn_Pk
Where  (b.DeleteFlag IS NULL OR b.DeleteFlag = 0)
AND a.Pregnant IS NOT NULL
AND c.Sex = 17
AND CAST(b.VisitDate as DATE) is not null
go

insert into PregnancyIndicator
(PatientId
, PatientMasterVisitId
, LMP
, EDD
, PregnancyStatusId
, ANCProfile
, ANCProfileDate
, Active
, DeleteFlag
, CreatedBy
, CreateDate
, AuditData
, VisitDate)
SELECT c.Id PatientId
, d.Id PatientMasterVisitId
, MAX(a.LMP) LMP
, MAX(a.EDD) EDD
, MAX(a.Pregnant) Pregnant
, 0
, null
, 0
, 0
, MAX(d.CreatedBy) CreatedBy
, MAX(d.CreateDate) CreateDate
, null
, max(d.VisitDate) VisitDate
 FROM x_Pregnancy a 
inner join Patient c on a.Ptn_pk = c.ptn_pk
inner join PatientMasterVisit d on c.id = d.PatientId
and cast(a.visitdate as date) = cast(d.visitdate as date)
and d.VisitType = 0
left join PregnancyIndicator e ON d.Id = e.PatientMasterVisitId
where e.PatientMasterVisitId IS NULL
GROUP BY c.Id, d.Id 
go

insert into Pregnancy
(PatientId
, PatientMasterVisitId
, LMP
, EDD
, Gravidae
, Parity
, Outcome
, DateOfOutcome
, Active
, DeleteFlag
, CreatedBy
, CreateDate
, AuditData)
SELECT c.Id PatientId
, d.Id PatientMasterVisitId
, MAX(a.LMP) LMP
, MAX(a.EDD) EDD
, 'null'
, 'null'
, 0
, null
, 0
, 0
, MAX(d.CreatedBy) CreatedBy
, MAX(d.CreateDate) CreateDate
, null
 FROM x_Pregnancy a 
inner join Patient c on a.Ptn_pk = c.ptn_pk
inner join PatientMasterVisit d on c.id = d.PatientId
and cast(a.visitdate as date) = cast(d.visitdate as date)
and d.VisitType = 0
left join Pregnancy e ON d.Id = e.PatientMasterVisitId
where e.PatientMasterVisitId IS NULL
and a.Pregnant = 82
and a.LMP is not null
and a.EDD is not null
GROUP BY c.Id, d.Id 
go


IF EXISTS(select name from sys.tables
where name = N'x_Pregnancy')
DROP TABLE x_Pregnancy
GO