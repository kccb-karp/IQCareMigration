declare @LabEncounter varchar(50) = (select top 1 Id from lookupitem where Name = 'Lab-encounter')
insert into PatientEncounter
select pmv.PatientId, @LabEncounter, pmv.Id, pmv.start, pmv.start, 205, 0, 1, ord.createdate, null,0 
from ord_laborder ord inner join patientmastervisit pmv on ord.PatientMasterVisitId = pmv.id
where ord.patientmastervisitid is not null and not exists (select 1 from PatientEncounter 
where PatientId = pmv.PatientId and encountertypeid=@LabEncounter and patientmastervisitid = pmv.Id)
go