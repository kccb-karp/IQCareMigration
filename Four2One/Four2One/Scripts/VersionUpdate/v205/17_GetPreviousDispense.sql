IF  EXISTS (SELECT * FROM sys.objects WHERE object_id 
= OBJECT_ID(N'[dbo].[sp_PharmacyModule_GetPreviousDispense]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].sp_PharmacyModule_GetPreviousDispense
GO

create proc sp_PharmacyModule_GetPreviousDispense(@patientId int) as
begin
with pharmacy as (select a.PatientId
, cast(a.OrderedByDate as date) DateOrdered
, c.DrugName
, b.Duration 
from ord_PatientPharmacyOrder a inner join dtl_PatientPharmacyOrder b
on a.ptn_pharmacy_pk = b.ptn_pharmacy_pk
inner join mst_Drug c on b.Drug_Pk = c.Drug_pk
where a.PatientId = @patientId and a.DeleteFlag = 0
union
select a.PatientId 
, cast(a.DispenseDate as date)
, b.DrugName
, a.Duration
from PatientDrugDispense a
inner join ClinicalDrug b on a.ClinicalDrugId = b.Id
where a.PatientId = @patientId and a.DeleteFlag = 0)

select DrugName, Duration from pharmacy a inner join (
select PatientId, MAX(DateOrdered) DateOrdered 
from pharmacy where DateOrdered < cast(getdate() as date)
group by PatientId) b on a.PatientId = b.PatientId and a.DateOrdered = b.DateOrdered
end


