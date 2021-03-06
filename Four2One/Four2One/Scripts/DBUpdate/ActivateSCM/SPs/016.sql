IF  EXISTS (SELECT * FROM sys.objects WHERE object_id 
= OBJECT_ID(N'[dbo].[pr_SCM_SavePharmacyDispenseOrderDetail_Web]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].pr_SCM_SavePharmacyDispenseOrderDetail_Web
GO


/****** Object:  StoredProcedure [dbo].[pr_SCM_SavePharmacyDispenseOrderDetail_Web]    Script Date: 8/15/2018 10:51:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[pr_SCM_SavePharmacyDispenseOrderDetail_Web] @Ptn_Pk INT
	,@StoreId INT
	,@VisitId INT
	,@Ptn_Pharmacy_Pk INT
	,@Drug_Pk INT
	,
	-----------------------   
	@MorningDose DECIMAL(10, 2)
	,@MiddayDose DECIMAL(10, 2)
	,@EveningDose DECIMAL(10, 2)
	,@NightDose DECIMAL(10, 2)
	,
	-----------------------
	@DispensedQuantity INT
	,@Prophylaxis INT
	,@BatchId INT
	,@BatchNo VARCHAR(50)
	,@ExpiryDate DATETIME
	,@DispensingUnit INT
	,@DispensedByDate VARCHAR(30) = NULL
	,@LocationId INT
	,@UserId INT
	,@DataStatus INT
	,
	-----------------------
	@Duration DECIMAL(18, 2)
	,@PrescribeOrderedQuantity DECIMAL(18, 2)
	,@PillCount DECIMAL(10, 2)
	,
	---------------------------------
	@PrintPrescriptionStatus INT
	,@PatientInstructions VARCHAR(500)
	,@Comments VARCHAR(500)
AS
BEGIN
	DECLARE @EntryStatus INT;

	SELECT @BatchId = id
	FROM mst_batch
	WHERE NAME = @BatchNo
		AND itemid = @Drug_Pk;

	SET @EntryStatus = 0;

	IF EXISTS (
			SELECT Drug_Pk
			FROM dbo.Dtl_PatientPharmacyOrder
			WHERE Drug_Pk = @Drug_Pk
				--AND DispensedQuantity = 0
				AND Ptn_Pharmacy_Pk = @Ptn_Pharmacy_Pk
			)
	BEGIN
		SET @EntryStatus = 1;

		UPDATE dbo.Dtl_PatientPharmacyOrder
		SET DispensedQuantity = @DispensedQuantity
			,BatchNo = @BatchId
			,ExpiryDate = @ExpiryDate
			,--UserId =@UserId,
			UpdateDate = GETDATE()
			,Duration = @Duration
			,OrderedQuantity = @PrescribeOrderedQuantity
			,PrintPrescriptionStatus = @PrintPrescriptionStatus
			,PatientInstructions = @PatientInstructions
			,MorningDose = @MorningDose
			,MiddayDose = @MiddayDose
			,EveningDose = @EveningDose
			,NightDose = @NightDose
			,PillCount = @PillCount
			,comments = @Comments
		WHERE Ptn_Pharmacy_pk = @Ptn_Pharmacy_Pk
			AND Drug_Pk = @Drug_Pk;

		INSERT INTO dbo.Dtl_PatientBillTransaction (
			Ptn_Pk
			,VisitId
			,LocationId
			,TransactionDate
			,LabId
			,PharmacyId
			,ItemId
			,BatchId
			,DispensingUnit
			,Quantity
			,SellingPrice
			,CostPrice
			,Margin
			,ConsultancyFee
			,AdminFee
			,BillAmount
			,DoctorId
			,UserId
			,CreateDate
			)
		VALUES (
			@Ptn_Pk
			,@VisitId
			,@LocationId
			,@DispensedByDate
			,0
			,@Ptn_Pharmacy_pk
			,@Drug_Pk
			,@BatchId
			,@DispensingUnit
			,@DispensedQuantity
			,0
			,0
			,0
			,0
			,0
			,0
			,0
			,@UserId
			,GETDATE()
			);
			--INSERT INTO dbo.Dtl_StockTransaction( ItemId, BatchId, Ptn_Pharmacy_Pk, PtnPk, StoreId, TransactionDate, Quantity, ExpiryDate,
			--PurchasePrice, SellingPrice, Margin, UserId, CreateDate )
			--VALUES( @Drug_Pk, @BatchId, @Ptn_Pharmacy_Pk, @Ptn_Pk, @StoreId, @DispensedByDate, '-' + CONVERT(VARCHAR, @DispensedQuantity),
			--@ExpiryDate, 0, 0, 0, @UserId, GETDATE());
	END;

	IF NOT EXISTS (
			SELECT Drug_Pk
			FROM dbo.Dtl_PatientPharmacyOrder
			WHERE Drug_Pk = @Drug_Pk
				AND BatchNo = @BatchId
				AND ExpiryDate = @ExpiryDate
				AND Ptn_Pharmacy_Pk = @Ptn_Pharmacy_Pk
			)
	BEGIN
		SET @EntryStatus = 1;

		INSERT INTO dbo.Dtl_PatientPharmacyOrder (
			Ptn_Pharmacy_Pk
			,Drug_Pk
			,GenericId
			,StrengthID
			,DispensedQuantity
			,UserId
			,CreateDate
			,Prophylaxis
			,BatchNo
			,ExpiryDate
			,Duration
			,OrderedQuantity
			,PrintPrescriptionStatus
			,PatientInstructions
			,MorningDose
			,MiddayDose
			,EveningDose
			,NightDose
			,PillCount
			,comments
			)
		VALUES (
			@Ptn_Pharmacy_Pk
			,@Drug_Pk
			,0
			,0
			,@DispensedQuantity
			,@UserId
			,GETDATE()
			,@Prophylaxis
			,@BatchId
			,@ExpiryDate
			,@Duration
			,@PrescribeOrderedQuantity
			,@PrintPrescriptionStatus
			,@PatientInstructions
			,@MorningDose
			,@MiddayDose
			,@EveningDose
			,@NightDose
			,@PillCount
			,@Comments
			);

		INSERT INTO dbo.Dtl_PatientBillTransaction (
			Ptn_Pk
			,VisitId
			,LocationId
			,TransactionDate
			,LabId
			,PharmacyId
			,ItemId
			,BatchId
			,DispensingUnit
			,Quantity
			,SellingPrice
			,CostPrice
			,Margin
			,ConsultancyFee
			,AdminFee
			,BillAmount
			,DoctorId
			,UserId
			,CreateDate
			)
		VALUES (
			@Ptn_Pk
			,@VisitId
			,@LocationId
			,@DispensedByDate
			,0
			,@Ptn_Pharmacy_pk
			,@Drug_Pk
			,@BatchId
			,@DispensingUnit
			,@DispensedQuantity
			,0
			,0
			,0
			,0
			,0
			,0
			,0
			,@UserId
			,GETDATE()
			);
			--INSERT INTO dbo.Dtl_StockTransaction( ItemId, BatchId, Ptn_Pharmacy_Pk, PtnPk, StoreId, TransactionDate, Quantity, ExpiryDate,
			--PurchasePrice, SellingPrice, Margin, UserId, CreateDate )
			--VALUES( @Drug_Pk, @BatchId, @Ptn_Pharmacy_Pk, @Ptn_Pk, @StoreId, @DispensedByDate, '-' + CONVERT(VARCHAR, @DispensedQuantity),
			--@ExpiryDate, 0, 0, 0, @UserId, GETDATE());
	END;

	IF (@EntryStatus = 0)
	BEGIN
		IF (@DataStatus = 1)
		BEGIN
			INSERT INTO dbo.Dtl_PatientPharmacyOrder (
				Ptn_Pharmacy_Pk
				,Drug_Pk
				,GenericId
				,DispensedQuantity
				,UserId
				,CreateDate
				,Prophylaxis
				,BatchNo
				,ExpiryDate
				,Duration
				,OrderedQuantity
				,PrintPrescriptionStatus
				,PatientInstructions
				,MorningDose
				,MiddayDose
				,EveningDose
				,NightDose
				,PillCount
				)
			VALUES (
				@Ptn_Pharmacy_Pk
				,@Drug_Pk
				,0
				,@DispensedQuantity
				,@UserId
				,GETDATE()
				,@Prophylaxis
				,@BatchId
				,@ExpiryDate
				,@Duration
				,@PrescribeOrderedQuantity
				,@PrintPrescriptionStatus
				,@PatientInstructions
				,@MorningDose
				,@MiddayDose
				,@EveningDose
				,@NightDose
				,@PillCount
				);

			DECLARE @duraction1 DECIMAL(18, 2);
			DECLARE @Qty1 DECIMAL(18, 2);

			SELECT TOP 1 @duraction1 = Duration
				,@Qty1 = OrderedQuantity
			FROM dbo.Dtl_PatientPharmacyOrder
			WHERE Ptn_Pharmacy_Pk = @Ptn_Pharmacy_Pk
				AND Drug_Pk = @Drug_Pk
				AND Duration IS NOT NULL
				AND OrderedQuantity IS NOT NULL;

			UPDATE dbo.Dtl_PatientPharmacyOrder
			SET Duration = @duraction1
				,OrderedQuantity = @Qty1
			WHERE Ptn_Pharmacy_Pk = @Ptn_Pharmacy_Pk
				AND Drug_Pk = @Drug_Pk
				AND Duration IS NULL
				AND OrderedQuantity IS NULL;

			INSERT INTO dbo.Dtl_PatientBillTransaction (
				Ptn_Pk
				,VisitId
				,LocationId
				,TransactionDate
				,LabId
				,PharmacyId
				,ItemId
				,BatchId
				,DispensingUnit
				,Quantity
				,SellingPrice
				,CostPrice
				,Margin
				,ConsultancyFee
				,AdminFee
				,BillAmount
				,DoctorId
				,UserId
				,CreateDate
				)
			VALUES (
				@Ptn_Pk
				,@VisitId
				,@LocationId
				,@DispensedByDate
				,0
				,@Ptn_Pharmacy_pk
				,@Drug_Pk
				,@BatchId
				,@DispensingUnit
				,@DispensedQuantity
				,0
				,0
				,0
				,0
				,0
				,0
				,0
				,@UserId
				,GETDATE()
				);
				--INSERT INTO dbo.Dtl_StockTransaction( ItemId, BatchId, Ptn_Pharmacy_Pk, PtnPk, StoreId, TransactionDate, Quantity, ExpiryDate,
				--PurchasePrice, SellingPrice, Margin, UserId, CreateDate )
				--VALUES( @Drug_Pk, @BatchId, @Ptn_Pharmacy_Pk, @Ptn_Pk, @StoreId, @DispensedByDate, '-' + CONVERT(VARCHAR, @DispensedQuantity),
				--@ExpiryDate, 0, 0, 0, @UserId, GETDATE());
		END;
	END;

	DECLARE @OrderedQuantityByDrug DECIMAL(18, 2);
	DECLARE @TotalDispensedQuantityByDrug DECIMAL(18, 2);

	SELECT @OrderedQuantityByDrug = orderedquantity
	FROM dtl_patientpharmacyorder
	WHERE ptn_pharmacy_pk = @ptn_Pharmacy_Pk
		AND Drug_Pk = @Drug_Pk;

	SELECT @TotalDispensedQuantityByDrug = SUM(DispensedQuantity) + SUM(PillCount)
	FROM dtl_patientpharmacyorder
	WHERE ptn_pharmacy_pk = @ptn_Pharmacy_Pk
		AND Drug_Pk = @Drug_Pk;

	DECLARE @TotalOrderedQuantity DECIMAL(18, 2);
	DECLARE @TotalDispensedQuantity DECIMAL(18, 2);

	SELECT @TotalOrderedQuantity = SUM(z.OrderedQuantity)
	FROM (
		SELECT Drug_Pk
			,ISNULL(OrderedQuantity, 0) AS 'OrderedQuantity'
		FROM dtl_patientpharmacyorder
		WHERE ptn_pharmacy_pk = @ptn_Pharmacy_Pk
		GROUP BY Drug_Pk
			,OrderedQuantity
		) AS z;

	SELECT @TotalDispensedQuantity = SUM(DispensedQuantity) + SUM(PillCount)
	FROM dtl_patientpharmacyorder
	WHERE ptn_pharmacy_pk = @ptn_Pharmacy_Pk;

	--SELECT @OrderedQuantity1;
	--SELECT @TotalDispensedQuantity1;
	IF (@TotalDispensedQuantity = @TotalOrderedQuantity)
	BEGIN
		UPDATE ord_PatientPharmacyOrder
		SET OrderStatus = 2
		WHERE DispensedByDate IS NOT NULL
			AND ptn_pharmacy_pk = @ptn_pharmacy_pk;
	END;

	IF (
			@TotalDispensedQuantity > 0
			AND @TotalDispensedQuantity < @TotalOrderedQuantity
			)
	BEGIN
		UPDATE ord_PatientPharmacyOrder
		SET OrderStatus = 3
		WHERE DispensedByDate IS NOT NULL
			AND ptn_pharmacy_pk = @ptn_pharmacy_pk;
	END;

	IF (@TotalDispensedQuantity < 1)
	BEGIN
		UPDATE ord_PatientPharmacyOrder
		SET OrderStatus = 1
		WHERE DispensedByDate IS NOT NULL
			AND ptn_pharmacy_pk = @ptn_pharmacy_pk
	END
END;
