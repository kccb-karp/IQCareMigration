

/****** Object:  StoredProcedure [dbo].[pr_Clinical_GetInitialFollowupVisitInfo]    Script Date: 8/28/2018 7:20:52 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[pr_Clinical_GetInitialFollowupVisitInfo]
       @patientID INT, @visitID INT, @locationID INT
AS
BEGIN
--0 Visit Date &  & CreateDate & DataQuality                
SELECT VisitDate AS 'visitDate', CreateDate AS 'createDate', DataQuality AS 'dataQuality', typeofvisit
FROM ord_visit
WHERE Visit_Id = @visitID
      AND Ptn_Pk = @patientID
      AND LocationID = @locationID;
SELECT Scheduled, SupporterName AS 'treatmentSupporterName', TreatmentSupporterContact AS 'treatmentSupporterContact', TBRegistration AS 'TBRegNumber', NutritionalProblem AS 'nutritionalProblem', AttendingClinician AS 'attendingClinician', NutritionalProblem AS 'nutritionalProblem'
FROM dtl_PatientARTEncounter
WHERE Ptn_pk = @patientID
      AND Visit_Id = @visitID
      AND LocationID = @locationID;
--2 Follow Up Date                
SELECT TOP 1 AppDate AS 'Dateofnextappointment'
FROM dtl_PatientAppointment
WHERE Visit_pk = @visitID
      AND Ptn_Pk = @patientID
      AND LocationID = @locationID
ORDER BY AppDate DESC;   --and AppReason=110 and AppStatus =12               
--3 Height Weight Oedema                
SELECT Height AS 'height', Weight AS 'weight', Temp, BPDiastolic, BPSystolic, HR, RR, Headcircumference,WeightForAge,WeightForHeight,BMIz,Muac
FROM dtl_PatientVitals
WHERE Visit_pk = @visitID
      AND Ptn_Pk = @patientID
      AND LocationID = @locationID;
--4 Pregnancy & EDD & DateOfDelivery & PMTCT & MUAC                 
SELECT Pregnant AS 'pregnant', EDD AS 'EDD', DateofDelivery AS 'deliveryDate', PMTCT AS 'ReferredtoPMTCT', DateofMiscarriage, DateofInducedAbortion
FROM dtl_PatientClinicalStatus
WHERE Visit_pk = @visitID
      AND Ptn_Pk = @patientID
      AND LocationID = @locationID;
--5 Gestation                
SELECT GestAge AS 'gestation'
FROM dtl_PatientDelivery
WHERE Visit_pk = @visitID
      AND Ptn_Pk = @patientID
      AND LocationID = @locationID;
--6 PMTCTANCNumber                
SELECT ANCNumber AS 'PMTCTANCNumber', DOB
FROM mst_patient
WHERE Ptn_pk = @patientID;
--7 FamilyPlanning & Number of Days Hospitalized & Nutritional Support                
SELECT FamilyPlanningStatus AS 'familyPlanningStatus', HospitalizedNumberofDays AS 'numOfDaysHospitalized', NutritionalSupport AS 'nutritionalSupport', NoFamilyPlanning
FROM dtl_patientCounseling
WHERE Ptn_pk = @patientID
      AND Visit_pk = @visitID
      AND LocationID = @locationID;
--8 TB Status                    
SELECT TBStatus AS 'TBStatus', TBRxStartDate AS 'TBRxStart', TBRxEndDate AS 'TBRxStop'
FROM dtl_PatientOtherTreatment
WHERE Ptn_pk = @patientID
      AND Visit_pk = @visitID
      AND LocationID = @locationID;
--9 TB Reg Number & New OIs Problem & Nutritional Problem                
SELECT Disease_Pk AS 'newOIsProblemID', DiseaseDesc AS 'newOIsProblemOther'
FROM dtl_PatientDisease
WHERE Ptn_pk = @patientID
      AND Visit_pk = @visitID
      AND LocationID = @locationID;
--10 Potential Side Effects                
SELECT SymptomID AS 'potentialSideEffectID', SymptomDescription AS 'potentialSideEffectOther'
FROM dtl_PatientSymptoms
WHERE Ptn_pk = @patientID
      AND Visit_pk = @visitID
      AND LocationID = @locationID;
--11 WAB Stage & WHO Stage                
SELECT WABStage AS 'WABStage', WHOStage AS 'WHOStage'
FROM dtl_PatientStage
WHERE Ptn_pk = @patientID
      AND Visit_pk = @visitID
      AND LocationID = @locationID;
--12 CPTAdhere                
SELECT CotrimoxazoleAdhere AS 'CPTAdhere'
FROM dtl_Adherence_Reason
WHERE Ptn_pk = @patientID
      AND Visit_pk = @visitID
      AND LocationID = @locationID;
--13 ARV Drugs Adhere + Reason                
SELECT ARVAdhere AS 'ARVDrugsAdhere', AdherenceReason AS 'reasonARVDrugsPoorFair', AdherenceReasonOther AS 'reasonARVDrugsPoorFairOther'
FROM dtl_PatientAdherence
WHERE Ptn_pk = @patientID
      AND Visit_pk = @visitID
      AND LocationID = @locationID;
--14 ReferredTo + Other                  
SELECT PatientRefID AS 'referredTo', PatientRefDesc AS 'referredToOther'
FROM dtl_PatientReferredTo
WHERE Ptn_pk = @patientID
      AND Visit_pk = @visitID
      AND LocationID = @locationID;
--15 Infant Feeding Option                
SELECT FeedingOption AS 'infantFeedingOption'
FROM dtl_InfantInfo
WHERE Ptn_pk = @patientID
      AND Visit_pk = @visitID
      AND LocationID = @locationID;
--16             
SELECT *
FROM dtl_PatientARVTherapy
WHERE Ptn_pk = @patientID
      AND Visit_pk = @visitID
      AND LocationID = @locationID;
--17 Family Planning Method          
SELECT FamilyPlanningMethod AS 'familyPlanningMethodID'
FROM Dtl_PatientFamilyPlanning
WHERE Ptn_pk = @patientID
      AND Visit_Id = @visitID
      AND LocationID = @locationID;
--18 --  at risk population        
SELECT *
FROM dbo.dtl_PatientAtRiskPopulation
WHERE Ptn_pk = @patientID
      AND Visit_pk = @visitID
      AND LocationID = @locationID;
--19  at risk population services    
SELECT *
FROM dbo.dtl_PatientAtRiskPopulationServices
WHERE Ptn_pk = @patientID
      AND Visit_pk = @visitID
      AND LocationID = @locationID;
--20  pwp    
SELECT *
FROM dbo.dtl_PatientPreventionwithpositives
WHERE Ptn_pk = @patientID
      AND Visit_pk = @visitID
      AND LocationID = @locationID;
END;
GO


