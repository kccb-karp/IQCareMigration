IF EXISTS(Select * FROM sys.procedures WHERE name = N'sp_PharmacyModule_SavePrescribedDrugs')
DROP PROC sp_PharmacyModule_SavePrescribedDrugs
GO

CREATE PROC sp_PharmacyModule_SavePrescribedDrugs
(
@PatientMasterVisitId Int,
@PatientId int,
@PatientDrugPrescriptionId int,
@DrugId int,
@FrequencyId int,
@Dose decimal(18,1),
@Duration int,
@Quantity decimal(18,1),
@Comment varchar(500)
)

AS

BEGIN

	INSERT INTO PatientDrugDispense 
	(PatientDrugPrescriptionId
	, PatientId
	, PatientMasterVisitId
	, ClinicalDrugId
	, Dose
	, DrugFrequencyId
	, Duration
	, PrescribedQuantity
	, PrescriptionComment
	, CreateDate
	, DeleteFlag)
	VALUES
	(@PatientDrugPrescriptionId
	, @PatientId
	, @PatientMasterVisitId
	, @DrugId
	, @Dose
	, @FrequencyId
	, @Duration
	, @Quantity
	, CASE WHEN @Comment = '' THEN NULL ELSE @Comment END
	, GETDATE()
	, 0);

END