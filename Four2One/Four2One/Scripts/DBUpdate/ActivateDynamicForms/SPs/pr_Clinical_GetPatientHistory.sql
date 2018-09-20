
/****** Object:  StoredProcedure [dbo].[pr_Clinical_GetPatientHistory_Constella]    Script Date: 8/27/2018 2:39:02 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER procedure [dbo].[pr_Clinical_GetPatientHistory_Constella]                                                                                                                  
@PatientId int,                                                                                                                  
@Password varchar(40)   = null                                                                                                               
as                                                                                                                  
                                                                                                                  
begin                                                                                             
Declare @SymKey varchar(400)                                                                                  
                                                                                                            
                                                                                                                  
Select Distinct	dbo.fn_PatientIdentificationNumber_Constella(a.ptn_pk, '', 1) [PatientId],
				(CountryId + '-' + PosId + '-' + SatelliteId + '-' + PatientEnrollmentId) [PatientID],
				(convert(varchar(50), decryptbykey(a.firstname)) + ' ' +
				isnull(convert(varchar(50), decryptbykey(a.MiddleName)), '') + ' ' +
				convert(varchar(50), decryptbykey(a.lastName))) Name,
				b.LocationID,
				a.Sex,
				a.PatientClinicID
From mst_patient a, ord_visit b
Where a.ptn_pk = b.ptn_pk
And a.ptn_pk = @patientid
And b.visittype = 12                                                                                                              
                                                                                  
       Select forms.* FROM(                                                                                                        
Select	'HIV-Enrollment' [FormName],
		a.ptn_pk,
		(convert(varchar(50), decryptbykey(a.FirstName)) + ' ' +
		convert(varchar(50), decryptbykey(a.MiddleName)) + ' ' +
		convert(varchar(50), decryptbykey(a.LastName))) Name,
		isnull(b.VisitDate, '1900-01-01') [TranDate],
		b.DataQuality [DataQuality],
		b.Visit_Id [OrderNo],
		b.LocationID [LocationID],
		'0' [PharmacyNo],
		'1' [Priority],
		'2' [Module],
		'0' [ID],
		'0' [ART],
		'0' [CAUTION]
From mst_patient a, ord_visit b
Where a.ptn_pk = b.ptn_pk
And b.visittype = 0
And a.Ptn_Pk = @PatientId
And a.PatientEnrollmentID <> ''
And (b.deleteflag Is Null Or b.deleteflag = 0)      
                                                                                 
Union All                                             
                                    
Select	'Initial Evaluation' As FormName,
		a.Ptn_Pk,
		convert(varchar(50), decryptbykey(a.FirstName)) + ' ' + convert(varchar(50), decryptbykey(a.MiddleName)) + ' ' + convert(varchar(50), decryptbykey(a.LastName))
		As Name,
		isnull(b.VisitDate, '1900-01-01') As TranDate,
		b.DataQuality,
		b.Visit_Id As OrderNo,
		b.LocationID,
		'0' As PharmacyNo,
		'2' As Priority,
		'2' As Module,
		'0' As ID,
		'0' As ART,
		'0' As CAUTION
From mst_Patient As a
Inner Join ord_Visit As b On a.Ptn_Pk = b.Ptn_Pk
Where (b.VisitType = 1)
And (a.Ptn_Pk = @PatientId)
And (b.DeleteFlag Is Null Or b.DeleteFlag = 0)                                                                                 
                                                                                                        
Union All                
                
Select	'Prior ART/HIV Care' As FormName,
		a.Ptn_Pk,
		convert(varchar(50), decryptbykey(a.FirstName)) + ' ' + convert(varchar(50), decryptbykey(a.MiddleName)) + ' ' + convert(varchar(50),
		decryptbykey(a.LastName)) As Name,
		isnull(b.VisitDate, '1900-01-01') As TranDate,
		b.DataQuality,
		b.Visit_Id As OrderNo,
		b.LocationID,
		'0' As PharmacyNo,
		'2' As Priority,
		'202' As Module,
		'0' As ID,
		'0' As ART,
		'0' As CAUTION
From mst_Patient As a
Inner Join ord_Visit As b On a.Ptn_Pk = b.Ptn_Pk
Where (b.VisitType = 16)
And (a.Ptn_Pk = @PatientId)
And (b.DeleteFlag Is Null Or b.DeleteFlag = 0) 
          
Union All                    
                
Select	'ART Care' As FormName,
		a.Ptn_Pk,
		convert(varchar(50), decryptbykey(a.FirstName)) + ' ' + convert(varchar(50), decryptbykey(a.MiddleName)) + ' ' + convert(varchar(50), decryptbykey(a.LastName))
		As Name,
		isnull(b.VisitDate, '1900-01-01') As TranDate,
		b.DataQuality,
		b.Visit_Id As OrderNo,
		b.LocationID,
		'0' As PharmacyNo,
		'4' As Priority,
		'202' As Module,
		'0' As ID,
		'0' As ART,
		'0' As CAUTION
From mst_Patient As a
Inner Join ord_Visit As b On a.Ptn_Pk = b.Ptn_Pk
Where (b.VisitType = 14)
And (a.Ptn_Pk = @PatientId)
And (b.DeleteFlag Is Null Or b.DeleteFlag = 0)   
    
---john start    
Union All       
Select	'ART Therapy' As FormName,
		a.Ptn_Pk,
		convert(varchar(50), decryptbykey(a.FirstName)) + ' ' + convert(varchar(50), decryptbykey(a.MiddleName)) + ' ' + convert(varchar(50), decryptbykey(a.LastName))
		As Name,
		isnull(b.VisitDate, '1900-01-01') As TranDate,
		b.DataQuality,
		b.Visit_Id As OrderNo,
		b.LocationID,
		'0' As PharmacyNo,
		'4' As Priority,
		'203' As Module,
		'0' As ID,
		'0' As ART,
		'0' As CAUTION
From mst_Patient As a
Inner Join ord_Visit As b On a.Ptn_Pk = b.Ptn_Pk
Where (b.VisitType = 19)
And (a.Ptn_Pk = @PatientId)
And (b.DeleteFlag Is Null Or b.DeleteFlag = 0)                                                                         
--john end                                                                                 
                                                                                                        
Union All           
               
Select	'ART History' As FormName,
		a.Ptn_Pk,
		convert(varchar(50), decryptbykey(a.FirstName)) + ' ' + convert(varchar(50), decryptbykey(a.MiddleName)) + ' ' + convert(varchar(50), decryptbykey(a.LastName))
		As Name,
		isnull(b.VisitDate, '1900-01-01') As TranDate,
		b.DataQuality,
		b.Visit_Id As OrderNo,
		b.LocationID,
		'0' As PharmacyNo,
		'4' As Priority,
		'203' As Module,
		'0' As ID,
		'0' As ART,
		'0' As CAUTION
From mst_Patient As a
Inner Join ord_Visit As b On a.Ptn_Pk = b.Ptn_Pk
Where (b.VisitType = 18)
And (a.Ptn_Pk = @PatientId)
And (b.DeleteFlag Is Null Or b.DeleteFlag = 0)    

Union All       
                                                                                         
                                                                                                         
Select	'Pharmacy' As FormName,
		mst_Patient.Ptn_Pk,
		convert(varchar(50), decryptbykey(mst_Patient.FirstName)) + ' ' + convert(varchar(50), decryptbykey(mst_Patient.MiddleName)) + ' ' + convert(varchar(50),
		decryptbykey(mst_Patient.LastName)) As Name,
		coalesce(DispensedByDate,OrderedByDate,VisitDate) TranDate,
		--Case
		--	When dbo.ord_PatientPharmacyOrder.DispensedByDate Is Null Then dbo.ord_PatientPharmacyOrder.OrderedByDate
		--	Else dbo.ord_PatientPharmacyOrder.DispensedByDate
		--End As TranDate,
		ord_Visit.DataQuality,
		ord_PatientPharmacyOrder.ptn_pharmacy_pk As OrderNo,
		ord_Visit.LocationID,
		'0' As PharmacyNo,
		'5' As Priority,
		'0' As Module,
		mst_Decode.ID,
		mst_Decode.Name As ART,
		Case
			When dbo.ord_PatientPharmacyOrder.DispensedByDate Is Null Then '1'
			Else '0'
		End As CAUTION
From mst_Patient
Inner Join ord_PatientPharmacyOrder On mst_Patient.Ptn_Pk = ord_PatientPharmacyOrder.Ptn_pk
Inner Join ord_Visit On mst_Patient.Ptn_Pk = ord_Visit.Ptn_Pk
		And ord_PatientPharmacyOrder.VisitID = ord_Visit.Visit_Id
Left Outer Join mst_Decode On mst_Decode.ID = ord_PatientPharmacyOrder.ProgID
Where (ord_Visit.VisitType = 4)
And (mst_Patient.Ptn_Pk = @PatientId)
And (ord_Visit.DeleteFlag Is Null Or ord_Visit.DeleteFlag = 0)
And (ord_Visit.VisitDate Is Not Null)
And (ord_PatientPharmacyOrder.OrderType = 116)                                                                                        
                       
Union All  
Select	'Laboratory' [FormName],
		a.ptn_pk,
		(convert(varchar(50), decryptbykey(a.firstname)) + ' ' +
		convert(varchar(50), decryptbykey(a.MiddleName)) + ' ' +
		convert(varchar(50), decryptbykey(a.lastName))) Name,
		isnull(b.OrderDate, '1900-01-01') [TranDate],
		c.DataQuality [DataQuality],
		b.Id [OrderNo],
		c.LocationID [LocationId],
		'0' [PharmacyNo],
		'7' [Priority],
		'0' As Module,
		'0' [ID],
		'0' [ART],
		CAUTION = ( Case b.OrderStatus When 'Pending' Then 1 Else 0 End)
		
From mst_patient a, ord_LabOrder b, ord_Visit c
Where a.ptn_pk = b.ptn_pk
And b.VisitId = c.Visit_Id
And a.ptn_pk = @PatientId
And c.visittype = 6
And (b.deleteflag Is Null Or b.deleteflag = 0)                                                                                         
  UNION ALL
--union                                                                                                              
                                                                                        
--Select	'Laboratory' [FormName],
--		a.ptn_pk,
--		(convert(varchar(50), decryptbykey(a.firstname)) + ' ' +
--		convert(varchar(50), decryptbykey(a.MiddleName)) + ' ' +
--		convert(varchar(50), decryptbykey(a.lastName))) Name,
--		isnull(b.OrderedbyDate, '1900-01-01') [TranDate],
--		c.DataQuality [DataQuality],
--		LabId [OrderNo],
--		c.LocationID [LocationID],
--		'0' [PharmacyNo],
--		'7' [Priority],
--		'0' [Module],
--		'0' [ID],
--		'0' [ART],
--		CAUTION =
--			Case
--				When b.ReportedByDate Is Null Or b.ReportedByDate = '1900-01-01' Then '1'
--				Else '0'
--			End
--From mst_patient a, ord_PatientLabOrder b, ord_Visit c
--Where a.ptn_pk = b.ptn_pk
--And b.VisitId = c.Visit_Id
--And a.ptn_pk = @PatientId
--And c.visittype = 6
--And (b.deleteflag Is Null Or b.deleteflag = 0)                                                                                     
 
--union  All                                                                                                               
--  Select	'Service Request ' + M.DisplayName As FormName,
--		P.Ptn_Pk,
--		convert(varchar(50), decryptbykey(P.FirstName)) + ' ' + convert(varchar(50), decryptbykey(P.MiddleName)) + ' ' + convert(varchar(50),
--		decryptbykey(P.LastName)) As Name,
--		O.OrderDate,
--		V.DataQuality,
--		O.Id As [OrderNo],
--		V.LocationID,
--		'0' As PharmacyNo,
--		'7' As Priority,
--		 0 As Module,
--		'0' As ID,
--		'0' As ART,
--		Case
--			When 	O.OrderStatus <> 'Complete' Then '1'
--			Else '0'
--		End As CAUTION
--From mst_Patient As P
--Inner Join ord_ClinicalServiceOrder As O On P.Ptn_Pk = O.Ptn_Pk
--Inner Join ord_Visit As V On O.VisitId = V.Visit_Id
--Inner Join mst_module As M On O.TargetModuleId = M.ModuleID
--Where (P.Ptn_Pk = @PatientId)
--And O.DeleteFlag = 0                                                                                      
                                                              
                                                                                                              
--Union All                                                             
                                                                                                      
Select	'Paediatric Pharmacy' As FormName,
		mst_Patient.Ptn_Pk,
		convert(varchar(50), decryptbykey(mst_Patient.FirstName)) + ' ' + convert(varchar(50), decryptbykey(mst_Patient.MiddleName))
		+ ' ' + convert(varchar(50), decryptbykey(mst_Patient.LastName)) As Name,
		Case
			When dbo.ord_PatientPharmacyOrder.DispensedByDate Is Null Then dbo.ord_PatientPharmacyOrder.OrderedByDate
			Else dbo.ord_PatientPharmacyOrder.DispensedByDate
		End As TranDate,
		ord_Visit.DataQuality,
		ord_PatientPharmacyOrder.ptn_pharmacy_pk As OrderNo,
		ord_Visit.LocationID,
		'0' As PharmacyNo,
		'6' As Priority,
		'0' As Module,
		'0' As ID,
		'0' As ART,
		Case
			When dbo.ord_PatientPharmacyOrder.DispensedByDate Is Null Then '1'
			Else '0'
		End As CAUTION
From mst_Patient
Inner Join ord_PatientPharmacyOrder On mst_Patient.Ptn_Pk = ord_PatientPharmacyOrder.Ptn_pk
Inner Join ord_Visit On mst_Patient.Ptn_Pk = ord_Visit.Ptn_Pk
		And ord_PatientPharmacyOrder.VisitID = ord_Visit.Visit_Id
Where (ord_Visit.VisitType = 4)
And (mst_Patient.Ptn_Pk = @PatientId)
And (ord_Visit.DeleteFlag Is Null Or ord_Visit.DeleteFlag = 0)
And (ord_Visit.VisitDate Is Not Null)
And (ord_PatientPharmacyOrder.OrderType = 117)                                                                                                       
                                                                                                      
Union All                                   
                                                                                             
Select	'ART Follow-Up' As FormName,
		a.Ptn_Pk,
		convert(varchar(50), decryptbykey(a.FirstName, a.Ptn_Pk, convert(varchar(50), a.Ptn_Pk))) + ' ' + convert(varchar(50), decryptbykey(a.MiddleName, a.Ptn_Pk,
		convert(varchar(50), a.Ptn_Pk))) + ' ' + convert(varchar(50), decryptbykey(a.LastName, a.Ptn_Pk, convert(varchar(50), a.Ptn_Pk))) As Name,
		isnull(b.VisitDate, '1900-01-01') As TranDate,
		b.DataQuality,
		b.Visit_Id As OrderNo,
		b.LocationID,
		'0' As PharmacyNo,
		'3' As Priority,
		'2' As Module,
		'0' As ID,
		'0' As ART,
		'0' As CAUTION
From mst_Patient As a
Inner Join ord_Visit As b On a.Ptn_Pk = b.Ptn_Pk
Where (b.VisitType = 2)
And (a.Ptn_Pk = @PatientId)
And (b.DeleteFlag Is Null Or b.DeleteFlag = 0)                                                                                                             
                  
Union All 
                                                                                   
Select	'HIV Care/ART Encounter' As FormName,
		a.Ptn_Pk,
		convert(varchar(50), decryptbykey(a.FirstName, a.Ptn_Pk, convert(varchar(50), a.Ptn_Pk))) + ' ' + convert(varchar(50), decryptbykey(a.MiddleName,
		a.Ptn_Pk, convert(varchar(50), a.Ptn_Pk))) + ' ' + convert(varchar(50), decryptbykey(a.LastName, a.Ptn_Pk, convert(varchar(50), a.Ptn_Pk))) As Name,
		isnull(b.VisitDate, '1900-01-01') As TranDate,
		b.DataQuality,
		b.Visit_Id As OrderNo,
		b.LocationID,
		'0' As PharmacyNo,
		'3' As Priority,
		'202' As Module,
		'0' As ID,
		'0' As ART,
		'0' As CAUTION
From mst_Patient As a
Inner Join ord_Visit As b On a.Ptn_Pk = b.Ptn_Pk
Where (b.VisitType = 15)
And (a.Ptn_Pk = @PatientId)
And (b.DeleteFlag Is Null Or b.DeleteFlag = 0)                                                                                                         
    
Union All        

Select	'Initial and Follow up Visits' As FormName,
		a.Ptn_Pk,
		convert(varchar(50), decryptbykey(a.FirstName, a.Ptn_Pk, convert(varchar(50), a.Ptn_Pk))) + ' ' + convert(varchar(50), decryptbykey(a.MiddleName,
		a.Ptn_Pk, convert(varchar(50), a.Ptn_Pk))) + ' ' + convert(varchar(50), decryptbykey(a.LastName, a.Ptn_Pk, convert(varchar(50), a.Ptn_Pk))) As Name,
		isnull(b.VisitDate, '1900-01-01') As TranDate,
		b.DataQuality,
		b.Visit_Id As OrderNo,
		b.LocationID,
		'0' As PharmacyNo,
		'3' As Priority,
		'203' As Module,
		'0' As ID,
		'0' As ART,
		'0' As CAUTION
From mst_Patient As a
Inner Join ord_Visit As b On a.Ptn_Pk = b.Ptn_Pk
Where (b.VisitType = 17)
And (a.Ptn_Pk = @PatientId)
And (b.DeleteFlag Is Null Or b.DeleteFlag = 0)     
    
Union All                                                                                                           
                                                                                                
Select Distinct	'Non-ART Follow-Up' As FormName,
				a.Ptn_Pk,
				convert(varchar(50), decryptbykey(a.FirstName, a.Ptn_Pk, convert(varchar(50), a.Ptn_Pk))) + ' ' + convert(varchar(50), decryptbykey(a.MiddleName, a.Ptn_Pk,
				convert(varchar(50), a.Ptn_Pk))) + ' ' + convert(varchar(50), decryptbykey(a.LastName, a.Ptn_Pk, convert(varchar(50), a.Ptn_Pk))) As Name,
				isnull(b.VisitDate, '1900-01-01') As TranDate,
				b.DataQuality,
				b.Visit_Id As OrderNo,
				b.LocationID,
				'0' As PharmacyNo,
				'4' As Priority,
				'2' As Module,
				'0' As ID,
				'0' As ART,
				'0' As CAUTION
From mst_Patient As a
Inner Join ord_Visit As b On a.Ptn_Pk = b.Ptn_Pk
Where (b.VisitType = 3)
And (b.Ptn_Pk = @PatientId)
And (b.DeleteFlag Is Null Or b.DeleteFlag = 0)                               
                                                                                                          
Union All                                         
                                                                       
Select	'Patient Record - Initial Visit' As FormName,
		mst_Patient.Ptn_Pk,
		convert(varchar(50), decryptbykey(mst_Patient.FirstName, mst_Patient.Ptn_Pk, convert(varchar(50), mst_Patient.Ptn_Pk)))
		+ ' ' + convert(varchar(50), decryptbykey(mst_Patient.MiddleName, mst_Patient.Ptn_Pk, convert(varchar(50), mst_Patient.Ptn_Pk))) + ' ' + convert(varchar(50), decryptbykey(mst_Patient.LastName,
		mst_Patient.Ptn_Pk, convert(varchar(50), mst_Patient.Ptn_Pk))) As Name,
		isnull(ord_Visit.VisitDate, '1900-01-01') As TranDate,
		ord_Visit.DataQuality,
		ord_Visit.Visit_Id As OrderNo,
		ord_Visit.LocationID,
		'0' As PatientRecordNo,
		'0' As Priority,
		'' As Module,
		'0' As ID,
		'0' As ART,
		'0' As CAUTION
From mst_Patient
Inner Join ord_Visit On mst_Patient.Ptn_Pk = ord_Visit.Ptn_Pk
Where (ord_Visit.VisitType = 7)
And (mst_Patient.Ptn_Pk = @PatientId)                                                                                                        
                                      
Union All        
                                             
Select	'Patient Record - Follow Up' As FormName,
		mst_Patient.Ptn_Pk,
		convert(varchar(50), decryptbykey(mst_Patient.FirstName, mst_Patient.Ptn_Pk, convert(varchar(50), mst_Patient.Ptn_Pk)))
		+ ' ' + convert(varchar(50), decryptbykey(mst_Patient.MiddleName, mst_Patient.Ptn_Pk, convert(varchar(50), mst_Patient.Ptn_Pk))) + ' ' + convert(varchar(50), decryptbykey(mst_Patient.LastName,
		mst_Patient.Ptn_Pk, convert(varchar(50), mst_Patient.Ptn_Pk))) As Name,
		isnull(ord_Visit.VisitDate, '1900-01-01') As TranDate,
		ord_Visit.DataQuality,
		ord_Visit.Visit_Id As OrderNo,
		ord_Visit.LocationID,
		'0' As PatientRecordNo,
		'0' As Priority,
		'' As Module,
		'0' As ID,
		'0' As ART,
		'0' As CAUTION
From mst_Patient
Inner Join ord_Visit On mst_Patient.Ptn_Pk = ord_Visit.Ptn_Pk
Where (ord_Visit.VisitType = 8)
And (mst_Patient.Ptn_Pk = @PatientId)
And (ord_Visit.DeleteFlag Is Null)                                                                                        
                                      
Union All                                                                                           
                                                                          
Select	'Care Tracking' As FormName,
		a.Ptn_Pk,
		convert(varchar(50), decryptbykey(a.FirstName, a.Ptn_Pk, convert(varchar(50), a.Ptn_Pk))) + ' ' + convert(varchar(50), decryptbykey(a.MiddleName, a.Ptn_Pk,
		convert(varchar(50), a.Ptn_Pk))) + ' ' + convert(varchar(50), decryptbykey(a.LastName, a.Ptn_Pk, convert(varchar(50), a.Ptn_Pk))) As Name,
		Case
			When c.Careended = 1 Then isnull(c.CareEndedDate, '')
			When c.ARTended = 1 Then isnull(c.ARTenddate, '')
			Else isnull(b.DateLastContact, '')
		End As TranDate,
		b.DataQuality,
		b.TrackingID As OrderNo,
		c.LocationId As LocationID,
		c.CareEndedID As PharmacyNo,
		'9' As Priority,
		b.ModuleId As Module,
		'0' As ID,
		'0' As ART,
		'0' As CAUTION
From mst_Patient As a
Inner Join dtl_PatientTrackingCare As b On a.Ptn_Pk = b.Ptn_Pk
Inner Join dtl_PatientCareEnded As c On a.Ptn_Pk = c.Ptn_Pk
		And b.TrackingID = c.TrackingId
Where (c.ARTended Is Null Or c.ARTended = 0)
And (a.Ptn_Pk = @PatientId)

Union All                                                                                                            
                                                                                        
Select	'Home Visit' As FormName,
		a.Ptn_Pk,
		convert(varchar(50), decryptbykey(a.FirstName, a.Ptn_Pk, convert(varchar(50), a.Ptn_Pk))) + ' ' + convert(varchar(50), decryptbykey(a.MiddleName, a.Ptn_Pk,
		convert(varchar(50), a.Ptn_Pk))) + ' ' + convert(varchar(50), decryptbykey(a.LastName, a.Ptn_Pk, convert(varchar(50), a.Ptn_Pk))) As Name,
		isnull(b.hvBeginDate, '1900-01-01') As TranDate,
		b.DataQuality,
		b.HomeVisitID As OrderNo,
		b.LocationId As LocationID,
		'0' As PharmacyNo,
		'8' As Priority,
		'2' As Module,
		'0' As ID,
		'0' As ART,
		'0' As CAUTION
From mst_Patient As a
Inner Join dtl_PatientHomeVisit As b On a.Ptn_Pk = b.ptn_pk
Where (a.Ptn_Pk = @PatientId)
And (b.DeleteFlag Is Null)
Or (a.Ptn_Pk = @PatientId)
And (b.DeleteFlag = 0)                                                                          
 Union All
 SELECT 'PEP' AS FormName
			,a.ptn_pk
	    ,convert(varchar(50), decryptbykey(a.FirstName, a.Ptn_Pk, convert(varchar(50), a.Ptn_Pk))) + ' ' + convert(varchar(50), decryptbykey(a.MiddleName, a.Ptn_Pk,
		convert(varchar(50), a.Ptn_Pk))) + ' ' + convert(varchar(50), decryptbykey(a.LastName, a.Ptn_Pk, convert(varchar(50), a.Ptn_Pk))) As Name,
			ISNULL(b.VisitDate, '1900-01-01') AS TranDate
			,b.DataQuality AS DataQuality
			,b.Visit_Id AS OrderNo
			,b.LocationID AS LocationID
			,'0' AS PharmacyNo
			,'4' AS Priority
			,'6' AS Module
			,'0' AS ID
			,'0' AS ART
			,'0' AS CAUTION
		FROM mst_patient AS a
			,ord_visit AS b
		WHERE a.ptn_pk = b.ptn_pk
			AND b.visittype = 21
			AND a.Ptn_Pk = @PatientId
			AND (
				b.deleteflag IS NULL
				OR b.deleteflag = 0
				)
		                                    
Union All   

        SELECT 'Paediatric Initial Evaluation Form' AS FormName
			,a.ptn_pk
			,CONVERT(VARCHAR(50), DECRYPTBYKEY(a.FirstName)) + ' ' + CONVERT(VARCHAR(50), DECRYPTBYKEY(a.MiddleName)) + ' ' + CONVERT(VARCHAR(50), DECRYPTBYKEY(a.LastName)) AS NAME
			,ISNULL(b.VisitDate, '1900-01-01') AS TranDate
			,b.DataQuality AS DataQuality
			,b.Visit_Id AS OrderNo
			,b.LocationID AS LocationID
			,'0' AS PharmacyNo
			,'4' AS Priority
			,'204' AS Module
			,'0' AS ID
			,'0' AS ART
			,'0' AS CAUTION
			
		FROM mst_patient AS a
			,ord_visit AS b
		WHERE a.ptn_pk = b.ptn_pk
			AND b.visittype = 22
			AND a.Ptn_Pk = @PatientId
			AND (
				b.deleteflag IS NULL
				OR b.deleteflag = 0
				)
		
		UNION ALL
		
		SELECT 'Express' AS FormName
			,a.ptn_pk
			,CONVERT(VARCHAR(50), DECRYPTBYKEY(a.FirstName)) + ' ' + CONVERT(VARCHAR(50), DECRYPTBYKEY(a.MiddleName)) + ' ' + CONVERT(VARCHAR(50), DECRYPTBYKEY(a.LastName)) AS NAME
			,ISNULL(b.VisitDate, '1900-01-01') AS TranDate
			,b.DataQuality AS DataQuality
			,b.Visit_Id AS OrderNo
			,b.LocationID AS LocationID
			,'0' AS PharmacyNo
			,'4' AS Priority
			,'204' AS Module
			,'0' AS ID
			,'0' AS ART
			,'0' AS CAUTION
			
		FROM mst_patient AS a
			,ord_visit AS b
		WHERE a.ptn_pk = b.ptn_pk
			AND b.visittype = 31
			AND a.Ptn_Pk = @PatientId
			AND (
				b.deleteflag IS NULL
				OR b.deleteflag = 0
				)
		
		UNION ALL

		SELECT 'Adult Initial Evaluation Form' AS FormName
			,a.ptn_pk
			,CONVERT(VARCHAR(50), DECRYPTBYKEY(a.FirstName)) + ' ' + CONVERT(VARCHAR(50), DECRYPTBYKEY(a.MiddleName)) + ' ' + CONVERT(VARCHAR(50), DECRYPTBYKEY(a.LastName)) AS NAME
			,ISNULL(b.VisitDate, '1900-01-01') AS TranDate
			,b.DataQuality AS DataQuality
			,b.Visit_Id AS OrderNo
			,b.LocationID AS LocationID
			,'0' AS PharmacyNo
			,'4' AS Priority
			,'204' AS Module
			,'0' AS ID
			,'0' AS ART
			,'0' AS CAUTION
	
		FROM mst_patient AS a
			,ord_visit AS b
		WHERE a.ptn_pk = b.ptn_pk
			AND b.visittype = 25
			AND a.Ptn_Pk = @PatientId
			AND (
				b.deleteflag IS NULL
				OR b.deleteflag = 0
				)
		
		UNION ALL
		
		SELECT 'Adult Follow up Form' AS FormName
			,a.ptn_pk
			,CONVERT(VARCHAR(50), DECRYPTBYKEY(a.FirstName)) + ' ' + CONVERT(VARCHAR(50), DECRYPTBYKEY(a.MiddleName)) + ' ' + CONVERT(VARCHAR(50), DECRYPTBYKEY(a.LastName)) AS NAME
			,ISNULL(b.VisitDate, '1900-01-01') AS TranDate
			,b.DataQuality AS DataQuality
			,b.Visit_Id AS OrderNo
			,b.LocationID AS LocationID
			,'0' AS PharmacyNo
			,'4' AS Priority
			,'204' AS Module
			,'0' AS ID
			,'0' AS ART
			,'0' AS CAUTION
			
		FROM mst_patient AS a
			,ord_visit AS b
		WHERE a.ptn_pk = b.ptn_pk
			AND b.visittype = 23
			AND a.Ptn_Pk = @PatientId
			AND (
				b.deleteflag IS NULL
				OR b.deleteflag = 0
				)
		
		UNION  ALL
		
		
         SELECT 'Paediatric Follow up Form' AS FormName
			,a.ptn_pk
			,CONVERT(VARCHAR(50), DECRYPTBYKEY(a.FirstName)) + ' ' + CONVERT(VARCHAR(50), DECRYPTBYKEY(a.MiddleName)) + ' ' + CONVERT(VARCHAR(50), DECRYPTBYKEY(a.LastName)) AS NAME
			,ISNULL(b.VisitDate, '1900-01-01') AS TranDate
			,b.DataQuality AS DataQuality
			,b.Visit_Id AS OrderNo
			,b.LocationID AS LocationID
			,'0' AS PharmacyNo
			,'4' AS Priority
			,'204' AS Module
			,'0' AS ID
			,'0' AS ART
			,'0' AS CAUTION
			
		FROM mst_patient AS a
			,ord_visit AS b
		WHERE a.ptn_pk = b.ptn_pk
			AND b.visittype = 24
			AND a.Ptn_Pk = @PatientId
			AND (
				b.deleteflag IS NULL
				OR b.deleteflag = 0
				)
		
		UNION  ALL
		                              
                                                  
Select	'Patient Registration' As FormName,
		a.Ptn_Pk,
		convert(varchar(50), decryptbykey(a.FirstName)) + ' ' + convert(varchar(50), decryptbykey(a.MiddleName)) + ' ' + convert(varchar(50),
		decryptbykey(a.LastName)) As Name,
		isnull(b.VisitDate, '1900-01-01') As TranDate,
		b.DataQuality,
		b.Visit_Id As OrderNo,
		b.LocationID,
		'0' As PharmacyNo,
		'1' As Priority,
		'0' As Module,
		'0' As ID,
		'0' As ART,
		'0' As CAUTION
From mst_Patient As a
Inner Join ord_Visit As b On a.Ptn_Pk = b.Ptn_Pk
Where (b.VisitType = 12)
And (a.Ptn_Pk = @PatientId)
And (b.DeleteFlag Is Null Or b.DeleteFlag = 0)                                                       
                                          
Union All    
SELECT 'HEI' AS FormName
			,a.ptn_pk
			,CONVERT(VARCHAR(50), DECRYPTBYKEY(a.firstname, a.ptn_pk, CONVERT(VARCHAR(50), a.ptn_pk))) + ' ' + CONVERT(VARCHAR(50), DECRYPTBYKEY(a.MiddleName, a.ptn_pk, CONVERT(VARCHAR(50), a.ptn_pk))) + ' ' + CONVERT(VARCHAR(50), DECRYPTBYKEY(a.lastName, a.ptn_pk, CONVERT(VARCHAR(50), a.ptn_pk))) AS NAME
			,ISNULL(b.VisitDate, '1900-01-01') AS TranDate
			,b.DataQuality AS DataQuality
			,b.Visit_Id AS OrderNo
			,b.LocationID AS LocationID
			,'0' AS PharmacyNo
			,'9' AS Priority
			,'1' AS Module
			,'0' AS ID
			,'0' AS ART
			,'0' AS CAUTION
			
		FROM mst_patient AS a
			,ord_visit AS b
		WHERE a.ptn_pk = b.ptn_pk
			AND b.visittype = 37
			AND a.Ptn_Pk = @PatientId
			AND (
				b.deleteflag IS NULL
				OR b.deleteflag = 0
				)
		
		UNION ALL
		
		SELECT 'MEI' AS FormName
			,a.ptn_pk
			,CONVERT(VARCHAR(50), DECRYPTBYKEY(a.firstname, a.ptn_pk, CONVERT(VARCHAR(50), a.ptn_pk))) + ' ' + CONVERT(VARCHAR(50), DECRYPTBYKEY(a.MiddleName, a.ptn_pk, CONVERT(VARCHAR(50), a.ptn_pk))) + ' ' + CONVERT(VARCHAR(50), DECRYPTBYKEY(a.lastName, a.ptn_pk, CONVERT(VARCHAR(50), a.ptn_pk))) AS NAME
			,ISNULL(b.VisitDate, '1900-01-01') AS TranDate
			,b.DataQuality AS DataQuality
			,b.Visit_Id AS OrderNo
			,b.LocationID AS LocationID
			,'0' AS PharmacyNo
			,'9' AS Priority
			,'1' AS Module
			,'0' AS ID
			,'0' AS ART
			,'0' AS CAUTION
		
		FROM mst_patient AS a
			,ord_visit AS b
		WHERE a.ptn_pk = b.ptn_pk
			AND b.visittype = 40
			AND a.Ptn_Pk = @PatientId
			AND (
				b.deleteflag IS NULL
				OR b.deleteflag = 0
				)
		
		UNION ALL
		
		SELECT 'DCC Adult Initial Evaluation Form' AS FormName
			,a.ptn_pk
			,CONVERT(VARCHAR(50), DECRYPTBYKEY(a.FirstName)) + ' ' + CONVERT(VARCHAR(50), DECRYPTBYKEY(a.MiddleName)) + ' ' + CONVERT(VARCHAR(50), DECRYPTBYKEY(a.LastName)) AS NAME
			,ISNULL(b.VisitDate, '1900-01-01') AS TranDate
			,b.DataQuality AS DataQuality
			,b.Visit_Id AS OrderNo
			,b.LocationID AS LocationID
			,'0' AS PharmacyNo
			,'1' AS Priority
			,'210' AS Module
			,'0' AS ID
			,'0' AS ART
			,'0' AS CAUTION
			
		FROM mst_patient AS a
			,ord_visit AS b
		WHERE a.ptn_pk = b.ptn_pk
			AND b.visittype = 38
			AND a.Ptn_Pk = @PatientId
			AND (
				b.deleteflag IS NULL
				OR b.deleteflag = 0
				)
		
		UNION ALL
		
		SELECT 'DCC Revised Adult Follow up Form' AS FormName
			,a.ptn_pk
			,CONVERT(VARCHAR(50), DECRYPTBYKEY(a.FirstName)) + ' ' + CONVERT(VARCHAR(50), DECRYPTBYKEY(a.MiddleName)) + ' ' + CONVERT(VARCHAR(50), DECRYPTBYKEY(a.LastName)) AS NAME
			,ISNULL(b.VisitDate, '1900-01-01') AS TranDate
			,b.DataQuality AS DataQuality
			,b.Visit_Id AS OrderNo
			,b.LocationID AS LocationID
			,'0' AS PharmacyNo
			,'2' AS Priority
			,'210' AS Module
			,'0' AS ID
			,'0' AS ART
			,'0' AS CAUTION
	
		FROM mst_patient AS a
			,ord_visit AS b
		WHERE a.ptn_pk = b.ptn_pk
			AND b.visittype = 39
			AND a.Ptn_Pk = @PatientId
			AND (
				b.deleteflag IS NULL
				OR b.deleteflag = 0
				)
		
		UNION ALL
		
		SELECT 'Green Card Form' AS FormName
			,a.ptn_pk
			,CONVERT(VARCHAR(50), DECRYPTBYKEY(a.FirstName)) + ' ' + CONVERT(VARCHAR(50), DECRYPTBYKEY(a.MiddleName)) + ' ' + CONVERT(VARCHAR(50), DECRYPTBYKEY(a.LastName)) AS NAME
			,ISNULL(b.VisitDate, '1900-01-01') AS TranDate
			,b.DataQuality AS DataQuality
			,b.Visit_Id AS OrderNo
			,b.LocationID AS LocationID
			,'0' AS PharmacyNo
			,'2' AS Priority
			,'203' AS Module
			,'0' AS ID
			,'0' AS ART
			,'0' AS CAUTION
			
		FROM mst_patient AS a
			,ord_visit AS b
		WHERE a.ptn_pk = b.ptn_pk
			AND b.visittype = 50
			AND a.Ptn_Pk = @PatientId
			AND (
				b.deleteflag IS NULL
				OR b.deleteflag = 0
				)
		/**** HVICE ******/
		UNION ALL
		
		SELECT 'HIVCE - Treatment Preparation' AS FormName
			,a.ptn_pk
			,CONVERT(VARCHAR(50), DECRYPTBYKEY(a.FirstName)) + ' ' + CONVERT(VARCHAR(50), DECRYPTBYKEY(a.MiddleName)) + ' ' + CONVERT(VARCHAR(50), DECRYPTBYKEY(a.LastName)) AS NAME
			,ISNULL(b.VisitDate, '1900-01-01') AS TranDate
			,b.DataQuality AS DataQuality
			,b.Visit_Id AS OrderNo
			,b.LocationID AS LocationID
			,'0' AS PharmacyNo
			,'2' AS Priority
			,'203' AS Module
			,'0' AS ID
			,'0' AS ART
			,'0' AS CAUTION
			
		FROM mst_patient AS a
			,ord_visit AS b
		WHERE a.ptn_pk = b.ptn_pk
			AND b.visittype = 60
			AND a.Ptn_Pk = @PatientId
			AND (
				b.deleteflag IS NULL
				OR b.deleteflag = 0
				)
		
		UNION ALL
		
		SELECT 'HVICE - ART Readiness Assessment' AS FormName
			,a.ptn_pk
			,CONVERT(VARCHAR(50), DECRYPTBYKEY(a.FirstName)) + ' ' + CONVERT(VARCHAR(50), DECRYPTBYKEY(a.MiddleName)) + ' ' + CONVERT(VARCHAR(50), DECRYPTBYKEY(a.LastName)) AS NAME
			,ISNULL(b.VisitDate, '1900-01-01') AS TranDate
			,b.DataQuality AS DataQuality
			,b.Visit_Id AS OrderNo
			,b.LocationID AS LocationID
			,'0' AS PharmacyNo
			,'2' AS Priority
			,'203' AS Module
			,'0' AS ID
			,'0' AS ART
			,'0' AS CAUTION
		
		FROM mst_patient AS a
			,ord_visit AS b
		WHERE a.ptn_pk = b.ptn_pk
			AND b.visittype = 61
			AND a.Ptn_Pk = @PatientId
			AND (
				b.deleteflag IS NULL
				OR b.deleteflag = 0
				)
		
		UNION ALL
		
		SELECT 'HVICE - Transition' AS FormName
			,a.ptn_pk
			,CONVERT(VARCHAR(50), DECRYPTBYKEY(a.FirstName)) + ' ' + CONVERT(VARCHAR(50), DECRYPTBYKEY(a.MiddleName)) + ' ' + CONVERT(VARCHAR(50), DECRYPTBYKEY(a.LastName)) AS NAME
			,ISNULL(b.VisitDate, '1900-01-01') AS TranDate
			,b.DataQuality AS DataQuality
			,b.Visit_Id AS OrderNo
			,b.LocationID AS LocationID
			,'0' AS PharmacyNo
			,'2' AS Priority
			,'203' AS Module
			,'0' AS ID
			,'0' AS ART
			,'0' AS CAUTION
			
		FROM mst_patient AS a
			,ord_visit AS b
		WHERE a.ptn_pk = b.ptn_pk
			AND b.visittype = 62
			AND a.Ptn_Pk = @PatientId
			AND (
				b.deleteflag IS NULL
				OR b.deleteflag = 0
				)
		
		UNION ALL
		
		SELECT 'HIVCE - Alcohol Depression Screening' AS FormName
			,a.ptn_pk
			,CONVERT(VARCHAR(50), DECRYPTBYKEY(a.FirstName)) + ' ' + CONVERT(VARCHAR(50), DECRYPTBYKEY(a.MiddleName)) + ' ' + CONVERT(VARCHAR(50), DECRYPTBYKEY(a.LastName)) AS NAME
			,ISNULL(b.VisitDate, '1900-01-01') AS TranDate
			,b.DataQuality AS DataQuality
			,b.Visit_Id AS OrderNo
			,b.LocationID AS LocationID
			,'0' AS PharmacyNo
			,'2' AS Priority
			,'203' AS Module
			,'0' AS ID
			,'0' AS ART
			,'0' AS CAUTION
			
		FROM mst_patient AS a
			,ord_visit AS b
		WHERE a.ptn_pk = b.ptn_pk
			AND b.visittype = 63
			AND a.Ptn_Pk = @PatientId
			AND (
				b.deleteflag IS NULL
				OR b.deleteflag = 0
				)
		
		UNION ALL
		
		SELECT 'Clinical Encounter' AS FormName
			,a.ptn_pk
			,CONVERT(VARCHAR(50), DECRYPTBYKEY(a.FirstName)) + ' ' + CONVERT(VARCHAR(50), DECRYPTBYKEY(a.MiddleName)) + ' ' + CONVERT(VARCHAR(50), DECRYPTBYKEY(a.LastName)) AS NAME
			,ISNULL(b.VisitDate, '1900-01-01') AS TranDate
			,b.DataQuality AS DataQuality
			,b.Visit_Id AS OrderNo
			,b.LocationID AS LocationID
			,'0' AS PharmacyNo
			,'2' AS Priority
			,'0' AS Module
			,'0' AS ID
			,'0' AS ART
			,'0' AS CAUTION
			
		FROM mst_patient AS a
			,ord_visit AS b
		WHERE a.ptn_pk = b.ptn_pk
			AND b.visittype in (select top 1 visittypeid from mst_visittype where visitname ='Clinical Encounter' AND (
				b.deleteflag IS NULL
				OR b.deleteflag = 0
				))
			AND a.Ptn_Pk = @PatientId
			AND (
				b.deleteflag IS NULL
				OR b.deleteflag = 0
				)
		
		UNION  ALL
		
		Select Distinct	c.VisitName As FormName,
				a.Ptn_Pk,
				convert(varchar(50), decryptbykey(a.FirstName)) + ' ' + convert(varchar(50), decryptbykey(a.MiddleName)) + ' ' + convert(varchar(50), decryptbykey(a.LastName))
				As Name,
				isnull(b.VisitDate, '1900-01-01') As TranDate,
				b.DataQuality,
				b.Visit_Id As OrderNo,
				b.LocationID,
				'0' As PharmacyNo,
				c.VisitTypeID As Priority,
				d.ModuleId As Module,
				'0' As ID,
				'0' As ART,
				'0' As CAUTION
