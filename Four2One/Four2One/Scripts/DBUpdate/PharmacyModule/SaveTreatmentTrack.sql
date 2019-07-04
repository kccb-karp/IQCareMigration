CREATE PROC sp_PharmacyModule_SaveTreatmentTrack
(
	@PatientMasterVisitId int,  
	@PatientId int,  
	@UserId int,  
	@RegimenId int,
	@RegimenLineId int,
	@TreatmentPlanId int,
	@TreatmentPlanReasonId int
)

AS

BEGIN

	IF EXISTS(SELECT * FROM ARVTreatmentTracker
	WHERE PatientMasterVisitId = @PatientMasterVisitId)
	BEGIN
		UPDATE ARVTreatmentTracker
		SET RegimenId = @RegimenId
		, RegimenLineId = @RegimenLineId
		, TreatmentStatusId = @TreatmentPlanId
		, TreatmentStatusReasonId = @TreatmentPlanReasonId
		WHERE PatientMasterVisitId = @PatientMasterVisitId;
	END
	ELSE
	BEGIN
		INSERT INTO ARVTreatmentTracker(PatientId, ServiceAreaId, PatientMasterVisitId
		, RegimenId, RegimenLineId, DrugId, TreatmentStatusId, TreatmentStatusReasonId
		, ParentId, DeleteFlag, CreateBy, CreateDate)
		VALUES
		(@PatientId, 0 ,@PatientMasterVisitId
		, @RegimenId, @RegimenLineId, 0, @TreatmentPlanId, @TreatmentPlanReasonId
		,0,0,@UserId, GETDATE());
	END
END