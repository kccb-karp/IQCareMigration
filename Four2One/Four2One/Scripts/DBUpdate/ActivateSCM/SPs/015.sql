IF  EXISTS (SELECT * FROM sys.objects WHERE object_id 
= OBJECT_ID(N'[dbo].[pr_SCM_SavePharmacyDispenseOrder_Web]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].pr_SCM_SavePharmacyDispenseOrder_Web
GO




/****** Object:  StoredProcedure [dbo].[pr_SCM_SavePharmacyDispenseOrder_Web]    Script Date: 8/15/2018 10:45:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[pr_SCM_SavePharmacyDispenseOrder_Web] @Ptn_Pk INT
	,@LocationId INT
	,@DispensedBy INT = NULL
	,@DispensedByDate VARCHAR(30) = NULL
	,@OrderType INT = NULL
	,@ProgramId INT = NULL
	,@StoreId INT = NULL
	,@Regimen VARCHAR(50) = NULL
	,@UserId INT = NULL
	,@OrderId INT = 0
	,@AppointmentDate DATETIME = NULL
	,@OrderedBy INT = NULL
	,@OrderDate VARCHAR(30) = NULL
	,@deleteScript VARCHAR(1000) = NULL
	,@RegimenLine INT = 0
	,@RegimenCode INT = 0
	,@TherapyPlan INT = NULL
	,@PatientClassification INT = null
	,@IsEnrolDifferenciatedCare int =0
AS
BEGIN
	IF (isnull(@deleteScript, '') <> '')
	BEGIN
		EXEC (@deleteScript)
			--print @deleteScript
	END

	DECLARE @EmpID VARCHAR(50)
		,@ARTStartDate DATETIME

	IF @OrderId > 0
	BEGIN
		SET @EmpID = (
				SELECT EmployeeID
				FROM ord_PatientPharmacyOrder
				WHERE ptn_pharmacy_pk = @OrderID
				)

		DECLARE @VisitId INT

		SELECT @VisitId = VisitId
		FROM dbo.Ord_PatientPharmacyOrder
		WHERE Ptn_Pharmacy_Pk = @OrderId

		UPDATE dbo.Ord_Visit
		SET VisitDate = @DispensedByDate
			,DataQuality = 1
			,UserId = @UserId
			,PatientClassification = @PatientClassification
			,IsEnrolDifferenciatedCare = @IsEnrolDifferenciatedCare
		WHERE Visit_Id = @VisitId

		UPDATE dbo.Ord_PatientPharmacyOrder
		SET DispensedBy = @DispensedBy
			,DispensedByDate = @DispensedByDate
			,TreatmentPlan = @TherapyPlan
			,StoreId = @StoreId
			,UserId = @UserId
			,UpdateDate = getdate()
		WHERE Ptn_Pharmacy_Pk = @OrderId

		IF (@Regimen <> '')
		BEGIN
			UPDATE dbo.Dtl_RegimenMap
			SET RegimenType = @Regimen
				,RegimenId = @RegimenCode
			WHERE ptn_pk = @Ptn_pk
				AND Visit_Pk = @VisitId
				AND OrderId = @OrderId
		END

		--  Delete from Dtl_PatientPharmacyOrder where Ptn_Pharmacy_Pk = @OrderId            
		SELECT @VisitId [VisitId]
			,@OrderId [Ptn_Pharmacy_Pk]

		EXEC pr_SCM_SetPharmacyRefillAppointment @Ptn_Pk
			,@LocationId
			,@VisitId
			,@AppointmentDate
			,@UserId
			,@EmpID
	END
	ELSE
	BEGIN
		INSERT INTO dbo.Ord_Visit (
			Ptn_Pk
			,LocationId
			,VisitDate
			,VisitType
			,DataQuality
			,DeleteFlag
			,UserId
			,CreateDate
			,PatientClassification
			,IsEnrolDifferenciatedCare
			)
		VALUES (
			@Ptn_Pk
			,@LocationId
			,@OrderDate
			,4
			,0
			,0
			,@UserId
			,getdate()
			,@PatientClassification
			,@IsEnrolDifferenciatedCare
			)

		INSERT INTO dbo.Ord_PatientPharmacyOrder (
			Ptn_Pk
			,VisitId
			,LocationId
			,OrderedBy
			,OrderedByDate
			,DispensedBy
			,DispensedByDate
			,OrderType
			,ProgId
			,StoreId
			,DeleteFlag
			,UserId
			,CreateDate
			,RegimenLine
			,orderstatus
			,TreatmentPlan
			)
		VALUES (
			@Ptn_Pk
			,ident_current('Ord_Visit')
			,@LocationId
			,@OrderedBy
			,@OrderDate
			,@DispensedBy
			,@DispensedByDate
			,@OrderType
			,@ProgramId
			,@StoreId
			,0
			,@UserId
			,getdate()
			,@RegimenLine
			,1
			,@TherapyPlan
			)

		UPDATE ord_PatientPharmacyOrder
		SET ReportingID = (
				SELECT RIGHT('000000' + CONVERT(VARCHAR, ident_current('dbo.ord_PatientPharmacyOrder')), 6)
				)
		WHERE ptn_pharmacy_pk = ident_current('dbo.ord_PatientPharmacyOrder')

		IF (@Regimen <> '')
		BEGIN
			INSERT INTO dbo.Dtl_RegimenMap (
				Ptn_Pk
				,LocationId
				,Visit_Pk
				,RegimenType
				,OrderId
				,DeleteFlag
				,UserId
				,CreateDate
				,RegimenId
				)
			VALUES (
				@Ptn_Pk
				,@LocationId
				,ident_current('ord_Visit')
				,@Regimen
				,ident_current('Ord_PatientPharmacyOrder')
				,0
				,@UserId
				,getdate()
				,@RegimenCode
				)
		END

		SELECT ident_current('ord_Visit') [VisitId]
			,ident_current('Ord_PatientPharmacyOrder') [Ptn_Pharmacy_Pk]

		DECLARE @NewVisitID INT

		SELECT @NewVisitID = ident_current('ord_Visit')

		SET @EmpID = (
				SELECT EmployeeID
				FROM ord_PatientPharmacyOrder
				WHERE ptn_pharmacy_pk = @OrderID
				)

		EXEC pr_SCM_SetPharmacyRefillAppointment @Ptn_Pk
			,@LocationId
			,@NewVisitID
			,@AppointmentDate
			,@UserId
			,@EmpID
	END

	--vy added art startdate
	SET @ARTStartDate = dbo.fn_GetPatientARTStartDate_constella(@Ptn_pk)

	UPDATE mst_Patient
	SET ARTStartDate = @ARTStartDate
	WHERE ptn_pk = @Ptn_pk
END