From mst_Patient As a
Inner Join ord_Visit As b On a.Ptn_Pk = b.Ptn_Pk
Inner Join mst_VisitType As c On b.VisitType = c.VisitTypeID
Inner Join mst_Feature As d
Left Outer Join mst_module As e On d.ModuleId = e.ModuleID On c.SystemId = d.SystemId
	And c.VisitName = d.FeatureName
Where (e.DeleteFlag = 0)
And (a.Ptn_Pk = @PatientId)
And (b.DeleteFlag Is Null Or b.DeleteFlag = 0)
And (b.VisitType Not In (0, 1, 2, 3, 4, 5, 6, 7, 8, 11, 12))
And (d.ModuleId Not In (0))
And (d.Published = 2)
And (d.DeleteFlag Is Null Or d.DeleteFlag = 0)
                                     
    ) forms
	ORDER BY TranDate DESC
		,FormName DESC;--02

                                          
                     

--02                                                                                
select Visit_Id, LocationID from ord_visit where ptn_pk = @patientid and visittype=0                          
                                                                          
--03                                                                                 
--Select FeatureID, FeatureName from mst_feature where Published IN(2) and ModuleId not IN(2)                          
Select FeatureID, FeatureName from mst_feature a left outer join mst_module b on a.ModuleID=b.ModuleId  where Published IN(2) and  b.deleteflag=0 and a.deleteflag=0                                    
                                   
                                                                                                                        
                                                                           
End


GO


