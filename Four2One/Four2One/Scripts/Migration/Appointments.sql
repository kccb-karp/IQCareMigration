﻿WITH ValidAppointments AS
(Select a.Ptn_pk
, CAST(b.VisitDate as DATE) VisitDate
, MAX(a.AppDate) AppointmentDate

FROM dtl_PatientAppointment a
INNER JOIN ord_Visit b ON a.Ptn_pk = b.Ptn_Pk
AND a.Visit_pk = b.Visit_Id
WHERE (b.DeleteFlag = 0 OR b.DeleteFlag IS NULL)
AND a.AppDate IS NOT NULL 
AND YEAR(a.AppDate) BETWEEN 2000 And 2019
AND a.AppDate >= b.VisitDate
AND DATEDIFF(dd, b.VisitDate, a.AppDate) <= 365
GROUP BY a.Ptn_pk, CAST(b.VisitDate as DATE))


INSERT INTO PatientAppointment
select distinct
d.Id PatientMasterVisitId
, 258 ServiceAreaId
, c.Id PatientId
, cast(a.AppointmentDate As DATE) AppDate
, 235 ReasonId
, '' [Description]
, 223 StatusId
, cast(a.AppointmentDate As DATE) statusDate
, 257 DiffCareId
, 0 DeleteFlag
, d.CreatedBy
, d.CreateDate
, NULL AuditData
 from
 ValidAppointments a 
inner join Patient c on a.Ptn_pk = c.ptn_pk
inner join PatientMasterVisit d 
	on c.id = d.PatientId
	and cast(a.visitdate as date) = cast(d.visitdate as date) 
	and d.VisitType = 0
left join PatientAppointment e ON d.Id = e.PatientMasterVisitId
where e.PatientMasterVisitId IS NULL;