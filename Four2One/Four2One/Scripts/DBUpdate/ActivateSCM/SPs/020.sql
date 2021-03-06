if exists (select * from sys.procedures where name = 'sp_getPatientPharmacyPrescription')
BEGIN
DROP PROCEDURE [dbo].[sp_getPatientPharmacyPrescription]
END

GO

CREATE PROCEDURE [dbo].[sp_getPatientPharmacyPrescription]
	@PatientMasterVisitID int = null
AS
BEGIN

Set Nocount On;
	declare @pharmacy_pk int
	set @pharmacy_pk = (select top 1 ptn_pharmacy_pk from ord_PatientPharmacyOrder 
						where PatientMasterVisitId = @PatientMasterVisitID and DeleteFlag <> 1)

	select a.Drug_Pk,
	
	a.BatchNo batchId,
	a.FrequencyID, b.abbreviation abbr, b.DrugName, c.Name batchName, 
	a.SingleDose dose, 
	d.Name freq,

	a.MorningDose, a.MiddayDose, a.EveningDose, a.NightDose,
	a.duration, a.OrderedQuantity, a.DispensedQuantity,
	
	a.Prophylaxis
	from dtl_PatientPharmacyOrder a inner join mst_drug b on a.Drug_Pk = b.Drug_pk
	left join Mst_Batch c on a.BatchNo = c.ID
	left join mst_Frequency d on a.FrequencyID = d.ID

	where a.ptn_pharmacy_pk IN(SELECT ptn_pharmacy_pk from ord_PatientPharmacyOrder WHERE PatientMasterVisitId=@PatientMasterVisitID) 
	
End	