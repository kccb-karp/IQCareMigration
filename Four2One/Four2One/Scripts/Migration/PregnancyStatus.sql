  IF EXISTS(select name from sys.tables
where name = N'x_Pregnancy')
DROP TABLE x_Pregnancy
GO

Create Table x_Pregnancy
(Ptn_Pk int not null
, VisitDate date not null
, Pregnant int not null
, LMP Date null
, EDD Date null
)

GO
with PatientPregnant as(Select a.Ptn_Pk,a.Visit_pk
, CAST(b.VisitDate as DATE) VisitDate
, CASE WHEN a.Pregnant = 1 OR a.Pregnant = 89 THEN 82
WHEN a.Pregnant = 91 Then 85
WHEN a.Pregnant = 92 Then 86
 when a.Pregnant=89 or a.Pregnant = 1  then 82 
  when a.Pregnant=90 or a.Pregnant = 0 or a.Pregnant = 9 then 84
WHEN a.Pregnant IS NULL THEN NULL ELSE 84 END AS Pregnant
,CASE WHEN a.LMP = CAST('' AS datetime) THEN NULL ELSE CAST(a.LMP as DATE) END AS LMP
,CASE WHEN a.EDD = CAST('' AS datetime) THEN NULL ELSE CAST(a.EDD as DATE) END AS EDD
,a.CreateDate
,a.UserID
FROM dtl_PatientClinicalStatus a INNER JOIN ord_Visit b 
ON a.Ptn_Pk = b.Ptn_Pk AND a.Visit_Pk = b.Visit_Id
inner join mst_Patient c on a.Ptn_pk = c.Ptn_Pk
Where  (b.DeleteFlag IS NULL OR b.DeleteFlag = 0)
AND a.Pregnant IS NOT NULL
AND c.Sex = 17
AND CAST(b.VisitDate as DATE) is not null

),

PregnantStatus as (select pg.Ptn_pk,pg.VisitDate,pg.Pregnant from(select p.Ptn_pk,p.Visit_pk,p.VisitDate,p.Pregnant,ROW_NUMBER() OVER(Partition by p.Ptn_pk ,p.VisitDate
order by p.Visit_pk desc)rownum
from PatientPregnant p)pg where pg.rownum='1'
),




PatientLMP as(select lm.Ptn_pk,lm.LMP,lm.VisitDate from (select pp.Ptn_pk,pp.LMP,pp.VisitDate,pp.Visit_pk,ROW_NUMBER () OVER(partition by pp.Ptn_pk,pp.VisitDate
order by pp.Visit_pk desc)rownum
 from PatientPregnant pp
 where pp.LMP is not null)lm where lm.rownum='1'
 ),




 
PatientEDD as(select ed.Ptn_pk,ed.EDD,ed.VisitDate from (select pp.Ptn_pk,pp.EDD,pp.VisitDate,pp.Visit_pk,ROW_NUMBER () OVER(partition by pp.Ptn_pk,pp.VisitDate
order by pp.Visit_pk desc)rownum
 from PatientPregnant pp
 where pp.EDD is not null)ed where ed.rownum='1'
 ),



PatientVisit as(select p.Ptn_pk,p.VisitDate,p.Visit_pk,p.UserID,p.CreateDate from (select p.Ptn_pk ,p.Visit_pk,p.VisitDate,p.UserID,p.CreateDate,ROW_NUMBER () OVER(partition by
  p.Ptn_pk,p.VisitDate order by p.Visit_pk desc) rownum  from PatientPregnant p
 inner join ord_Visit v on v.Visit_Id=p.Visit_pk
 )p  where p.rownum='1')


 

insert into x_Pregnancy(Ptn_Pk,VisitDate,Pregnant,EDD,LMP) 
  select  v.Ptn_pk,v.VisitDate,p.Pregnant,pe.EDD,lm.LMP as Createdby 
 from PatientVisit v
 left   join PregnantStatus p on p.Ptn_pk=v.Ptn_pk and p.VisitDate=v.VisitDate
 left join PatientEDD pe on pe.Ptn_pk=v.Ptn_pk and pe.VisitDate=V.VisitDate
 left join PatientLMP lm on lm.Ptn_pk=v.Ptn_pk and lm.VisitDate=v.VisitDate

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
, a.LMP
, a.EDD
,a.Pregnant 
, 0
, null
, 0
, 0
, d.CreatedBy
, d.CreateDate
, null
, d.VisitDate
 FROM x_Pregnancy a
inner join Patient c on a.Ptn_pk = c.ptn_pk
inner join PatientMasterVisit d on c.id = d.PatientId
and cast(a.visitdate as date) = cast(d.visitdate as date)
and d.VisitType = 0
left join PregnancyIndicator e ON d.Id = e.PatientMasterVisitId
where e.PatientMasterVisitId IS NULL
Order by c.Id,d.Id

go






IF EXISTS(select name from sys.tables
where name = N'x_Pregnancy')
DROP TABLE x_Pregnancy
GO

