IF  EXISTS (SELECT * FROM sys.objects WHERE object_id 
= OBJECT_ID(N'[dbo].[pr_Clinical_PatientDetails_Constella]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[pr_Clinical_PatientDetails_Constella]
GO


CREATE procedure [dbo].[pr_Clinical_PatientDetails_Constella]   ( 
	@PatientId int,                                                                                                                                                                                
	@SystemId int,                                  
	@ModuleId int,                                                                                                                                                                                
	@DBKey varchar(50) = null   
  )  
     
As                                                                                                                                                                                                                                                    
                                                                                                                                              
begin

Declare @ARTEndStatus varchar(50)
-- Table 0                                                                                                                                                                              
Select	convert(varchar(50), decryptbykey(a.firstname)) [firstname],
		convert(varchar(50), decryptbykey(a.middlename)) [middlename],
		convert(varchar(50), decryptbykey(a.lastName)) [lastname],
		convert(varchar(50), decryptbykey(a.Address)) [Address],
		convert(varchar(50), decryptbykey(a.Phone)) [phone],
		a.CountryId + '-' + a.PosId + '-' + a.SatelliteId + '-' + a.PatientEnrollmentId PatientId,
		PatientEnrollmentID,
		a.PatientClinicId,
		a.RegistrationDate,
		a.Status,
		a.IQNumber [IQNumber],
		DOB,
		(datediff(Month, DOB, getdate()) / 12) [Age],
		convert(varchar, datediff(Month, DOB, getdate()) % 12) [Age1],
		--datediff(yy,a.dob,getdate()) [AGE],                                                                        
		datediff(Month, a.dob, getdate()) [AgeInMonths],
		dbo.fn_getpatientage(a.ptn_pk) [AGEINYEARMONTH],
		b.Name [SexNM],
		e.Name [Program],
		isnull(f.Name, '') [VillageNM],
		isnull(g.Name, '') [District],
		isnull(h.Name, '') [ProvinceNM],
		c.EmergContactName [EmergContactName],
		c.EmergContactPhone [EmergContactPhone],
		d.HIVStatus_Child,
		convert(varchar(50), decryptbykey(c.TenCellLeader)) [TenCellLeader],
		convert(varchar(50), decryptbykey(c.TenCellLeaderAddress)) [TenCellLeaderAddress],
		a.CountryId + '-' + a.PosId + '-' + a.SatelliteId + '-' + a.PatientEnrollmentId [EnrollmentID],
		isnull(a.ANCNumber, '') [ANCNumber],
		isnull(a.PMTCTNumber, '') [PMTCTNumber],
		isnull(a.AdmissionNumber, '') [AdmissionNumber],
		isnull(a.OutpatientNumber, '') [OutpatientNumber],
		isnull(a.HEIIDNumber,'') HEIIDNumber,
		a.PatientFacilityID,
		isnull(f.ID, '') [VillageId],
		isnull(g.ID, '') [DistrictId],
		IP.ParentPtnPk
From mst_patient a
Left Outer Join mst_decode b On a.sex = b.id
Left Outer Join dtl_patientcontacts c On a.ptn_pk = c.ptn_pk
Left Outer Join dtl_PatientHivOther d On a.Ptn_Pk = d.Ptn_pk
Left Outer Join mst_decode e On a.ProgramId = e.Id
Left Outer Join mst_village f On a.VillageName = f.Id
Left Outer Join mst_district g On a.DistrictName = g.Id
Left Outer Join mst_province h On a.Province = h.Id
Left Outer Join dtl_InfantParent IP On IP.Ptn_pk = a.Ptn_Pk And IP.DeleteFlag = 0 OR IP.DeleteFlag Is Null
Where a.Ptn_Pk = @PatientId


--Table 1 --ART --Last Visit Date                                                   
Select Top 1 a.VisitDate
From ord_Visit a, mst_patient b
Where a.ptn_pk = b.ptn_pk
And a.Ptn_Pk = @PatientId
And (a.DeleteFlag = 0 Or a.DeleteFlag Is Null)
And (a.visittype Not In (5, 10, 11, 12) Or a.visittype < 100)
And (b.DeleteFlag = 0 Or b.DeleteFlag Is Null)
And nullif(b.PatientEnrollmentId, '') Is Not Null
Order By a.Visitdate Desc

--Table 2                                                                             
Select Top 1 AppDate
From dtl_patientappointment
Where ptn_pk = @PatientId
And Appstatus In (12)
And AppDate <> '1900-01-01'
And (DeleteFlag = 0 Or DeleteFlag Is Null)
Order By AppDate Asc

--Table 3                                                                                                                                                                        
-----HB,HCT/HB,AST                                                                                                                                               


Select	R.ResultValue	TestResults
		,O.OrderDate	OrderedByDate
		,R.ParameterId
From dtl_LabOrderTestResult R
Inner Join ord_LabOrder O On O.Id = R.LabOrderId
Inner Join Mst_LabTestParameter P On R.ParameterId = P.Id
And r.DeleteFlag = 0
And O.DeleteFlag = 0
And O.Ptn_Pk = @PatientId
And P.ReferenceId In ('HCT', 'HB', 'ASTSGOT', 'CREATININE', 'SYPHILIS_RPR', 'CREATININEMM')

--Table 4                             
Select	dbo.fn_GetPatientCurrentARTRegimen_Constella(a.ptn_pk) [Current ARV Regimen],
		dbo.fn_GetPatientCurrentARTStartDate_Constella(a.ptn_pk) [Current ARV StartDate],
		a.ARTStartDate [AidsRelief ARV StartDate],
		b.currentartstartdate [Hist ARV StartDate],
		c.ARTStartDate [Hist ARV StartDateCTC]
From mst_patient a
Left Outer Join dtl_patienthivprevcareie b On a.ptn_pk = b.ptn_pk
Left Outer Join dtl_PatientHivPrevCareEnrollment c On a.ptn_pk = c.ptn_pk
Where (a.deleteflag = 0 Or a.deleteflag Is Null)
And a.ptn_pk = @PatientId

--Table 5                                                                                                                                                  
---Query to use for Weight and BMI Graph                                                       
Select *
From
(
	Select
		a.Height [Height],
		a.Weight [Weight],
		0 VisitID,--b.visit_Id [VisitID],
		convert(decimal(18, 2), round((nullif(a.Weight, 0) / (nullif(a.height / 100, 0) * nullif(a.height / 100, 0))), 2)) As BMI,
	null	[VisitType],--b.visitType [VisitType],
		b.VisitDate [Visit_OrderbyDate]
	From	dtl_patientvitals a,
			ord_visit b
	Where a.visit_pk = b.visit_Id
		And (b.DeleteFlag = 0 Or b.DeleteFlag Is Null)
		And a.ptn_pk = @PatientId
		And a.Height Is Not Null
		And a.Weight Is Not Null 
	Union 
	Select
		a.Height [Height],
		a.Weight [Weight],
		0 VisitID, --b.visit_Id [VisitID],
		convert(decimal(18, 2), round((nullif(a.Weight, 0) / (nullif(a.height / 100, 0) * nullif(a.height / 100, 0))), 2)) As BMI,
		null	[VisitType],--b.visitType [VisitType],
		a.OrderedByDate [Visit_OrderbyDate]
	From	ord_PatientPharmacyOrder a,
			ord_visit b
	Where a.visitId = b.visit_Id
		And (b.DeleteFlag = 0 Or b.DeleteFlag Is Null)
		And a.ptn_pk = @PatientId
		And a.ordertype = 117
		And a.Height Is Not Null
		And a.Weight Is Not Null
) As inLineView
Order By Visit_OrderbyDate Desc

--Table 6                                                                                     

			declare @CD4Values Table( 
				Ptn_Pk int, 
				LabTestId int, 
				TestName varchar(100),
				TestReferenceId varchar(50),
				ParameterId int,
				ParameterReferenceId varchar(50),
				ParameterName varchar(100),
				TestResult decimal(10,2),
				ResultUnit varchar(50),
				DetectionLimit decimal(10,2), 
				Undetectable bit, 
				OrderDate datetime,
				ResultDate datetime,
				HasResult bit
				)
				Insert Into @CD4Values
				(
					Ptn_Pk,
					LabTestId,
					TestName,
					TestReferenceId,
					ParameterId,
					ParameterReferenceId,
					ParameterName,
					TestResult,
					ResultUnit,
					DetectionLimit,
					Undetectable,
					OrderDate,
					ResultDate,
					HasResult
				)
				Select	O.Ptn_Pk
						,R.LabTestId
						,T.Name TestName
						,T.ReferenceId TestReferenceId
						,R.ParameterId
						,P.ReferenceId ParameterReferenceId
						,P.ParameterName
						,R.ResultValue	As TestResult
						,R.ResultUnit
						,R.DetectionLimit
						,R.Undetectable
						,O.OrderDate
						,ResultDate
						,R.HasResult
				From dtl_LabOrderTestResult As R
				Inner Join dtl_LabOrderTest OT On R.LabOrderTestId=OT.Id
				Inner Join Mst_LabTestParameter As P On P.Id = R.ParameterId
				Inner Join mst_LabTestMaster As T On T.Id = R.LabTestId
				Inner Join ord_LabOrder As O On O.Id = R.LabOrderId And O.Id = OT.LabOrderId
				Where (P.ReferenceId in ('CD4','CD4COUNT'))
					And (R.DeleteFlag = 0)
					And (O.DeleteFlag = 0)
					And (O.Ptn_Pk = @PatientId)
				Order By OrderDate

				Select Ptn_Pk,LabTestId,TestResult, OrderDate [Date], ResultDate,ResultUnit From @CD4Values

--Table 7                                                                                                           

Select	O.Ptn_Pk
		,R.LabTestId
		,R.ParameterId
		,R.ResultValue TestResult
		,R.DetectionLimit
		,R.Undetectable
		,O.OrderDate	[Date]
		,ResultDate
From dtl_LabOrderTestResult R
Inner Join Mst_LabTestParameter P On P.Id = R.ParameterId
Inner Join dtl_LabOrderTest OT On R.LabOrderTestId=OT.Id
Inner Join ord_LabOrder O On O.Id = R.LabOrderId
Where  (P.ReferenceId in ('VIRALLOAD','VIRAL_LOAD'))
	And R.DeleteFlag = 0
	And O.Ptn_Pk =@PatientId
Order By O.OrderDate Asc

--Table 8  

	Select		O.OrderDate	[Date]
	From dtl_LabOrderTestResult R
	Inner Join Mst_LabTestParameter P On P.Id = R.ParameterId
	Inner Join ord_LabOrder O On O.Id = R.LabOrderId
	Where P.ReferenceId In ('CD4','CD4COUNT','VIRALLOAD','VIRAL_LOAD')
		And R.DeleteFlag = 0
		And O.DeleteFlag = 0
		And O.Ptn_Pk = @PatientId
	Order By [Date] Asc
--Table 9                                                                            
--Pregnant Record   
If (@ModuleId = '203') Begin
Select Top 1	a.*,
				b.Name [PregnantValue]
From dtl_PatientClinicalStatus a
Inner Join VW_AllMasters b On a.Pregnant = b.Id
Join Ord_visit c On a.Visit_pk = c.Visit_Id
Where a.ptn_pk = @PatientId
And b.ModuleId = @ModuleId
And (c.deleteflag = 0 Or c.deleteflag Is Null)
Order By a.Visit_pk Desc
End 
Else Begin
Select Top 1	*,
				[PregnantValue] =
					Case
						When Pregnant = '0' Then 'Negative'
						When Pregnant = '1' Then 'Positive'
					End
From dtl_PatientClinicalStatus a
Join Ord_visit b On a.Visit_pk = b.Visit_Id
Where a.ptn_pk = @PatientId
And (b.deleteflag = 0 Or b.deleteflag Is Null)
Order By a.Visit_pk Desc
End

--Table 10 WHOStage Data                                                                    

Select WHOStageFlag = 1
--Table 11                                                                                        
Select Top 1	a.ptn_pk,
				a.visit_pk,
				c.Name [WHOStage],
				d.Name [WAB Stage]
From dtl_patientstage a
Inner Join ord_visit b On a.visit_pk = b.Visit_ID
Left Outer Join mst_decode c On a.whostage = c.id
Left Outer Join mst_decode d On a.wabstage = d.id
Where a.ptn_pk = @PatientId
And (WHOStage Is Not Null And WHOStage <> 0)
And (b.DeleteFlag Is Null Or b.DeleteFlag = 0)
Order By a.WABStageID Desc

--End Else Begin
--Select WHOStageFlag = 0
--Select 19
--End

--Table 12--- Lowest CD4                                                                                                                                                                     

Select LowestCD4Flag = 1

--Table 13                                                                                                                                                              
Select *
From
(
	Select
		convert(numeric, PrevLowestCD4) [TestResults],
		PrevMostRecentCD4 [TestResultsCTC],
		isnull(PrevLowestCD4Date, PrevMostRecentCD4Date) [OrderedByDate]
	From	dtl_PatientHivPrevCareIE a,
			ord_Visit b
	Where a.Visit_pk = b.Visit_Id
		And a.Ptn_pk = @PatientId
		And (b.deleteflag Is Null Or b.deleteflag = 0)
		And (PrevLowestCD4 Is Not Null Or PrevMostRecentCD4 Is Not Null) 
	Union 
	Select TestResult TestResults
		   ,TestResult TestResultCTC
		   ,OrderDate OrderByDate
	From @CD4Values Where HasResult = 1
	
) As InlineView

--Table 14 Most Recent CD4                                                            

Select RecentCD4Flag = 1

-- Table 15                                                                             
Select	max(TestResults) [TestResults],
		OrderedByDate
From
(
	Select
		convert(numeric, PrevMostRecentCD4) [TestResults],
		PrevMostRecentCD4Date [OrderedByDate]
	From	dtl_PatientHivPrevCareIE a,
			ord_Visit b
	Where a.Visit_pk = b.Visit_Id
		And a.Ptn_pk = @PatientId
		And (b.deleteflag Is Null Or b.deleteflag = 0)
		And PrevMostRecentCD4 Is Not Null
		And PrevMostRecentCD4Date Is Not Null 
	Union 
	Select TestResult TestResults		  
		   ,OrderDate OrderByDate
	From @CD4Values Where HasResult = 1
) As InlineView
Group By OrderedByDate
Order By OrderedByDate Desc

--Table 16                                                                                                                                                                                                                             

Declare @checkdate datetime
Declare @finaldate datetime
Select RecentCD4Flag = 1

-- Table 17                                                                                                                       
Set @checkdate =
(
	Select Top 1
		OrderedByDate
	From
		(
			Select
				convert(numeric, PrevMostRecentCD4) [TestResults],
				PrevMostRecentCD4Date [OrderedByDate]
			From	dtl_PatientHivPrevCareIE a,
					ord_Visit b
			Where a.Visit_pk = b.Visit_Id
				And a.Ptn_pk = @PatientId
				And (b.deleteflag Is Null Or b.deleteflag = 0)
				And PrevMostRecentCD4 Is Not Null
				And PrevMostRecentCD4Date Is Not Null 
			Union

			Select TestResult TestResults
					,OrderDate OrderByDate
			From @CD4Values Where HasResult = 1
		) As InlineView
	Order By OrderedByDate Desc
)
Set @finaldate = dateadd(Month, 6, @checkdate)
Select @finaldate


--Table 18 WAB stage                                                                                                                          
Select Top 1	a.ptn_pk,
				a.Visit_Pk,
				a.WABStageID,
				d.name [WABStage]
From dtl_patientstage a, ord_visit b, mst_decode d
Where a.wabstage = d.id
And a.visit_pk = b.visit_Id
And a.ptn_pk = @PatientId
And (WABStage Is Not Null And WABStage <> 0)
And (b.DeleteFlag Is Null Or b.DeleteFlag = 0)
Order By a.WABStageID Desc

---Table 19 Program Status for ART(ART, Non-ART, Unknown, CareEnd) and PMTCT (PMTCT, PMTCT Care End)                                    
Select	nullif(dbo.fn_GetPatientProgramStatus_Naveen(@PatientId, @ModuleId), '') [ART/PalliativeCare],
		---- --dbo.fn_GetPatientPMTCTProgramStatus_Futures(@PatientId, 0) [PMTCTStatus]                                                                               
		nullif(dbo.fn_GetPatientPMTCTProgramStatus_Futures(@PatientId), '') [PMTCTStatus]


-- Table 20 for family info                                      
Select count(*) [FamilyCount]
From dtl_familyInfo
Where Ptn_pk = @PatientId
And Referenceid Is Not Null
And (DeleteFlag Is Null Or DeleteFlag = 0)

-- Table 21---for family ART Count                                                                            
Select count(*) [FamilyARTCount]
From dtl_FamilyInfo f
Left Outer Join mst_RelationshipType r On r.ID = f.RelationshipType
Left Outer Join mst_decode s On s.ID = f.Sex
Where f.Ptn_pk = @PatientId
And dbo.fn_GetHivCareStatusID(f.ptn_pk, f.ReferenceId, f.Id) = 2
And f.Referenceid Is Not Null
And (f.DeleteFlag Is Null Or f.DeleteFlag = 0)

--table 22                                                                                                                                    
Select count(*) [FamilyAllCount]
From dtl_familyInfo
Where Ptn_pk = @PatientId
And (DeleteFlag Is Null Or DeleteFlag = 0)

--Table 23 -- Dynamic Labels                                                                                                                                
Exec dbo.pr_SystemAdmin_GetSystemBasedLabels_Constella	@SystemId,
														1000,
														''
--Table 24                                                                                                                                                 
Select Top 1	Z.TestResults,
				Z.OrderedByDate,
				dateadd(mm, 6, Z.OrderedByDate) [OrderedByDueDate],
				Z.Dis_Date
From
(
	Select
		convert(numeric, b.PrevARVsCD4) [TestResults],
		a.RegistrationDate [OrderedByDate],
		'0' [Dis_Date]
	From mst_patient a
		Inner Join dtl_PatientHivPrevCareIE b On a.ptn_pk = b.ptn_pk
		Inner Join ord_Visit c On c.Visit_Id = b.Visit_pk
			And c.Ptn_Pk = a.Ptn_pk
			And c.visittype = 0
	Where (a.DeleteFlag = 0 Or a.DeleteFlag Is Null)
		And b.ptn_pk = @PatientId
		And a.RegistrationDate Is Not Null
		And b.PrevARVsCD4 Is Not Null 
	Union 
	Select TestResult TestResults	
		   ,OrderDate OrderByDate
		   ,'1' Dis_Date
	From @CD4Values Where HasResult = 1

) Z
Order By Z.OrderedByDate Desc

--Table 25-- Most Recent Weight                                                                          
Select Top 1 Weight, Height
From dtl_patientvitals
Where ptn_pk = @PatientId
And Weight Is Not Null
Order By visit_pk Desc

--Table 26 ARV runs out                                                                                   
Select Top 1	max(po.Duration),
				opo.dispensedbydate,
				datediff(dd, getdate(), (dateadd(dd, max(po.duration), opo.dispensedbydate))) [CurrARTStock]
From ord_PatientPharmacyOrder opo
Inner Join dtl_PatientPharmacyOrder po On opo.Ptn_Pharmacy_Pk = po.Ptn_Pharmacy_Pk
Where opo.ptn_pk = @PatientId
And --locationid = @LocationId and                                
opo.Ptn_Pharmacy_Pk In
(
	Select
		a.ptn_pharmacy_pk
	From	ord_patientpharmacyorder a,
			dtl_patientpharmacyorder b,
			lnk_drugtypegeneric c
	Where a.ptn_pharmacy_pk = b.ptn_pharmacy_pk
		And b.genericid = c.genericid
		And c.drugtypeid = 37
		And (a.deleteflag = 0 Or a.deleteflag Is Null)
		And a.dispensedbydate Is Not Null Union Select
		a.ptn_pharmacy_pk
	From	ord_patientpharmacyorder a,
			dtl_patientpharmacyorder b,
			lnk_drugtypegeneric c,
			lnk_druggeneric d
	Where a.ptn_pharmacy_pk = b.ptn_pharmacy_pk
		And b.drug_pk = d.drug_pk
		And d.genericid = c.genericid
		And c.drugtypeid = 37
		And a.dispensedbydate Is Not Null
		And (a.deleteflag = 0 Or a.deleteflag Is Null)
)
Group By opo.dispensedbydate
Order By dispensedbydate Desc

--Table 27                                                                                    
Select dbo.fn_GetAgeConstella(DOB, RegistrationDate) [PatientAge]
From mst_patient
Where ptn_pk = @PatientId
--Table 28 -- PMTCT -- Current ARV Prophylaxis Regimen and Current ARV Prophylaxis Regimen Start Date    
If Exists
(
	Select
		*
	From mst_patient
	Where datediff(dd, dob, getdate()) / 365 >= 15
		And ptn_pk = @PatientId
) Begin

Select	dbo.fn_GetPatientCurrentProphylaxisRegimen_Constella(@PatientId) [CurrentARVProphylaxisRegimen],
		dbo.fn_GetPatientCurrentProphylaxisStartDate_Constella(@PatientId) [CurrentProphylaxisRegimenStartDate]

End Else Select	[CurrentARVProphylaxisRegimen] = Null,
				[CurrentProphylaxisRegimenStartDate] = Null


--Table 29 -- PMTCT -- Delivery Date                                                                                                                                   
Select max(DateOfDelivery) [DeliveryDateTime]
From dtl_patientclinicalstatus a, mst_patient b
Where a.Ptn_pk = @PatientId
And a.ptn_pk = b.ptn_pk
And (b.deleteflag = 0 Or b.deleteflag Is Null)


--Table 30 -- PMTCT -- Feeding Option                                                                                                              
Select Top 1 (a.Name) [FeedingOption]
From dtl_InfantInfo b
Inner Join mst_pmtctdecode a On b.FeedingOption = a.Id
Inner Join ord_Visit c On b.visit_pk = c.visit_Id
Where b.Ptn_pk = @PatientId
And b.FeedingOption Is Not Null
And (a.deleteflag = 0 Or a.deleteflag Is Null)
And (b.deleteflag = 0 Or b.deleteflag Is Null)
Order By c.visitDate Desc

--Table 31 -- PMTCT -- Last Visit Date                                                                               
Select Top 1 a.VisitDate [PMTCTVisitDate]
From ord_Visit a, mst_patient b
Where a.ptn_pk = b.ptn_pk
And a.Ptn_Pk = @PatientId
And (a.DeleteFlag = 0 Or a.DeleteFlag Is Null)
And (a.visittype In (4, 6, 11, 12) Or a.visittype > 100)
And (b.DeleteFlag = 0 Or b.DeleteFlag Is Null)
And datediff(dd, b.dob, getdate()) / 365 >= 15
And b.sex = 17
And (ANCNumber Is Not Null Or PMTCTNumber Is Not Null Or AdmissionNumber Is Not Null Or OutPatientNumber Is Not Null)
Order By Visitdate Desc

--Table 32 -- Child HIV Status                                                                              
Select Top 1 (b.Name) [ChildHIVStatus]
From dtl_patienthivother a
Inner Join mst_pmtctDecode b On a.HIVStatus_CHILD = b.Id
Inner Join ord_Visit c On a.visit_pk = c.visit_Id
Inner Join mst_patient d On a.ptn_pk = d.ptn_pk
Where a.ptn_pk = @PatientId
And (d.ANCNumber Is Not Null Or d.PMTCTNumber Is Not Null Or d.AdmissionNumber Is Not Null Or d.OutPatientNumber Is Not Null)


And (d.DeleteFlag = 0 Or d.DeleteFlag Is Null)
Order By c.visitDate Desc

---Table 33 ---- LMP from ANC-----                                                                      

Select Top 1 a.LMP [LMP]
From dtl_PatientClinicalStatus a, ord_visit b, mst_visittype c, mst_patient d
Where a.visit_pk = b.visit_id
And b.visittype = c.visittypeid
And (b.DeleteFlag = 0 Or b.DeleteFlag Is Null)
And datediff(dd, d.dob, getdate()) / 365 >= 15
And a.ptn_pk = d.ptn_pk
And d.sex = 17
And c.visitname Like '%ANC%'
And a.Ptn_pk = @PatientId
And a.LMP Is Not Null
Order By b.visitdate Asc

--Table 34 ---- EDD from ANC-----                                                                      

Select Top 1 a.EDD [EDD]
From dtl_PatientClinicalStatus a, ord_visit b, mst_visittype c, mst_patient d
Where a.visit_pk = b.visit_id
And b.visittype = c.visittypeid
And (b.DeleteFlag = 0 Or b.DeleteFlag Is Null)
And datediff(dd, d.dob, getdate()) / 365 >= 15
And a.ptn_pk = d.ptn_pk
And d.sex = 17
And c.visitname Like '%ANC%'
And a.Ptn_pk = @PatientId
And a.EDD Is Not Null
Order By b.visitdate Asc

--Table 35 ---- TBStatus from ANC -----                                                  
Select Top 1 (d.Name) [TBStatus]
From dtl_PatientOtherTreatment a, ord_visit b, mst_visittype c, mst_pmtctdecode d, mst_patient e
Where a.visit_pk = b.visit_id
And b.visittype = c.visittypeid
And (b.DeleteFlag = 0 Or b.DeleteFlag Is Null)
And (a.DeleteFlag = 0 Or a.DeleteFlag Is Null)
And a.TBStatus = d.Id
And datediff(dd, e.dob, getdate()) / 365 >= 15
And b.ptn_pk = e.ptn_pk
And e.sex = 17
And c.visitname Like '%ANC%'
And a.Ptn_pk = @PatientId
And a.TBStatus Is Not Null
Order By b.visitdate Desc

--Table 36 ---- Partner HIV Status -----                                                                      
Select Top 1 (b.Name) [Partner HIV Status]
From dtl_PatientCounseling a, mst_pmtctdecode b, ord_Visit c, mst_patient d
Where a.visit_pk = c.visit_Id
And datediff(dd, d.dob, getdate()) / 365 >= 15
And a.ptn_pk = d.ptn_pk
And (a.DeleteFlag = 0 Or a.DeleteFlag Is Null)
And (c.DeleteFlag = 0 Or c.DeleteFlag Is Null)
And a.PartnerHIVTestResult = b.Id
And a.PartnerHIVTestResult Is Not Null
And d.sex = 17
And a.Ptn_pk = @PatientId
Order By c.visitdate Desc

--Table 37 ---- Infant Prophylaxis Regimen -----                                                            
Select Top 1 (z.RegimenType) [Prophylaxis Regimen]
From ord_patientpharmacyorder x, dtl_patientpharmacyorder y,
dtl_RegimenMap z, mst_patient c
Where (x.DeleteFlag Is Null Or x.DeleteFlag = 0)
And x.progid = 223
And y.prophylaxis = 1
And x.ptn_pharmacy_pk = y.ptn_pharmacy_pk
And x.ptn_pk = c.ptn_pk
And datediff(dd, c.dob, getdate()) / 365 <= 2
And x.ptn_pk = @PatientId
And y.ptn_pharmacy_pk = z.orderid
Order By x.dispensedbydate Desc
--Table 38 ---- Lab Results -----        
Select	TP.ParameterName															As Test
		,convert(varchar, max(O.OrderDate), 103)									As Date
		,max(cast(datediff(Month, P.DOB, O.OrderDate) / 12.0 As decimal(10, 1)))	As [Age(Mnt)]
		,R.ResultValue																As Result
From Mst_LabTestParameter As TP
Inner Join dtl_LabOrderTestResult As R On R.ParameterId = TP.Id
Inner Join ord_LabOrder As O On O.Id = R.LabOrderId
Inner Join mst_Patient As P On P.Ptn_Pk = O.Ptn_Pk
Where (R.DeleteFlag = 0)
	And (O.DeleteFlag = 0)
	And (R.HasResult = 1)
	And (TP.ReferenceId In ('HIV_RAPID_TEST', 'HIV_CONFIRM', 'PCR'))
	And (O.Ptn_Pk = @PatientId)
Group By	TP.ParameterName
			,R.ResultValue

--Table 39 ---- Lab Results -----                                                       

Select Top 1 a.GestAge [Gestational Age]
From dtl_patientdelivery a, mst_patient b
Where a.ptn_pk = @PatientId
And a.ptn_pk = b.ptn_pk
And datediff(dd, b.dob, getdate()) / 365 >= 15
Order By a.Visit_pk Desc

--Table 40 ---- Care Ended Status -----                                            
Select Top 1	PatientExitReason,
				CareEnded,
				PMTCTCareEnded,
				Ptn_Pk
From VW_PatientCareEnd
Where (CareEnded Is Not Null Or CareEnded <> 0)
And ptn_pk = @PatientId
And ModuleId = @ModuleId
Order By CareEndedId Desc

--Table 41 ---- Techenical AreaName according Patient Selection -----                                    
Select	ptn_pk,
		ModuleID,
		StartDate
From lnk_patientprogramstart
Where ptn_pk = @PatientId
Order By ModuleID

--Table 42 ---- Techenical AreaName according Patient Selection -----                          
--select status from mst_patient where ptn_pk = @PatientId and deleteflag=0              

Select	PatientExitReason,
		CareEnded,
		PMTCTCareEnded,
		Ptn_Pk
From VW_PatientCareEnd
Where ptn_pk = @PatientId
And CareEnded = 1
And PatientExitReason = 93

---Table 43               
Select @ARTEndStatus = dbo.fn_GetPatientARTStatus_Futures(@PatientId)

If (@ARTEndStatus != '' Or @ARTEndStatus Is Not Null) Begin
Select @ARTEndStatus [ARTEndStatus]
End Else Begin
Select '' [ARTEndStatus]
End

-- Table 44 --3 Viral Load due date
declare @ParameterId int;

Select Top (1) @ParameterId = Id from Mst_LabTestParameter As P Where (P.ReferenceId In ('VIRALLOAD','VIRAL_LOAD')) And DeleteFlag=0;

declare @LatestViralLoad float;
Set @LatestViralLoad = (
--Select Top (1) dtl.ResultValue
Select Top (1) isnull(dtl.ResultValue, dtl.undetectable)
From dtl_LabOrderTest As ord
Inner Join dtl_LabOrderTestResult As dtl On ord.LabOrderId = dtl.LabOrderId
Inner Join ord_LabOrder As L On L.Id = ord.LabOrderId
--Inner Join Mst_LabTestParameter As P On P.Id = dtl.ParameterId
Where (dtl.ParameterId = @ParameterId)
	And (L.Ptn_Pk = @PatientId)
	And (ord.DeleteFlag Is Null Or ord.DeleteFlag = 0)
	And (L.OrderDate <> '')
	And (L.OrderDate Is Not Null)
	and isnull(dtl.ResultValue, dtl.undetectable) is not null
Order By L.OrderDate Desc
)

IF(@LatestViralLoad is null)
begin
       select ''[ViralLoadDueDate] from [dbo].[ord_LabOrder] where Ptn_pk=-1
end
else IF(@LatestViralLoad = 1.00)
begin
	select TOP 1 DATEADD(MONTH, 12, ord.ResultDate) [ViralLoadDueDate],'Undetectable VL' ResultValue from dtl_LabOrderTest ord inner JOIN dtl_LabOrderTestResult dtl on ord.LabOrderId = dtl.LabOrderId 
       inner JOIN [dbo].[ord_LabOrder] L ON L.Id=ord.LabOrderId
     --  inner JOIN ord_Visit ordV ON L.VisitId = ordV.Visit_Id
       where dtl.ParameterId =@ParameterId and L.Ptn_pk = @PatientId and (ord.DeleteFlag IS NULL OR ord.DeleteFlag=0) and ord.ResultDate <> '' 
       and ord.ResultDate is NOT NULL
       order BY ord.ResultDate desc
end
else IF(@LatestViralLoad > 1000)
begin
       select TOP 1 DATEADD(MONTH, 3, ord.ResultDate) [ViralLoadDueDate],dtl.ResultValue from dtl_LabOrderTest ord inner JOIN dtl_LabOrderTestResult dtl on ord.LabOrderId = dtl.LabOrderId 
       inner JOIN [dbo].[ord_LabOrder] L ON L.Id=ord.LabOrderId
      -- inner JOIN ord_Visit ordV ON L.VisitId = ordV.Visit_Id
       where dtl.ParameterId = @ParameterId and L.Ptn_pk = @PatientId and (ord.DeleteFlag IS NULL OR ord.DeleteFlag=0) and ord.ResultDate <> '' 
       and ord.ResultDate is NOT NULL
	   and dtl.ResultValue is not null
       order BY ord.ResultDate desc
end
else
begin
       select TOP 1 DATEADD(MONTH, 12, ord.ResultDate) [ViralLoadDueDate],dtl.ResultValue from dtl_LabOrderTest ord inner JOIN dtl_LabOrderTestResult dtl on ord.LabOrderId = dtl.LabOrderId 
       inner JOIN [dbo].[ord_LabOrder] L ON L.Id=ord.LabOrderId
     --  inner JOIN ord_Visit ordV ON L.VisitId = ordV.Visit_Id
       where dtl.ParameterId =@ParameterId and L.Ptn_pk = @PatientId and (ord.DeleteFlag IS NULL OR ord.DeleteFlag=0) and ord.ResultDate <> '' 
       and ord.ResultDate is NOT NULL
       order BY ord.ResultDate desc
end
End


GO


