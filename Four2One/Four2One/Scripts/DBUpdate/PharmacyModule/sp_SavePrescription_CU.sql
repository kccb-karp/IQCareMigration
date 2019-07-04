 create PROC sp_SavePrescription_CU  
(  
@PatientMasterVisitId int = 0,  
@PatientId int,  
@UserId int,  
@PrescriptionDate varchar(100),
@TreatmentProgramId int
  
)  
  
AS  
  
BEGIN  
DECLARE @PatientDrugPrescriptionId INT;  
  
IF EXISTS(SELECT 1 FROM PatientDrugPrescription   
   WHERE PatientMasterVisitId = @PatientMasterVisitId)  
BEGIN  
 SELECT @PatientDrugPrescriptionId = Id FROM PatientDrugPrescription  
 WHERE PatientMasterVisitId = @PatientMasterVisitId;  
END  
ELSE  
BEGIN  
 INSERT INTO PatientDrugPrescription   
 (PatientId  
 , PatientMasterVisitId  
 , PrescriptionDate  
 , TreatmentProgramId
 , CreatedBy  
 , CreateDate  
 , DeleteFlag)  
 VALUES  
 (@PatientId, @PatientMasterVisitId
 --, CAST(@PrescriptionDate as datetime)  
 , GETDATE()
 , @TreatmentProgramId
 , @UserId  
 , GETDATE()  
 , 0)  
  
 SET @PatientDrugPrescriptionId = SCOPE_IDENTITY();   
   
END  

IF NOT EXISTS(Select 1 FROM PatientEncounter WHERE PatientMasterVisitId = @PatientMasterVisitId
AND EncounterTypeId = (SELECT TOP 1 LookupItemId from LookupMasterItem 
WHERE DisplayName = 'pocprescription-encounter' AND LookupMasterId = 108))

INSERT INTO PatientEncounter (PatientId, EncounterTypeId, PatientMasterVisitId
, EncounterStartTime, EncounterEndTime, ServiceAreaId, DeleteFlag, CreatedBy, CreateDate, Status)
VALUES
(@PatientId
, (SELECT TOP 1 LookupItemId from LookupMasterItem 
WHERE DisplayName = 'pocprescription-encounter' AND LookupMasterId = 108)
, @PatientMasterVisitId
, CAST(@PrescriptionDate AS datetime)
, CAST(@PrescriptionDate AS datetime)
, 204
, 0
, @UserId
, GETDATE()
,0
)
SELECT @PatientDrugPrescriptionId;  
END