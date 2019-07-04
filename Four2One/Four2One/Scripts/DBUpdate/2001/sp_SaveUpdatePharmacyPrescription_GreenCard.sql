ALTER PROCEDURE [dbo].[sp_SaveUpdatePharmacyPrescription_GreenCard]                                    
	@ptn_pharmacy_pk int = null,
	@DrugId int = null,
	@BatchId varchar(50) = null,
	@Dose varchar(50) = null,                                 
	@FreqId int = null,
	@Morning decimal(18,2)=0,
	@Midday  decimal(18,2)=0,
	@Evening  decimal(18,2)=0,
	@Night  decimal(18,2)=0,
	@Duration decimal(18,2) = null,
	@qtyPres decimal(18,2) = null,
	@qtyDisp decimal(18,2) = null,
	@UserID int = null,                
	@Prophylaxis int = null,
	@pmscm varchar(50) = null                               
                                    
AS                                        
Begin

	declare @TotalOrderedQuantity int,@TotalDispensedQuantity int
	Select @TotalOrderedQuantity = 0, @TotalDispensedQuantity = 0
	declare @_dose as decimal(18,2);
	Select @_dose = case when @Dose <> '' and @Dose <> null then @Dose else 1 end;
			
	Insert Into dtl_PatientPharmacyOrder (
		ptn_pharmacy_pk,Drug_Pk,Duration,OrderedQuantity,FrequencyID,BatchNo,SingleDose, DispensedQuantity, UserID,CreateDate,Prophylaxis,
		genericid,StrengthID, MorningDose, MiddayDose, EveningDose, NightDose)
	Values (
		@ptn_pharmacy_pk,@DrugId,@Duration,@qtyPres,@FreqId,@BatchId,@_dose,@qtyDisp,@UserID,Getdate(),@Prophylaxis,0,0,@Morning,@Midday,@Evening,@Night);



	if(@pmscm = 1 and @qtyDisp > 0)
	BEGIN
		--INSERT into dtl_patientPharmacyDispensed
		--(ptn_pharmacy_pk,drug_pk,batchId,frequencyID,dose,duration,dispensedQuantity,dispensedDate,deleteFlag)
		--values(@ptn_pharmacy_pk,@DrugId,@BatchId,@FreqId,@Dose,@Duration,@qtyDisp,GETDATE(),0)

		declare @ptn_pk int = (select Ptn_pk from ord_patientpharmacyorder where ptn_pharmacy_pk=@ptn_pharmacy_pk)
		declare @storeID int = (select top 1 StoreId from Dtl_StockTransaction where BatchId = @BatchId)

		insert into Dtl_StockTransaction
		(ItemId,BatchId,ptn_pharmacy_pk, PtnPk,storeid,transactiondate,quantity,UserId,createdate)
		values(@DrugId,@BatchId,@ptn_pharmacy_pk,@ptn_pk,@storeID,getdate(),-@qtyDisp,@UserID,GETDATE())

	END

	Select	@TotalOrderedQuantity = Sum(a.OrderedQuantity),
			@TotalDispensedQuantity = Sum(a.dispensedQuantity)
	From dtl_PatientPharmacyOrder a
	Where a.ptn_pharmacy_pk = @ptn_pharmacy_pk

	Update ord_PatientPharmacyOrder Set
		OrderStatus = Case 
						When DispensedByDate Is Null Then 1 --new order
						When DispensedByDate Is Not Null  And @TotalDispensedQuantity = @TotalOrderedQuantity Then 2 --complete
						When DispensedByDate Is Not Null  And @TotalDispensedQuantity < @TotalOrderedQuantity Then 3 --partial
						Else orderstatus End
	Where ptn_pharmacy_pk = @ptn_pharmacy_pk

                                     
End
GO