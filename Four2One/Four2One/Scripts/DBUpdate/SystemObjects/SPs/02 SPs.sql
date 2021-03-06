/****** Object:  StoredProcedure [dbo].[WaitingList_SystemCleanup]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WaitingList_SystemCleanup]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[WaitingList_SystemCleanup]
GO
/****** Object:  StoredProcedure [dbo].[WaitingList_QueuePatient]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WaitingList_QueuePatient]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[WaitingList_QueuePatient]
GO
/****** Object:  StoredProcedure [dbo].[sp_SaveUpdatePharmacyPrescription_GreenCard]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_SaveUpdatePharmacyPrescription_GreenCard]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_SaveUpdatePharmacyPrescription_GreenCard]
GO
/****** Object:  StoredProcedure [dbo].[sp_SaveUpdatePharmacy_GreenCard]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_SaveUpdatePharmacy_GreenCard]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_SaveUpdatePharmacy_GreenCard]
GO
/****** Object:  StoredProcedure [dbo].[sp_savePatientFamilyPlanningMethod]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_savePatientFamilyPlanningMethod]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_savePatientFamilyPlanningMethod]
GO
/****** Object:  StoredProcedure [dbo].[sp_savePatientEncounterVaccines]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_savePatientEncounterVaccines]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_savePatientEncounterVaccines]
GO
/****** Object:  StoredProcedure [dbo].[sp_savePatientEncounterTS]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_savePatientEncounterTS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_savePatientEncounterTS]
GO
/****** Object:  StoredProcedure [dbo].[sp_savePatientEncounterPresentingComplaints]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_savePatientEncounterPresentingComplaints]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_savePatientEncounterPresentingComplaints]
GO
/****** Object:  StoredProcedure [dbo].[sp_savePatientEncounterPhysicalExam]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_savePatientEncounterPhysicalExam]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_savePatientEncounterPhysicalExam]
GO
/****** Object:  StoredProcedure [dbo].[sp_savePatientEncounterPHDP]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_savePatientEncounterPHDP]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_savePatientEncounterPHDP]
GO
/****** Object:  StoredProcedure [dbo].[sp_savePatientEncounterPatientManagement]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_savePatientEncounterPatientManagement]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_savePatientEncounterPatientManagement]
GO
/****** Object:  StoredProcedure [dbo].[sp_savePatientEncounterGeneralExam]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_savePatientEncounterGeneralExam]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_savePatientEncounterGeneralExam]
GO
/****** Object:  StoredProcedure [dbo].[sp_savePatientEncounterDiagnosis]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_savePatientEncounterDiagnosis]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_savePatientEncounterDiagnosis]
GO
/****** Object:  StoredProcedure [dbo].[sp_savePatientEncounterComplaints]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_savePatientEncounterComplaints]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_savePatientEncounterComplaints]
GO
/****** Object:  StoredProcedure [dbo].[sp_savePatientEncounterChronicIllness]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_savePatientEncounterChronicIllness]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_savePatientEncounterChronicIllness]
GO
/****** Object:  StoredProcedure [dbo].[sp_savePatientEncounterAllergies]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_savePatientEncounterAllergies]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_savePatientEncounterAllergies]
GO
/****** Object:  StoredProcedure [dbo].[sp_savePatientEncounterAdverseEvents]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_savePatientEncounterAdverseEvents]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_savePatientEncounterAdverseEvents]
GO
/****** Object:  StoredProcedure [dbo].[sp_PharmacyPendingOrders]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_PharmacyPendingOrders]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_PharmacyPendingOrders]
GO
/****** Object:  StoredProcedure [dbo].[sp_patientCategorizationAtEnrollment]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_patientCategorizationAtEnrollment]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_patientCategorizationAtEnrollment]
GO
/****** Object:  StoredProcedure [dbo].[SP_mst_PatientToGreencardRegistration]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_mst_PatientToGreencardRegistration]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_mst_PatientToGreencardRegistration]
GO
/****** Object:  StoredProcedure [dbo].[sp_IsVisitScheduled]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_IsVisitScheduled]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_IsVisitScheduled]
GO
/****** Object:  StoredProcedure [dbo].[sp_getZScores]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_getZScores]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_getZScores]
GO
/****** Object:  StoredProcedure [dbo].[sp_getTreatmentProgram]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_getTreatmentProgram]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_getTreatmentProgram]
GO
/****** Object:  StoredProcedure [dbo].[sp_getRegimenClassification]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_getRegimenClassification]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_getRegimenClassification]
GO
/****** Object:  StoredProcedure [dbo].[sp_getPMTCTPeriodDrugTaken]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_getPMTCTPeriodDrugTaken]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_getPMTCTPeriodDrugTaken]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetPluginModuleAndFeaturesForFacility]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetPluginModuleAndFeaturesForFacility]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetPluginModuleAndFeaturesForFacility]
GO
/****** Object:  StoredProcedure [dbo].[sp_getPharmacyRegimens]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_getPharmacyRegimens]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_getPharmacyRegimens]
GO
/****** Object:  StoredProcedure [dbo].[sp_getPharmacyPatientsExpected]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_getPharmacyPatientsExpected]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_getPharmacyPatientsExpected]
GO
/****** Object:  StoredProcedure [dbo].[sp_getPharmacyFields]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_getPharmacyFields]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_getPharmacyFields]
GO
/****** Object:  StoredProcedure [dbo].[sp_getPharmacyDrugSwitchSubReasons]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_getPharmacyDrugSwitchSubReasons]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_getPharmacyDrugSwitchSubReasons]
GO
/****** Object:  StoredProcedure [dbo].[sp_getPharmacyDrugList]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_getPharmacyDrugList]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_getPharmacyDrugList]
GO
/****** Object:  StoredProcedure [dbo].[sp_getPharmacyDrugFrequency]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_getPharmacyDrugFrequency]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_getPharmacyDrugFrequency]
GO
/****** Object:  StoredProcedure [dbo].[sp_getPharmacyBatch]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_getPharmacyBatch]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_getPharmacyBatch]
GO
/****** Object:  StoredProcedure [dbo].[sp_getPendingPrescriptions]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_getPendingPrescriptions]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_getPendingPrescriptions]
GO
/****** Object:  StoredProcedure [dbo].[sp_getPatientWorkPlan]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_getPatientWorkPlan]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_getPatientWorkPlan]
GO
/****** Object:  StoredProcedure [dbo].[sp_getPatientPharmacyPrescription]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_getPatientPharmacyPrescription]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_getPatientPharmacyPrescription]
GO
/****** Object:  StoredProcedure [dbo].[sp_getPatientLatestPharmacyPrescription]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_getPatientLatestPharmacyPrescription]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_getPatientLatestPharmacyPrescription]
GO
/****** Object:  StoredProcedure [dbo].[sp_getPatientEncounterVaccines]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_getPatientEncounterVaccines]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_getPatientEncounterVaccines]
GO
/****** Object:  StoredProcedure [dbo].[sp_getPatientEncounterHistory]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_getPatientEncounterHistory]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_getPatientEncounterHistory]
GO
/****** Object:  StoredProcedure [dbo].[sp_getPatientEncounterExam]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_getPatientEncounterExam]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_getPatientEncounterExam]
GO
/****** Object:  StoredProcedure [dbo].[sp_getPatientEncounterDiagnosis]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_getPatientEncounterDiagnosis]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_getPatientEncounterDiagnosis]
GO
/****** Object:  StoredProcedure [dbo].[sp_getPatientEncounterComplaints]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_getPatientEncounterComplaints]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_getPatientEncounterComplaints]
GO
/****** Object:  StoredProcedure [dbo].[sp_getPatientEncounterChronicIllness]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_getPatientEncounterChronicIllness]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_getPatientEncounterChronicIllness]
GO
/****** Object:  StoredProcedure [dbo].[sp_getPatientEncounterAllergies]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_getPatientEncounterAllergies]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_getPatientEncounterAllergies]
GO
/****** Object:  StoredProcedure [dbo].[sp_getPatientEncounterAdverseEvents]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_getPatientEncounterAdverseEvents]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_getPatientEncounterAdverseEvents]
GO
/****** Object:  StoredProcedure [dbo].[sp_getPatientEncounter]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_getPatientEncounter]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_getPatientEncounter]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetMSTDecode]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetMSTDecode]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetMSTDecode]
GO
/****** Object:  StoredProcedure [dbo].[sp_getItemIdByGroupAndItemName]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_getItemIdByGroupAndItemName]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_getItemIdByGroupAndItemName]
GO
/****** Object:  StoredProcedure [dbo].[sp_getFacility]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_getFacility]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_getFacility]
GO
/****** Object:  StoredProcedure [dbo].[sp_getCurrentRegimen]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_getCurrentRegimen]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_getCurrentRegimen]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllWards]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllWards]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetAllWards]
GO
/****** Object:  StoredProcedure [dbo].[sp_getAllViralLoads]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_getAllViralLoads]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_getAllViralLoads]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllVillages]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllVillages]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetAllVillages]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllReasons]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllReasons]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetAllReasons]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllProvince_Country]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllProvince_Country]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetAllProvince_Country]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllProvince]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllProvince]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetAllProvince]
GO
/****** Object:  StoredProcedure [dbo].[sp_getAllPatientVitals]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_getAllPatientVitals]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_getAllPatientVitals]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllMSTSymptoms]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllMSTSymptoms]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetAllMSTSymptoms]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllMSTDecode]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllMSTDecode]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetAllMSTDecode]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllMSTCode]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllMSTCode]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetAllMSTCode]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllLPTF]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllLPTF]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetAllLPTF]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllHIVDiseases]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllHIVDiseases]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetAllHIVDiseases]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllHivDisclosure]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllHivDisclosure]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetAllHivDisclosure]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllEmployees]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllEmployees]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetAllEmployees]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllEducation]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllEducation]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetAllEducation]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllDivisions]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllDivisions]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetAllDivisions]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllDivision]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllDivision]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetAllDivision]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllDistrict]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllDistrict]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetAllDistrict]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllDesignation]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllDesignation]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetAllDesignation]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllCountries]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllCountries]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetAllCountries]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllCouncellingType]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllCouncellingType]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetAllCouncellingType]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllCouncellingTopic]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllCouncellingTopic]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetAllCouncellingTopic]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllARTSponsor]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllARTSponsor]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetAllARTSponsor]
GO
/****** Object:  StoredProcedure [dbo].[sp_DifferentiatedCarePatientsPerCategory]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_DifferentiatedCarePatientsPerCategory]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_DifferentiatedCarePatientsPerCategory]
GO
/****** Object:  StoredProcedure [dbo].[sp_DifferentiatedCareParameters]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_DifferentiatedCareParameters]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_DifferentiatedCareParameters]
GO
/****** Object:  StoredProcedure [dbo].[sp_DeletePharmacyPrescription_GreenCard]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_DeletePharmacyPrescription_GreenCard]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_DeletePharmacyPrescription_GreenCard]
GO
/****** Object:  StoredProcedure [dbo].[sp_deletePatientPharmacyOrder]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_deletePatientPharmacyOrder]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_deletePatientPharmacyOrder]
GO
/****** Object:  StoredProcedure [dbo].[sp_deletePatientFamilyPlanningMethod]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_deletePatientFamilyPlanningMethod]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_deletePatientFamilyPlanningMethod]
GO
/****** Object:  StoredProcedure [dbo].[sp_deletePatientEncounterVaccines]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_deletePatientEncounterVaccines]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_deletePatientEncounterVaccines]
GO
/****** Object:  StoredProcedure [dbo].[sp_deletePatientEncounterPresentingComplaints]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_deletePatientEncounterPresentingComplaints]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_deletePatientEncounterPresentingComplaints]
GO
/****** Object:  StoredProcedure [dbo].[sp_deletePatientEncounterPhysicalExam]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_deletePatientEncounterPhysicalExam]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_deletePatientEncounterPhysicalExam]
GO
/****** Object:  StoredProcedure [dbo].[sp_deletePatientEncounterPHDP]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_deletePatientEncounterPHDP]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_deletePatientEncounterPHDP]
GO
/****** Object:  StoredProcedure [dbo].[sp_deletePatientEncounterGeneralExam]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_deletePatientEncounterGeneralExam]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_deletePatientEncounterGeneralExam]
GO
/****** Object:  StoredProcedure [dbo].[sp_deletePatientEncounterDiagnosis]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_deletePatientEncounterDiagnosis]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_deletePatientEncounterDiagnosis]
GO
/****** Object:  StoredProcedure [dbo].[sp_deletePatientEncounterComplaints]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_deletePatientEncounterComplaints]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_deletePatientEncounterComplaints]
GO
/****** Object:  StoredProcedure [dbo].[sp_deletePatientEncounterChronicIllness]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_deletePatientEncounterChronicIllness]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_deletePatientEncounterChronicIllness]
GO
/****** Object:  StoredProcedure [dbo].[sp_deletePatientEncounterAllergies]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_deletePatientEncounterAllergies]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_deletePatientEncounterAllergies]
GO
/****** Object:  StoredProcedure [dbo].[sp_deletePatientEncounterAdverseEvents]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_deletePatientEncounterAdverseEvents]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_deletePatientEncounterAdverseEvents]
GO
/****** Object:  StoredProcedure [dbo].[SP_Bluecard_ToGreenCard]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_Bluecard_ToGreenCard]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_Bluecard_ToGreenCard]
GO
/****** Object:  StoredProcedure [dbo].[ServiceArea_GetPatientReports]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ServiceArea_GetPatientReports]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ServiceArea_GetPatientReports]
GO
/****** Object:  StoredProcedure [dbo].[ServiceArea_GetForms]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ServiceArea_GetForms]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ServiceArea_GetForms]
GO
/****** Object:  StoredProcedure [dbo].[ServiceArea_GetBusinessRule]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ServiceArea_GetBusinessRule]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ServiceArea_GetBusinessRule]
GO
/****** Object:  StoredProcedure [dbo].[SCM_StockSummaryLineList]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SCM_StockSummaryLineList]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SCM_StockSummaryLineList]
GO
/****** Object:  StoredProcedure [dbo].[SCM_SavePurchaseOrderItem_Combined]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SCM_SavePurchaseOrderItem_Combined]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SCM_SavePurchaseOrderItem_Combined]
GO
/****** Object:  StoredProcedure [dbo].[SCM_PurchasedReceivedItem_Save]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SCM_PurchasedReceivedItem_Save]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SCM_PurchasedReceivedItem_Save]
GO
/****** Object:  StoredProcedure [dbo].[SCM_ManageItemStore]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SCM_ManageItemStore]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SCM_ManageItemStore]
GO
/****** Object:  StoredProcedure [dbo].[SCM_GetPurchaseOrderItems]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SCM_GetPurchaseOrderItems]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SCM_GetPurchaseOrderItems]
GO
/****** Object:  StoredProcedure [dbo].[Schedule_UpdateTask]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Schedule_UpdateTask]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Schedule_UpdateTask]
GO
/****** Object:  StoredProcedure [dbo].[Schedule_GetTask]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Schedule_GetTask]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Schedule_GetTask]
GO
/****** Object:  StoredProcedure [dbo].[Registration_GetIdentifierByServiceArea]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Registration_GetIdentifierByServiceArea]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Registration_GetIdentifierByServiceArea]
GO
/****** Object:  StoredProcedure [dbo].[Psmart_ProcessNewClientRegistration]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Psmart_ProcessNewClientRegistration]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Psmart_ProcessNewClientRegistration]
GO
/****** Object:  StoredProcedure [dbo].[Psmart_ProcessMotherDetails]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Psmart_ProcessMotherDetails]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Psmart_ProcessMotherDetails]
GO
/****** Object:  StoredProcedure [dbo].[pr_Scheduler_UpdateAppointmentStatus]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pr_Scheduler_UpdateAppointmentStatus]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[pr_Scheduler_UpdateAppointmentStatus]
GO
/****** Object:  StoredProcedure [dbo].[pr_Reports_GetARVRegimenReport_Constella]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pr_Reports_GetARVRegimenReport_Constella]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[pr_Reports_GetARVRegimenReport_Constella]
GO
/****** Object:  StoredProcedure [dbo].[pr_Reports_GetARVRegimenforAdultandChild_Constella]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pr_Reports_GetARVRegimenforAdultandChild_Constella]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[pr_Reports_GetARVRegimenforAdultandChild_Constella]
GO
/****** Object:  StoredProcedure [dbo].[pr_Record_GetPatientRevisit]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pr_Record_GetPatientRevisit]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[pr_Record_GetPatientRevisit]
GO
/****** Object:  StoredProcedure [dbo].[pr_Record_CreatePatientRevisit]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pr_Record_CreatePatientRevisit]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[pr_Record_CreatePatientRevisit]
GO
/****** Object:  StoredProcedure [dbo].[pr_Pharmacy_FindDrugByName]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pr_Pharmacy_FindDrugByName]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[pr_Pharmacy_FindDrugByName]
GO
/****** Object:  StoredProcedure [dbo].[pr_Clinical_GetPatientItemsByUserID]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pr_Clinical_GetPatientItemsByUserID]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[pr_Clinical_GetPatientItemsByUserID]
GO
/****** Object:  StoredProcedure [dbo].[pr_Clinical_FindItemByName]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pr_Clinical_FindItemByName]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[pr_Clinical_FindItemByName]
GO
/****** Object:  StoredProcedure [dbo].[pr_Admin_SaveTBRegimenGeneric_Constella]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pr_Admin_SaveTBRegimenGeneric_Constella]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[pr_Admin_SaveTBRegimenGeneric_Constella]
GO
/****** Object:  StoredProcedure [dbo].[pr_Admin_SaveRegimenGeneric_Constella]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pr_Admin_SaveRegimenGeneric_Constella]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[pr_Admin_SaveRegimenGeneric_Constella]
GO
/****** Object:  StoredProcedure [dbo].[pr_Admin_GetRegimenGeneric_Constella]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pr_Admin_GetRegimenGeneric_Constella]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[pr_Admin_GetRegimenGeneric_Constella]
GO
/****** Object:  StoredProcedure [dbo].[Pharmacy_SearchAllRegisteredPatients]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pharmacy_SearchAllRegisteredPatients]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Pharmacy_SearchAllRegisteredPatients]
GO
/****** Object:  StoredProcedure [dbo].[Pharmacy_SaveUpdateRegistration]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pharmacy_SaveUpdateRegistration]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Pharmacy_SaveUpdateRegistration]
GO
/****** Object:  StoredProcedure [dbo].[Pharmacy_ModifyPrescription]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pharmacy_ModifyPrescription]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Pharmacy_ModifyPrescription]
GO
/****** Object:  StoredProcedure [dbo].[Pharmacy_GetPrescription]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pharmacy_GetPrescription]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Pharmacy_GetPrescription]
GO
/****** Object:  StoredProcedure [dbo].[Pharmacy_GetExpectedPatients]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pharmacy_GetExpectedPatients]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Pharmacy_GetExpectedPatients]
GO
/****** Object:  StoredProcedure [dbo].[Pharmacy_GetAllRegisteredPatients]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pharmacy_GetAllRegisteredPatients]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Pharmacy_GetAllRegisteredPatients]
GO
/****** Object:  StoredProcedure [dbo].[PersonContact_Update]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PersonContact_Update]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[PersonContact_Update]
GO
/****** Object:  StoredProcedure [dbo].[PersonContact_Insert]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PersonContact_Insert]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[PersonContact_Insert]
GO
/****** Object:  StoredProcedure [dbo].[Person_Update]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Person_Update]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Person_Update]
GO
/****** Object:  StoredProcedure [dbo].[Person_Insert]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Person_Insert]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Person_Insert]
GO
/****** Object:  StoredProcedure [dbo].[PatientType_Update]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PatientType_Update]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[PatientType_Update]
GO
/****** Object:  StoredProcedure [dbo].[PatientTreatmentSupporter_Update]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PatientTreatmentSupporter_Update]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[PatientTreatmentSupporter_Update]
GO
/****** Object:  StoredProcedure [dbo].[PatientTreatmentSupporter_To_Greencard]    Script Date: 6/6/2018 3:40:01 PM ******/

/****** Object:  StoredProcedure [dbo].[PatientTreatmentSupporter_Insert]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PatientTreatmentSupporter_Insert]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[PatientTreatmentSupporter_Insert]
GO
/****** Object:  StoredProcedure [dbo].[PatientsNotSynced]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PatientsNotSynced]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[PatientsNotSynced]
GO

/****** Object:  StoredProcedure [dbo].[Patient_Update]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Patient_Update]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Patient_Update]
GO
/****** Object:  StoredProcedure [dbo].[Patient_Insert]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Patient_Insert]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Patient_Insert]
GO
/****** Object:  StoredProcedure [dbo].[Ord_Visit_Insert]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Ord_Visit_Insert]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Ord_Visit_Insert]
GO
/****** Object:  StoredProcedure [dbo].[mstPatient_Insert]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[mstPatient_Insert]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[mstPatient_Insert]
GO
/****** Object:  StoredProcedure [dbo].[LookupMasterItem_Insert]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LookupMasterItem_Insert]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[LookupMasterItem_Insert]
GO
/****** Object:  StoredProcedure [dbo].[Laboratory_SaveTestResult]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Laboratory_SaveTestResult]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Laboratory_SaveTestResult]
GO
/****** Object:  StoredProcedure [dbo].[Laboratory_SaveTestParameter]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Laboratory_SaveTestParameter]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Laboratory_SaveTestParameter]
GO
/****** Object:  StoredProcedure [dbo].[Laboratory_SaveLabTest]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Laboratory_SaveLabTest]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Laboratory_SaveLabTest]
GO
/****** Object:  StoredProcedure [dbo].[Laboratory_SaveLabOrder]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Laboratory_SaveLabOrder]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Laboratory_SaveLabOrder]
GO
/****** Object:  StoredProcedure [dbo].[Laboratory_GroupRemoveTest]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Laboratory_GroupRemoveTest]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Laboratory_GroupRemoveTest]
GO
/****** Object:  StoredProcedure [dbo].[Laboratory_GroupGetLabTest]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Laboratory_GroupGetLabTest]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Laboratory_GroupGetLabTest]
GO
/****** Object:  StoredProcedure [dbo].[Laboratory_GroupAddTest]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Laboratory_GroupAddTest]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Laboratory_GroupAddTest]
GO
/****** Object:  StoredProcedure [dbo].[Laboratory_GetTestParameterResult]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Laboratory_GetTestParameterResult]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Laboratory_GetTestParameterResult]
GO
/****** Object:  StoredProcedure [dbo].[Laboratory_GetTestDepartment]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Laboratory_GetTestDepartment]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Laboratory_GetTestDepartment]
GO
/****** Object:  StoredProcedure [dbo].[Laboratory_GetResultUnit]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Laboratory_GetResultUnit]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Laboratory_GetResultUnit]
GO
/****** Object:  StoredProcedure [dbo].[Laboratory_GetParameterResultOption]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Laboratory_GetParameterResultOption]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Laboratory_GetParameterResultOption]
GO
/****** Object:  StoredProcedure [dbo].[Laboratory_GetParameterResultConfig]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Laboratory_GetParameterResultConfig]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Laboratory_GetParameterResultConfig]
GO
/****** Object:  StoredProcedure [dbo].[Laboratory_GetLabTestParameters]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Laboratory_GetLabTestParameters]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Laboratory_GetLabTestParameters]
GO
/****** Object:  StoredProcedure [dbo].[Laboratory_GetLabTestID]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Laboratory_GetLabTestID]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Laboratory_GetLabTestID]
GO
/****** Object:  StoredProcedure [dbo].[Laboratory_GetLabTest]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Laboratory_GetLabTest]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Laboratory_GetLabTest]
GO
/****** Object:  StoredProcedure [dbo].[Laboratory_GetLabOrderTests]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Laboratory_GetLabOrderTests]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Laboratory_GetLabOrderTests]
GO
/****** Object:  StoredProcedure [dbo].[Laboratory_GetLabOrder]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Laboratory_GetLabOrder]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Laboratory_GetLabOrder]
GO
/****** Object:  StoredProcedure [dbo].[Laboratory_FindTestByName]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Laboratory_FindTestByName]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Laboratory_FindTestByName]
GO
/****** Object:  StoredProcedure [dbo].[Laboratory_DeleteTestParameter]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Laboratory_DeleteTestParameter]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Laboratory_DeleteTestParameter]
GO
/****** Object:  StoredProcedure [dbo].[Laboratory_DeleteLabTest]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Laboratory_DeleteLabTest]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Laboratory_DeleteLabTest]
GO
/****** Object:  StoredProcedure [dbo].[Laboratory_DeleteLabOrder]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Laboratory_DeleteLabOrder]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Laboratory_DeleteLabOrder]
GO
/****** Object:  StoredProcedure [dbo].[Laboratory_ActivateLabTest]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Laboratory_ActivateLabTest]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Laboratory_ActivateLabTest]
GO
/****** Object:  StoredProcedure [dbo].[FormBuilder_SaveModuleBusinessRules]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FormBuilder_SaveModuleBusinessRules]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[FormBuilder_SaveModuleBusinessRules]
GO
/****** Object:  StoredProcedure [dbo].[FormBuilder_GetFieldLookupValues]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FormBuilder_GetFieldLookupValues]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[FormBuilder_GetFieldLookupValues]
GO
/****** Object:  StoredProcedure [dbo].[FormBuilder_GetFieldControlTypes]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FormBuilder_GetFieldControlTypes]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[FormBuilder_GetFieldControlTypes]
GO
/****** Object:  StoredProcedure [dbo].[FormBuilder_DeleteModuleBusinessRules]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FormBuilder_DeleteModuleBusinessRules]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[FormBuilder_DeleteModuleBusinessRules]
GO
/****** Object:  StoredProcedure [dbo].[Form_GetBusinessRule]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Form_GetBusinessRule]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Form_GetBusinessRule]
GO
/****** Object:  StoredProcedure [dbo].[FamilyTesting_To_Greencard]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FamilyTesting_To_Greencard]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[FamilyTesting_To_Greencard]
GO
/****** Object:  StoredProcedure [dbo].[ClinicalService_SaveResult]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ClinicalService_SaveResult]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ClinicalService_SaveResult]
GO
/****** Object:  StoredProcedure [dbo].[ClinicalService_SaveOrder]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ClinicalService_SaveOrder]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ClinicalService_SaveOrder]
GO
/****** Object:  StoredProcedure [dbo].[ClinicalService_Save]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ClinicalService_Save]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ClinicalService_Save]
GO
/****** Object:  StoredProcedure [dbo].[ClinicalService_GetServices]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ClinicalService_GetServices]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ClinicalService_GetServices]
GO
/****** Object:  StoredProcedure [dbo].[ClinicalService_GetOrderedServices]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ClinicalService_GetOrderedServices]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ClinicalService_GetOrderedServices]
GO
/****** Object:  StoredProcedure [dbo].[ClinicalService_GetOrder]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ClinicalService_GetOrder]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ClinicalService_GetOrder]
GO
/****** Object:  StoredProcedure [dbo].[ClinicalService_FindServiceByName]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ClinicalService_FindServiceByName]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ClinicalService_FindServiceByName]
GO
/****** Object:  StoredProcedure [dbo].[ClinicalService_DeleteOrder]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ClinicalService_DeleteOrder]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ClinicalService_DeleteOrder]
GO
/****** Object:  StoredProcedure [dbo].[ClinicalService_Delete]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ClinicalService_Delete]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ClinicalService_Delete]
GO
/****** Object:  StoredProcedure [dbo].[CCC_GetPatientCount]    Script Date: 6/6/2018 3:40:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CCC_GetPatientCount]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[CCC_GetPatientCount]
GO

/****** Object:  StoredProcedure [dbo].[CCC_GetPatientCount]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CCC_GetPatientCount]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[CCC_GetPatientCount] AS' 
END
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[CCC_GetPatientCount]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT        COUNT(distinct PT.Id) AS PatientCount
	FROM            dbo.Patient AS PT INNER JOIN
							 dbo.PatientEnrollment AS PE ON PT.Id = PE.PatientId INNER JOIN
							 dbo.PatientIdentifier AS PI ON PE.Id = PI.PatientEnrollmentId AND PT.Id = PI.PatientId INNER JOIN
							 dbo.Identifiers AS IDE ON PI.IdentifierTypeId = IDE.Id
	WHERE        (PT.DeleteFlag = 0) AND (IDE.Name = 'CCC Registration Number')
END

GO
/****** Object:  StoredProcedure [dbo].[ClinicalService_Delete]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ClinicalService_Delete]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[ClinicalService_Delete] AS' 
END
GO
-- =============================================
-- Author:		Joseph Njung'e
-- Create date: 20160223
-- Description:	Insert a new Service
-- =============================================
ALTER PROCEDURE [dbo].[ClinicalService_Delete]
	-- Add the parameters for the stored procedure here
	@ServiceId int,
	@UserId int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Update Mst_ClinicalService Set DeleteFlag = 1 Where Id = @ServiceId;
END

GO
/****** Object:  StoredProcedure [dbo].[ClinicalService_DeleteOrder]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ClinicalService_DeleteOrder]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[ClinicalService_DeleteOrder] AS' 
END
GO
-- =============================================
-- Author:		Joseph Njung'e
-- Create date: 20160223
-- Description:	Delete a Service order
-- =============================================
ALTER PROCEDURE [dbo].[ClinicalService_DeleteOrder]
	-- Add the parameters for the stored procedure here
	@OrderId int,
	@UserId int

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;

-- Insert statements for procedure here
	Update ord_ClinicalServiceOrder Set
		DeleteFlag = 1,
		UpdateDate = getdate(),
		UserId = @UserId
	Where Id = @OrderId;

	Update dtl_ClinicalServiceOrder Set DeleteFlag= 1 Where OrderId = @OrderId;
End
GO
/****** Object:  StoredProcedure [dbo].[ClinicalService_FindServiceByName]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ClinicalService_FindServiceByName]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[ClinicalService_FindServiceByName] AS' 
END
GO


 
ALTER PROCEDURE [dbo].[ClinicalService_FindServiceByName] 
      -- Add the parameters for the stored procedure here
      @SearchText varchar(15),
	  @ModuleId int = -1
AS
BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;
      If ltrim(rtrim(@SearchText)) <> ''
      Begin
            Select @SearchText = '%'+@SearchText+'%';
            Select @ModuleId = Case @ModuleId When -1 Then Null Else @ModuleId end;
            Select @SearchText = Case When nullif(@SearchText,'') Is Null Then Null Else '%'+@SearchText+'%' End
		-- Insert statements for procedure here
			Select	Id,			
				Name,
				Description,
				ModuleId,
				Module = (Select D.ModuleName From mst_module D Where D.ModuleID = M.ModuleId),			
				DeleteFlag
			From Mst_ClinicalService As M
			Where (DeleteFlag = 0)
			And Name Like @SearchText 
			And (ModuleId = @ModuleId Or @ModuleId Is Null);
       
                  
      End
      
    -- Insert statements for procedure here
      
 END


GO
/****** Object:  StoredProcedure [dbo].[ClinicalService_GetOrder]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ClinicalService_GetOrder]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[ClinicalService_GetOrder] AS' 
END
GO
ALTER PROCEDURE [dbo].[ClinicalService_GetOrder] 
	-- Add the parameters for the stored procedure here
	@PatientId int = null,	 
	@OrderId int = Null	
AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;
	
-- Insert statements for procedure here	
		Select	Id,			
			M.Ptn_Pk PatientId,
			LocationId,
			VisitId,
			ModuleId,
			Module = (Select D.ModuleName From mst_module D Where D.ModuleID = M.ModuleId),	
			M.TargetModuleId,
			TargetModule = (Select D.ModuleName From Mst_Module D where D.ModuleID = M.TargetModuleId),
			M.OrderNumber,
			M.OrderDate,
			M.OrderedBy,
			M.OrderStatus,		
			DeleteFlag,
			M.StatusDate,
			M.ClinicalNotes,
			M.CreatedBy,
			M.CreateDate,
			M.UserId,
			M.UpdateDate
		From ord_ClinicalServiceOrder As M
		Where (Id = @OrderId Or @OrderId  Is Null) And (M.Ptn_Pk = @PatientId Or @PatientId Is Null);

		
		
End
	

GO
/****** Object:  StoredProcedure [dbo].[ClinicalService_GetOrderedServices]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ClinicalService_GetOrderedServices]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[ClinicalService_GetOrderedServices] AS' 
END
GO
-- =============================================
-- Author:		Joseph Njung'e
-- Create date: 20160223
-- Description:	Get services ordered
-- =============================================
ALTER PROCEDURE [dbo].[ClinicalService_GetOrderedServices] 
	-- Add the parameters for the stored procedure here
	@OrderId int 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    	Select 
			D.Id,
			D.OrderId,
			D.ClinicalServiceId,
			D.ResultNotes,
			D.RequestNotes,
			D.Quantity,
			D.ResultDate,
			D.ResultBy, 
			D.DeleteFlag,
			S.Name ServiceName,
			S.[Description] ServiceDescription,
			S.DeleteFlag ServiceDeleteFlag,
			S.ModuleId ServiceModuleId,
			ServiceModuleName= (Select M.ModuleName From mst_module M Where M.ModuleID = S.ModuleId)
		From dtl_ClinicalServiceOrder D 
		Inner Join Mst_ClinicalService S	On D.ClinicalServiceId = S.Id
		Inner Join ord_ClinicalServiceOrder O On O.Id = D.OrderId
		Where (O.Id = @OrderId);
END

GO
/****** Object:  StoredProcedure [dbo].[ClinicalService_GetServices]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ClinicalService_GetServices]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[ClinicalService_GetServices] AS' 
END
GO
ALTER PROCEDURE [dbo].[ClinicalService_GetServices] 
	-- Add the parameters for the stored procedure here
	@ServiceId int = null
AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;
	
-- Insert statements for procedure here
	Select	Id,			
			Name,
			Description,
			ModuleId,
			Module = (Select D.ModuleName From mst_module D Where D.ModuleID = M.ModuleId),			
			DeleteFlag
	From Mst_ClinicalService As M
	Where (DeleteFlag = 0)
	And (Id = isnull(@ServiceId, Id))
End
GO
/****** Object:  StoredProcedure [dbo].[ClinicalService_Save]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ClinicalService_Save]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[ClinicalService_Save] AS' 
END
GO
-- =============================================
-- Author:		Joseph Njung'e
-- Create date: 20160223
-- Description:	Insert a new Service
-- =============================================
ALTER PROCEDURE [dbo].[ClinicalService_Save] 
	-- Add the parameters for the stored procedure here
	@Name varchar(50) , 
	@Description varchar(250) ,
	@ModuleId int,
	@UserId int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Insert Into dbo.Mst_ClinicalService (
		ModuleId,
		Name,
		Description,
		DeleteFlag)
	Values (
		@ModuleId,
		@Name,
		@Description,
		0 );
END

GO
/****** Object:  StoredProcedure [dbo].[ClinicalService_SaveOrder]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ClinicalService_SaveOrder]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[ClinicalService_SaveOrder] AS' 
END
GO
ALTER PROCEDURE [dbo].[ClinicalService_SaveOrder] 
	-- Add the parameters for the stored procedure here
	@PatientId int,
	@LocationId int,
	@ModuleId int,
	@TargetModuleId int,
	@VisitId int = null, 
	@OrderId int = Null,
	@OrderDate datetime,
	@OrderedBy int,
	@ClinicalNotes varchar(400),
	@OrderStatus varchar(50) = 'Pending',
	@UserId int,
	@ServiceList xml= null
AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;
	
-- Insert statements for procedure here
	Declare @VisitTypeId int;
	Select @VisitTypeId = VisitTypeID From mst_VisitType Where VisitName = 'Service Order Form'
	Declare @OrderedServices Table(ServiceId int,TestNotes varchar(400),Quantity int,ResultNotes varchar(400), ResultBy int, ResultDate datetime);
	Declare @OrderNumber varchar(50);
	;With SR As
		(
			Select
				L.G.query('serviceid').value('.', 'int') ServiceId,
				nullif(L.G.query('testnotes').value('.', 'varchar(400)'), '') TestNotes,
				Isnull(L.G.query('quantity').value('.', 'int'),1) Quantity,
				nullif(L.G.query('resultnotes').value('.', 'varchar(400)'), '') ResultNotes,
				nullif(L.G.query('resultdate').value('.', 'datetime'), '') ResultDate,
				nullif(L.G.query('resultby').value('.', 'int'), '') ResultBy
			From @ServiceList.nodes('/root/result') As L (G)
		)
		Insert Into @OrderedServices(ServiceId, TestNotes, Quantity, ResultNotes,ResultBy,ResultDate)
		Select
			ServiceId,
			TestNotes,
			Quantity,
			ResultNotes,
			ResultBy,
			ResultDate
		From SR;
	Begin Transaction ServiceOrder
	Begin Try
		Insert Into ord_Visit (
			Ptn_pk,
			LocationID,
			VisitDate,
			VisitType,
			DataQuality,
			UserID,
			Createdate,
			OrderedDate,
			ModuleID,
			Signature)
		Values (
			@PatientId,
			@LocationId,
			@OrderDate,
			@VisitTypeId,
			0,
			@UserID,
			getdate(),
			@OrderDate,
			@ModuleId,
			@OrderedBy );

		Select @VisitId = scope_identity();

		Select @OrderNumber = max(convert(varchar, replace(OrderNumber, '-', '')))
		From ord_ClinicalServiceOrder
		Where OrderNumber Like convert(varchar, datepart(Year, getdate())) + '-%'

		If (@OrderNumber Is Null) Select @OrderNumber = convert(varchar(4),datepart(year, getdate())) + replicate('0', 5) + convert(varchar, 1); 
		Else Select @OrderNumber = convert(int, @OrderNumber) + 1;

		Select @OrderNumber = stuff(@OrderNumber, 5, 0, '-');

		Insert Into ord_ClinicalServiceOrder(
			Ptn_pk,
			LocationId,
			VisitId,
			ModuleId,
			TargetModuleId,
			OrderDate,
			OrderedBy,
			OrderNumber,
			OrderStatus,
			StatusDate,
			ClinicalNotes,
			CreatedBy,
			CreateDate,
			UserId,			
			DeleteFlag
		)
		Values(
			@PatientId,
			@LocationId,
			@VisitId,
			@ModuleId,
			@TargetModuleId,
			@OrderDate,
			@OrderedBy,
			@OrderNumber,
			@OrderStatus,
			getdate(),
			@ClinicalNotes,
			@UserId,
			getdate(),
			@UserId,
			0
		);
		Select @OrderId = scope_identity();

		Insert Into dtl_ClinicalServiceOrder(
			OrderId,
			ClinicalServiceId,
			RequestNotes,
			Quantity,
			ResultNotes,
			ResultDate,
			ResultBy,
			DeleteFlag
		)
		Select 
			@OrderId, 
			ServiceId, 
			TestNotes, 
			Quantity,
			ResultNotes,
			ResultDate,
			ResultBy,
			0
		From @OrderedServices ;
		declare @rCount int, @sCount int;

		Select 
			@rCount = Count(*) ,
			@sCount = Sum(Case When ResultBy Is Null Then 0 Else 1 End)
		From dtl_ClinicalServiceOrder
		Where OrderId =@OrderId;

		Update ord_ClinicalServiceOrder  Set
			OrderStatus = Case When @sCount = 0 Then 'Pending' 
							   When @sCount < @rCount Then 'Partially Complete'
							   Else 'Complete'  End
		Where Id = @OrderId;	
		
		If(@rCount = @sCount) Begin
			Update ord_visit set DataQuality = 1 Where Visit_Id = @VisitId;
		End	

		Select @OrderId OrderId, @OrderNumber OrderNumber, @PatientId PatientId, @VisitId VisitId;
		
		

	If @@TRANCOUNT > 0 Commit Transaction ServiceOrder;
	End Try 
	Begin Catch
		Declare @ErrorMessage nvarchar(4000), @ErrorSeverity int, @ErrorState int;
		Select	@ErrorMessage = error_message(),
				@ErrorSeverity = error_severity(),
				@ErrorState = error_state();
		Raiserror (@ErrorMessage, @ErrorSeverity, @ErrorState);
		If @@TRANCOUNT > 0 Rollback Transaction ServiceOrder;
	End Catch;
End
GO
/****** Object:  StoredProcedure [dbo].[ClinicalService_SaveResult]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ClinicalService_SaveResult]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[ClinicalService_SaveResult] AS' 
END
GO
ALTER PROCEDURE [dbo].[ClinicalService_SaveResult] 
	-- Add the parameters for the stored procedure here
	 
	@OrderId int ,	
	@UserId int,
	@ServiceList xml
AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;
	
-- Insert statements for procedure here
	
	Declare @OrderedServices Table(Id int, ServiceId int,TestNotes varchar(400),ResultNotes varchar(400), ResultBy int, ResultDate datetime);
	Declare @OrderNumber varchar(50);
	;With SR As
		(
			Select
				L.G.query('id').value('.', 'int') Id,
				L.G.query('serviceid').value('.', 'int') ServiceId,
				nullif(L.G.query('testnotes').value('.', 'varchar(400)'), '') TestNotes,
				nullif(L.G.query('resultnotes').value('.', 'varchar(400)'), '') ResultNotes,
				nullif(L.G.query('resultdate').value('.', 'datetime'), '') ResultDate,
				nullif(L.G.query('resultby').value('.', 'int'), '') ResultBy
			From @ServiceList.nodes('/root/result') As L (G)
		)
		Insert Into @OrderedServices(
			Id,
			ServiceId, 
			TestNotes,
			ResultNotes,
			ResultBy,
			ResultDate
		)
		Select
			Id,
			ServiceId,
			TestNotes,
			ResultNotes,
			ResultBy,
			ResultDate
		From SR;
	Begin Transaction ServiceOrder
	Begin Try
		
		

		Update C Set
			ResultBy = O.ResultBy,
			ResultDate = O.ResultDate,
			ResultNotes = O.ResultNotes		
		From dtl_ClinicalServiceOrder C 
		Inner Join @OrderedServices O		On O.Id = C.Id
		Where c.ResultBy Is Null And O.ResultBy Is Not Null;

		declare @rCount int, @sCount int;

		Select 
			@rCount = Count(*) ,
			@sCount = Sum(Case When ResultBy Is Null Then 0 Else 1 End)
		From dtl_ClinicalServiceOrder
		Where OrderId =@OrderId;

		Update ord_ClinicalServiceOrder  Set
			OrderStatus = Case When @sCount = 0 Then 'Pending' 
							   When @sCount < @rCount Then 'Partially Complete'
							   Else 'Complete'  End
		Where Id = @OrderId;	
		
		Update V Set
			DataQuality =  Case 
							   When @sCount < @rCount Then 0
							   Else 1  End
		From ord_ClinicalServiceOrder O  
		Inner Join ord_Visit V On V.Visit_Id = O.VisitId And O.Id=@OrderId	;

	If @@TRANCOUNT > 0 Commit Transaction ServiceOrder;
	End Try 
	Begin Catch
		Declare @ErrorMessage nvarchar(4000), @ErrorSeverity int, @ErrorState int;
		Select	@ErrorMessage = error_message(),
				@ErrorSeverity = error_severity(),
				@ErrorState = error_state();
		Raiserror (@ErrorMessage, @ErrorSeverity, @ErrorState);
		If @@TRANCOUNT > 0 Rollback Transaction ServiceOrder;
	End Catch;
End
GO

/****** Object:  StoredProcedure [dbo].[Form_GetBusinessRule]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Form_GetBusinessRule]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Form_GetBusinessRule] AS' 
END
GO


-- =============================================
-- Author:		Joseph Njung'e
-- Create date: 2016-07-15
-- Description:	Get the form business rule
-- =============================================
ALTER PROCEDURE [dbo].[Form_GetBusinessRule] 
	-- Add the parameters for the stored procedure here
	@FormId int = null,
	@FeatureId int = null,
	@ModuleId int = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	If(@ModuleId Is Null) Begin
		Select	Id
			,	BusRuleId
			,	BusRuleName
			,	BusRuleDeleteFlag
			,	BusRuleReferenceId
			,	MinValue
			,	MaxValue
			,	SetType	As RuleSet
			,	FormId
			,	FormReferenceId
			,	FeatureId
			,	MultiVisit
			,	Custom
			,	FormTypeReferenceId
			,	FeatureTypeId	
			,	FormName	
		From FormBusinessRuleView
		Where (FormId = @FormId Or @FormId Is Null)
			And (FeatureId = @FeatureId Or @FeatureId Is Null);
	End
	Else Begin
		Select	Id
			,	BusRuleId
			,	BusRuleName
			,	BusRuleDeleteFlag
			,	BusRuleReferenceId
			,	MinValue
			,	MaxValue
			,	SetType	As RuleSet
			,	F.FormId
			,	FormReferenceId
			,	F.FeatureId
			,	F.MultiVisit
			,	F.Custom
			,	FormTypeReferenceId
			,	FeatureTypeId	
			,	F.FormName	
		From FormBusinessRuleView F
		--Inner Join ServiceAreaFormView S On S.FeatureId = F.FormId
		Where (F.FormId= @FormId Or @FormId Is Null)
		And  (F.FeatureId = @FeatureId Or @FeatureId Is Null)
		--And S.ModuleId = @ModuleId
	End
END


GO
/****** Object:  StoredProcedure [dbo].[FormBuilder_DeleteModuleBusinessRules]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FormBuilder_DeleteModuleBusinessRules]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[FormBuilder_DeleteModuleBusinessRules] AS' 
END
GO

ALTER procedure [dbo].[FormBuilder_DeleteModuleBusinessRules]    
(        
	@ModuleId int       
)        
as        
begin

Delete From lnk_ServiceBusinessRule
Where moduleid = @ModuleId

End
GO
/****** Object:  StoredProcedure [dbo].[FormBuilder_GetFieldControlTypes]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FormBuilder_GetFieldControlTypes]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[FormBuilder_GetFieldControlTypes] AS' 
END
GO

-- =============================================
-- Author:		Joseph Njung'e
-- Create date: 20150623
-- Description:	Get fieldControlTypes
-- =============================================
ALTER PROCEDURE [dbo].[FormBuilder_GetFieldControlTypes] 
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Select	ControlID
			,Name
			,DataType
			,DeleteFlag
			,UserId
			,CreateDate
			,UpdateDate
			,ReferenceId
			,LookupTable
	From mst_control
	Where (Name <> 'System auto generated')
END

GO
/****** Object:  StoredProcedure [dbo].[FormBuilder_GetFieldLookupValues]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FormBuilder_GetFieldLookupValues]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[FormBuilder_GetFieldLookupValues] AS' 
END
GO


ALTER PROCEDURE [dbo].[FormBuilder_GetFieldLookupValues]                                                                                 
(                                                                                  
	@FieldId int,
	@Predefined bit = 0  ,
	@SystemId int = 0                            
)                                                                                                   
AS                                                                                  
Begin                                 
 
	If(@Predefined = 0) Begin
			Select	Id											FieldID
					,FieldName
					,ControlId
					,dbo.GetLookupValues(CategoryId, BindTable,@SystemId)	FieldValue
					,0											Predefined
					,CategoryId									CodeId
					,BindTable
					,0											ModuleId
			From mst_CustomformField
			Where Id = @FieldId;
	End                            
    Else Begin
		Select	Id											FieldID
					,PDFName FieldName
					,ControlId
					,dbo.GetLookupValues(CategoryId, BindTable,@SystemId)	FieldValue
					,0											Predefined
					,CategoryId									CodeId
					,BindTable
					,											ModuleId
			From Mst_PreDefinedFields
			Where Id = @FieldId;
	End             
End	   

GO
/****** Object:  StoredProcedure [dbo].[FormBuilder_SaveModuleBusinessRules]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FormBuilder_SaveModuleBusinessRules]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[FormBuilder_SaveModuleBusinessRules] AS' 
END
GO


ALTER procedure [dbo].[FormBuilder_SaveModuleBusinessRules]    
(        
@ModuleId int,        
@BusRuleId int,        
@value varchar(50) =null,        
@value1 varchar(50) =null,        
@setType int=null,        
@UserId int=null       
)        
As Begin 
	Insert Into lnk_ServiceBusinessRule (
			ModuleId
		,	BusRuleId
		,	Value
		,	Value1
		,	SetType
		,	CreateDate
		,	UserId)
	Values (
			@ModuleId
		,	@BusRuleid
		,	nullif(@value,'')
		,	nullif(@value1,'')
		,	@setType
		,	getdate()
		,	@userid)

End

GO
/****** Object:  StoredProcedure [dbo].[Laboratory_ActivateLabTest]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Laboratory_ActivateLabTest]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Laboratory_ActivateLabTest] AS' 
END
GO
-- =============================================
-- Author:		Joseph Njunge
-- Create date: 20160223
-- Description:	Inactivite/Activate Lab Test
-- =============================================
ALTER PROCEDURE [dbo].[Laboratory_ActivateLabTest]
	-- Add the parameters for the stored procedure here
	@LabTestId int , 	
	@Active bit,
	@UserId int
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Update mst_LabTestMaster Set Active = @Active Where Id=@LabTestId;
END

GO
/****** Object:  StoredProcedure [dbo].[Laboratory_DeleteLabOrder]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Laboratory_DeleteLabOrder]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Laboratory_DeleteLabOrder] AS' 
END
GO
-- =============================================
-- Author:		Joseph Njung'e
-- Create date: 01-Dec-2016
-- Description:	Delete Laborder
-- =============================================
ALTER PROCEDURE [dbo].[Laboratory_DeleteLabOrder] 
	-- Add the parameters for the stored procedure here
	@LabOrderId int,
	@DeletedBy int,
	@DeleteReason varchar(250)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Begin Transaction LabOrder
	Begin Try
		Update ord_LabOrder Set
				DeleteFlag = 1
			,	DeletedBy=@DeletedBy
			,	DeleteDate=getdate()
			,	DeleteReason= @DeleteReason
		Where Id = @LabOrderId;
		Update dtl_LabOrderTest Set
				DeleteFlag = 1
		Where LabOrderId = @LabOrderId;

		Update dtl_LabOrderTestResult Set
				DeleteFlag = 1
		Where LabOrderId = @LabOrderId;

		If @@TRANCOUNT > 0 Commit Transaction LabOrder;
	End Try 
	Begin Catch
		Declare @ErrorMessage nvarchar(4000), @ErrorSeverity int, @ErrorState int;
		Select	@ErrorMessage = error_message(),
				@ErrorSeverity = error_severity(),
				@ErrorState = error_state();
		Raiserror (@ErrorMessage, @ErrorSeverity, @ErrorState);
		If @@TRANCOUNT > 0 Rollback Transaction LabOrder;
	End Catch;
END
GO
/****** Object:  StoredProcedure [dbo].[Laboratory_DeleteLabTest]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Laboratory_DeleteLabTest]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Laboratory_DeleteLabTest] AS' 
END
GO
-- =============================================
-- Author:		Joseph Njunge
-- Create date: 20160223
-- Description:	Delete Lab Test
-- =============================================
ALTER PROCEDURE [dbo].[Laboratory_DeleteLabTest] 
	-- Add the parameters for the stored procedure here
	@LabTestId int , 	
	@UserId int
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Update mst_LabTestMaster Set DeleteFlag = 1, DeletedBy=@UserId, DeleteDate=getdate() Where Id=@LabTestId;
END

GO
/****** Object:  StoredProcedure [dbo].[Laboratory_DeleteTestParameter]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Laboratory_DeleteTestParameter]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Laboratory_DeleteTestParameter] AS' 
END
GO

-- =============================================
-- Author:		Joseph Njunge
-- Create date: 20160223
-- Description:	Delete Lab Test Parameter
-- =============================================
ALTER PROCEDURE [dbo].[Laboratory_DeleteTestParameter] 
	-- Add the parameters for the stored procedure here
	@ParameterId int , 
	@LabTestId int , 
	@UserId int
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Update Mst_LabTestParameter Set DeleteFlag= 1,UserId=@UserId, UpdateDate=getdate()  Where Id = @ParameterId;
END


GO
/****** Object:  StoredProcedure [dbo].[Laboratory_FindTestByName]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Laboratory_FindTestByName]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Laboratory_FindTestByName] AS' 
END
GO


 
ALTER PROCEDURE [dbo].[Laboratory_FindTestByName] 
      -- Add the parameters for the stored procedure here
      @SearchText varchar(15),
	  @ExcludeGroup bit= 0
AS
BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;
      If ltrim(rtrim(@SearchText)) <> ''
      Begin
            Select @SearchText = '%'+@SearchText+'%';
            
            Select @SearchText = Case When nullif(@SearchText,'') Is Null Then Null Else '%'+@SearchText+'%' End
		-- Insert statements for procedure here
			Select	Id,
					ReferenceId,
					Name,
					IsGroup,
					DepartmentId,
					Department = (select D.LabDepartmentName From mst_LabDepartment D Where D.LabDepartmentID = M.DepartmentId),
					ParameterCount,
					DeleteFlag
			From mst_LabTestMaster As M
			Where (DeleteFlag = 0)
			And Active = 1
			And  Name Like @SearchText
			And Case When @ExcludeGroup = 1 And IsGroup = 1 Then 0 Else 1 End = 1
			And (ParameterCount > 0 Or IsGroup = 1);
       
                  
      End
      
    -- Insert statements for procedure here
      
 END


GO
/****** Object:  StoredProcedure [dbo].[Laboratory_GetLabOrder]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Laboratory_GetLabOrder]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Laboratory_GetLabOrder] AS' 
END
GO
-- =============================================
-- Author:		Joseph Njung'e
-- Create date: 20160223
-- Description:	Get Lab Order details
-- =============================================
ALTER PROCEDURE [dbo].[Laboratory_GetLabOrder] 
	-- Add the parameters for the stored procedure here
	@LabOrderId int = null,
	@PatientPk int = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
		Select	O.Id LabOrderId,
			O.OrderNumber ,
			O.Ptn_pk PatientPk,
			O.LocationId,
			O.VisitId,
			O.OrderedBy ,
			O.OrderDate OrderDate,
			O.ClinicalOrderNotes ClinicalNotes,
			O.DeleteFlag,
			O.ModuleId ,
			O.PreClinicLabDate,
			O.UserId,
			O.Createdby,
			O.CreateDate,
			O.UpdateDate,
			OrderStatus
	From ord_LabOrder O
	Where (O.Id = @LabOrderId Or @LabOrderId Is Null)
	And	  (O.Ptn_Pk = @PatientPk Or @PatientPk Is Null);

	
	
END

GO
/****** Object:  StoredProcedure [dbo].[Laboratory_GetLabOrderTests]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Laboratory_GetLabOrderTests]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Laboratory_GetLabOrderTests] AS' 
END
GO
-- =============================================
-- Author:		Joseph Njung'e
-- Create date: 20160223
-- Description:	Get the lab tests in lab order order
-- =============================================
ALTER PROCEDURE [dbo].[Laboratory_GetLabOrderTests] 
	-- Add the parameters for the stored procedure here
	@LabOrderId int ,
	@LabOrderTestId int = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Select 
		P.LabOrderId,
		O.OrderedBy,
		O.ModuleId,
		O.OrderDate,
		O.OrderNumber,
		P.Id TestOrderId,
		P.LabTestId TestId,
		L.Name TestName,
		P.TestNotes,
		P.ResultNotes,
		D.LabDepartmentName Department,
		D.LabDepartmentId DepartmentId,
		L.IsGroup,	
		P.DeleteFlag,		
		P.ParentTestId,
		P.IsParent,		
		L.DeleteFlag TestDeleteFlag,
		L.ReferenceId,	
		P.ResultBy,
		P.ResultDate,
		P.ResultStatus,
		P.UserId,
		P.StatusDate,
		HasResult = Case When (Select Count(HasResult) - Sum(Convert(int,HasResult))
						From dtl_LabOrderTestResult R 
					 Where P.LabOrderId=@LabOrderId 
						And R.LabOrderTestId = P.Id
					) = 0 Then Convert(bit,1) Else Convert(bit,0) End
	From dtl_LabOrderTest P
	Inner Join mst_LabTestMaster L On L.Id = P.LabTestID
	Inner Join ord_LabOrder O On O.Id = P.LabOrderId
	Left Outer join mst_LabDepartment D On D.LabDepartmentID = L.DepartmentId
	Where P.LabOrderID = @LabOrderId  And (P.Id = @LabOrderTestId Or @LabOrderTestId Is Null)
END

GO
/****** Object:  StoredProcedure [dbo].[Laboratory_GetLabTest]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Laboratory_GetLabTest]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Laboratory_GetLabTest] AS' 
END
GO
-- =============================================
-- Author:		Joseph Njunge
-- Create date: 20160212
-- Description:	Get Lab Test.
-- =============================================
ALTER PROCEDURE [dbo].[Laboratory_GetLabTest] 
	-- Add the parameters for the stored procedure here
	@LabTestId int = null
AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;
	
-- Insert statements for procedure here
	Select	Id,
			ReferenceId,
			Name,
			IsGroup,
			DepartmentId,
			Department = (select D.LabDepartmentName From mst_LabDepartment D Where D.LabDepartmentID = M.DepartmentId),
			ParameterCount,
			Active,
			DeleteFlag
	From mst_LabTestMaster As M
	Where DeleteFlag = 0  And (Id = isnull(@LabTestId, Id))
End

GO
/****** Object:  StoredProcedure [dbo].[Laboratory_GetLabTestID]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Laboratory_GetLabTestID]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Laboratory_GetLabTestID] AS' 
END
GO

 
ALTER PROCEDURE [dbo].[Laboratory_GetLabTestID] 
      -- Add the parameters for the stored procedure here
      @LabName varchar(15)
AS
BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;
      Declare @SearchString varchar(20);
      If ltrim(rtrim(@LabName)) <> ''
      Begin
            Select @SearchString = '%'+@LabName+'%';
            
            Select      LT.LabTestID,
                  LT.LabName,
                  LT.LabDepartmentID,
                  D.LabDepartmentName
            From dbo.mst_LabTest As LT
            Inner Join 
                  dbo.mst_LabDepartment As D          On LT.LabDepartmentID = D.LabDepartmentID
            Where (LT.LabName Like @SearchString)
            And LT.DeleteFlag = 0 
            And D.DeleteFlag = 0
            Group By    LT.LabTestID,
                  LT.LabName,
                  LT.LabDepartmentID,
                  D.LabDepartmentName;
                  
      End
      
    -- Insert statements for procedure here
      
      END

GO
/****** Object:  StoredProcedure [dbo].[Laboratory_GetLabTestParameters]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Laboratory_GetLabTestParameters]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Laboratory_GetLabTestParameters] AS' 
END
GO
-- =============================================
-- Author:		Joseph Njung'e
-- Create date: 20160223
-- Description:	Get Testparameters for a labtest
-- =============================================
ALTER PROCEDURE [dbo].[Laboratory_GetLabTestParameters] 
	-- Add the parameters for the stored procedure here
	@LabTestId int , 
	@ParameterId int = null
AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;

-- Insert statements for procedure here
Select	Id,
		ReferenceId,
		ParameterName,
		LabTestId,
		DataType,
		P.OrdRank,
		LoincCode,
		UserId,
		CreateDate,
		UpdateDate,
		DeleteFlag
From Mst_LabTestParameter As P
Where (LabTestId = @LabTestId)
And (Id = isnull(@ParameterId, Id))
And (DeleteFlag = 0)
End


GO
/****** Object:  StoredProcedure [dbo].[Laboratory_GetParameterResultConfig]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Laboratory_GetParameterResultConfig]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Laboratory_GetParameterResultConfig] AS' 
END
GO
-- =============================================
-- Author:		Joseph Njung'e
-- Create date: 20160224
-- Description:	Get the lab test parameter result option
-- =============================================
ALTER PROCEDURE [dbo].[Laboratory_GetParameterResultConfig]
	-- Add the parameters for the stored procedure here
	@ParameterId int
AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;

Select	Id,
		C.ParameterId,
		MinBoundary,
		MaxBoundary,
		MinNormalRange,
		MaxNormalRange,
		Isnull(DefaultUnit,0) DefaultUnit,
		U.UnitName,
		C.UnitId,
		DetectionLimit
From dtl_LabTestParameterConfig C
Inner Join vw_LabTestParameterUnits U On U.UnitId = C.UnitId
Where ParameterId = @ParameterId
And C.DeleteFlag = 0


End

GO
/****** Object:  StoredProcedure [dbo].[Laboratory_GetParameterResultOption]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Laboratory_GetParameterResultOption]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Laboratory_GetParameterResultOption] AS' 
END
GO
-- =============================================
-- Author:		Joseph Njung'e
-- Create date: 20160224
-- Description:	Get the lab test parameter result option
-- =============================================
ALTER PROCEDURE [dbo].[Laboratory_GetParameterResultOption] 
	-- Add the parameters for the stored procedure here
	@ParameterId int
AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;

Select	Id,
		Value,
		ParameterId,
		DeleteFlag
From dtl_LabTestParameterResultOption
Where ParameterId = @ParameterId And DeleteFlag = 0 Order by Value
End

GO
/****** Object:  StoredProcedure [dbo].[Laboratory_GetResultUnit]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Laboratory_GetResultUnit]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Laboratory_GetResultUnit] AS' 
END
GO
-- =============================================
-- Author:		Joseph Njunge
-- Create date: 20160223
-- Description:	Get Test result units
-- =============================================
ALTER PROCEDURE [dbo].[Laboratory_GetResultUnit] 
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select UnitId UnitID,UnitName Name from vw_LabTestParameterUnits Where DeleteFlag=0 order by Name   
END

GO
/****** Object:  StoredProcedure [dbo].[Laboratory_GetTestDepartment]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Laboratory_GetTestDepartment]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Laboratory_GetTestDepartment] AS' 
END
GO
-- =============================================
-- Author:		Joseph Njunge
-- Create date: 20160223
-- Description:	Get Test departments
-- =============================================
ALTER PROCEDURE [dbo].[Laboratory_GetTestDepartment] 
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Select D.LabDepartmentID Id, D.LabDepartmentName Name, D.DeleteFlag from mst_LabDepartment D Where D.DeleteFlag = 0  
END

GO
/****** Object:  StoredProcedure [dbo].[Laboratory_GetTestParameterResult]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Laboratory_GetTestParameterResult]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Laboratory_GetTestParameterResult] AS' 
END
GO
-- =============================================
-- Author:		Joseph Njung'e
-- Create date: 20160223
-- Description:	Get test parameter result
-- =============================================
ALTER PROCEDURE [dbo].[Laboratory_GetTestParameterResult] 
	-- Add the parameters for the stored procedure here
	@LabTestOrderId int 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	 Select 
		R.Id  Id,
		LabOrderId,
		R.LabTestId,
		LabOrderTestId ,
		R.ParameterId,	
		ResultValue,
		isnull(Undetectable,0)Undetectable,
		DetectionLimit,
		ResultText,
		ResultOption,
		ResultOptionId,
		R.UserId,
		R.DeleteFlag,
		HasResult,
		ResultConfigId,
		ResultUnitId,
		ResultUnit,
		R.CreateDate	,
		P.ParameterName,
		P.ReferenceId,
		P.DataType	,
		P.OrdRank,
		P.DeleteFlag ParamDeleteFlag	,
		R.StatusDate
	From dtl_LabOrderTestResult R Inner Join Mst_LabTestParameter P
	On R.ParameterId = P.Id			 
	Where R.LabOrderTestId = @LabTestOrderId And R.DeleteFlag=0 AND P.DeleteFlag=0
	Order By P.OrdRank;
END

GO
/****** Object:  StoredProcedure [dbo].[Laboratory_GroupAddTest]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Laboratory_GroupAddTest]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Laboratory_GroupAddTest] AS' 
END
GO
-- =============================================
-- Author:		Joseph Njung'e
-- Create date: 201602023
-- Description:	Add labTest to group
-- =============================================
ALTER PROCEDURE [dbo].[Laboratory_GroupAddTest] 
	-- Add the parameters for the stored procedure here
	@MainTestId int , 
	@LabTestId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
		Delete From lnk_GroupLabTest Where GroupLabTestId = @MainTestId And LabTestId=@LabTestId;
		Insert Into lnk_GroupLabTest(GroupLabTestId,LabTestId) Values(@MainTestId, @LabTestId);
	END

GO
/****** Object:  StoredProcedure [dbo].[Laboratory_GroupGetLabTest]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Laboratory_GroupGetLabTest]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Laboratory_GroupGetLabTest] AS' 
END
GO

-- =============================================
-- Author:		Joseph Njung'e
-- Create date: 201602023
-- Description:	Get the labtests in a group
-- =============================================
ALTER PROCEDURE [dbo].[Laboratory_GroupGetLabTest] 
	-- Add the parameters for the stored procedure here
	@MainTestId int 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Select	
		M.Id,
		M.ReferenceId,
		M.Name,
		M.IsGroup,
		M.DepartmentId,
		Department = (select D.LabDepartmentName From mst_LabDepartment D Where D.LabDepartmentID = M.DepartmentId),
		M.ParameterCount,
		M.DeleteFlag,
		M.Active
	From lnk_GroupLabTest As G
	Inner Join mst_LabTestMaster As M On M.Id = G.LabTestId
	Where  M.DeleteFlag = 0 And G.GroupLabTestId = @MainTestId And M.IsGroup = 0
END


GO
/****** Object:  StoredProcedure [dbo].[Laboratory_GroupRemoveTest]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Laboratory_GroupRemoveTest]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Laboratory_GroupRemoveTest] AS' 
END
GO
-- =============================================
-- Author:		Joseph Njung'e
-- Create date: 20160223
-- Description:	Remove lab test from a group
-- =============================================
ALTER PROCEDURE [dbo].[Laboratory_GroupRemoveTest]
	-- Add the parameters for the stored procedure here
	@MainTestId int , 
	@LabTestId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    Delete From lnk_GroupLabTest Where GroupLabTestId = @MainTestId And LabTestId=@LabTestId;
END

GO
/****** Object:  StoredProcedure [dbo].[Laboratory_SaveLabOrder]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Laboratory_SaveLabOrder]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Laboratory_SaveLabOrder] AS' 
END
GO


ALTER PROCEDURE [dbo].[Laboratory_SaveLabOrder]                                       
	@PatientPk int,                  
	@LocationId int,   
	@UserId int,                  
	@OrderedBy int,                                      
	@OrderDate datetime,     
	@LabOrderId int = Null,    
	@PreClinicDate datetime=null,
	@ClinicalNotes varchar(250) = null   ,	
	@itemList xml = null  ,  
	@ParameterList xml = null,
	@VisitId int = null,  
	@ModuleId int              
As                             
Begin

	Set Nocount On;
	Declare @OrderedTest Table(TestId int, TestNotes varchar(255), IsGroup bit, IsParent bit, ParentTestId int);	
	Declare @SavedTest Table(OrderTestId int, LabTestId int);
	Declare @OrderNumber varchar(50);
	;With LabR As
		(
			Select
				L.G.query('testid').value('.', 'int') TestId,
				nullif(L.G.query('testnotes').value('.', 'varchar(255)'), '') TestNotes,
				L.G.query('isgroup').value('.', 'bit') IsGroup
			From @itemList.nodes('/root/request') As L (G)
		)
	Insert Into @OrderedTest (
		TestId,
		TestNotes,
		IsGroup,
		IsParent)
		Select	TestID,
				TestNotes,
				IsGroup,
				1 IsParent
		From LabR;
	Insert Into @OrderedTest (
		TestId,
		TestNotes,
		IsGroup,
		IsParent,
		ParentTestId)
		Select	G.LabTestId TestId,
				Null As TestNotes,
				0 IsGroup,
				0 IsParent,
				L.TestId As ParentTestId
		From @OrderedTest L
		Inner Join lnk_GroupLabTest G On L.TestId = G.GroupLabTestId
				And L.IsGroup = 1;

	Begin Transaction LabOrder
	Begin Try
		Insert Into ord_Visit (
			Ptn_pk,
			LocationID,
			VisitDate,
			VisitType,
			DataQuality,
			UserID,
			Createdate,
			OrderedDate,
			ModuleID,
			Signature)
		Values (
			@PatientPk,
			@LocationId,
			@OrderDate,
			6,
			0,
			@UserID,
			getdate(),
			@OrderDate,
			@ModuleId,
			@OrderedBy );
		Select @VisitId = scope_identity();

		Select @OrderNumber = max(convert(varchar, replace(OrderNumber, '-', '')))
		From ord_LabOrder
		Where OrderNumber Like convert(varchar, datepart(Year, getdate())) + '-%'

		If (@OrderNumber Is Null) Select @OrderNumber = convert(varchar(4),datepart(year, getdate())) + replicate('0', 5) + convert(varchar, 1); 
		Else Select @OrderNumber = convert(int, @OrderNumber) + 1;

		Select @OrderNumber = stuff(@OrderNumber, 5, 0, '-');

		Insert Into ord_LabOrder (
			Ptn_Pk,
			LocationId,
			ModuleId,
			VisitId,
			OrderedBy,
			OrderDate,
			CreateDate,
			CreatedBy,
			UserId,
			PreClinicLabDate,
			ClinicalOrderNotes,
			OrderNumber,
			OrderStatus,
			DeleteFlag
		)
		Values (
			@PatientPk,
			@LocationId,
			@ModuleId,
			@VisitId,
			@OrderedBy,
			@OrderDate,
			getdate(),
			@UserID,
			@UserId,			
			@PreClinicDate,
			@ClinicalNotes,
			@OrderNumber,			
			'Pending',
			0 );

		Select @LabOrderId = scope_identity();

		Insert Into dtl_LabOrderTest (
			LabOrderId,
			LabTestId,
			TestNotes,
			IsParent,
			ParentTestId,
			DeleteFlag,
			ResultStatus,
			UserId,
			StatusDate)
		Output Inserted.Id, Inserted.LabTestId Into @SavedTest (OrderTestId, LabTestId)
			Select	@LabOrderId,
					T.TestId,
					T.TestNotes,
					T.IsParent,
					T.ParentTestId,
					0,
					'Pending',
					@UserId,
					getdate()
			From @OrderedTest T;

		Insert Into dtl_LabOrderTestResult (
			LabOrderId,
			LabTestId,
			LabOrderTestId,
			ParameterId,
			CreatedBy,
			CreateDate,
			UserId,
			DeleteFlag,
			StatusDate)
			Select	@LabOrderId,
					T.LabTestId,
					T.OrderTestId,
					P.Id,
					@UserId,
					getdate(),
					@UserId,
					0,
					getdate()
			From Mst_LabTestParameter P
			Inner Join @SavedTest T On T.LabTestId = P.LabTestId
			Where p.DeleteFlag =0 Order By OrdRank;

			-- Output the saved stuff.
			
			Select Id LabOrderId,
					O.Ptn_pk PatientPk,
					LocationId,
					O.OrderedBy,
					O.OrderDate,
					O.CreateDate ,
					O.UserId,
					O.PreClinicLabDate PreClinicDate,
					VisitId,
					O.OrderNumber,
					ModuleId,
					O.ClinicalOrderNotes ClinicalNotes,
					O.OrderStatus,
					O.CreatedBy,
					O.UpdateDate,
					O.DeleteFlag
			 From ord_LabOrder O Where O.Id = @LabOrderId;

			If @@TRANCOUNT > 0 Commit Transaction LabOrder;
	End Try 
	Begin Catch
		Declare @ErrorMessage nvarchar(4000), @ErrorSeverity int, @ErrorState int;
		Select	@ErrorMessage = error_message(),
				@ErrorSeverity = error_severity(),
				@ErrorState = error_state();
		Raiserror (@ErrorMessage, @ErrorSeverity, @ErrorState);
		If @@TRANCOUNT > 0 Rollback Transaction LabOrder;
	End Catch;
End

GO
/****** Object:  StoredProcedure [dbo].[Laboratory_SaveLabTest]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Laboratory_SaveLabTest]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Laboratory_SaveLabTest] AS' 
END
GO
-- =============================================
-- Author:		Joseph Njunge
-- Create date: 20160223
-- Description:	Save Lab Test
-- =============================================
ALTER PROCEDURE [dbo].[Laboratory_SaveLabTest] 
	-- Add the parameters for the stored procedure here
	 
	@ReferenceId varchar(36) = null,
	@TestName varchar(250),
	@IsGroup bit = 0,
	@DepartmentId int = null,
	@LoincCode varchar(15) = null,
	--@ParameterList xml = null,
	@UserId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Declare @LabTestId int;
	Declare @ParameterId int ;
	Select @ReferenceId = Isnull(@ReferenceId, Convert(varchar(36),newid()));
	Begin Transaction saveLabTest
	Begin Try
		If Exists(Select 1 From mst_LabTestMaster Where Name = @TestName) Begin
			Raiserror('Duplication Error :: Another lab test exists with the same name',16,1);
			Return 0;
		End
		If Exists(Select 1 From mst_LabTestMaster Where ReferenceId = @ReferenceId) Begin
			Raiserror('Duplication Error :: Another lab test exists with the Reference Id',16,1);
			Return 0;
		End
		Insert Into mst_LabTestMaster (
			ReferenceId,
			Name,
			IsGroup,
			DepartmentId,
			LoincCode,
			Active,
			DeleteFlag)
		Values (
			@ReferenceId,
			@TestName,
			@IsGroup,
			@DepartmentId,
			@LoincCode,
			1,
			0 );
		Select @LabTestId = Scope_Identity();

	
		Select	Id,
			ReferenceId,
			Name,
			IsGroup,
			DepartmentId,
			Department = (select D.LabDepartmentName From mst_LabDepartment D Where D.LabDepartmentID = M.DepartmentId),
			ParameterCount,
			Active,
			DeleteFlag
		From mst_LabTestMaster As M
		Where (Id = @LabTestId);
			
		If @@TRANCOUNT > 0 Commit Transaction saveLabTest;
		End Try 
		Begin Catch
			Declare @ErrorMessage nvarchar(4000), @ErrorSeverity int, @ErrorState int;
			Select	@ErrorMessage = error_message(),
					@ErrorSeverity = error_severity(),
					@ErrorState = error_state();
			Raiserror (@ErrorMessage, @ErrorSeverity, @ErrorState);
			If @@TRANCOUNT > 0 Rollback Transaction saveLabTest;
		End Catch;

END

GO
/****** Object:  StoredProcedure [dbo].[Laboratory_SaveTestParameter]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Laboratory_SaveTestParameter]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Laboratory_SaveTestParameter] AS' 
END
GO
-- =============================================
-- Author:		Joseph Njung'e
-- Create date: 20160223
-- Description:	Save Test Parameter
-- =============================================
ALTER PROCEDURE [dbo].[Laboratory_SaveTestParameter] 
	-- Add the parameters for the stored procedure here
	@ParameterId int = null,
	@ReferenceId varchar(36),
	@Name varchar(250),
	@LabTestId int,
	@DataType varchar(20),
	@Rank decimal(5,2) = 0.00,
	@LoincCode varchar(50) = null,
	@UserId int,
	@DeleteFlag bit= 0,
	@OptionList xml = null,
	@ConfigList xml = null

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;
	declare @ResultOption Table(OptionId int, OptionValue varchar(50), DeleteFlag bit);
	declare @Config Table(
			ConfigId int,
			MinBoundary decimal(10,2),
			MaxBoundary decimal(10,2),
			MinNormal decimal(10,2),
			MaxNormal decimal(10,2),
			Unit int,
			DefaultUnit bit,
			Limit decimal(10,2),
			DeleteFlag bit);

		Begin Transaction saveTP
		Begin Try
			If (@ParameterId Is Null Or @ParameterId < 1 ) Begin
				Insert Into Mst_LabTestParameter (
					ReferenceId,
					parameterName,
					LabTestId,
					DataType,
					OrdRank,
					UserId,
					CreateDate,
					DeleteFlag,
					LoincCode)
				Values (
					@ReferenceId,
					@Name,
					@LabTestId,
					@DataType,
					@Rank,
					@UserId,
					getdate(),
					0,
					@LoincCode );
				Select @ParameterId = scope_identity();
			End
			Else Begin
				Update Mst_LabTestParameter Set
					ParameterName = isnull(@Name,ParameterName),
					DataType = @DataType,
					OrdRank = @Rank,
					LoincCode=@LoincCode,
					UpdateDate=getdate(),
					UserId =@UserId
				Where Id=@ParameterId;
			End
			If(@ConfigList Is Not Null) Begin
				Insert Into @Config(ConfigId, MinBoundary,MaxBoundary,MinNormal,MaxNormal, Unit,DefaultUnit,Limit,DeleteFlag)
				Select
					L.P.query('configid').value('.', 'int') ConfigId,
					convert(decimal(10,2),nullif(L.P.query('minboundary').value('.', 'varchar(10)'),'')) MinBoudary,
					convert(decimal(10,2),nullif(L.P.query('maxboundary').value('.', 'varchar(10)'),''))MaxBoundary,
					convert(decimal(10,2),nullif(L.P.query('minnormal').value('.', 'varchar(10)'),'')) MinNormal,
					convert(decimal(10,2),nullif(L.P.query('maxnormal').value('.', 'varchar(10)'),'')) MaxNormal,			
					L.P.query('unit').value('.', 'int') unit,
					L.P.query('defaultunit').value('.', 'bit') defaultunit,
					convert(decimal(10,2),nullif(L.P.query('limit').value('.', 'varchar(10)'),'')) Limit,	
					L.P.query('deleteflag').value('.', 'bit') DeleteFlag
				From @ConfigList.nodes('/root/config') As L (P);		
			End
			If(@OptionList Is Not Null) Begin
				Insert Into @ResultOption(OptionId,OptionValue,DeleteFlag)
				Select
					L.O.query('optionid').value('.', 'int') OptionId,
					L.O.query('value').value('.', 'varchar(50)') Value,
					L.O.query('deleteflag').value('.', 'bit') DeleteFlag
				From @OptionList.nodes('/root/options') As L (O);
			End
	
			Update p Set	
				MinBoundary= C.MinBoundary,
				MaxBoundary = C.MaxBoundary,
				MinNormalRange = C.MinNormal,
				MaxNormalRange = C.MaxNormal,
				UnitId = C.Unit,
				DefaultUnit = C.DefaultUnit,
				DetectionLimit = C.Limit,
				DeleteFlag = C.DeleteFlag
			From dtl_LabTestParameterConfig P
			Inner Join @Config C On  C.ConfigId = P.Id	And p.ParameterId = @ParameterId;

			Update p Set	
				MinBoundary= C.MinBoundary,
				MaxBoundary = C.MaxBoundary,
				MinNormalRange = C.MinNormal,
				MaxNormalRange = C.MaxNormal,
				UnitId = C.Unit,
				DefaultUnit = C.DefaultUnit,
				DetectionLimit = C.Limit,
				DeleteFlag = C.DeleteFlag
			From dtl_LabTestParameterConfig P
			Inner Join @Config C On C.Unit = P.UnitId
			Where P.ParameterId = @ParameterId And (ConfigId < 1 or ConfigId Is Null);


			Delete C From @Config C Inner Join dtl_LabTestParameterConfig P On P.UnitId = C.Unit
			Where P.ParameterId = @ParameterId And (ConfigId < 1 or ConfigId Is Null);

			Insert Into dtl_LabTestParameterConfig (
				ParameterId,
				MinBoundary,
				MaxBoundary,
				MinNormalRange,
				MaxNormalRange,
				UnitId,
				DefaultUnit,
				DetectionLimit,
				DeleteFlag)
			Select 
				@ParameterId,
				MinBoundary,
				MaxBoundary,
				MinNormal,
				MaxNormal,
				Unit,
				DefaultUnit,
				Limit,
				0
			From @Config Where DeleteFlag = 0 And (ConfigId < 1 or ConfigId Is Null) ;

			Update RO Set
				Value = O.OptionValue,
				DeleteFlag = O.DeleteFlag
			From dtl_LabTestParameterResultOption RO
			Inner Join @ResultOption O On RO.Id = O.OptionId
					And RO.ParameterId = @ParameterId;

			Insert Into dtl_LabTestParameterResultOption (
				ParameterId,
				Value,
				DeleteFlag)
			Select	@ParameterId,
					OptionValue,
					0
			From @ResultOption Where DeleteFlag = 0 And (OptionId < 1 or OptionId Is Null);

			Select	Id,
					ReferenceId,
					ParameterName,
					LabTestId,
					DataType,
					P.OrdRank,
					LoincCode,
					UserId,
					CreateDate,
					UpdateDate,
					DeleteFlag
			From Mst_LabTestParameter As P
			Where (Id = @ParameterId);

			Select	Id,
					ParameterId,
					MinBoundary,
					MaxBoundary,
					MinNormalRange,
					MaxNormalRange,
					C.UnitId,
					U.UnitName,
					Isnull(DefaultUnit,0) DefaultUnit,
					DetectionLimit,
					C.DeleteFlag
			From dtl_LabTestParameterConfig C
			Inner Join vw_LabTestParameterUnits U On U.UnitId = C.UnitId
			Where (ParameterId = @ParameterId)
			And (C.DeleteFlag = 0);

			Select	Id,
					ParameterId,
					Value,
					DeleteFlag
			From dtl_LabTestParameterResultOption
			Where (ParameterId = @ParameterId)
			And (DeleteFlag = 0);
		If @@TRANCOUNT > 0 Commit Transaction saveTP;
		End Try 
		Begin Catch
			Declare @ErrorMessage nvarchar(4000), @ErrorSeverity int, @ErrorState int;
			Select	@ErrorMessage = error_message(),
					@ErrorSeverity = error_severity(),
					@ErrorState = error_state();
			Raiserror (@ErrorMessage, @ErrorSeverity, @ErrorState);
			If @@TRANCOUNT > 0 Rollback Transaction saveTP;
		End Catch;
End
GO
/****** Object:  StoredProcedure [dbo].[Laboratory_SaveTestResult]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Laboratory_SaveTestResult]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Laboratory_SaveTestResult] AS' 
END
GO

-- =============================================
-- Author:		Joseph N
-- Create date: 20160223
-- Description:	Save Lab Result
-- =============================================
ALTER PROCEDURE [dbo].[Laboratory_SaveTestResult] 
	-- Add the parameters for the stored procedure here
	@LabTestOrderId int , 
	
	@ParameterList xml = null   ,
	@UserId int ,
	@ResultNotes varchar(250) = null,
	@ResultBy int,
	@ResultDate datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Declare @Results Table(ResultId int, 
							ParameterId int, 
							ResultValue decimal(10,2), 
							ResultText varchar(400), 
							ResultOption varchar(50), 
							ResultOptionValue int,
							ResultDate datetime, 
							ResultBy int,
							ResultUnit varchar(50) , 							
							ConfigId int,
							ResultUnitValue int,
							Undetectable bit,
							DetectionLimit decimal(10,2));
	
			Insert Into @Results(
				ResultId,
				ParameterId,
				ResultValue,
				ResultText,
				ResultOption,
				ResultOptionValue,
				ResultDate,
				ResultBy,
				ResultUnitValue,
				ResultUnit,				
				Undetectable,
				DetectionLimit,
				ConfigId
			)
			Select
				L.G.query('id').value('.', 'int') ResultId,
				L.G.query('parameterid').value('.', 'int') ParameterId,
				Convert(decimal(10,2),nullif(L.G.query('resultvalue').value('.', 'varchar(10)'), '')) ResultValue,
				nullif(L.G.query('resulttext').value('.', 'varchar(400)'), '') ResultText,
				nullif(L.G.query('resultoption').value('.', 'varchar(50)'), '') ResultOption,
				nullif(L.G.query('resultoptionvalue').value('.', 'int'), '') ResultOptionValue,
				nullif(L.G.query('resultdate').value('.', 'datetime'), '') ResultDate,
				nullif(L.G.query('resultby').value('.', 'int'), '') ResultBy,
				nullif(L.G.query('resultunitid').value('.', 'int'), '') ResultUnitValue,
				nullif(L.G.query('resultunit').value('.', 'varchar(50)'), '') ResultUnit ,
				nullif(L.G.query('undetectable').value('.', 'bit'), '') Undetectable,
				Convert(decimal(10,2),nullif(L.G.query('detectionlimit').value('.', 'varchar(10)'), '')) DetectionLimit,
				nullif(L.G.query('configid').value('.', 'int'), '') ConfigId
			From @ParameterList.nodes('/root/result') As L (G);
		
			
		Begin Transaction LabOrder
		Begin Try
			
			Update T Set
				ResultValue		= Isnull(T.ResultValue,R.ResultValue),
				ResultText		= Isnull(T.ResultText,R.ResultText),
				ResultOption	= Isnull(T.ResultOption,R.ResultOption),
				ResultOptionId  = Isnull(T.ResultOptionId, R.ResultOptionValue),
				ResultUnitId	= isnull(T.ResultUnitId, R.ResultUnitValue),
				ResultUnit		= Isnull(T.ResultUnit,R.ResultUnit),
				Undetectable	= Isnull(T.Undetectable,R.Undetectable),
				DetectionLimit	= Isnull(T.DetectionLimit, R.DetectionLimit),
				ResultConfigId	=isnull(T.ResultConfigId,R.ConfigId),
				Statusdate		= getdate(),
				UserId= @UserId
			From dtl_LabOrderTestResult T
			Inner Join @Results R On R.ResultId = T.Id
					And R.ParameterId = T.ParameterId
			Where T.HasResult = 0
			And T.DeleteFlag = 0
			And T.LabOrderTestId = @LabTestOrderId;
			If(@@rowcount > 0) Begin
				Update dtl_LabOrderTest Set 
					ResultNotes = nullif(@ResultNotes,'') ,
					ResultBy = @ResultBy,
					ResultDate = @ResultDate,
					ResultStatus='Received',
					UserId = @UserId,
					StatusDate = getdate()
				Where Id = @LabTestOrderId;

				declare @labOrderId int, @PendingCount int;	
			
				Select Top 1 @labOrderId = T.LabOrderId From   dtl_LabOrderTest T Where Id=@LabTestOrderId;

				Select @PendingCount = Count(T.Id)
				From dtl_LabOrderTest T
				Inner Join mst_LabTestMaster M On T.LabTestId = M.Id
				Where T.LabOrderId = @labOrderId
					And M.IsGroup = 0
					And T.ResultDate Is Null;

					--Select  @labOrderId  = Max(LabOrderId),
					--	@PendingCount = Count(T.Id) - Sum(Case When ResultDate Is Not Null Then 1 Else 0 End)
				 --From dtl_LabOrderTest T Inner Join mst_LabTestMaster M On T.LabTestId= M.Id Where LabOrderId = @labOrderId And M.IsGroup = 0;
				 -- T.Id=@LabTestOrderId And M.IsGroup = 0;
				 
				-- Update ord_LabOrder Set OrderStatus = Case When @PendingCount = 0 Then 'Complete' Else OrderStatus End
				Update ord_LabOrder Set OrderStatus =  'Partially Completed'	 Where Id=@labOrderId;

				If(@PendingCount = 0) Begin
					Update dtl_LabOrderTest Set
							ResultStatus = 'Received'
						,	ResultNotes = 'Group lab tests complete'
						,	UserId = @UserId
						,	ResultDate = @ResultDate
						,	StatusDate = getdate()
						,	ResultBy = @ResultBy
					Where LabOrderId = @labOrderId
					And ResultDate Is Null
					Update ord_LabOrder Set OrderStatus = 'Complete'  Where Id=@labOrderId;	
					Update ord_Visit set DataQuality = 1 Where Visit_Id = (Select VisitId From ord_LabOrder Where Id= @labOrderId)
				End

			End
			If @@TRANCOUNT > 0 Commit Transaction LabOrder;
		End Try 
		Begin Catch
			Declare @ErrorMessage nvarchar(4000), @ErrorSeverity int, @ErrorState int;
			Select	@ErrorMessage = error_message(),
					@ErrorSeverity = error_severity(),
					@ErrorState = error_state();
			Raiserror (@ErrorMessage, @ErrorSeverity, @ErrorState);
			If @@TRANCOUNT > 0 Rollback Transaction LabOrder;
		End Catch;

END


GO
/****** Object:  StoredProcedure [dbo].[LookupMasterItem_Insert]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LookupMasterItem_Insert]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[LookupMasterItem_Insert] AS' 
END
GO
ALTER PROCEDURE [dbo].[LookupMasterItem_Insert] 
	-- Add the parameters for the stored procedure here
	@ItemName varchar(200), 
	@MasterName varchar(200),
	@OrdRank decimal(5,2)=1.00,
	@DisplayName varchar(250) = Null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Declare @LookupItemId int, @MasterItemId int;

	Select @LookupItemId = Id From LookupItem Where Name = @ItemName;
	If(@LookupItemId Is Null) Begin
		Insert into LookupItem(Name,DisplayName,DeleteFlag) Values (@ItemName, @ItemName,0);
		Select @LookupItemId = scope_identity();
	End

	Select @MasterItemId = Id From LookupMaster Where Name = @MasterName;
	If(@MasterItemId Is Null) Begin
		Insert into LookupMaster(Name,DisplayName,DeleteFlag) Values (@MasterName, @MasterName,0);
		Select @MasterItemId = scope_identity();
	End

	Delete From LookupMasterItem where LookupMasterId=@MasterItemId And LookupItemId=@LookupItemId;

	Insert Into LookupMasterItem(LookupMasterId,LookupItemId,DisplayName,OrdRank) Values (@MasterItemId,@LookupItemId,Isnull(@DisplayName,@ItemName),@OrdRank)
END
GO
/****** Object:  StoredProcedure [dbo].[mstPatient_Insert]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[mstPatient_Insert]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[mstPatient_Insert] AS' 
END
GO

-- =============================================
-- Author: Felix Kithinji
-- Create date: 15-Mar-2017
-- Description: Insert
-- =============================================
ALTER PROCEDURE [dbo].[mstPatient_Insert] 
 -- Add the parameters for the stored procedure here
 @FirstName varchar(150),
 @LastName varchar(150),
 @MiddleName varchar(150) = null,
 @LocationID int,
 @PatientEnrollmentID varchar(50),
 @ReferredFrom int,
 @RegistrationDate datetime,
 @Sex int,
 @DOB datetime,
 @DobPrecision int,
 @MaritalStatus int,
 @Address varchar(250),
 @Phone varchar(250),
 @UserID int,
 @PosId varchar(10),
 @ModuleId int,
 @StartDate datetime,
 @CreateDate datetime
AS
BEGIN
 -- SET NOCOUNT ON added to prevent extra result sets from
 -- interfering with SELECT statements.
 SET NOCOUNT ON;

 DECLARE @Ptn_Pk int;
 DECLARE @EntryPointName varchar(50);
 DECLARE @Referral int;
 DECLARE @MaritalStatusName varchar(50);
 DECLARE @MaritalStatusId int;

 BEGIN
  Select @EntryPointName = ItemName
  from LookupItemView where ItemId=@ReferredFrom;

  SELECT @MaritalStatusName = ItemName
  from LookupItemView where ItemId=@MaritalStatus;

  select TOP 1 @Referral = ID from mst_Decode where NAME LIKE + '%'+ @EntryPointName + '%' AND CodeID = 17;
  select TOP 1 @MaritalStatusId = ID from mst_Decode where Name LIKE + '%'+ @MaritalStatusName + '%' AND CodeID=12;

  IF @Referral IS NULL
  BEGIN
  select TOP 1 @Referral = ID from mst_Decode where NAME = 'VCT'
  END
 END

    -- Insert statements for procedure here
 Insert Into mst_Patient(FirstName, LastName, MiddleName, LocationID, PatientEnrollmentID, ReferredFrom, RegistrationDate, Sex, DOB, DobPrecision, MaritalStatus, Address, Phone, UserID, PosId, Status, DeleteFlag, CreateDate,MovedToPatientTable)
 Values(
  ENCRYPTBYKEY(KEY_GUID('Key_CTC'),@FirstName),
  ENCRYPTBYKEY(KEY_GUID('Key_CTC'),@LastName),
  ENCRYPTBYKEY(KEY_GUID('Key_CTC'),@MiddleName),
  @LocationID,
  @PatientEnrollmentID,
  @Referral,
  @RegistrationDate,
  @Sex,
  @DOB,
  @DobPrecision,
  @MaritalStatusId,
  ENCRYPTBYKEY(KEY_GUID('Key_CTC'),@Address),
  ENCRYPTBYKEY(KEY_GUID('Key_CTC'),@Phone),
  @UserID,
  @PosId,
  0,
  0,
  @CreateDate,
  1
 );
 SELECT @Ptn_Pk=SCOPE_IDENTITY();
 SELECT @Ptn_Pk Ptn_Pk;

 Insert Into Lnk_PatientProgramStart(Ptn_pk, ModuleId, StartDate, UserID, CreateDate)
 Values(
  @Ptn_Pk,
  @ModuleId,
  @StartDate,
  @UserID,
  @CreateDate
 );
END

GO
/****** Object:  StoredProcedure [dbo].[Ord_Visit_Insert]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Ord_Visit_Insert]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Ord_Visit_Insert] AS' 
END
GO

-- =============================================
-- Author: Felix Kithinji
-- Create date: 15-Mar-2017
-- Description: Insert
-- =============================================
ALTER PROCEDURE [dbo].[Ord_Visit_Insert]
 -- Add the parameters for the stored procedure here
 @Ptn_Pk int,
 @LocationID int,
 @VisitDate datetime,
 @VisitType int,
 @UserID int,
 @CreateDate datetime,
 @ModuleId int
AS
BEGIN
 -- SET NOCOUNT ON added to prevent extra result sets from
 -- interfering with SELECT statements.
 SET NOCOUNT ON;

 DECLARE @Id int

    -- Insert statements for procedure here
 Insert Into ord_Visit(Ptn_Pk, LocationID, VisitDate, VisitType, DeleteFlag, UserID
 , CreateDate, CreatedBy, ModuleId)
 Values(
  @Ptn_Pk,
  @LocationID,
  @VisitDate,
  @VisitType,
  0,
  @UserID,
  @CreateDate,
  @UserID,
  @ModuleId
 );
 SELECT @Id=@@IDENTITY;
END


GO
/****** Object:  StoredProcedure [dbo].[Patient_Insert]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Patient_Insert]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Patient_Insert] AS' 
END
GO
ALTER PROCEDURE [dbo].[Patient_Insert] 
 -- Add the parameters for the stored procedure here
 @PersonId int,
 @ptn_pk int = null,
 @PatientIndex varchar(50),
 @DateOfBirth datetime,
 @NationalId varchar(100),
 @FacilityId int,
 @UserId int,
 @Active bit,
 @PatientType int,
 @DobPrecision bit
AS
BEGIN
 -- SET NOCOUNT ON added to prevent extra result sets from
 -- interfering with SELECT statements.
 SET NOCOUNT ON;

    -- Insert statements for procedure here
 Insert Into  Patient(ptn_pk,PersonId,PatientIndex,PatientType,FacilityId,Active,DateOfBirth,NationalId,DeleteFlag,CreatedBy,CreateDate,AuditData,DobPrecision)
 Values(
  @ptn_pk,
  @PersonId,
  @PatientIndex,
  @PatientType,
  @FacilityId,
  @Active,
  @DateOfBirth,
  ENCRYPTBYKEY(KEY_GUID('Key_CTC'),@NationalId),
  0,
  @UserId,
  GETDATE(),
  NULL,
  @DobPrecision
 );
SELECT SCOPE_IDENTITY() Id;
END

GO
/****** Object:  StoredProcedure [dbo].[Patient_Update]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Patient_Update]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Patient_Update] AS' 
END
GO

-- =============================================
-- Author: Felix Kithinji
-- Create date: 15-Mar-2017
-- Description: update
-- =============================================
ALTER PROCEDURE [dbo].[Patient_Update] 
 -- Add the parameters for the stored procedure here
 @ptn_pk int = null,
 @DateOfBirth datetime,
 @NationalId varchar(100),
 @FacilityId int,
 @AuditData xml=null,
 @Id int
AS
BEGIN
 -- SET NOCOUNT ON added to prevent extra result sets from
 -- interfering with SELECT statements.
 SET NOCOUNT ON;

    -- Insert statements for procedure here
 UPDATE Patient
 SET
  ptn_pk = @ptn_pk,
  DateOfBirth = @DateOfBirth,
  NationalId=ENCRYPTBYKEY(KEY_GUID('Key_CTC'),@NationalId),
  FacilityId=@FacilityId,
  AuditData=@AuditData
 WHERE
  Id=@Id
END


GO
/****** Object:  StoredProcedure [dbo].[PatientBaseline_To_Greencard]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PatientBaseline_To_Greencard]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[PatientBaseline_To_Greencard] AS' 
END
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[PatientBaseline_To_Greencard]
	-- Add the parameters for the stored procedure here
	@ptn_pk int,
	@PatientId int,
	@EnrollmentDate datetime,
	@VisitDate datetime,
	@UserID int,
	@PatientMasterVisitId int,
	@Status int,
	@ExitDate datetime,
	@CreateDate datetime,
	@UserID_CareEnded int,
	@CreateDate_CareEnded datetime,
	@EnrollmentId int,
	@ExitReason int,
	@DateOfDeath datetime,
	@Weight decimal,
	@Height decimal,
	@Pregnant bit,
	@TBinfected bit,
	@WHOStage int,
	@BreastFeeding bit,
	@CD4Count decimal,
	@MUAC decimal,
	@transferIn int,
	@EnrollmentWHOStage int,
	@HIVDiagnosisDate datetime,
	@artstart datetime,
	@Cohort varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @message varchar(max);
	if(@VisitDate Is Not Null) Begin
	INSERT INTO PatientMasterVisit(PatientId, ServiceId, Start, [End], Active, VisitDate, VisitScheduled, VisitBy, VisitType, [Status], CreateDate, DeleteFlag, CreatedBy)
	VALUES(@PatientId, 1, @EnrollmentDate, NULL, 0, @VisitDate, NULL, NULL, (SELECT top 1 ItemId FROM LookupItemView WHERE	MasterName like '%VisitType%' and ItemName like '%Enrollment%'), NULL, GETDATE(), 0 , @UserID);

	SET @PatientMasterVisitId = SCOPE_IDENTITY();
		
	---SELECT @message = 'Created PatientMasterVisit Id: ' + CAST(@PatientMasterVisitId as varchar);
	--PRINT @message;
			
	IF @Status = 1
		BEGIN
			IF @ExitDate IS NULL
			BEGIN
				SET @ExitDate = @CreateDate;
			END;
				
			IF @UserID_CareEnded IS NULL
			BEGIN
				SET @UserID_CareEnded = isnull(@UserID,1);
			END;
				
			IF @CreateDate_CareEnded IS NULL
			BEGIN
				SET @CreateDate_CareEnded = isnull( @CreateDate,getdate());
			END;
				
			INSERT INTO [dbo].[PatientCareending] ([PatientId] ,[PatientMasterVisitId] ,[PatientEnrollmentId] ,[ExitReason] ,[ExitDate] ,[TransferOutfacility] ,[DateOfDeath] ,[CareEndingNotes] ,[Active] ,[DeleteFlag] ,[CreatedBy] ,[CreateDate] ,[AuditData])
			VALUES(@PatientId ,@PatientMasterVisitId ,@EnrollmentId ,@ExitReason , @ExitDate ,NULL ,@DateOfDeath ,NULL ,0 ,0,@UserID_CareEnded ,@CreateDate_CareEnded ,NULL);
		END
			
	--SELECT @message = 'Created PatientCareending Id: ' + CAST(SCOPE_IDENTITY() as varchar);
	--PRINT @message;

	IF (@Weight IS NOT NULL AND @Height IS NOT NULL AND @Weight > 0 AND @Height > 0)
	BEGIN
		INSERT INTO [dbo].[PatientBaselineAssessment]([PatientId], [PatientMasterVisitId], [HBVInfected], [Pregnant], [TBinfected], [WHOStage], [BreastFeeding], [CD4Count], [MUAC], [Weight], [Height], [DeleteFlag], [CreatedBy], [CreateDate] )
		VALUES(@PatientId, @PatientMasterVisitId, 0, @Pregnant, @TBinfected, @WHOStage, @BreastFeeding, @CD4Count, @MUAC, @Weight, @Height, 0 , @UserID, GETDATE());

		--SELECT @message = 'Created PatientBaselineAssessment Id: ' + CAST(SCOPE_IDENTITY() as varchar);
		--PRINT @message;
	END

	IF EXISTS(SELECT * FROM dtl_PatientHivPrevCareIE WHERE Ptn_pk = @ptn_pk)
		BEGIN
			DECLARE @TransferInDate datetime, @TreatmentStartDate datetime, @CurrentART varchar(50), @FacilityFrom varchar(150), @CreateDateTransfer datetime, @MFLCODE int;

			SET @TransferInDate = (SELECT TOP 1 ARTTransferInDate FROM dtl_PatientHivPrevCareIE WHERE Ptn_pk = @ptn_pk);
			SET @TreatmentStartDate = (SELECT TOP 1 FirstLineRegStDate FROM dtl_PatientARTCare WHERE ptn_pk = @ptn_pk);
			SET @CurrentART = (SELECT TOP 1 CurrentART FROM dtl_PatientHivPrevCareIE WHERE Ptn_pk = @ptn_pk);
			SET @FacilityFrom = (SELECT TOP 1 ARTTransferInFrom FROM dtl_PatientHivPrevCareIE WHERE Ptn_pk = @ptn_pk);
			SET @CreateDateTransfer = (SELECT TOP 1 CreateDate FROM dtl_PatientHivPrevCareIE WHERE Ptn_pk = @ptn_pk);

			SET @MFLCODE = (select TOP 1 PosId from mst_Patient WHERE Ptn_pk = @ptn_pk);
			--SET @TreatmentStartDate = ISNULL(@TreatmentStartDate, @artstart);
			--SET @TreatmentStartDate = ISNULL(@TreatmentStartDate, @DEFAULTDATE);

			SET @MFLCODE = (select TOP 1 PosId from mst_Patient WHERE Ptn_pk = @ptn_pk);
			SET @FacilityFrom = ISNULL(@FacilityFrom, 'Unknown');
			SET @CurrentART = ISNULL(@CurrentART, (select top 1 ItemId from LookupItemView where MasterName = 'Unknown' and ItemName = 'Unknown'));

		--	SELECT @message = '@TransferInDate: ' + CAST(@TransferInDate as varchar);
			--PRINT @message;

			--SELECT @message = '@TreatmentStartDate: ' + CAST(@TreatmentStartDate as varchar);
		--	PRINT @message;

		--	SELECT @message = '@CurrentART: ' + CAST(@CurrentART as varchar);
		--	PRINT @message;

		--	SELECT @message = '@FacilityFrom: ' + CAST(@FacilityFrom as varchar);
		--	PRINT @message;

			--SELECT @message = '@MFLCODE: ' + CAST(@MFLCODE as varchar);
			--PRINT @message;

			IF @TransferInDate = CONVERT(datetime, '1900-01-01', 104)
			BEGIN
				SET @TransferInDate = NULL;
			END


			IF @transferIn = 1 AND @TransferInDate IS NOT NULL AND @TreatmentStartDate IS NOT NULL AND @CurrentART IS NOT NULL AND @FacilityFrom IS NOT NULL AND @MFLCODE IS NOT NULL
				BEGIN
					INSERT INTO [dbo].[PatientTransferIn]([PatientId], [PatientMasterVisitId], [ServiceAreaId], [TransferInDate], [TreatmentStartDate], [CurrentTreatment],  [FacilityFrom] , [MFLCode] ,[CountyFrom] , [TransferInNotes], [DeleteFlag] ,[CreatedBy] , [CreateDate])
					VALUES(@PatientId, @PatientMasterVisitId, 1, @TransferInDate, @TreatmentStartDate, @CurrentART, @FacilityFrom, @MFLCODE, (select ItemId from LookupItemView where MasterName = 'Unknown' and ItemName = 'Unknown'), ' ', 0 , @UserID, @CreateDateTransfer);

					--SELECT @message = 'Created PatientTransferIn Id: ' + CAST(SCOPE_IDENTITY() as varchar);
					--PRINT @message;
				END
	END

	IF EXISTS (Select ptn_pk, locationID, Visit_pk [VisitId], a.PurposeId, b.Name [Purpose], a.Regimen [Regimen],	a.DateLastUsed [RegLastUsed] From dtl_PatientBlueCardPriorART a Inner Join Mst_Decode b On a.PurposeID = b.ID WHERE ptn_pk = @ptn_pk)
		BEGIN
			DECLARE @TreatmentType varchar(50), @Purpose varchar(50), @Regimen varchar(50), @DateLastUsed datetime;
			
			SET @TreatmentType = (select TOP 1 [Name] from mst_Decode where codeID=33 AND ID = (Select top 1 a.PurposeId From dtl_PatientBlueCardPriorART a Inner Join Mst_Decode b On a.PurposeID = b.ID WHERE ptn_pk = @ptn_pk));
			SET @Purpose = (select TOP 1 b.Name [Purpose] From dtl_PatientBlueCardPriorART a Inner Join Mst_Decode b On a.PurposeID = b.ID WHERE ptn_pk = @ptn_pk);
			SET @Regimen = (select TOP 1 a.Regimen [Regimen] From dtl_PatientBlueCardPriorART a Inner Join Mst_Decode b On a.PurposeID = b.ID WHERE ptn_pk = @ptn_pk);
			SET @DateLastUsed = (select TOP 1 a.DateLastUsed [RegLastUsed] From dtl_PatientBlueCardPriorART a Inner Join Mst_Decode b On a.PurposeID = b.ID WHERE ptn_pk = @ptn_pk);

			IF @TreatmentType IS NOT NULL AND @Purpose IS NOT NULL AND @Regimen IS NOT NULL
				BEGIN
				INSERT INTO [dbo].[PatientARVHistory]([PatientId], [PatientMasterVisitId], [TreatmentType], [Purpose] , [Regimen], [DateLastUsed], [DeleteFlag] , [CreatedBy] , [CreateDate])
				VALUES(@PatientId, @PatientMasterVisitId, @TreatmentType, @Purpose, @Regimen, @DateLastUsed, 0, @UserID, @CreateDate);
				END

				--SELECT @message = 'Created PatientARVHistory Id: ' + CAST(SCOPE_IDENTITY() as varchar);
				--PRINT @message;
		END

	--Tranfer-ins//
	IF EXISTS(select TOP 1 FirstLineRegStDate from [dbo].[dtl_PatientARTCare] WHERE ptn_pk = @ptn_pk) AND @transferIn = 1
		BEGIN
			DECLARE @DateStartedOnFirstLine datetime;
			SET @DateStartedOnFirstLine = (select TOP 1 FirstLineRegStDate from [dbo].[dtl_PatientARTCare] WHERE ptn_pk = @ptn_pk);

			IF @DateStartedOnFirstLine IS NOT NULL AND @Cohort IS NOT NULL
			BEGIN
				INSERT INTO [dbo].[PatientTreatmentInitiation]([PatientMasterVisitId], [PatientId], [DateStartedOnFirstLine], [Cohort], Regimen, [RegimenCode] , [BaselineViralload] , [BaselineViralloadDate] , [DeleteFlag] , [CreatedBy] , [CreateDate] )
				VALUES(@PatientMasterVisitId, @PatientId, @DateStartedOnFirstLine, @Cohort, Null,(SELECT TOP 1 FirstLineReg FROM dtl_PatientARTCare where ptn_pk = @ptn_pk) , NULL, NULL, 0, @UserID, @CreateDate);

				--SELECT @message = 'Created PatientTreatmentInitiation Id: ' + CAST(SCOPE_IDENTITY() as varchar);
				--PRINT @message;
			END
		END

	--SET @HIVDiagnosisDate = ISNULL(@HIVDiagnosisDate, @DEFAULTDATE);
	--SET @EnrollmentDate = ISNULL(@EnrollmentDate, @DEFAULTDATE);
	--SET @artstart = ISNULL(@artstart, @DEFAULTDATE);

	IF @EnrollmentWHOStage IS NOT NULL
		BEGIN
			INSERT INTO [dbo].[PatientHivDiagnosis]([PatientMasterVisitId] , [PatientId] , [HIVDiagnosisDate] , [EnrollmentDate] , [EnrollmentWHOStage] , [ARTInitiationDate] , [DeleteFlag] , [CreatedBy] , [CreateDate])
			VALUES(@PatientMasterVisitId, @PatientId, @HIVDiagnosisDate, @EnrollmentDate, @EnrollmentWHOStage, @artstart, 0 , @UserID, @CreateDate);

				--SELECT @message = 'Created PatientHivDiagnosis Id: ' + CAST(SCOPE_IDENTITY() as varchar);
				--PRINT @message;
		END
	End
END
GO

/****** Object:  StoredProcedure [dbo].[PatientContact_To_Greencard]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PatientContact_To_Greencard]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[PatientContact_To_Greencard] AS' 
END
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[PatientContact_To_Greencard]
	-- Add the parameters for the stored procedure here
	@Address varbinary(max),
	@Phone varbinary(max),
	@PersonId int,
	@Status bit,
	@UserID int,
	@CreateDate datetime,
	@PersonContactID int OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @message varchar(max);

	--Insert into Person Contact
	IF @Address IS NOT NULL AND @Phone IS NOT NULL
		BEGIN
			INSERT INTO PersonContact(PersonId, [PhysicalAddress], [MobileNumber], [AlternativeNumber], [EmailAddress], [Active], [DeleteFlag], [CreatedBy], [CreateDate])
			VALUES(@PersonId, @Address, @Phone, null, null, @Status, 0, @UserID, @CreateDate);

			SET @PersonContactID = SCOPE_IDENTITY();
			--SET @message = 'Created PersonContact Id: ' + CAST(@PersonContactID as varchar);
			--PRINT @message;
		END

		SELECT @PersonContactID;
END
GO
/****** Object:  StoredProcedure [dbo].[PatientDemographics_To_Greencard]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PatientDemographics_To_Greencard]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[PatientDemographics_To_Greencard] AS' 
END
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[PatientDemographics_To_Greencard]
	@ptn_pk int,
	@FirstName varbinary(max),
	@MiddleName varbinary(max),
	@LastName varbinary(max),
	@Sex int,
	@Status_Greencard bit,
	@DeleteFlag bit,
	@CreateDate datetime, 
	@UserID int,
	@PatientFacilityId varchar(50), 
	@PatientType int,
	@FacilityId varchar(10),
	@DateOfBirth datetime, 
	@DobPrecision int, 
	@NationalId varbinary(max),
	@RegistrationDate datetime,
	@PersonId int OUTPUT,
	@PatientId int OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @message varchar(max);

	Insert into Person(FirstName, MidName, LastName, Sex, Active, DeleteFlag, CreateDate, CreatedBy)
	Values(@FirstName, @MiddleName, @LastName, @Sex, @Status_Greencard, @DeleteFlag, @CreateDate, @UserID);

	SET @PersonId = SCOPE_IDENTITY();
	--SET @message = 'Created Person Id: ' + CAST(@PersonId as varchar(50));
	--PRINT @message;

	Insert into Patient(ptn_pk, PersonId, PatientIndex, PatientType, FacilityId, Active, DateOfBirth, DobPrecision, NationalId, DeleteFlag, CreatedBy, CreateDate, RegistrationDate)
	Values(@ptn_pk, @PersonId, @PatientFacilityId, @PatientType, @FacilityId, @Status_Greencard, @DateOfBirth, @DobPrecision, @NationalId, @DeleteFlag, @UserID, @CreateDate, @RegistrationDate);

	SET @PatientId = SCOPE_IDENTITY();
	--SET @message = 'Created Patient Id: ' + CAST(@PatientId as varchar);
	--PRINT @message;

	SELECT @PersonId, @PatientId;
End
GO

/****** Object:  StoredProcedure [dbo].[PatientIdentifiers_To_Greencard]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PatientIdentifiers_To_Greencard]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[PatientIdentifiers_To_Greencard] AS' 
END
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[PatientIdentifiers_To_Greencard]
	-- Add the parameters for the stored procedure here
	@CCCNumber varchar(20),
	@PersonId int,
	@ModuleId int,
	@StartDate datetime,
	@PatientId int,
	@EnrollmentId int,
	@UserID int,
	@CreateDate datetime,
	@ReferredFrom int,
	@entryPoint int,	
	@MaritalStatus int,
	@MaritalStatusId int,
	@ServiceEntryPointId int OUTPUT,
	@PatientIdentifierId int OUTPUT,
	@PatientMaritalStatusID int OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @message varchar(max);

	IF @CCCNumber IS NOT NULL AND @ModuleId = 203
		BEGIN
			-- Patient Identifier
			INSERT INTO [dbo].[PatientIdentifier] ([PatientId], [PatientEnrollmentId], [IdentifierTypeId], [IdentifierValue] ,[DeleteFlag] ,[CreatedBy] ,[CreateDate] ,[Active] ,[AuditData])
			VALUES (@PatientId , @EnrollmentId ,(select top 1 Id from Identifiers where Code='CCCNumber') ,@CCCNumber ,0 ,@UserID ,@CreateDate ,0 ,NULL);

			SET @PatientIdentifierId = SCOPE_IDENTITY();
			--SET @message = 'Created PatientIdentifier Id: ' + CAST(@PatientIdentifierId as varchar);
			--PRINT @message;
		END

	--Insert into ServiceEntryPoint
	IF @ReferredFrom > 0 bEGIN
		SET @entryPoint = (select TOP 1 ItemId from [dbo].[LookupItemView] where ItemName like '%' + (SELECT top 1 Name FROM mst_Decode WHERE ID=@ReferredFrom AND CodeID=17) + '%');
		IF @entryPoint IS NULL
			BEGIN
				SET @entryPoint = (select top 1 ItemId from LookupItemView where MasterName = 'Unknown' and ItemName = 'Unknown');
			END
	END
	ELSE
		SET @entryPoint = (select top 1 ItemId from LookupItemView where MasterName = 'Unknown' and ItemName = 'Unknown');

	INSERT INTO ServiceEntryPoint([PatientId], [ServiceAreaId], [EntryPointId], [DeleteFlag], [CreatedBy], [CreateDate], [Active])
	VALUES(@PatientId, 1, @entryPoint, 0 , @UserID, @CreateDate, 0);

	SET @ServiceEntryPointId = SCOPE_IDENTITY();
	--SET @message = 'Created ServiceEntryPoint Id: ' + CAST(@ServiceEntryPointId as varchar);
	--PRINT @message;
	
	--Insert into MaritalStatus
	IF @MaritalStatus > 0
		BEGIN
			IF EXISTS (select TOP 1 ItemId from [dbo].[LookupItemView] where ItemName like '%' + (select Name from mst_Decode where ID = @MaritalStatus and CodeID = 12) + '%')
				SET @MaritalStatusId = (select TOP 1 ItemId from [dbo].[LookupItemView] where ItemName like '%' + (select TOP 1 Name from mst_Decode where ID = @MaritalStatus and CodeID = 12) + '%');
			ELSE
				SET @MaritalStatusId = (select TOP 1 ItemId from LookupItemView where MasterName = 'Unknown' and ItemName = 'Unknown');
		END
	ELSE
		SET @MaritalStatusId = (select TOP 1 ItemId from LookupItemView where MasterName = 'Unknown' and ItemName = 'Unknown');

	INSERT INTO PatientMaritalStatus(PersonId, MaritalStatusId, Active, DeleteFlag, CreatedBy, CreateDate)
	VALUES(@PersonId, @MaritalStatusId, 1, 0, @UserID, @CreateDate);

	SET @PatientMaritalStatusID = SCOPE_IDENTITY();
	--SET @message = 'Created PatientMaritalStatus Id: ' + CAST(@PatientMaritalStatusID as varchar);
	--PRINT @message;

	SELECT @PatientIdentifierId, @ServiceEntryPointId, @PatientMaritalStatusID
END
GO
/****** Object:  StoredProcedure [dbo].[PatientsNotSynced]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PatientsNotSynced]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[PatientsNotSynced] AS' 
END
GO

-- =============================================
-- Author: Felix
-- Create date: 10-Oct-2017
-- Description:	Avoid duplication of patients
-- =============================================
ALTER PROCEDURE [dbo].[PatientsNotSynced]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	-- Insert statements for procedure here
	DECLARE @j INT = 1;
	DECLARE @countj INT;
	--Create Temporary Tables for storing data 
	CREATE TABLE #Tmst_Patient (Id INT IDENTITY(1,1), ptn_pk int, personId int);

	INSERT INTO #Tmst_Patient(ptn_pk, personId)
	SELECT ptn_pk, PersonId FROM Patient

	DECLARE @ptn_pk int, @personId int, @patientId int, @message varchar(max), @patientmastervisitId int, @rPatientId int;

	SELECT @countj = COUNT(Id) FROM #Tmst_Patient 

	BEGIN
		WHILE (@j <= @countj)
			BEGIN
				SELECT @ptn_pk = ptn_pk, @personId = personId FROM #Tmst_Patient WHERE Id = @j;

				BEGIN TRY
					BEGIN TRANSACTION
						UPDATE mst_Patient set MovedToPatientTable = 1 where Ptn_Pk = @ptn_pk;	

						IF NOT EXISTS(SELECT * FROM GreenCardBlueCard_Transactional WHERE Ptn_Pk = @ptn_pk)
							BEGIN
								PRINT ' ';
								SELECT @message = '----- Set Patient as moved ptn_pk: ' + CAST(@ptn_pk as varchar(50));
								PRINT @message;
								
								INSERT INTO [dbo].[GreenCardBlueCard_Transactional] ([PersonId],[Ptn_Pk]) VALUES (@personId , @ptn_pk);
							END
					COMMIT
				END TRY
				BEGIN CATCH
					ROLLBACK
				END CATCH

				SELECT @j = @j + 1;

			END
		END
	DROP TABLE #Tmst_Patient


	DECLARE @d int = 1, @v int = 1;
	DECLARE @countd int, @countv int;

	CREATE TABLE #TPatient(Id INT IDENTITY(1,1), ptn_pk int, personId int, patientId int);
	CREATE TABLE #TPatientMasterVisit(Id INT IDENTITY(1,1), PatientId int, PatientMasterVisitId int);

	INSERT INTO #TPatient(ptn_pk, personId, patientId)
	 SELECT ptn_pk, PersonId, Id from (SELECT        Id, ptn_pk, PersonId, PatientIndex, PatientType, FacilityId, Active, DateOfBirth, DobPrecision, NationalId, DeleteFlag, CreatedBy, CreateDate, AuditData, RegistrationDate, row_number() Over (Partition By ptn_pk Order By Id Asc) RowNum
	FROM            dbo.Patient
	WHERE        (ptn_pk IN
		 (SELECT        ptn_pk
		   FROM            (SELECT        Patient_1.ptn_pk, COUNT(Patient_1.Id) AS Expr1
				FROM            dbo.Patient AS Patient_1 INNER JOIN
						dbo.mst_Patient ON Patient_1.ptn_pk = dbo.mst_Patient.Ptn_Pk
				GROUP BY Patient_1.ptn_pk
				HAVING         (COUNT(Patient_1.Id) > 1)) AS T))) B 

	WHERE B.RowNum>1

	SELECT @countd = COUNT(Id) FROM #TPatient
	
	BEGIN
		WHILE (@d <= @countd)
		BEGIN
			SELECT @ptn_pk = ptn_pk, @personId = personId, @patientId = patientId from #TPatient WHERE Id = @d;
			select top 1 @rPatientId = id from Patient where ptn_pk = @ptn_pk and Id <> @patientId
			BEGIN TRY
				BEGIN TRANSACTION
					INSERT INTO #TPatientMasterVisit(PatientId, PatientMasterVisitId)
					SELECT PatientId, Id FROM PatientMasterVisit WHERE PatientId = @patientId

					SELECT @countv = COUNT(Id) FROM #TPatientMasterVisit
					BEGIN
						WHILE(@v <=@countv)
						BEGIN
							SELECT @patientmastervisitId = PatientMasterVisitId FROM #TPatientMasterVisit WHERE Id = @v;
							UPDATE [dbo].[PatientMasterVisit] SET PatientId = @rPatientId WHERE Id = @patientmastervisitId AND PatientId = @patientId;
							UPDATE [dbo].[AdherenceAssessment] SET PatientId = @rPatientId WHERE PatientId = @patientId AND [PatientMasterVisitId] = @patientmastervisitId;
							UPDATE [dbo].[AdherenceOutcome] SET PatientId = @rPatientId WHERE PatientId = @patientId AND [PatientMasterVisitId] = @patientmastervisitId;
							UPDATE [dbo].[AdultChildVaccination] SET PatientId = @rPatientId WHERE PatientId = @patientId AND [PatientMasterVisitId] = @patientmastervisitId;
							UPDATE [dbo].[AdverseEvent] SET PatientId = @rPatientId WHERE PatientId = @patientId AND [PatientMasterVisitId] = @patientmastervisitId;
							UPDATE [dbo].[ARVTreatmentTracker] SET PatientId = @rPatientId WHERE PatientId = @patientId AND [PatientMasterVisitId] = @patientmastervisitId;
							UPDATE [dbo].[ComplaintsHistory] SET PatientId = @rPatientId WHERE PatientId = @patientId AND [PatientMasterVisitId] = @patientmastervisitId;
							UPDATE [dbo].[Disclosure] SET PatientId = @rPatientId WHERE PatientId = @patientId AND [PatientMasterVisitId] = @patientmastervisitId;
							UPDATE [dbo].[HIVEnrollmentBaseline] SET PatientId = @rPatientId WHERE PatientId = @patientId AND [PatientMasterVisitId] = @patientmastervisitId;
							UPDATE [dbo].[INHProphylaxis] SET PatientId = @rPatientId WHERE PatientId = @patientId AND [PatientMasterVisitId] = @patientmastervisitId;
							UPDATE [dbo].[PatientAdverseEventOutcome] SET PatientId = @rPatientId WHERE PatientId = @patientId AND [PatientMasterVisitId] = @patientmastervisitId;
							UPDATE [dbo].[PatientAllergies] SET PatientId = @rPatientId WHERE PatientId = @patientId AND [PatientMasterVisitId] = @patientmastervisitId;
							UPDATE [dbo].[PatientAllergy] SET PatientId = @rPatientId WHERE PatientId = @patientId AND [PatientMasterVisitId] = @patientmastervisitId;
							UPDATE [dbo].[PatientAppointment] SET PatientId = @rPatientId WHERE PatientId = @patientId AND [PatientMasterVisitId] = @patientmastervisitId;
							UPDATE [dbo].[PatientArtDistribution] SET PatientId = @rPatientId WHERE PatientId = @patientId AND [PatientMasterVisitId] = @patientmastervisitId;
							UPDATE [dbo].[PatientARVHistory] SET PatientId = @rPatientId WHERE PatientId = @patientId AND [PatientMasterVisitId] = @patientmastervisitId;
							UPDATE [dbo].[PatientBaselineAssessment] SET PatientId = @rPatientId WHERE PatientId = @patientId AND [PatientMasterVisitId] = @patientmastervisitId;
							UPDATE [dbo].[PatientCareending] SET PatientId = @rPatientId WHERE PatientId = @patientId AND [PatientMasterVisitId] = @patientmastervisitId;
							UPDATE [dbo].[PatientCategorization] SET PatientId = @rPatientId WHERE PatientId = @patientId AND [PatientMasterVisitId] = @patientmastervisitId;
							UPDATE [dbo].[PatientChronicIllness] SET PatientId = @rPatientId WHERE PatientId = @patientId AND [PatientMasterVisitId] = @patientmastervisitId;
							UPDATE [dbo].[PatientClinicalDiagnosis] SET PatientId = @rPatientId WHERE PatientId = @patientId AND [PatientMasterVisitId] = @patientmastervisitId;
							UPDATE [dbo].[PatientClinicalNotes] SET PatientId = @rPatientId WHERE PatientId = @patientId AND [PatientMasterVisitId] = @patientmastervisitId;
							UPDATE [dbo].[PatientConsent] SET PatientId = @rPatientId WHERE PatientId = @patientId AND [PatientMasterVisitId] = @patientmastervisitId;
							UPDATE [dbo].[PatientDiagnosis] SET PatientId = @rPatientId WHERE PatientId = @patientId AND [PatientMasterVisitId] = @patientmastervisitId;
							UPDATE [dbo].[PatientEncounter] SET PatientId = @rPatientId WHERE PatientId = @patientId AND [PatientMasterVisitId] = @patientmastervisitId;
							UPDATE [dbo].[PatientFamilyPlanning] SET PatientId = @rPatientId WHERE PatientId = @patientId AND [PatientMasterVisitId] = @patientmastervisitId;
							UPDATE [dbo].[PatientFamilyPlanningMethod] SET PatientId = @rPatientId WHERE PatientId = @patientId;
							UPDATE [dbo].[PatientHivDiagnosis] SET PatientId = @rPatientId WHERE PatientId = @patientId AND [PatientMasterVisitId] = @patientmastervisitId;
							UPDATE [dbo].[PatientIcf] SET PatientId = @rPatientId WHERE PatientId = @patientId AND [PatientMasterVisitId] = @patientmastervisitId;
							UPDATE [dbo].[PatientIcfAction] SET PatientId = @rPatientId WHERE PatientId = @patientId AND [PatientMasterVisitId] = @patientmastervisitId;
							UPDATE [dbo].[PatientIpt] SET PatientId = @rPatientId WHERE PatientId = @patientId AND [PatientMasterVisitId] = @patientmastervisitId;
							UPDATE [dbo].[PatientIptOutcome] SET PatientId = @rPatientId WHERE PatientId = @patientId AND [PatientMasterVisitId] = @patientmastervisitId;
							UPDATE [dbo].[PatientIptWorkup] SET PatientId = @rPatientId WHERE PatientId = @patientId AND [PatientMasterVisitId] = @patientmastervisitId;
							UPDATE [dbo].[PatientLabTracker] SET PatientId = @rPatientId WHERE PatientId = @patientId AND [PatientMasterVisitId] = @patientmastervisitId;
							UPDATE [dbo].[PatientPHDP] SET PatientId = @rPatientId WHERE PatientId = @patientId AND [PatientMasterVisitId] = @patientmastervisitId;
							UPDATE [dbo].[PatientPhysicalExamination] SET PatientId = @rPatientId WHERE PatientId = @patientId AND [PatientMasterVisitId] = @patientmastervisitId;
							UPDATE [dbo].[PatientProphylaxis] SET PatientId = @rPatientId WHERE PatientId = @patientId AND [PatientMasterVisitId] = @patientmastervisitId;
							UPDATE [dbo].[PatientPsychosocialCriteria] SET PatientId = @rPatientId WHERE PatientId = @patientId AND [PatientMasterVisitId] = @patientmastervisitId;
							UPDATE [dbo].[PatientReenrollment] SET PatientId = @rPatientId WHERE PatientId = @patientId;
							UPDATE [dbo].[PatientReferral] SET PatientId = @rPatientId WHERE PatientId = @patientId AND [PatientMasterVisitId] = @patientmastervisitId;
							UPDATE [dbo].[PatientScreening] SET PatientId = @rPatientId WHERE PatientId = @patientId AND [PatientMasterVisitId] = @patientmastervisitId;
							UPDATE [dbo].[PatientSupportSystemCriteria] SET PatientId = @rPatientId WHERE PatientId = @patientId AND [PatientMasterVisitId] = @patientmastervisitId;
							UPDATE [dbo].[PatientTransferIn] SET PatientId = @rPatientId WHERE PatientId = @patientId AND [PatientMasterVisitId] = @patientmastervisitId;
							UPDATE [dbo].[PatientTreatmentInitiation] SET PatientId = @rPatientId WHERE PatientId = @patientId AND [PatientMasterVisitId] = @patientmastervisitId;
							UPDATE [dbo].[PatientVitals] SET PatientId = @rPatientId WHERE PatientId = @patientId AND [PatientMasterVisitId] = @patientmastervisitId;
							UPDATE [dbo].[PatientWHOStage] SET PatientId = @rPatientId WHERE PatientId = @patientId AND [PatientMasterVisitId] = @patientmastervisitId;
							UPDATE [dbo].[PhysicalExamination] SET PatientId = @rPatientId WHERE PatientId = @patientId AND [PatientMasterVisitId] = @patientmastervisitId;
							UPDATE [dbo].[Pregnancy] SET PatientId = @rPatientId WHERE PatientId = @patientId AND [PatientMasterVisitId] = @patientmastervisitId;
							UPDATE [dbo].[PregnancyIndicator] SET PatientId = @rPatientId WHERE PatientId = @patientId AND [PatientMasterVisitId] = @patientmastervisitId;
							UPDATE [dbo].[PregnancyLog] SET PatientId = @rPatientId WHERE PatientId = @patientId AND [PatientMasterVisitId] = @patientmastervisitId;
							UPDATE [dbo].[PresentingComplaints] SET PatientId = @rPatientId WHERE PatientId = @patientId AND [PatientMasterVisitId] = @patientmastervisitId;
							UPDATE [dbo].[Referrals] SET PatientId = @rPatientId WHERE PatientId = @patientId AND [PatientMasterVisitId] = @patientmastervisitId;
							UPDATE [dbo].[TreatmentEventTracker] SET PatientId = @rPatientId WHERE PatientId = @patientId AND [PatientMasterVisitId] = @patientmastervisitId;
							UPDATE [dbo].[Vaccination] SET PatientId = @rPatientId WHERE PatientId = @patientId AND [PatientMasterVisitId] = @patientmastervisitId;
						END
					END

					UPDATE Patient SET DeleteFlag = 1, ptn_pk = - FLOOR(RAND(CHECKSUM(NEWID()))*(9999-1000)+1000) WHERE Id = @patientId
					UPDATE Person SET DeleteFlag = 1 WHERE Id = @personId
				COMMIT
			END TRY
			BEGIN CATCH
				ROLLBACK
			END CATCH

			SELECT @d = @d + 1
		END
	END

	DROP TABLE #TPatient
	DROP TABLE #TPatientMasterVisit
END
GO
/****** Object:  StoredProcedure [dbo].[PatientTreatmentSupporter_Insert]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PatientTreatmentSupporter_Insert]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[PatientTreatmentSupporter_Insert] AS' 
END
GO


-- =============================================
-- Author: Felix
-- Create date: 28-Apr-2017
-- Description: Insert into Patient Treatment Supporter
-- =============================================
ALTER PROCEDURE [dbo].[PatientTreatmentSupporter_Insert] 
 -- Add the parameters for the stored procedure here
 @PersonId int, 
 @SupporterId int,
 @MobileContact varbinary(max),
 @CreatedBy int
AS
BEGIN
 -- SET NOCOUNT ON added to prevent extra result sets from
 -- interfering with SELECT statements.
 SET NOCOUNT ON;

 IF @MobileContact IS NULL
  SET @MobileContact = NULL;
 ELSE
  SET @MobileContact = ENCRYPTBYKEY(KEY_GUID('Key_CTC'),@MobileContact);

    -- Insert statements for procedure here
 INSERT INTO PatientTreatmentSupporter([PersonId], [SupporterId], [MobileContact], [DeleteFlag], [CreatedBy], [CreateDate])
 VALUES(@PersonId, @SupporterId, @MobileContact, 0, @CreatedBy, GETDATE());

 SELECT SCOPE_IDENTITY() Id;
END



GO
/****** Object:  StoredProcedure [dbo].[PatientTreatmentSupporter_To_Greencard]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PatientTreatmentSupporter_To_Greencard]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[PatientTreatmentSupporter_To_Greencard] AS' 
END
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[PatientTreatmentSupporter_To_Greencard]
	-- Add the parameters for the stored procedure here
	@ptn_pk int,
	@PersonId int,
	@PatientTreatmentSupporterID int OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	--Insert into Treatment Supporter
	DECLARE @k INT = 1;
	DECLARE @countk INT, @message varchar(max);

	DECLARE @FirstNameT varchar(50), @LastNameT varchar(50), @TreatmentSupportTelNumber varchar(50), 
	@CreateDateT datetime, @UserIDT int, @IDT int;

	--Create Temporary Tables for storing data 
	CREATE TABLE #Tdtl_PatientContacts(Id INT IDENTITY(1,1), FirstNameT varchar(50), LastNameT varchar(50), TreatmentSupportTelNumber varchar(50), CreateDateT datetime, UserIDT int);
		--Insert data to temporary table #Tdtl_PatientContacts 
	INSERT INTO #Tdtl_PatientContacts(FirstNameT, LastNameT, TreatmentSupportTelNumber, CreateDateT, UserIDT)
	SELECT SUBSTRING(TreatmentSupporterName,0,charindex(' ',TreatmentSupporterName))as firstname, SUBSTRING(TreatmentSupporterName,charindex(' ',TreatmentSupporterName) + 1,len(TreatmentSupporterName)+1)as lastname,	TreatmentSupportTelNumber, CreateDate, UserID 
	from dtl_PatientContacts WHERE ptn_pk = @ptn_pk;

	SELECT @countk = COUNT(Id) FROM #Tdtl_PatientContacts 
	BEGIN
	WHILE (@k <= @countk)
		BEGIN
			SELECT @FirstNameT = FirstNameT, @LastNameT = LastNameT, @TreatmentSupportTelNumber = TreatmentSupportTelNumber, @CreateDateT = Isnull(CreateDateT,getdate()), @UserIDT = Isnull(UserIDT,1) FROM #Tdtl_PatientContacts WHERE Id = @k;

			BEGIN TRY
				BEGIN TRANSACTION
					--PRINT ' '  
					--SELECT @message = '----- Treatment Supporter: ' + CAST(@ptn_pk as varchar(50));
					--PRINT @message;

					IF @FirstNameT IS NOT NULL AND @LastNameT IS NOT NULL 
						BEGIN
							Insert into Person(FirstName, MidName, LastName, Sex, Active, DeleteFlag, CreateDate, CreatedBy)
							Values(ENCRYPTBYKEY(KEY_GUID('Key_CTC'),@FirstNameT), NULL, ENCRYPTBYKEY(KEY_GUID('Key_CTC'),@LastNameT), (select TOP 1 ItemId from LookupItemView where MasterName = 'Unknown' and ItemName = 'Unknown'), 1, 0, getdate(), @UserIDT);

							SELECT @IDT = SCOPE_IDENTITY();
							--SELECT @message = 'Created Person Treatment Supporter Id: ' + CAST(@IDT as varchar(50));
							--PRINT @message;

							INSERT INTO PatientTreatmentSupporter(PersonId, [SupporterId], [MobileContact], [DeleteFlag], [CreatedBy], [CreateDate])
							VALUES(@PersonId, @IDT, ENCRYPTBYKEY(KEY_GUID('Key_CTC'),@TreatmentSupportTelNumber), 0, @UserIDT, getdate());

							SET @PatientTreatmentSupporterID = SCOPE_IDENTITY();
							--SET @message = 'Created PatientTreatmentSupporterID Id: ' + CAST(@PatientTreatmentSupporterID as varchar);
							--PRINT @message;
						END
				IF @@TRANCOUNT > 0 COMMIT
				END TRY
				BEGIN CATCH
					Declare @ErrorMessage NVARCHAR(4000),@ErrorSeverity Int,@ErrorState Int;

					Select	@ErrorMessage = Error_message(),@ErrorSeverity = Error_severity(),	@ErrorState = Error_state();

					Raiserror (@ErrorMessage, @ErrorSeverity, @ErrorState  );

					IF @@TRANCOUNT > 0					
						ROLLBACK
				END CATCH

				SELECT @k = @k + 1;

				END
			END
		--Now Drop Temporary Tables
		DROP TABLE #Tdtl_PatientContacts

	SELECT @PatientTreatmentSupporterID;
END
GO
/****** Object:  StoredProcedure [dbo].[PatientTreatmentSupporter_Update]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PatientTreatmentSupporter_Update]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[PatientTreatmentSupporter_Update] AS' 
END
GO

ALTER PROCEDURE [dbo].[PatientTreatmentSupporter_Update] 
	-- Add the parameters for the stored procedure here
	@PersonId int, 
	@SupporterId int,
	@MobileContact varbinary(max),
	@CreatedBy int,
	@DeleteFlag bit,
	@Id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	 IF @MobileContact IS NULL
	  SET @MobileContact = NULL;
	 ELSE
	  SET @MobileContact = ENCRYPTBYKEY(KEY_GUID('Key_CTC'),@MobileContact);

	  UPDATE PatientTreatmentSupporter
	  SET SupporterId = @SupporterId, PersonId = @PersonId, MobileContact = @MobileContact , CreatedBy = @CreatedBy, DeleteFlag = @DeleteFlag
	  WHERE Id = @Id

	  SELECT SCOPE_IDENTITY() Id;
END


GO
/****** Object:  StoredProcedure [dbo].[PatientType_Update]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PatientType_Update]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[PatientType_Update] AS' 
END
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[PatientType_Update]
	-- Add the parameters for the stored procedure here
	@PatientId int,
	@PatientType int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Update Patient set PatientType = @PatientType where Id = @PatientId
END

GO
/****** Object:  StoredProcedure [dbo].[Person_Insert]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Person_Insert]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Person_Insert] AS' 
END
GO
-- =============================================
-- Author:  Steve Osewe
-- Create date: 20-Jan-2017
-- Description: Insert
-- =============================================
ALTER PROCEDURE [dbo].[Person_Insert]
 -- Add the parameters for the stored procedure here
 @FirstName varchar(100),
 @MidName varchar(100)= Null,
 @LastName varchar(100),
 @Sex int,
 @DateOfBirth datetime = NULL,
 @DobPrecision bit = NULL,
 --@NationalId varchar(100) = null,
 @UserId int
AS
BEGIN
 -- SET NOCOUNT ON added to prevent extra result sets from
 -- interfering with SELECT statements.
 SET NOCOUNT ON;

 --if(@DateOfBirth is null)BEGIN SET @DateOfBirth='1989-06-15' END
    -- Insert statements for procedure here
 Insert Into Person(FirstName, MidName,LastName,Sex,DateOfBirth,DobPrecision,Active,DeleteFlag,CreateDate,CreatedBy)
 Values(
  ENCRYPTBYKEY(KEY_GUID('Key_CTC'),@FirstName),
  ENCRYPTBYKEY(KEY_GUID('Key_CTC'),@MidName),
  ENCRYPTBYKEY(KEY_GUID('Key_CTC'),@LastName),
  @Sex,
  @DateOfBirth,
  @DobPrecision,
  --ENCRYPTBYKEY(KEY_GUID('Key_CTC'),@NationalId),
  1,
  0,
  GETDATE(),
  @UserId
 );
 SELECT SCOPE_IDENTITY() PersonId;
END
GO
/****** Object:  StoredProcedure [dbo].[Person_Update]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Person_Update]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Person_Update] AS' 
END
GO
ALTER PROCEDURE [dbo].[Person_Update]
 -- Add the parameters for the stored procedure here
 @FirstName varchar(100),
 @MidName varchar(100)= Null,
 @LastName varchar(100),
 @Sex int,
 @DateOfBirth datetime = NULL,
 --@NationalId varchar(100) = null,
 @Id int
AS
BEGIN
 -- SET NOCOUNT ON added to prevent extra result sets from
 -- interfering with SELECT statements.
 SET NOCOUNT ON;

    -- Insert statements for procedure here
 UPDATE Person
 SET
  FirstName=ENCRYPTBYKEY(KEY_GUID('Key_CTC'),@FirstName),
  MidName=ENCRYPTBYKEY(KEY_GUID('Key_CTC'),@MidName),
  LastName=ENCRYPTBYKEY(KEY_GUID('Key_CTC'),@LastName),
  Sex=@Sex,
  DateOfBirth=@DateOfBirth
  --NationalId=ENCRYPTBYKEY(KEY_GUID('Key_CTC'),@NationalId)
 WHERE
   Id=@Id;
END
GO
/****** Object:  StoredProcedure [dbo].[PersonContact_Insert]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PersonContact_Insert]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[PersonContact_Insert] AS' 
END
GO
-- =============================================
-- Author:		Steve Osewe
-- Create date: 20-Jan-2017
-- Description:	Insert
-- =============================================
ALTER PROCEDURE [dbo].[PersonContact_Insert]
	-- Add the parameters for the stored procedure here
	@PersonId int=Null,
	@PhysicalAddress varbinary(max)= Null,
	@MobileNumber varbinary(max)=Null,
	@AlternativeNumber varbinary(max)=Null,
	@EmailAddress varbinary(max)=Null,
	@UserId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Declare @Id int;

	 IF @MobileNumber IS NULL
  SET @MobileNumber = NULL;
 ELSE
  SET @MobileNumber = ENCRYPTBYKEY(KEY_GUID('Key_CTC'),@MobileNumber);

	if( @AlternativeNumber IS NULL)
		BEGIN
		  SET @AlternativeNumber = NULL;
		END
	else
	BEGIN
	  SET @AlternativeNumber=ENCRYPTBYKEY(KEY_GUID('Key_CTC'),@AlternativeNumber)
	END

	if(@EmailAddress is null)
	begin
		SET @EmailAddress= NULL;
	end
	else
		begin
		  SET @EmailAddress=ENCRYPTBYKEY(KEY_GUID('Key_CTC'),@EmailAddress);
		end

	Insert Into PersonContact(PersonId,PhysicalAddress,MobileNumber,AlternativeNumber,EmailAddress,Active,DeleteFlag,CreateDate,CreatedBy)
	Values(
		@PersonId,
		ENCRYPTBYKEY(KEY_GUID('Key_CTC'),@PhysicalAddress),
		@MobileNumber,
		-- ENCRYPTBYKEY(KEY_GUID('Key_CTC'),@MobileNumber),
		@AlternativeNumber,
		@EmailAddress,
		1,
		0,
		GETDATE(),
		@UserId
	);
	SET @Id =(Select SCOPE_IDENTITY() Id);
	
	-- Set Previous Contacts to Zero
	if(@Id>0)
	BEGIN
		UPDATE PersonContact SET Active=0 WHERE PersonId=@PersonId AND Id NOT IN(Id);
	END
END

GO
/****** Object:  StoredProcedure [dbo].[PersonContact_Update]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PersonContact_Update]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[PersonContact_Update] AS' 
END
GO
ALTER PROCEDURE [dbo].[PersonContact_Update]
 -- Add the parameters for the stored procedure here
 @PersonId int=Null,
 @PhysicalAddress varbinary(max)= Null,
 @MobileNumber varbinary(max)=Null,
 @AlternativeNumber varbinary(max)=Null,
 @EmailAddress varbinary(max)=Null,
 @Id int
AS
BEGIN
 -- SET NOCOUNT ON added to prevent extra result sets from
 -- interfering with SELECT statements.
 SET NOCOUNT ON;

 if( @AlternativeNumber IS NULL)
  BEGIN
    SET @AlternativeNumber = NULL;
  END
 else
 BEGIN
   SET @AlternativeNumber=ENCRYPTBYKEY(KEY_GUID('Key_CTC'),@AlternativeNumber)
 END

 if(@EmailAddress is null)
 begin
  SET @EmailAddress= NULL;
 end
 else
  begin
    SET @EmailAddress=ENCRYPTBYKEY(KEY_GUID('Key_CTC'),@EmailAddress);
  end

    -- Insert statements for procedure here
    UPDATE PersonContact
 SET
  PhysicalAddress=ENCRYPTBYKEY(KEY_GUID('Key_CTC'),@PhysicalAddress),
  MobileNumber=ENCRYPTBYKEY(KEY_GUID('Key_CTC'),@MobileNumber),
  AlternativeNumber=@AlternativeNumber,
  EmailAddress=@EmailAddress
 WHERE 
  PersonId=@PersonId 
  AND
  Id=@Id 
END
GO
/****** Object:  StoredProcedure [dbo].[Pharmacy_GetAllRegisteredPatients]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pharmacy_GetAllRegisteredPatients]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Pharmacy_GetAllRegisteredPatients] AS' 
END
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[Pharmacy_GetAllRegisteredPatients] 
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Select Ptn_Pk
	  ,	   convert(varchar(50), decryptbykey(FirstName))							 fname
	  ,	   convert(varchar(50), decryptbykey(MiddleName))							 mname
	  ,	   convert(varchar(50), decryptbykey(LastName))								 lname
	  ,	   PatientEnrollmentID
	  ,	   cast(round(datediff(Hour, DOB, getdate()) / 8766.0, 2) As numeric(18, 2)) age
	  ,	   b.name																	 gender
	  ,	   c.name																	 [service]
	From mst_patient a
	Left Join mst_decode b On a.sex = b.id
	Left Join mst_decode c On a.ServiceRegisteredForAtPharmacy = c.id
	Where RegisteredAtPharmacy = 1
	
END

GO
/****** Object:  StoredProcedure [dbo].[Pharmacy_GetExpectedPatients]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pharmacy_GetExpectedPatients]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Pharmacy_GetExpectedPatients] AS' 
END
GO
-- =============================================
-- Author:		John Macharia
-- Create date: 14th Feb 2017
-- Description:	get number of patients expected to come for pharmacy
-- =============================================
ALTER PROCEDURE [dbo].[Pharmacy_GetExpectedPatients]
	-- Add the parameters for the stored procedure here
	@Date datetime

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;
	declare @pharmacyReason int = (select top 1 id from mst_decode where name = 'Pharmacy Refill')
	--0 expected
	select count(*) expected from dtl_patientappointment 
	--where appreason = @pharmacyReason and (deleteflag = 0 or deleteflag is null) and cast(AppDate as date) = cast(@Date as date)
	where (deleteflag = 0 or deleteflag is null) and cast(AppDate as date) = cast(@Date as date)

	--1 Actual
	select count(*) actual  from ord_patientpharmacyorder 
	where (deleteflag=0 or deleteflag is null) and cast(dispensedbydate as date) = cast(@Date as date)
	
End
GO
/****** Object:  StoredProcedure [dbo].[Pharmacy_GetPrescription]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pharmacy_GetPrescription]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Pharmacy_GetPrescription] AS' 
END
GO

-- =============================================
-- Author:		Joseph
-- Create date: 
-- Description:	Get pending pharmacy prescriptions
-- =============================================
ALTER PROCEDURE [dbo].[Pharmacy_GetPrescription] 
	-- Add the parameters for the stored procedure here
	@PrescriptionDate datetime , 
	@LocationId int,
	@PrescriptionStatus int 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Declare @StartDate datetime, @EndDate datetime;

	Select @StartDate = dateadd(second, 0, dateadd(day, datediff(day, 0, @PrescriptionDate), 0)) ,	@EndDate = dateadd(second, -1, dateadd(day, datediff(day, 0, @PrescriptionDate)+1, 0))
    -- Insert statements for procedure here
	Select	PV.Ptn_pk
		,	PatientEnrollmentID 
		,	PatientFacilityId
		,	ptn_pharmacy_pk	OrderId
		,	ReportingID		PrescriptionNumber
		,	FirstName
		,	MiddleName
		,	LastName
		,	DOB
		,	Sex
		,	convert(varchar(20),OrderedByDate,106) OrderedByDate
		,	Case
				When PO.OrderStatus = 1 Then 'New Order'
				When PO.OrderStatus = 3 Then 'Partial Dispense'
				Else 'Already Dispensed Order'
			End [Status]
		,  convert(varchar(20),PO.CreateDate,106) CreateDate
		--,	cast(datediff(Hour, PO.CreateDate, getdate()) As varchar) + ' hrs ' + cast(datediff(Minute, PO.CreateDate, getdate()) % 60 As varchar) + ' mins' Duration
		, cast(datediff(Minute, PO.CreateDate, getdate()) as varchar) + ' mins' Duration
		,	(
			Select UserFirstName + ' ' + UserLastName
			From mst_User U
			Where U.UserId = PO.OrderedBy
			)				
			PrescribedBy
	From ord_PatientPharmacyOrder PO
	Inner Join PatientView PV On PV.Ptn_Pk = PO.Ptn_pk 
	Where orderstatus = @PrescriptionStatus
	And	CONVERT(date, OrderedByDate) = CONVERT(date, @PrescriptionDate) -- Between @StartDate And @EndDate
	And PO.LocationId = @LocationId
	And (PO.DeleteFlag = 0 or PO.DeleteFlag is null)
	order by Duration desc
END


GO
/****** Object:  StoredProcedure [dbo].[Pharmacy_ModifyPrescription]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pharmacy_ModifyPrescription]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Pharmacy_ModifyPrescription] AS' 
END
GO
-- =============================================
-- Author:		Joseph N	
-- Create date: <Create Date,,>
-- Description:	Modify a pharmacy prescription
-- =============================================
ALTER PROCEDURE [dbo].[Pharmacy_ModifyPrescription]
@ptn_pharmacy_pk int,   
 @Ptn_pk int,                                                
 @LocationID int,                                                
 @OrderedBy int,                                                
 @OrderedByDate datetime,                                                
 @VisitType int,                                                
 @UserID int,                                                 
 @RegimenType varchar(50),                                                
 @DispensedBy int=null,                                                
 @DispensedByDate datetime=null,                      
 @ReportedByDate datetime=null,                                              
 @OrderType int,                                                
 @Signature int,                                                
 @EmployeeID int,                                                
 @Height decimal(8,1),                                                
 @Weight numeric(8,1),                                                 
 @FDC int,                                        
 @ProgID int,                                  
 @ProviderID int,                      
 @PeriodTaken int,                    
@EditReason varchar(250),
 @flag int=null,                
 @RegimenLine int,                
 @PharmacyNotes varchar(200),              
 @AppntDate datetime=null,              
 @AppntReason int  ,
 @ModuleID int = null   
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   declare @VisitPk int;

   Select @VisitPk = VisitID From ord_PatientPharmacyOrder Where ptn_pharmacy_pk=@ptn_pharmacy_pk;

   Update ord_visit set DeleteFlag = 1, UserID=@UserId, UpdateDate = getdate() where Visit_Id=@VisitPk;
   Update dtl_PatientAppointment Set DeleteFlag =1 , UpdateUserId=@UserID, UpdateDate=getdate() where Visit_pk=@VisitPk;
   update dtl_RegimenMap Set DeleteFlag=1, UserId=@UserID, UpdateDate =getdate() where  dtl_RegimenMap.Visit_Pk=@VisitPk
   update ord_PatientPharmacyOrder set DeleteFlag = 1 where ptn_pharmacy_pk =@ptn_pharmacy_pk;
   Delete from [dtl_PatientVitals] where Visit_pk=@VisitPk;
   --- insert a new order
   Declare @NewPrescriptionPk int,@NewVisitPk int ,@RegimenId int,@ARTStartDate datetime     ;

	Select @RegimenType = Nullif(Ltrim(Rtrim(@RegimenType)), '');

	                                               
		Insert Into ord_Visit (
			Ptn_pk,
			LocationID,
			VisitDate,
			VisitType,
			UserID,
			Createdate,
			DataQuality,
			ModuleID)
		Values (
			@Ptn_pk, 
			@LocationID, 
			@OrderedByDate, 
			@VisitType, 
			@UserID, 
			Getdate(), 
			1,
			@ModuleID);		
		Set @NewVisitPk =SCOPE_IDENTITY();

		Insert Into dbo.ord_PatientPharmacyOrder (
			Ptn_pk,
			VisitID,
			LocationID,
			OrderedBy,
			OrderedByDate,
			DispensedBy,
			DispensedByDate,
			OrderType,
			Height,
			Weight,
			FDC,
			ProgID,
			Signature,
			EmployeeID,
			UserID,
			CreateDate,
			ProviderID,
			PharmacyPeriodTaken,
			Regimenline,
			PharmacyNotes)
		Values (
			@Ptn_pk, 
			@NewVisitPk, 
			@LocationID, 
			@OrderedBy, 
			@OrderedByDate, 
			@DispensedBy, 
			@DispensedByDate, 
			@OrderType, 
			@Height, 
			@Weight, 
			@FDC, 
			@ProgID, 
			@Signature, 
			@EmployeeID, 
			@UserID, 
			Getdate(), 
			@ProviderID, 
			@PeriodTaken, 
			@RegimenLine, 
			@PharmacyNotes);
		Set @NewPrescriptionPk =SCOPE_IDENTITY();

		If Not Exists (Select	1	From [dtl_PatientVitals]	Where Visit_pk = @NewVisitPk	And ptn_pk = @Ptn_pk) Begin
			Insert Into [dtl_PatientVitals] (
				[Ptn_pk],
				[LocationID],
				[Visit_pk],
				[Height],
				[Weight],
				[UserID],
				[CreateDate])
			Values (
				@Ptn_pk, 
				@LocationID, 
				@NewVisitPk, 
				@Height, 
				@Weight, 
				@UserID, 
				Getdate());
		End
		Update ord_PatientPharmacyOrder Set
			ReportingID = (Select Right('000000' + Convert(varchar, @NewPrescriptionPk), 6)),
			OrderStatus = (Case when @DispensedByDate Is Not Null And @DispensedBy > 0 Then 2 ELse orderstatus End)
		Where ptn_pharmacy_pk =@NewPrescriptionPk;

		

		If (@AppntDate Is Not Null Or Year(@AppntDate) != '1900') Begin
			Insert Into dtl_patientappointment (
				Ptn_pk,
				Visit_pk,
				LocationID,
				AppDate,
				AppReason,
				AppStatus,
				EmployeeId,
				DeleteFlag,
				UserId,
				CreateDate,
				ModuleId)
			Values (
				@Ptn_pk, 
				@NewVisitPk, 
				@LocationID, 
				@AppntDate, 
				@AppntReason, 
				12, 
				@EmployeeID, 
				0, 
				@UserID, 
				Getdate(),
				@ModuleID);
		End

		
		If(@RegimenType Is Not Null) Begin	
			Insert Into dtl_RegimenMap (
				Ptn_Pk,
				LocationID,
				Visit_Pk,
				RegimenType,
				OrderId,
				UserID,
				CreateDate)
			Values (
				@Ptn_pk, 
				@LocationID, 
				@NewVisitPk, 
				@RegimenType, 
				@NewPrescriptionPk, 
				@UserID, 
				Getdate());
		End
		Select @ARTStartDate = dbo.fn_GetPatientARTStartDate_constella(@Ptn_pk);
		Update mst_Patient Set
			ARTStartDate = @ARTStartDate
		Where ptn_pk = @Ptn_pk;

		Insert Into AuditTracker_PharmacyOrder (
			OriginalPharmacyPk
		   ,CurrentPharmacyPk
		   ,UserId
		   ,CreateDate
		   ,Justification)
		Values (
			@ptn_pharmacy_pk
		   ,@NewPrescriptionPk
		   ,@UserID
		   ,getdate()
		   ,@EditReason)

		Select @NewPrescriptionPk;
	
	
END

GO
/****** Object:  StoredProcedure [dbo].[Pharmacy_SaveUpdateRegistration]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pharmacy_SaveUpdateRegistration]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Pharmacy_SaveUpdateRegistration] AS' 
END
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[Pharmacy_SaveUpdateRegistration] 
	-- Add the parameters for the stored procedure here
	@firstName varchar(100) = null,
	@middleName varchar(100) = null,
	@lastName varchar(100) = null,
	@patientEnrollmentID varchar(50) = null,
	@DOB datetime = null,
	@gender int = null,
	@locationID int = null,
	@regDate datetime = null,
	@userID int = null,
	@serviceId int = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Declare @SymKey varchar(400) ;
	declare @ptn_pk int                                                             
	
	
    -- Insert statements for procedure here
		Insert Into mst_Patient (
				Status
		   ,	FirstName
		   ,	MiddleName
		   ,	LastName
		   ,	PatientEnrollmentID
		   ,	LocationID
		   ,	RegistrationDate
		   ,	Sex
		   ,	DOB
		   ,	UserID
		   ,	CreateDate
		   ,	RegisteredAtPharmacy
		   ,	ServiceRegisteredForAtPharmacy)
		Values (
				'0'
		   ,	encryptbykey(key_guid('Key_CTC'), @firstName)
		   ,	encryptbykey(key_guid('Key_CTC'), @middleName)
		   ,	encryptbykey(key_guid('Key_CTC'), @lastName)
		   ,	@patientEnrollmentID
		   ,	@locationID
		   ,	@regDate
		   ,	@gender
		   ,	@DOB
		   ,	@userID
		   ,	getdate()
		   ,	1
		   ,	@serviceId);

	Select @ptn_pk = SCOPE_IDENTITY();
	
	
END

GO
/****** Object:  StoredProcedure [dbo].[Pharmacy_SearchAllRegisteredPatients]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pharmacy_SearchAllRegisteredPatients]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Pharmacy_SearchAllRegisteredPatients] AS' 
END
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[Pharmacy_SearchAllRegisteredPatients] 
	@fname varchar(50) = null,
	@mname varchar(50) = null,
	@lname varchar(50) = null,
	@patientid varchar(50) = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Select Ptn_Pk
	  ,	   convert(varchar(50), decryptbykey(FirstName))							 fname
	  ,	   convert(varchar(50), decryptbykey(MiddleName))							 mname
	  ,	   convert(varchar(50), decryptbykey(LastName))								 lname
	  ,	   PatientEnrollmentID
	  ,	   cast(round(datediff(Hour, DOB, getdate()) / 8766.0, 2) As numeric(18, 2)) age
	  ,	   b.name																	 gender
	  ,	   c.name																	 [service]
	From mst_patient a
	Left Join mst_decode b On a.sex = b.id
	Left Join mst_decode c On a.ServiceRegisteredForAtPharmacy = c.id
	Where RegisteredAtPharmacy = 1 
	and convert(varchar(50), decryptbykey(FirstName)) like '%' + @fname + '%'
	and convert(varchar(50), decryptbykey(MiddleName)) like '%' + @mname + '%'
	and convert(varchar(50), decryptbykey(LastName)) like '%' + @lname + '%'
	and PatientEnrollmentID like '%' + @patientid + '%'
	
END

GO
/****** Object:  StoredProcedure [dbo].[pr_Admin_GetRegimenGeneric_Constella]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pr_Admin_GetRegimenGeneric_Constella]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[pr_Admin_GetRegimenGeneric_Constella] AS' 
END
GO
ALTER procedure [dbo].[pr_Admin_GetRegimenGeneric_Constella]        
@RegimenID int        
as        
Begin        
 select r.RegimenID,r.RegimenName,r.RegimenCode,r.stage,r.SRNo,r.userID
 ,l.GenericID,g.GenericName,GenericAbbrevation
 ,(Case r.deleteflag when 0 then 'Active' when 1 then 'In-Active' end) [Status] 
 from mst_regimen r        
 inner join lnk_RegimenGeneric l on l.RegimenID=r.RegimenID        
 inner join mst_Generic g on l.GenericID=g.GenericID        
 where r.RegimenID=@RegimenID    
         
End
GO
/****** Object:  StoredProcedure [dbo].[pr_Admin_SaveRegimenGeneric_Constella]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pr_Admin_SaveRegimenGeneric_Constella]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[pr_Admin_SaveRegimenGeneric_Constella] AS' 
END
GO
ALTER procedure [dbo].[pr_Admin_SaveRegimenGeneric_Constella]                
@RegimenName varchar(50),               
@RegimenCode varchar(50),              
@SRNo int,               
@Rid int=null,                
@Stage varchar(50),                
@UserID int,                
@Status int,                
@GenericID varchar(1000),                
@flag int=null                
as                
Begin                
  if(@flag='1')                
  begin                
   print(1)                
   declare @RegimenID int                
   declare @tempGenericCount int                
   declare @Index int                
   declare @tempGenericID int                
                   
   BEGIN TRANSACTION              
    if exists(Select * from mst_Regimen)             
	 Begin            
	  Select @SRNO=MAX(SRNo) from mst_Regimen             
	 End              
                 
   if (@SRNO IS NULL)               
   Begin              
    insert into mst_Regimen(RegimenName,RegimenCode,Stage,SRNo,UserID,CreateDate,DeleteFlag)values(@RegimenName,@RegimenCode,@Stage,@SRNo,@UserID,getdate(),@Status)              
   End              
   else              
   Begin              
    insert into mst_Regimen(RegimenName,RegimenCode,Stage,SRNo,UserID,CreateDate,DeleteFlag)values(@RegimenName,@RegimenCode,@Stage,@SRNo+1,@UserID,getdate(),@Status)              
   End              
                  
   set @RegimenID=ident_current('mst_Regimen')                
   select @tempGenericCount = count(*) from dbo.fnParseDelimitedList(@GenericID,',')                
   print(@tempGenericCount)  
   set @Index = 1;                
   while @Index <= @tempGenericCount                
    begin                
     set @tempGenericID = dbo.fnGetParmTilte(@Index,@GenericID)                    
     print(@tempGenericID)                
     insert into lnk_RegimenGeneric(RegimenID,GenericID,CreateDate,UserID,DeleteFlag)                 
     values(@RegimenID,@tempGenericID,getDate(),@UserID,@Status)                
     set @Index = @Index+1;                
    End                
   if @@ERROR > 0                
    BEGIN                
     rollback transaction                
    END                
   else                
    begin                
     COMMIT TRANSACTION                
                     
    end                
  end                
  if(@flag='2')                
  begin                
         --start      
     delete lnk_RegimenGeneric where RegimenID=@Rid    
     select @tempGenericCount = count(*) from dbo.fnParseDelimitedList(@GenericID,',')                
     set @Index = 1;                
     while @Index <= @tempGenericCount                
	   begin                
		 set @tempGenericID = dbo.fnGetParmTilte(@Index,@GenericID)                    
		 print(@tempGenericID)                
		 insert into lnk_RegimenGeneric(RegimenID,GenericID,CreateDate,UserID,DeleteFlag)                 
		 values(@Rid,@tempGenericID,getDate(),@UserID,@Status)                
		 set @Index = @Index+1;                
	   End      
   --end        
  if(@Status = 0)                
  begin                
     Declare @MaxSRNO int 
	 Select top 1 @MaxSRNO = SRNo from mst_Regimen  order by SRNo desc                
     Declare @NewSeq int                
     if(@MaxSRNO < @SRNO)                
	   begin                
		set @NewSeq = @MaxSRNO+1                
	   end                
     else                
	   begin                
		set @NewSeq = @SRNO                
	   end 
	                 
     Declare @OldSeq int 
	 select @OldSeq = SRNO from mst_Regimen where RegimenID=@Rid               
     if(@OldSeq = 0 or @OldSeq is null)                
		begin                
		   Declare @MaxSeq int                         
           Select top 1 @MaxSeq = SRNO from mst_Regimen order by SRNO desc                          
           if(isnull(@MaxSeq,0)=0)                        
              begin                         
                set @NewSeq=1                        
              end   
		   update mst_Regimen set SRNO = @SRNO + 1 where RegimenID=@Rid and SRNO >= @NewSeq                
		   update mst_Regimen                
		   set                
		   RegimenCode=@RegimenCode,        
		   SRNo=@NewSeq,       
		   Stage=@Stage,                
		   DeleteFlag=@Status                
		   where RegimenID=@Rid                  
	   end                
		 else if(@OldSeq = @NewSeq)                
	   begin                
		   update mst_Regimen                
		   set       
		   RegimenCode=@RegimenCode,        
		   SRNo=@NewSeq,        
		   Stage=@Stage,             
		   DeleteFlag=@Status                
		   where RegimenID=@Rid               
	   end                 
   else if(@OldSeq < @NewSeq)                
   begin                
	   update mst_Regimen  set SRNO = @SRNO - 1 where SRNo > @OldSeq and SRNo <=@NewSeq                 
	   update mst_Regimen                
		   set                
		   RegimenCode=@RegimenCode,        
		   SRNo=@NewSeq,      
		   Stage=@Stage,          
		   DeleteFlag=@Status                
		   where RegimenID=@Rid               
   end                
   else if(@OldSeq > @NewSeq)                
     begin                
		 update mst_Regimen set SRNO = @SRNO + 1 where SRNo <@OldSeq and SRNo >= @NewSeq                   
		 update mst_Regimen                
		   set          
		   RegimenCode=@RegimenCode,        
		   SRNo=@NewSeq,      
		   Stage=@Stage,                    
		   DeleteFlag=@Status                
		   where RegimenID=@Rid                
		 end                 
     end                
   else                
     begin                
	   select @OldSeq = SRNo from mst_Regimen where RegimenID=@Rid                  
	   update mst_Regimen set SRNo = SRNo -1 where SRNo > @OldSeq and RegimenID=@Rid                  
	   update mst_Regimen set SRNo = null,Stage=@Stage,DeleteFlag =@Status where RegimenID=@Rid                  
     end         
          
   end                
End
GO
/****** Object:  StoredProcedure [dbo].[pr_Admin_SaveTBRegimenGeneric_Constella]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pr_Admin_SaveTBRegimenGeneric_Constella]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[pr_Admin_SaveTBRegimenGeneric_Constella] AS' 
END
GO
ALTER procedure [dbo].[pr_Admin_SaveTBRegimenGeneric_Constella]                            
@RegimenName varchar(50),                                           
@SRNo int,                           
@Rid int=null,                            
@TreatmentTime int,                            
@UserID int,                            
@Status int,                            
@GenericID varchar(1000),                            
@flag int=null                            
as                            
Begin                            
  if(@flag='1')                            
  begin                            
   print(1)                            
   declare @RegimenID int                            
   declare @tempGenericCount int                            
   declare @Index int                            
   declare @tempGenericID int                            
                               
   BEGIN TRANSACTION                          
    if not exists(Select * from mst_TBRegimen where SRNo=@SRNO)                         
  Begin                        
   Select @SRNO=MAX(SRNo) from mst_TBRegimen     
   insert into mst_TBRegimen(Name,TreatmentTime,SRNo,UserID,CreateDate,DeleteFlag)values(@RegimenName,@TreatmentTime,@SRNo+1,@UserID,getdate(),@Status)                         
  End                          
                        
   else                          
   Begin     
 update mst_TBRegimen set SRNO=SRNO+1 where SRNO>=@SRNO                         
    insert into mst_TBRegimen(Name,TreatmentTime,SRNo,UserID,CreateDate,DeleteFlag)values(@RegimenName,@TreatmentTime,@SRNo,@UserID,getdate(),@Status)                          
   End                          
                              
   set @RegimenID=ident_current('mst_TBRegimen')                            
   select @tempGenericCount = count(*) from dbo.fnParseDelimitedList(@GenericID,',')                            
   print(@tempGenericCount)              
   set @Index = 1;                            
   while @Index <= @tempGenericCount                            
    begin                            
     set @tempGenericID = dbo.fnGetParmTilte(@Index,@GenericID)                                
     print(@tempGenericID)                            
     insert into lnk_TBRegimenGeneric(TBRegimenID,GenericID,CreateDate,UserID,DeleteFlag)                             
     values(@RegimenID,@tempGenericID,getDate(),@UserID,@Status)                            
     set @Index = @Index+1;                            
    End                            
   if @@ERROR > 0                            
    BEGIN                            
     rollback transaction                            
    END                            
   else                            
    begin                            
     COMMIT TRANSACTION                            
                                 
    end                            
  end            
                        
  if(@flag='2')                            
  begin               
         --start                  
     delete lnk_TBRegimenGeneric where TBRegimenID=@Rid                
     select @tempGenericCount = count(*) from dbo.fnParseDelimitedList(@GenericID,',')                            
     set @Index = 1;                            
     while @Index <= @tempGenericCount                            
    begin                            
   set @tempGenericID = dbo.fnGetParmTilte_new(@Index,@GenericID)                                
   --print(@tempGenericID)                            
   insert into lnk_TBRegimenGeneric(TBRegimenID,GenericID,CreateDate,UserID,DeleteFlag)                             
   values(@Rid,@tempGenericID,getDate(),@UserID,@Status)                            
   set @Index = @Index+1;                            
    End                  
   --end          
                  
  if(@Status = 0)                            
  begin                            
     Declare @MaxSRNO int             
  Select top 1 @MaxSRNO = SRNo from mst_TBRegimen  order by SRNo desc                            
     Declare @NewSeq int                            
     if(@MaxSRNO < @SRNO)                            
  begin                       
  set @NewSeq = @MaxSRNO+1                            
  end         
     else                            
  begin                            
  set @NewSeq = @SRNO                            
  end          
        
        
  Declare @OldSeq int             
  select @OldSeq = SRNO from mst_TBRegimen where ID=@Rid                           
  if(@OldSeq = 0 or @OldSeq is null)                            
  Begin                 
  update mst_TBRegimen set SRNO = @SRNO + 1 where ID=@Rid and SRNO >= @NewSeq                            
     update mst_TBRegimen                            
  set                            
   SRNo=@SRNO,                   
   TreatmentTime=@TreatmentTime,                            
   DeleteFlag=@Status                            
   where ID=@Rid                              
  end             
          
  else if(@OldSeq = @NewSeq)                            
   begin                            
   update mst_TBRegimen                            
   set                   
   SRNo=@NewSeq,                    
   TreatmentTime=@TreatmentTime,                     
   DeleteFlag=@Status                            
   where ID=@Rid                           
  end           
        
    else if(@OldSeq < @NewSeq)                            
    begin                            
     update mst_TBRegimen  set SRNO = @SRNO - 1 where SRNo > @OldSeq and SRNo <=@NewSeq                             
     update mst_TBRegimen                            
      set                            
      SRNo=@NewSeq,                  
      TreatmentTime=@TreatmentTime,                       
      DeleteFlag=@Status                            
      where ID=@Rid                           
    end                     
        
    else if(@OldSeq > @NewSeq)                            
      begin                            
     update mst_TBRegimen set SRNO = SRNO + 1 where SRNo <@OldSeq and SRNo >= @NewSeq                               
     update mst_TBRegimen                            
      set                      
      SRNo=@NewSeq,                  
      TreatmentTime=@TreatmentTime,                                
      DeleteFlag=@Status                            
      where ID=@Rid                            
    end                             
end                                             
              else                                                
                begin                  
    select @OldSeq = SRNo from mst_Regimen where RegimenID=@Rid                              
    update mst_TBRegimen set SRNo = SRNo -1 where SRNo > @OldSeq and ID=@Rid                              
    update mst_TBRegimen set SRNo = null,TreatmentTime=@TreatmentTime,DeleteFlag =@Status where ID=@Rid                           
         end        
             
   end                            
End
GO
/****** Object:  StoredProcedure [dbo].[pr_Clinical_FindItemByName]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pr_Clinical_FindItemByName]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[pr_Clinical_FindItemByName] AS' 
END
GO

-- =============================================
-- Author:		Joseph Njung'e
-- Create date: 13 June 2014
-- Description:	Search for items by name
-- =============================================
ALTER PROCEDURE [dbo].[pr_Clinical_FindItemByName] 
	-- Add the parameters for the stored procedure here
	@SearchText varchar(15)  
AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;

-- Insert statements for procedure here
If ltrim(rtrim(@SearchText)) <> '' Select @SearchText = '%' + @SearchText + '%';

Select	I.Item_PK ItemID,
		I.ItemName,
		I.ItemTypeID,
		0 SellingPrice,
		'Pharmaceuticals' ItemTypeName	
From dbo.Mst_Consumables I
Where I.ItemName Like @SearchText
	And I.DeleteFlag = 0 
	Union All 
Select	I.Item_PK ItemId,
		I.ItemName,
		I.ItemTypeID,
		0 SellingPrice,
		'Billables' ItemTypeName
From Mst_ItemMaster I
	Inner Join Mst_ItemType T On I.ItemTypeID = T.ItemTypeID
Where I.ItemName Like @SearchText
	And T.ItemName = 'Billables'
	And I.DeleteFlag = 0


End
GO

/****** Object:  StoredProcedure [dbo].[pr_Pharmacy_FindDrugByName]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pr_Pharmacy_FindDrugByName]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[pr_Pharmacy_FindDrugByName] AS' 
END
GO

-- =============================================
-- Author:		Joseph Njung'e
-- Create date: July 21 2015
-- Description:	Search Drugs. If PM?SCM is on, show available quatity in the dispensing stores only
-- =============================================
ALTER PROCEDURE [dbo].[pr_Pharmacy_FindDrugByName] 
	-- Add the parameters for the stored procedure here
	@SearchText varchar(50) = null, 
	@CheckQuantity bit = 0,
	@ExcludeDrugType int = Null
AS
Begin
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	If Ltrim(Rtrim(@SearchText)) <> '' Select @SearchText = '%' + @SearchText + '%';
	
	If(@ChecKQuantity = 1) Begin
		Select	D.Drug_pk,
			Convert(varchar(100), D.DrugName) As Drugname,
			Isnull(Convert(varchar, Sum(ST.Quantity)), 0) As QTY
		From Dtl_StockTransaction As ST
		Inner Join
			Mst_Store As S On S.Id = ST.StoreId		And S.DispensingStore = 1
		Right Outer Join
			Mst_Drug As D On D.Drug_pk = ST.ItemId 
		Where (D.DrugName Like @SearchText)
		And D.DeleteFlag = 0
		And Case When @ExcludeDrugType Is Null Then 1
				 When dbo.fn_GetDrugTypeId_futures (D.Drug_pk) = @ExcludeDrugType Then 0
				 Else 1
			End = 1
		Group By	D.Drug_pk,	D.DrugName;		
	End
	Else Begin
		Select Drug_pk,
			DrugName 
		From Mst_Drug D 
		Where DeleteFlag=0 And 
		DrugName LIKE @SearchText
		And Case When @ExcludeDrugType Is Null Then 1
				 When dbo.fn_GetDrugTypeId_futures (D.Drug_pk) = @ExcludeDrugType Then 0
				 Else 1
			End = 1
	End
End

GO
/****** Object:  StoredProcedure [dbo].[pr_Record_CreatePatientRevisit]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pr_Record_CreatePatientRevisit]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[pr_Record_CreatePatientRevisit] AS' 
END
GO


-- =============================================
-- Author:		Joseph Njung'e
-- Create date: 29 Jul 2015
-- Description:	Create a revisit
-- =============================================
ALTER PROCEDURE [dbo].[pr_Record_CreatePatientRevisit] 
	-- Add the parameters for the stored procedure here
	@PatientID int,
	@LocationID Int,
	@VisitDate datetime , 
	@VisitTypeName varchar(50) = 'Revisit',
	@RevistHrsAllowance int =24,
	@ModuleID int,
	@UserID int 
	
AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;
Declare @VisitTypeID int, @LeastVisitDate datetime;

Select @LeastVisitDate = Dateadd(Hour, -@RevistHrsAllowance, @VisitDate);

	If Not Exists (Select 1	From mst_VisitType	Where VisitName = @VisitTypeName And DeleteFlag = 0) Begin
		Return;
	End

	Select @VisitTypeID = VisitTypeID
	From mst_VisitType
	Where VisitName = @VisitTypeName
	And DeleteFlag = 0;

	If Exists (Select 1	From ord_Visit	Where VisitType = @VisitTypeID	And DeleteFlag = 0	And Ptn_PK = @PatientID And VisitDate Between @LeastVisitDate And @VisitDate) Begin
		Return;
	End

	Insert Into ord_Visit (
		Ptn_PK,
		LocationID,
		VisitDate,
		VisitType,
		DataQuality,
		DeleteFlag,
		UserID,
		CreateDate,
		ModuleID,
		CreatedBy)
	Values (
		@PatientID,
		@LocationID,
		@VisitDate,
		@VisitTypeID,
		1,
		0,
		@UserID,
		Getdate(),
		@ModuleID,
		@UserID );

End


GO
/****** Object:  StoredProcedure [dbo].[pr_Record_GetPatientRevisit]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pr_Record_GetPatientRevisit]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[pr_Record_GetPatientRevisit] AS' 
END
GO

-- =============================================
-- Author:		Joseph Njung'e
-- Create date: 29 Jul 2015
-- Description:	Create a revisit
-- =============================================
ALTER PROCEDURE [dbo].[pr_Record_GetPatientRevisit] 
	-- Add the parameters for the stored procedure here
	@PatientID int,
	@LocationID Int,
	@GetLastVisit bit =0
	
AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
	Set Nocount On;
	Set Rowcount 0;
	If(@GetLastVisit = 1) Set Rowcount  1
	
	
	Select	O.Visit_Id,
			O.Ptn_Pk,
			O.LocationID,
			O.VisitDate,
			O.VisitType,
			O.DataQuality,
			O.DeleteFlag,
			O.UserID,
			O.CreateDate,
			O.CreatedBy,
			O.ModuleID,
			M.ModuleName,
			V.VisitName
	From ord_Visit As O
	Inner Join
		mst_VisitType As V On O.VisitType = V.VisitTypeID
	Inner Join mst_Module M On M.ModuleID = O.ModuleID
	Where (O.Ptn_Pk = @PatientID)
	And (O.LocationID = @LocationID)
	And (O.DeleteFlag = 0)
	And (V.VisitName = 'Revisit') Order By VisitDate desc;

End

GO
/****** Object:  StoredProcedure [dbo].[pr_Reports_GetARVRegimenforAdultandChild_Constella]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pr_Reports_GetARVRegimenforAdultandChild_Constella]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[pr_Reports_GetARVRegimenforAdultandChild_Constella] AS' 
END
GO
--sp_helptext pr_Reports_GetARVRegimenforAdultandChild_Constella  
    
ALTER procedure [dbo].[pr_Reports_GetARVRegimenforAdultandChild_Constella]                                                                                        
 @StartDate DateTime,                                                                                
 @EndDate DateTime,                                                                    
 @LocationID int                                                                                
                                                                                 
as                                                                                        
Begin                                                                                  
SET NOCOUNT ON;                              
                            
select FacilityId,FacilityName from mst_Facility where FacilityId = @LocationId                            
-------------Age 0-1 (Age>0 and <2)-------------------------------------------------------------------                                                                                
    
select d.RegimenCode,d.Stage,c.regimentype, count(distinct a.ptn_pk) [Ptn_Count] from mst_patient a                               
Inner Join ord_patientpharmacyorder b on a.ptn_pk = b.ptn_pk                               
Inner Join dtl_regimenmap c on a.ptn_pk = c.ptn_pk and b.ptn_pharmacy_pk = c.orderid          
Left Outer Join mst_regimen d on d.RegimenName = RegimenType and c.regimenid = d.regimenid                               
where a.LocationID=@LocationID and a.status = 0 and (a.deleteflag is null or a.deleteflag = 0) and                              
b.dispensedbydate >= @StartDate and b.dispensedbydate <=@EndDate                               
and b.dispensedbydate in (select max(dispensedbydate) from ord_patientpharmacyorder x,dtl_regimenmap y  
where  x.ptn_pharmacy_pk = y.orderid and x.ptn_pk = a.ptn_pk and x.dispensedbydate >= @StartDate and   
x.dispensedbydate <=@EndDate  and (x.deleteflag is null or x.deleteflag = 0))                              
and datediff(dd,a.dob,b.dispensedbydate)/365>=0 and datediff(dd,a.dob,b.dispensedbydate)/365<2                            
group by d.RegimenCode,d.Stage,c.regimentype    
    
union    
    
select d.RegimenCode,d.Stage,c.regimentype, count(distinct a.ptn_pk) [Ptn_Count] from mst_patient a                               
Inner Join ord_patientpharmacyorder b on a.ptn_pk = b.ptn_pk                               
Inner Join dtl_regimenmap c on a.ptn_pk = c.ptn_pk and b.ptn_pharmacy_pk = c.orderid          
Inner Join dtl_patientcareended e on a.ptn_pk = e.ptn_pk                              
Left Outer Join mst_regimen d on d.RegimenName = RegimenType and c.regimenid = d.regimenid                               
where a.LocationID=@LocationID and a.status = 1 and e.careended = 1 and e.PatientExitReason in (91,92)    
and e.careendedid in (select max(careendedid) from dtl_patientcareended where ptn_pk = a.ptn_pk and careended = 1)    
and (a.deleteflag is null or a.deleteflag = 0) and                              
b.dispensedbydate >= @StartDate and b.dispensedbydate <=@EndDate                               
and b.dispensedbydate in (select max(dispensedbydate) from ord_patientpharmacyorder x,dtl_regimenmap y  
where  x.ptn_pharmacy_pk = y.orderid and x.ptn_pk = a.ptn_pk and x.dispensedbydate >= @StartDate and   
x.dispensedbydate <=@EndDate  and (x.deleteflag is null or x.deleteflag = 0))                                
and datediff(dd,a.dob,b.dispensedbydate)/365>=0 and datediff(dd,a.dob,b.dispensedbydate)/365<2                              
group by d.RegimenCode,d.Stage,c.regimentype                     
                                                                      
                              
-------------Age 2-4 (Age >=2 and <5)-------------------------------------------------------------------                                                                                
     
select d.RegimenCode,d.Stage,c.regimentype, count(distinct a.ptn_pk) [Ptn_Count] from mst_patient a                               
Inner Join ord_patientpharmacyorder b on a.ptn_pk = b.ptn_pk                               
Inner Join dtl_regimenmap c on a.ptn_pk = c.ptn_pk and b.ptn_pharmacy_pk = c.orderid          
Left Outer Join mst_regimen d on d.RegimenName = RegimenType and c.regimenid = d.regimenid                               
where a.LocationID=@LocationID and a.status = 0 and (a.deleteflag is null or a.deleteflag = 0) and                              
b.dispensedbydate >= @StartDate and b.dispensedbydate <=@EndDate                               
and b.dispensedbydate in (select max(dispensedbydate) from ord_patientpharmacyorder x,dtl_regimenmap y  
where  x.ptn_pharmacy_pk = y.orderid and x.ptn_pk = a.ptn_pk and x.dispensedbydate >= @StartDate and   
x.dispensedbydate <=@EndDate  and (x.deleteflag is null or x.deleteflag = 0))                                
and datediff(dd,a.dob,b.dispensedbydate)/365>=2 and datediff(dd,a.dob,b.dispensedbydate)/365<5                             
group by d.RegimenCode,d.Stage,c.regimentype    
    
union    
    
select d.RegimenCode,d.Stage,c.regimentype, count(distinct a.ptn_pk) [Ptn_Count] from mst_patient a                               
Inner Join ord_patientpharmacyorder b on a.ptn_pk = b.ptn_pk                               
Inner Join dtl_regimenmap c on a.ptn_pk = c.ptn_pk and b.ptn_pharmacy_pk = c.orderid          
Inner Join dtl_patientcareended e on a.ptn_pk = e.ptn_pk                              
Left Outer Join mst_regimen d on d.RegimenName = RegimenType and c.regimenid = d.regimenid                               
where a.LocationID=@LocationID and a.status = 1 and e.careended = 1 and e.PatientExitReason in (91,92)    
and e.careendedid in (select max(careendedid) from dtl_patientcareended where ptn_pk = a.ptn_pk and careended = 1)    
and (a.deleteflag is null or a.deleteflag = 0) and                              
b.dispensedbydate >= @StartDate and b.dispensedbydate <=@EndDate                               
and b.dispensedbydate in (select max(dispensedbydate) from ord_patientpharmacyorder x,dtl_regimenmap y  
where  x.ptn_pharmacy_pk = y.orderid and x.ptn_pk = a.ptn_pk and x.dispensedbydate >= @StartDate and   
x.dispensedbydate <=@EndDate  and (x.deleteflag is null or x.deleteflag = 0))                               
and datediff(dd,a.dob,b.dispensedbydate)/365>=2 and datediff(dd,a.dob,b.dispensedbydate)/365<5                             
group by d.RegimenCode,d.Stage,c.regimentype                     
                                                             
                
-------------Age 5-15 (Age >=5 and <15)-------------------------------------------------------------------                                                                                
     
select d.RegimenCode,d.Stage,c.regimentype, count(distinct a.ptn_pk) [Ptn_Count] from mst_patient a                               
Inner Join ord_patientpharmacyorder b on a.ptn_pk = b.ptn_pk                               
Inner Join dtl_regimenmap c on a.ptn_pk = c.ptn_pk and b.ptn_pharmacy_pk = c.orderid          
Left Outer Join mst_regimen d on d.RegimenName = RegimenType and c.regimenid = d.regimenid                               
where a.LocationID=@LocationID and a.status = 0 and (a.deleteflag is null or a.deleteflag = 0) and                              
b.dispensedbydate >= @StartDate and b.dispensedbydate <=@EndDate                               
and b.dispensedbydate in (select max(dispensedbydate) from ord_patientpharmacyorder x,dtl_regimenmap y  
where  x.ptn_pharmacy_pk = y.orderid and x.ptn_pk = a.ptn_pk and x.dispensedbydate >= @StartDate and   
x.dispensedbydate <=@EndDate  and (x.deleteflag is null or x.deleteflag = 0))                                
and datediff(dd,a.dob,b.dispensedbydate)/365>=5 and datediff(dd,a.dob,b.dispensedbydate)/365<15                             
group by d.RegimenCode,d.Stage,c.regimentype    
    
union    
    
select d.RegimenCode,d.Stage,c.regimentype, count(distinct a.ptn_pk) [Ptn_Count] from mst_patient a                               
Inner Join ord_patientpharmacyorder b on a.ptn_pk = b.ptn_pk                            
Inner Join dtl_regimenmap c on a.ptn_pk = c.ptn_pk and b.ptn_pharmacy_pk = c.orderid          
Inner Join dtl_patientcareended e on a.ptn_pk = e.ptn_pk                              
Left Outer Join mst_regimen d on d.RegimenName = RegimenType and c.regimenid = d.regimenid                               
where a.LocationID=@LocationID and a.status = 1 and e.careended = 1 and e.PatientExitReason in (91,92)    
and e.careendedid in (select max(careendedid) from dtl_patientcareended where ptn_pk = a.ptn_pk and careended = 1)    
and (a.deleteflag is null or a.deleteflag = 0) and                              
b.dispensedbydate >= @StartDate and b.dispensedbydate <=@EndDate                               
and b.dispensedbydate in (select max(dispensedbydate) from ord_patientpharmacyorder x,dtl_regimenmap y  
where  x.ptn_pharmacy_pk = y.orderid and x.ptn_pk = a.ptn_pk and x.dispensedbydate >= @StartDate and   
x.dispensedbydate <=@EndDate  and (x.deleteflag is null or x.deleteflag = 0))                               
and datediff(dd,a.dob,b.dispensedbydate)/365>=5 and datediff(dd,a.dob,b.dispensedbydate)/365<15                              
group by d.RegimenCode,d.Stage,c.regimentype                     
                                              
                              
-------------Age>15 --------------------------------------------------------------------------                                                                                
     
    
select d.RegimenCode,d.Stage,c.regimentype, count(distinct a.ptn_pk) [Ptn_Count] from mst_patient a                               
Inner Join ord_patientpharmacyorder b on a.ptn_pk = b.ptn_pk                               
Inner Join dtl_regimenmap c on a.ptn_pk = c.ptn_pk and b.ptn_pharmacy_pk = c.orderid          
Left Outer Join mst_regimen d on d.RegimenName = RegimenType and c.regimenid = d.regimenid                               
where a.LocationID=@LocationID and a.status = 0 and (a.deleteflag is null or a.deleteflag = 0) and                              
b.dispensedbydate >= @StartDate and b.dispensedbydate <=@EndDate                               
and b.dispensedbydate in (select max(dispensedbydate) from ord_patientpharmacyorder x,dtl_regimenmap y  
where  x.ptn_pharmacy_pk = y.orderid and x.ptn_pk = a.ptn_pk and x.dispensedbydate >= @StartDate and   
x.dispensedbydate <=@EndDate  and (x.deleteflag is null or x.deleteflag = 0))                                
and datediff(dd,a.dob,b.dispensedbydate)/365>15                              
group by d.RegimenCode,d.Stage,c.regimentype    
    
union    
    
select d.RegimenCode,d.Stage,c.regimentype, count(distinct a.ptn_pk) [Ptn_Count] from mst_patient a                               
Inner Join ord_patientpharmacyorder b on a.ptn_pk = b.ptn_pk                               
Inner Join dtl_regimenmap c on a.ptn_pk = c.ptn_pk and b.ptn_pharmacy_pk = c.orderid          
Inner Join dtl_patientcareended e on a.ptn_pk = e.ptn_pk                              
Left Outer Join mst_regimen d on d.RegimenName = RegimenType and c.regimenid = d.regimenid                               
where a.LocationID=@LocationID and a.status = 1 and e.careended = 1 and e.PatientExitReason in (91,92)    
and e.careendedid in (select max(careendedid) from dtl_patientcareended where ptn_pk = a.ptn_pk and careended = 1)    
and (a.deleteflag is null or a.deleteflag = 0) and                              
b.dispensedbydate >= @StartDate and b.dispensedbydate <=@EndDate                               
and b.dispensedbydate in (select max(dispensedbydate) from ord_patientpharmacyorder x,dtl_regimenmap y  
where  x.ptn_pharmacy_pk = y.orderid and x.ptn_pk = a.ptn_pk and x.dispensedbydate >= @StartDate and   
x.dispensedbydate <=@EndDate  and (x.deleteflag is null or x.deleteflag = 0))                                
and datediff(dd,a.dob,b.dispensedbydate)/365>15                              
group by d.RegimenCode,d.Stage,c.regimentype                     
                        
                                                                   
            
End
GO
/****** Object:  StoredProcedure [dbo].[pr_Reports_GetARVRegimenReport_Constella]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pr_Reports_GetARVRegimenReport_Constella]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[pr_Reports_GetARVRegimenReport_Constella] AS' 
END
GO
ALTER Procedure [dbo].[pr_Reports_GetARVRegimenReport_Constella]                  
  @StartDate DateTime,                                                                  
 @EndDate DateTime,                                                      
 @LocationID int=0           
AS                  
BEGIN                
SET NOCOUNT ON;          
select Convert(varchar(12), @StartDate, 106)[StartDate], @EndDate[EndDate], FacilityId,FacilityName from mst_Facility where FacilityId = @LocationId                   
 ---------------------------------------------------------------             
select d.RegimenCode,c.regimentype,count(a.ptn_pk)[Number of Visitor] from mst_patient a     
Inner Join ord_patientpharmacyorder b on a.ptn_pk = b.ptn_pk and (b.deleteflag is null or b.deleteflag = 0)     
Inner Join dtl_regimenmap c on a.ptn_pk = c.ptn_pk and b.ptn_pharmacy_pk = c.orderid    
Left Outer Join mst_regimen d on d.RegimenName = c.RegimenType and c.RegimenID = d.RegimenID      
where  a.LocationID=@LocationID and a.status = 0 and (a.deleteflag is null or a.deleteflag = 0) and 
  
b.dispensedbydate >= @StartDate and b.dispensedbydate <=@EndDate     
group by d.RegimenCode,d.Stage,c.regimentype              
                 
end
GO
/****** Object:  StoredProcedure [dbo].[pr_Scheduler_UpdateAppointmentStatus]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pr_Scheduler_UpdateAppointmentStatus]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[pr_Scheduler_UpdateAppointmentStatus] AS' 
END
GO
ALTER PROCEDURE [dbo].[pr_Scheduler_UpdateAppointmentStatus]
(@Currentdate DATETIME,
 @locationid  INT
)
AS      
     --Begin------Check in PatientMasterVisit table if record exist(excluding the records of scheduler and enrollment visit type)      ------with in grace period of appointment date then update the status to met if the       ------appointment date + grace period has gone then update the status to missed      ------seprately check the record in lab order table as the lab entries does not go into the PatientMasterVisit table      -----------------------Update Met status--------------------------      
     UPDATE PatientAppointment
       SET
           StatusId =
     (
         SELECT LookupItemId
         FROM LookupMasterItem
         WHERE DisplayName LIKE 'Met'
     ),
           StatusDate =
     (
         SELECT MIN(VisitDate)
         FROM PatientMasterVisit c
         WHERE(c.visitdate BETWEEN(PatientAppointment.AppointmentDate -
                                  (
                                      SELECT appgraceperiod
                                      FROM mst_facility
                                      WHERE facilityid = @locationid
                                  )) AND(PatientAppointment.AppointmentDate +
                                        (
                                            SELECT appgraceperiod
                                            FROM mst_facility
                                            WHERE facilityid = @locationid
                                        ) + 1))
              AND c.PatientId = PatientAppointment.PatientId
              AND c.Id <> PatientAppointment.PatientMasterVisitId
              AND visittype NOT IN(5, 0)
         AND visittype <> 0
     )
     WHERE StatusId =
     (
         SELECT LookupItemId
         FROM LookupMasterItem
         WHERE DisplayName LIKE 'Pending'
     )
           AND (deleteflag IS NULL
                OR deleteflag != 1)
           AND PatientId IN
     (
         SELECT c.PatientId
         FROM PatientMasterVisit c
         WHERE((c.visitdate BETWEEN(PatientAppointment.AppointmentDate -
                                   (
                                       SELECT appgraceperiod
                                       FROM mst_facility
                                       WHERE facilityid = @locationid
                                   )) AND(PatientAppointment.AppointmentDate +
                                         (
                                             SELECT appgraceperiod
                                             FROM mst_facility
                                             WHERE facilityid = @locationid
                                         ) + 1)))
              AND c.PatientId = PatientAppointment.PatientId
              AND c.Id <> PatientAppointment.PatientMasterVisitId
              AND visittype NOT IN(5, 0)
         AND visittype <> 0
     );
     UPDATE PatientAppointment
       SET
           StatusId =
     (
         SELECT LookupItemId
         FROM LookupMasterItem
         WHERE DisplayName LIKE 'Met'
     ),
           StatusDate =
     (
         SELECT MIN(VisitDate)
         FROM PatientMasterVisit c
         WHERE(c.visitdate BETWEEN(PatientAppointment.AppointmentDate -
                                  (
                                      SELECT appgraceperiod
                                      FROM mst_facility
                                      WHERE facilityid = @locationid
                                  )) AND(PatientAppointment.AppointmentDate +
                                        (
                                            SELECT appgraceperiod
                                            FROM mst_facility
                                            WHERE facilityid = @locationid
                                        ) + 1))
              AND c.PatientId = PatientAppointment.PatientId
              AND c.Id <> PatientAppointment.PatientMasterVisitId
              AND visittype NOT IN(5, 0)
         AND visittype <> 0
     )
     WHERE StatusId =
     (
         SELECT LookupItemId
         FROM LookupMasterItem
         WHERE DisplayName LIKE 'Pending'
     )
           AND (deleteflag IS NULL
                OR deleteflag != 1)
           AND PatientId IN
     (
         SELECT c.Ptn_Pk
         FROM ord_patientlaborder c
         WHERE((c.createdate BETWEEN(PatientAppointment.AppointmentDate -
                                    (
                                        SELECT appgraceperiod
                                        FROM mst_facility
                                        WHERE facilityid = @locationid
                                    )) AND(PatientAppointment.AppointmentDate +
                                          (
                                              SELECT appgraceperiod
                                              FROM mst_facility
                                              WHERE facilityid = @locationid
                                          ) + 1)))
              AND c.Ptn_Pk = PatientAppointment.PatientId
              AND c.locationid = @locationid
     );
     ---- -----------------------Update Missed status--------------------------      
     UPDATE PatientAppointment
       SET
           StatusId =
     (
         SELECT LookupItemId
         FROM LookupMasterItem
         WHERE DisplayName LIKE 'Missed'
     ),
           StatusDate = @Currentdate
     WHERE StatusId =
     (
         SELECT LookupItemId
         FROM LookupMasterItem
         WHERE DisplayName LIKE 'Pending'
     )
           AND (deleteflag IS NULL
                OR deleteflag != 1)
           AND PatientId IN
     (
         SELECT PatientAppointment.PatientId
         FROM PatientAppointment
         WHERE StatusId =
         (
             SELECT LookupItemId
             FROM LookupMasterItem
             WHERE DisplayName LIKE 'Pending'
         )
               AND PatientId = PatientAppointment.PatientId
               AND StatusDate = PatientAppointment.StatusDate
               AND (PatientAppointment.AppointmentDate +
                   (
                       SELECT appgraceperiod
                       FROM mst_facility
                       WHERE facilityid = @locationid
                   ) < @currentdate)
     );
     UPDATE A
       SET
           StatusId =
     (
         SELECT LookupItemId
         FROM LookupMasterItem
         WHERE DisplayName LIKE 'Care Ended'
     ),
           StatusDate = @Currentdate
     FROM Patient AS P
          INNER JOIN PatientAppointment AS A ON P.Id = A.PatientId
     WHERE(P.Active = 0)
          AND A.DeleteFlag = 0
          AND A.StatusId IN
     (
     (
         SELECT LookupItemId
         FROM LookupMasterItem
         WHERE DisplayName LIKE 'Missed'
     ),
     (
         SELECT LookupItemId
         FROM LookupMasterItem
         WHERE DisplayName LIKE 'Pending'
     )
     );
     ----update status of all those active patients(previously inactive) who have careended appointments, to missed and      -----Then compare StatusDate with currentdate if curentdate is less then (StatusDate + graceperoiddate) then mark StatusId pending      
     UPDATE PatientAppointment
       SET
           StatusId =
     (
         SELECT LookupItemId
         FROM LookupMasterItem
         WHERE DisplayName LIKE 'Missed'
     ),
           StatusDate = @Currentdate
     WHERE StatusId =
     (
         SELECT LookupItemId
         FROM LookupMasterItem
         WHERE DisplayName LIKE 'Care Ended'
     )
           AND (deleteflag IS NULL
                OR deleteflag != 1)
           AND PatientId IN
     (
         SELECT PatientId
         FROM Patient
         WHERE Active = 1
     );
     UPDATE PatientAppointment
       SET
           StatusId =
     (
         SELECT LookupItemId
         FROM LookupMasterItem
         WHERE DisplayName LIKE 'Pending'
     ),
	StatusDate = @Currentdate
     WHERE StatusId =
     (
         SELECT LookupItemId
         FROM LookupMasterItem
         WHERE DisplayName LIKE 'CareEnded'
     )
           AND (deleteflag IS NULL
                OR deleteflag != 1)
           AND DATEADD(dd,
                      (
                          SELECT appgraceperiod
                          FROM mst_facility
                          WHERE facilityid = @locationid
                      ), StatusDate) >= @Currentdate;


     -----------------Update missed to Previously missed status---------------------------------      
     UPDATE PatientAppointment
       SET
           PatientAppointment.StatusId =
     (
         SELECT LookupItemId
         FROM LookupMasterItem
         WHERE DisplayName LIKE 'Previously Missed'
     ),
           StatusDate = @Currentdate
     WHERE PatientAppointment.StatusId =
     (
         SELECT LookupItemId
         FROM LookupMasterItem
         WHERE DisplayName LIKE 'Missed'
     )
           AND (deleteflag IS NULL
                OR deleteflag != 1)
           AND PatientAppointment.AppointmentDate <
     (
         SELECT MAX(b.StatusDate)
         FROM PatientAppointment b
         WHERE b.StatusId IN
         (
         (
             SELECT LookupItemId
             FROM LookupMasterItem
             WHERE DisplayName LIKE 'Pending'
         ),
         (
             SELECT LookupItemId
             FROM LookupMasterItem
             WHERE DisplayName LIKE 'Met'
         )
         )
               AND b.PatientId = PatientAppointment.PatientId
               AND (deleteflag IS NULL
                    OR deleteflag != 1)
     );
     --End

GO
/****** Object:  StoredProcedure [dbo].[Psmart_ProcessMotherDetails]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Psmart_ProcessMotherDetails]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Psmart_ProcessMotherDetails] AS' 
END
GO
-- =============================================
-- Author:		<sosewe>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[Psmart_ProcessMotherDetails]
	-- Add the parameters for the stored procedure here
	@firstName varchar(100),
	@middleName varchar(100),
	@lastName varchar(100),
	@cccNumber varchar(20),
	@ptnpk int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Declare @hivStatus int,@hivCareStatus int,@PersonId int,@RelationshipTypeId int,@PatientId int;


    -- Insert statements for procedure here
	if(@cccNumber IS NULL)BEGIN SET @hivStatus=37 END ELSE BEGIN SET @hivStatus=37 END
	if(@cccNumber IS NULL)BEGIN SET @hivCareStatus=1 END ELSE BEGIN SET @hivStatus=null END

	--SET @PersonId=(SELECT PersonId FROM Patient WHERE ptn_pk=@ptnpk);
	SET @RelationshipTypeId=(SELECT Id FROM LookupItem WHERE Name='mother');
	SET @PatientId=(SELECT Id FROM Patient WHERE ptn_pk=@ptnpk)

	INSERT INTO [dbo].[dtl_FamilyInfo]
           ([Ptn_pk],[RFirstName],[RLastName],[Sex],[AgeYear],[AgeMonth],[RelationshipDate],[RelationshipType],[HivStatus],[HivCareStatus],[RegistrationNo],[UserId] ,[DeleteFlag],[CreateDate]	)
     VALUES
           (@ptnpk
           , encryptbykey(key_guid('Key_CTC'), @firstName)--<RFirstName, varbinary(max),>
           , encryptbykey(key_guid('Key_CTC'), @lastName) --<RLastName, varbinary(max),>
           ,17
           ,0 --<AgeYear, int,>
           ,0 --<AgeMonth, int,>
           ,GETDATE() --<RelationshipDate, datetime,>
           ,10 -- <RelationshipType, int,>
           ,@hivStatus
           ,@hivCareStatus
           ,@cccNumber
           ,1 -- <UserId, int,>
           ,0 --<DeleteFlag, int,>
           ,GETDATE()
           )
	
	 -- INSERT TO PERSON
    INSERT INTO Person (FirstName,LastName,Sex,CreatedBy,CreateDate) VALUES(
		ENCRYPTBYKEY(KEY_GUID('Key_CTC'),@FirstName),
		ENCRYPTBYKEY(KEY_GUID('Key_CTC'),@LastName),
		(SELECT Id FROM LookupItem WHERE Name='female'),
		1,
		GETDATE()
	)
	SELECT @PersonId=SCOPE_IDENTITY();

	INSERT INTO PersonRelationship (PersonId,RelationshipTypeId,CreatedBy,CreateDate,PatientId) VALUES(
		@PersonId,@RelationshipTypeId,1,GETDATE(),@PatientId
	)

END



GO
/****** Object:  StoredProcedure [dbo].[Psmart_ProcessNewClientRegistration]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Psmart_ProcessNewClientRegistration]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Psmart_ProcessNewClientRegistration] AS' 
END
GO
-- =============================================
-- Author:		<stephen Osewe>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[Psmart_ProcessNewClientRegistration]
	-- Add the parameters for the stored procedure here
	@FirstName varchar(100), --1
	@MiddleName varchar(100)=null, --2
	@LastName varchar(100), --3
	@registrationDate datetime, --4
	@dob datetime, --5
	@dobPrecision varchar(1) = '0', --6
	@phone varchar(50), --7
	@gender varchar(15), --8
	@landmark varchar(50), --9
	@maritalStatus varchar(50)=0, --10
	@htsId varchar(50) = null, --11
	@serialNumber varchar(50), --12
	@facilityId varchar(10)=null, --13
	@moduleId varchar(5), --14
	@village varchar(50) = null, --15
	@ward varchar(50) =null, --16
	@subcounty varchar(50) =null, --17
	@heiNumber varchar(15) = null, --18
	@Address varchar(250),
	@hts_facility_id varchar(15) = null --19
AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;

    -- Insert statements for procedure here
	declare @ptnpk int=0,@visitId int=0, @locationId int,@PosId int,@CountryId int, @patient_facility_index varchar(15)
	DECLARE @PatientMastrVisitId int;
	DECLARE @PersonId int;
	Declare @PatientId int,@PatientEnrollmentId int;

		Select Top 1 @locationId = FacilityId
					,@PosId = PosID
					,@CountryId = CountryID
		From mst_Facility
		Where DeleteFlag = 0

		If(@hts_facility_id is null Or @hts_facility_id ='') Begin
			Select @hts_facility_id = @PosId
		End
		Begin Transaction InsertPat
		Begin Try
			Insert Into mst_Patient (
				[Status]
			   ,FirstName
			   ,MiddleName
			   ,LastName
			   ,LocationID
			   ,RegistrationDate
			   ,Sex
			   ,DOB
			   ,DobPrecision
			   ,CountryID
			   ,PosID
			   ,SatelliteID
			   ,UserID
			   ,CreateDate
			   ,Phone
			   ,LandMark
			   ,HTSID
			   ,MaritalStatus
			   ,CardSerialNumber
			   ,[Address]
			   ,HEIIDNumber)
			Values (
				'0'
			   ,encryptbykey(key_guid('Key_CTC'), @firstName)
			   ,encryptbykey(key_guid('Key_CTC'), @middleName)
			   ,encryptbykey(key_guid('Key_CTC'), @lastName)
			   ,@locationId
			   ,@registrationDate
			   ,(Select Top 1		Id		From mst_Decode		Where Name = '' + @gender + '')
			   ,@dob
			   ,isnull(convert(int, @dobPrecision), 0)
			   ,@CountryId
			   ,@PosId
			   ,0
			   ,1
			   ,getdate()
			   ,encryptbykey(key_guid('Key_CTC'), @phone)
			   ,@landmark
			   ,@htsId
			   ,isnull((Select Top 1	Id	From mst_Decode	Where Name = '' + @maritalStatus + '')	, 0)
			   ,-- SELECT SCOPE_IDENTITY(); ");,
				@serialNumber
			   ,encryptbykey(key_guid('Key_CTC'), @Address)
			   ,@heiNumber);
			Set @ptnpk = scope_identity();

	
			Select @patient_facility_index = PatientFacilityId From mst_Patient where Ptn_Pk=@ptnpk
-- insert into ord_visit

			Insert Into [dbo].[ord_Visit] (
				[Ptn_PK]
			   ,[LocationID]
			   ,[VisitDate]
			   ,[VisitType]
			   ,[DataQuality]
			   ,[DeleteFlag]
			   ,[UserID]
			   ,[CreateDate]
			   ,[UpdateDate])
			Values (
				@ptnpk
			   ,@locationId
			   ,@registrationDate -- visitdate
			   ,12 -- for registration
			   ,1
			   ,0
			   ,1 -- default psmart userId
			   ,getdate()
			   ,getdate());

-- insert into lnk_patientprogramstart
			Insert Into [dbo].[Lnk_PatientProgramStart] (
				[Ptn_PK]
			   ,[ModuleId]
			   ,[StartDate]
			   ,[UserID]
			   ,[CreateDate]
			   ,[UpdateDate])
			Values (
				@ptnpk
			   ,@moduleId
			   ,getdate()--@registrationDate
			   ,1
			   ,getdate()
			   ,getdate());

			
-- INSERT TO PERSON
			Insert Into Person (
				FirstName
			   ,MidName
			   ,LastName
			   ,Sex
			   ,DateOfBirth
			   ,DobPrecision
			   ,createdby
			   ,CreateDate)
			Values (
				encryptbykey(key_guid('Key_CTC'), @FirstName)
			   ,encryptbykey(key_guid('Key_CTC'), @LastName)
			   ,encryptbykey(key_guid('Key_CTC'), @MiddleName)
			   ,(Select Top 1		Id	From LookupItem		Where Name = '' + @gender + '')
			   ,@dob
			   ,@dobPrecision
			   ,1
			   ,getdate())
			Select @PersonId = scope_identity();


-- INSERT TO PATIENT
			Insert Into Patient (
				Ptn_PK
			   ,PersonId
			   ,PatientType
			   ,FacilityID
			   ,DateOfBirth
			   ,DobPrecision
			   ,NationalId
			   ,RegistrationDate
			   ,PatientIndex
			   ,CreateDate
			   ,createdby)
			Values (
				@ptnpk
			   ,@PersonId
			   ,(Select	top 1	Id		From LookupItem			Where Name = 'New')
			   ,@PosId
			 ,	@dob
			   ,@dobPrecision
			   ,999999
			   ,@registrationDate
			  , @patient_facility_index			   
			   ,getdate()
			   ,1)
			Select @PatientId = scope_identity();

-- PatientMasterVisit
			--Insert Into PatientMasterVisit (
			--	PatientId
			--   ,ServiceId
			--   ,Start
			--   ,VisitDate
			--   ,VisitScheduled
			--   ,VisitBy
			--   ,VisitType
			--   ,createdby
			--   ,CreateDate)
			--Values (
			--	@PatientId
			--   ,1
			--   ,getdate()
			--   ,convert(datetime, @registrationDate, 104)
			--   ,0
			--   ,(Select Top 1			Id		From LookupItem		Where Name = 'self')
			--   ,0
			--   ,1
			--   ,getdate())
			--Set @PatientMastrVisitId = scope_identity();
-- INsert Patient Enrollment
			Insert Into PatientEnrollment (
				PatientId
			   ,ServiceAreaId
			   ,EnrollmentDate
			   ,EnrollmentStatusId
			   ,TransferIn
			   ,CareEnded
			   ,createdby
			   ,CreateDate)
			Values (
				@PatientId
			   ,2
			   ,getdate()--@registrationDate
			   ,0
			   ,0
			   ,0
			   ,1
			   ,getdate())
			
				Select @PatientEnrollmentId = scope_identity();

-- INSER TO PatientIdentifier
			If (@htsId <> ''Or @htsId Is Not Null)	Begin
				Select @htsId = @patient_facility_index
			End
			Insert Into PatientIdentifier (
				PatientId
				,PatientEnrollmentId
				,IdentifierTypeId
				,IdentifierValue
				,createdby
				,CreateDate
				,AssigningFacility
				,Active)
			Values (
				@PatientId
				,@PatientEnrollmentId
				,(Select		Top 1	Id		From Identifiers		Where Code = 'HTSNumber')
				,@htsId
				,1
				,getdate()
				,@hts_facility_id
				,1);
-- INSER TO PersonIdentifier
			
			Insert Into PersonIdentifier (
				PersonId				
				,IdentifierId
				,IdentifierValue
				,createdby
				,CreateDate
				,AssigningFacility
				,Active
				,DeleteFlag)
			Values (
				@PersonId
				,(Select Top 1	Id		From Identifiers		Where Code = 'CARD_SERIAL_NUMBER')
				,@serialNumber				
				,1
				,getdate()
				,@facilityId
				,1
				,0);		
-- PersonContact
			Select @Address =
				   Case
					   When @Address = '' Or
						   @Address Is Null Then Null
					   Else ltrim(rtrim(@Address))
				   End
				  ,@phone =
				   Case
					   When @phone = '' Or
						   @phone Is Null Then Null
					   Else ltrim(rtrim(@phone))
				   End

			If (@Address Is Not Null	Or @Phone Is Not Null)	Begin
				Insert Into PatientContact (
					PersonId
				   ,PhysicalAddress
				   ,mobileNo
				   ,CreateDate
				   ,createdby)
				Values (
					@PersonId
				   ,encryptbykey(key_guid('Key_CTC'), @Address)
				   ,encryptbykey(key_guid('Key_CTC'), @phone)
				   ,getdate()
				   ,1)
			End
-- PersonLocation

			If (@village Is Not Null	And datalength(@village) > 4
				And @ward Is Not Null
				And datalength(@ward) > 4
				And datalength(@ward) > 4
				And @subcounty Is Not Null
				And datalength(@subcounty) > 4)
			Begin
			Insert Into PersonLocation (
				PersonId
			   ,County
			   ,SubCounty
			   ,Village
			   ,Ward
			   ,LandMark
			   ,createdby
			   ,CreateDate)
			Values (
				@PersonId
			   ,(Select Top 1		CountyID		From County		Where Subcountyname = '' + @subcounty + '')
			   ,isnull((Select Top 1	SubCountyID		From County		Where Subcountyname = '' + @subcounty + '')		, 0)
			   ,@village
			   ,(Select Top 1	WardId	From County	Where WardName = '' + @ward + '')
			   ,@landmark
			   ,1
			   ,getdate())
			End
-- PatientENcounter
			--Insert Into PatientEncounter (
			--	PatientId
			--   ,PatientMasterVisitId
			--   ,EncounterTypeId
			--   ,EncounterStartTime
			--   ,EncounterEndTime
			--   ,ServiceAreaId
			--   ,CreateDate
			--   ,createdby
			--   ,Status)
			--Values (
			--	@PatientId
			--   ,@PatientMastrVisitId
			--   ,(Select Top 1	Id	From LookupItem		Where Name = 'Hts-encounter')
			--   ,convert(datetime, @registrationDate, 104)
			--   ,convert(datetime, @registrationDate, 104)
			--   ,2
			--   ,convert(datetime, @registrationDate, 104)
			--   ,1
			--   ,0)

			Select @PersonId Id;

			If @@TRANCOUNT > 0
			Commit Transaction InsertPat;
			End Try
			Begin Catch
			Declare @ErrorMessage nvarchar(4000)
				   ,@ErrorSeverity int
				   ,@ErrorState int;
			Select @ErrorMessage = error_message()
				  ,@ErrorSeverity = error_severity()
				  ,@ErrorState = error_state();
			Raiserror (@ErrorMessage, @ErrorSeverity, @ErrorState);
			If @@TRANCOUNT > 0
			Rollback Transaction InsertPat;
			End Catch;
End
GO
/****** Object:  StoredProcedure [dbo].[Registration_GetIdentifierByServiceArea]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Registration_GetIdentifierByServiceArea]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Registration_GetIdentifierByServiceArea] AS' 
END
GO

ALTER PROCEDURE [dbo].[Registration_GetIdentifierByServiceArea] @ServiceAreaId int = 0
AS
BEGIN
	SET NOCOUNT ON

	IF (@ServiceAreaId = 0)
	BEGIN
		SELECT DISTINCT ID IdentifierID
			,FieldName IdentifierName
		FROM mst_PatientIdentifier a
		INNER JOIN lnk_PatientModuleIdentifier b ON a.ID = b.FieldID
		Union All
		Select 0 IdentifierId, 'Unique Patient Id'
	END
	ELSE
	BEGIN
		SELECT DISTINCT ID IdentifierID
			,FieldName IdentifierName
		FROM mst_PatientIdentifier a
		INNER JOIN lnk_PatientModuleIdentifier b ON a.ID = b.FieldID	
		WHERE b.ModuleID = @ServiceAreaId
		Union All
		Select 0 IdentifierId, 'Unique Patient Id'
	END
	--select * from mst_PatientIdentifier
	--select * from lnk_PatientModuleIdentifier
	--select * from mst_module
	SET NOCOUNT OFF
END
GO
/****** Object:  StoredProcedure [dbo].[Schedule_GetTask]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Schedule_GetTask]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Schedule_GetTask] AS' 
END
GO

-- =============================================
-- Author:		Joseph
-- Create date: 
-- Description:	Get scheduled tasks
-- =============================================
ALTER PROCEDURE [dbo].[Schedule_GetTask]  
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Select TaskName, LastRunDate, NextRunDate From ScheduledTask Where Active = 1
END

GO
/****** Object:  StoredProcedure [dbo].[Schedule_UpdateTask]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Schedule_UpdateTask]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Schedule_UpdateTask] AS' 
END
GO

-- =============================================
-- Author:		Joseph
-- Create date: 
-- Description:	Get scheduled tasks
-- =============================================
ALTER PROCEDURE [dbo].[Schedule_UpdateTask]  
	@taskName varchar(50),
	@NextRunDate datetime,
	@LastRunDate datetime,
	@Active bit =1
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Update ScheduledTask Set
			NextRunDate = @NextRunDate
		,	LastRunDate = @LastRunDate
		,	Active = @Active
	Where TaskName = @TaskName;
END

GO

/****** Object:  StoredProcedure [dbo].[ServiceArea_GetBusinessRule]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ServiceArea_GetBusinessRule]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[ServiceArea_GetBusinessRule] AS' 
END
GO

-- =============================================
-- Author:		Joseph Njung'e
-- Create date: 2016-07-15
-- Description:	Get the service area business rule
-- =============================================
ALTER PROCEDURE [dbo].[ServiceArea_GetBusinessRule] 
	-- Add the parameters for the stored procedure here
	@ModuleId int = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
		Select	Id
			,	BusRuleId
			,	BusRuleName
			,	BusRuleDeleteFlag
			,	BusRuleReferenceId
			,	Value MinValue
			,	Value1 MaxValue
			,	SetType RuleSet
			,	ModuleId
			,	ModuleName
			,	DisplayName
			,	CanEnroll
		From ServiceAreaBusinessRuleView
		Where (ModuleId = @ModuleId Or @ModuleId Is Null)
END

GO
/****** Object:  StoredProcedure [dbo].[ServiceArea_GetForms]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ServiceArea_GetForms]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[ServiceArea_GetForms] AS' 
END
GO

-- =============================================
-- Author:		Joseph
-- Create date: 2016 07 18
-- Description:	Get Forms for a service area
-- =============================================
ALTER PROCEDURE [dbo].[ServiceArea_GetForms] 
	-- Add the parameters for the stored procedure here
	@ModuleId int ,
	@LocationId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Select	FeatureId
		,	FeatureName
		,	Published
		,	ModuleId
		,	ReferenceId
		,	FormName
		,	FormId
		,	FormDescription
		,	Custom
		,	CategoryId
		,	Code
		,	PermCount
	From ServiceAreaFormView
	Where (ModuleId = @ModuleId)
		And (FeatureDeleteFlag = 0)
		And (Published = 2)
		And (FormDeleteFlag = 0)
END

GO
/****** Object:  StoredProcedure [dbo].[ServiceArea_GetPatientReports]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ServiceArea_GetPatientReports]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[ServiceArea_GetPatientReports] AS' 
END
GO

-- =============================================
-- Author:		Joseph
-- Create date: 2016 07 18
-- Description:	Get Forms for a service area
-- =============================================
ALTER PROCEDURE [dbo].[ServiceArea_GetPatientReports]
	-- Add the parameters for the stored procedure here
	@ModuleId int ,
	@LocationId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
Select	F.FeatureId
	,	F.FeatureName
	,	F.ReferenceId
	,	F.ModuleId
	,	F.FeatureTypeId
	,	D.Code		As FeatureTypeName
	,	D.CodeID	As FeatureCodeId
From mst_Feature As F
Inner Join mst_Decode As D On F.FeatureTypeId = D.ID
And D.Code = 'PATIENT_REPORT'
Where (F.ModuleId = @ModuleId Or F.ModuleId = 0)
	And (F.DeleteFlag = 0)
	And (F.ReportFlag = 1)
Union All
Select	F.FeatureId
	,	F.FeatureName
	,	F.ReferenceId
	,	F.ModuleId
	,	F.FeatureTypeId
	,	D.Code		As FeatureTypeName
	,	D.CodeID	As FeatureCodeId
From mst_Feature As F
Inner Join mst_Decode As D On F.FeatureTypeId = D.ID
And D.Code = 'MODULE_REPORT'
Where (F.ModuleId = @ModuleId  )
	And (F.DeleteFlag = 0)
	And (F.ReportFlag = 1)
END

GO
/****** Object:  StoredProcedure [dbo].[SP_Bluecard_ToGreenCard]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_Bluecard_ToGreenCard]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[SP_Bluecard_ToGreenCard] AS' 
END
GO

-- =============================================
-- Author:		<felix/stephen>
-- Create date: <03-22-2017>
-- Description:	<Patient registration migration from bluecard to greencard>
-- =============================================
ALTER PROCEDURE [dbo].[SP_Bluecard_ToGreenCard]
	-- Add the parameters for the stored procedure here
	@ptn_pk int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

DECLARE @FirstName varbinary(max), @MiddleName varbinary(max), @LastName varbinary(max), @Sex int, @Status bit , @DeleteFlag bit, 
		@CreateDate datetime, @UserID int,  @message varchar(80), @Id int, @PatientFacilityId varchar(50), @PatientType int, 
		@FacilityId varchar(10), @DateOfBirth datetime, @DobPrecision int, @NationalId varchar(100), @PatientId int,  
		@ARTStartDate date,@transferIn int,@CCCNumber varchar(20), @entryPoint int, @ReferredFrom int, @RegistrationDate datetime,
		@MaritalStatusId int, @MaritalStatus int, @DistrictName varchar(50), @CountyID int, @SubCountyID int, @WardID int,
		@Address varbinary(max), @Phone varbinary(max), @EnrollmentId int, @PatientIdentifierId int, @ServiceEntryPointId int,
		@PatientMaritalStatusID int, @PatientTreatmentSupporterID int, @PersonContactID int, @IDNational varbinary(max);

DECLARE @FirstNameT varchar(50), @LastNameT varchar(50), @TreatmentSupportTelNumber varbinary(max), 
			@CreateDateT datetime, @UserIDT int, @IDT int;
			
DECLARE @TreatmentSupportTelNumber_VARCHAR varchar(100);
  
--PRINT '-------- Patients Report --------'; 
--SELECT @message = '----- ptn_pk ' + CAST(@ptn_pk as varchar(50));
--PRINT @message;
  
--DECLARE mstPatient_cursor CURSOR FOR   
Select Top 1 @FirstName = FirstName
		   , @MiddleName = MiddleName
		   , @LastName = LastName
		   , @Sex = Sex
		   , @Status = [Status]
		   , @DeleteFlag = DeleteFlag
		   , @CreateDate = dbo.mst_Patient.CreateDate
		   , @UserId = dbo.mst_Patient.UserID
		   , @PatientFacilityId = PatientFacilityId
		   , @FacilityId = PosId
		   , @DateOfBirth = DOB
		   , @DobPrecision = DobPrecision
		   , @NationalId = [ID/PassportNo]
		   , @CCCNumber = PatientEnrollmentID
		   , @ReferredFrom = [ReferredFrom]
		   , @RegistrationDate = [RegistrationDate]
		   , @MaritalStatus = MaritalStatus
		   , @DistrictName = DistrictName
		   , @Address = [Address]
		   , @Phone = Phone
From mst_Patient
Inner Join dbo.Lnk_PatientProgramStart On dbo.mst_Patient.Ptn_Pk = dbo.Lnk_PatientProgramStart.Ptn_pk
Where (dbo.Lnk_PatientProgramStart.ModuleId = 203)
	And dbo.mst_Patient.Ptn_Pk = @ptn_pk
  
--OPEN mstPatient_cursor  
  
--FETCH NEXT FROM mstPatient_cursor   
--INTO @FirstName, @MiddleName, @LastName, @Sex, @Status, @DeleteFlag, @CreateDate, @UserID, @PatientFacilityId, @FacilityId, @DateOfBirth, @DobPrecision, @NationalId,@CCCNumber, @ReferredFrom, @RegistrationDate, @MaritalStatus , @DistrictName, @Address, @Phone
  
IF @@rowcount = 1 BEGIN  
	--PRINT ' '  
	--SELECT @message = '----- patients From mst_patient: ' + CAST(@ptn_pk as varchar(50))
  
	--PRINT @message  

	exec pr_OpenDecryptedSession;

	--set null dates
	Select @CreateDate = Isnull(@CreateDate, getdate()), 
		@Status = Case when @Status = 1 Then 0 Else 1 End,
		@IDNational = ENCRYPTBYKEY(KEY_GUID('Key_CTC'),Isnull(@NationalId,'99999999')); 
	
	SET @Sex = (SELECT TOP 1 ItemId FROM LookupItemView WHERE MasterName = 'Gender' and ItemName = (select top 1 Name from mst_Decode where id = @Sex));
	IF @Sex IS  NULL
		SET @Sex = (select top 1 ItemId from LookupItemView where MasterName = 'Unknown' and ItemName = 'Unknown');

		

	--Default all persons to new
	SET @ARTStartDate=( SELECT top 1 ARTTransferInDate FROM dtl_PatientHivPrevCareIE WHERE Ptn_pk=@ptn_pk);
	if(@ARTStartDate Is NULL) BEGIN 
		SET @PatientType=(SELECT top 1 Id FROM LookupItem WHERE Name='New');
		SET @transferIn=0; 
	END 
	ELSE BEGIN 
		SET @PatientType=(SELECT Top 1 Id FROM LookupItem WHERE Name='Transfer-In');
		SET @transferIn=1; 
	End
	-- SELECT @PatientType = 1285

	--encrypt nationalid
	--SET @IDNational=ENCRYPTBYKEY(KEY_GUID('Key_CTC'),@IDNational);

	IF NOT EXISTS ( SELECT TOP 1 ptn_pk FROM Patient WHERE ptn_pk = @ptn_pk) BEGIN
			Insert into Person(FirstName, MidName, LastName, Sex, Active, DeleteFlag, CreateDate, CreatedBy)
			Values(@FirstName, @MiddleName, @LastName, @Sex, @Status, @DeleteFlag, @CreateDate, @UserID);

			SELECT @Id= scope_identity();
			--SELECT @message = 'Created Person Id: ' + CAST(@Id as varchar(50));
			--PRINT @message;

			Insert into Patient(ptn_pk, PersonId, PatientIndex, PatientType, FacilityId, Active, DateOfBirth, DobPrecision, NationalId, DeleteFlag, CreatedBy, CreateDate, RegistrationDate)
			Values(@ptn_pk, @Id, @PatientFacilityId, @PatientType, @FacilityId, @Status, @DateOfBirth, @DobPrecision, @IDNational, @DeleteFlag, @UserID, @CreateDate, @RegistrationDate);

			SELECT @PatientId=scope_identity();
			--SELECT @message = 'Created Patient Id: ' + CAST(@PatientId as varchar);
			--PRINT @message;

			Update mst_Patient Set MovedToPatientTable =1 Where Ptn_Pk=@ptn_pk;
			INSERT INTO [dbo].[GreenCardBlueCard_Transactional] ([PersonId] ,[Ptn_Pk]) VALUES (@Id , @ptn_pk);

			-- Insert to PatientEnrollment
			INSERT INTO [dbo].[PatientEnrollment] ([PatientId] ,[ServiceAreaId] ,[EnrollmentDate] ,[EnrollmentStatusId] ,[TransferIn] ,[CareEnded] ,[DeleteFlag] ,[CreatedBy] ,[CreateDate] ,[AuditData])
			VALUES (@PatientId,1,(SELECT top 1 StartDate FROM Lnk_PatientProgramStart WHERE Ptn_pk=@ptn_pk),0, @transferIn,0 ,0 ,@UserID ,@CreateDate ,NULL)
		
			SELECT @EnrollmentId=scope_identity();
			--SELECT @message = 'Created PatientEnrollment Id: ' + CAST(@EnrollmentId as varchar);
			--PRINT @message;

			IF @CCCNumber IS NOT NULL BEGIN
					-- Patient Identifier
					INSERT INTO [dbo].[PatientIdentifier] ([PatientId], [PatientEnrollmentId], [IdentifierTypeId], [IdentifierValue] ,[DeleteFlag] ,[CreatedBy] ,[CreateDate] ,[Active] ,[AuditData])
					VALUES (@PatientId , @EnrollmentId ,(select top 1 Id from Identifiers where Code='CCCNumber') ,@CCCNumber ,0 ,@UserID ,@CreateDate ,0 ,NULL);

					SELECT @PatientIdentifierId=scope_identity();
					--SELECT @message = 'Created PatientIdentifier Id: ' + CAST(@PatientIdentifierId as varchar);
					--PRINT @message;
			END

			--Insert into ServiceEntryPoint
			IF @ReferredFrom > 0
				SET @entryPoint = (select TOP 1 ItemId from [dbo].[LookupItemView] where ItemName like '%' + (SELECT Name FROM mst_Decode WHERE ID=@ReferredFrom AND CodeID=17) + '%');
			IF @entryPoint IS NULL BEGIN
						SET @entryPoint = (select ItemId from LookupItemView where MasterName = 'Unknown' and ItemName = 'Unknown');
			END
			ELSE
				SET @entryPoint = (select ItemId from LookupItemView where MasterName = 'Unknown' and ItemName = 'Unknown');

			INSERT INTO ServiceEntryPoint([PatientId], [ServiceAreaId], [EntryPointId], [DeleteFlag], [CreatedBy], [CreateDate], [Active])
			VALUES(@PatientId, 1, @entryPoint, 0 , @UserID, @CreateDate, 0);

			SELECT @ServiceEntryPointId=scope_identity();
			--SELECT @message = 'Created ServiceEntryPoint Id: ' + CAST(@ServiceEntryPointId as varchar);
			--PRINT @message;
	
			--Insert into MaritalStatus
			IF @MaritalStatus > 0 BEGIN
					IF EXISTS (select TOP 1 ItemId from [dbo].[LookupItemView] where ItemName like '%' + (select Name from mst_Decode where ID = @MaritalStatus and CodeID = 12) + '%')
						SET @MaritalStatusId = (select TOP 1 ItemId from [dbo].[LookupItemView] where ItemName like '%' + (select Name from mst_Decode where ID = @MaritalStatus and CodeID = 12) + '%');
					ELSE
						SET @MaritalStatusId = (select ItemId from LookupItemView where MasterName = 'Unknown' and ItemName = 'Unknown');
			END
			ELSE
				SET @MaritalStatusId = (select ItemId from LookupItemView where MasterName = 'Unknown' and ItemName = 'Unknown');

			INSERT INTO PatientMaritalStatus(PersonId, MaritalStatusId, Active, DeleteFlag, CreatedBy, CreateDate)
			VALUES(@Id, @MaritalStatusId, 1, 0, @UserID, @CreateDate);

			SELECT @PatientMaritalStatusID=scope_identity();
			--SELECT @message = 'Created PatientMaritalStatus Id: ' + CAST(@PatientMaritalStatusID as varchar);
			--PRINT @message;

			--Insert into PersonLocation
			----SET @CountyID = (SELECT TOP 1 CountyId from County where CountyName like '%' + @DistrictName  + '%');
			----SET @WardID = (SELECT TOP 1 WardId FROM County WHERE WardName LIKE '%' +  +'%')

			----INSERT INTO PersonLocation(PersonId, County, SubCounty, Ward, Village, Location, SubLocation, LandMark, NearestHealthCentre, Active, DeleteFlag, CreatedBy, CreateDate)
			----VALUES(@Id, @CountyID, @SubCountyID, @WardID, @Village, @Location, @SubLocation, @LandMark, @NearestHealthCentre, 1, @DeleteFlag, @UserID, @CreateDate);
	
			--Insert into Treatment Supporter
			--DECLARE Treatment_Supporter_cursor CURSOR FOR
			Select Top 1 @FirstNameT = substring(TreatmentSupporterName, 0, charindex(' ', TreatmentSupporterName))--									  As firstname
				 , @LastNameT = substring(TreatmentSupporterName, charindex(' ', TreatmentSupporterName) + 1, len(TreatmentSupporterName) + 1) --As lastname
				 , @TreatmentSupportTelNumber_VARCHAR =TreatmentSupportTelNumber
				 , @CreateDateT = CreateDate
				 , @UserIDT= UserID
			From dtl_PatientContacts
			Where ptn_pk = @ptn_pk And Nullif(TreatmentSupportName,'')	Is Not Null;

			--OPEN Treatment_Supporter_cursor
			--FETCH NEXT FROM Treatment_Supporter_cursor INTO @FirstNameT, @LastNameT, @TreatmentSupportTelNumber_VARCHAR, @CreateDateT , @UserIDT

			--IF @@FETCH_STATUS <> 0   
			--	PRINT '         <<None>>'       
			
			IF @@rowcount = 1			BEGIN  

				--SELECT @message = '         ' + @product  
				--PRINT @message
				--SET @TreatmentSupportTelNumber = ENCRYPTBYKEY(KEY_GUID('Key_CTC'),@TreatmentSupportTelNumber_VARCHAR);
				IF @FirstNameT IS NOT NULL AND @LastNameT IS NOT NULL BEGIN
						Insert into Person(FirstName, MidName, LastName, Sex, Active, DeleteFlag, CreateDate, CreatedBy)
						Values(ENCRYPTBYKEY(KEY_GUID('Key_CTC'),@FirstNameT), NULL, ENCRYPTBYKEY(KEY_GUID('Key_CTC'),@LastNameT), (select ItemId from LookupItemView where MasterName = 'Unknown' and ItemName = 'Unknown'), 1, 0, @CreateDateT, @UserIDT);

						SELECT @IDT=scope_identity();
						--SELECT @message = 'Created Person Treatment Supporter Id: ' + CAST(@IDT as varchar(50));
						--PRINT @message;

						IF @TreatmentSupportTelNumber_VARCHAR IS NOT NULL
						 SET @TreatmentSupportTelNumber = ENCRYPTBYKEY(KEY_GUID('Key_CTC'),@TreatmentSupportTelNumber_VARCHAR)

						INSERT INTO PatientTreatmentSupporter(PersonId, [SupporterId], [MobileContact], [DeleteFlag], [CreatedBy], [CreateDate])
						VALUES(@Id, @IDT, @TreatmentSupportTelNumber, 0, @UserIDT, @CreateDateT);

						SELECT @PatientTreatmentSupporterID=scope_identity();
						--SELECT @message = 'Created PatientTreatmentSupporterID Id: ' + CAST(@PatientTreatmentSupporterID as varchar);
						--PRINT @message;
				END

			--	FETCH NEXT FROM Treatment_Supporter_cursor INTO  @FirstNameT, @LastNameT, @TreatmentSupportTelNumber_VARCHAR, @CreateDateT, @UserIDT
			--	END  

			--CLOSE Treatment_Supporter_cursor  
			--DEALLOCATE Treatment_Supporter_cursor

			--Insert into Person Contact
				IF @Address IS NOT NULL OR @Phone IS NOT NULL	BEGIN
					INSERT INTO PersonContact(PersonId, [PhysicalAddress], [MobileNumber], [AlternativeNumber], [EmailAddress], [Active], [DeleteFlag], [CreatedBy], [CreateDate])
					VALUES(@Id, @Address, @Phone, null, null, @Status, 0, @UserID, @CreateDate);

					SELECT @PersonContactID=scope_identity();
					--SELECT @message = 'Created PersonContact Id: ' + CAST(@PersonContactID as varchar);
					--PRINT @message;
				END

			END
		End
		ELSE	BEGIN
			SET @Id = (SELECT TOP 1 PersonId FROM Patient WHERE ptn_pk = @ptn_pk);
			UPDATE Person
			SET FirstName = @FirstName, MidName = @MiddleName, LastName = @LastName, Sex = @Sex, Active = @Status, DeleteFlag = @DeleteFlag, CreateDate = @CreateDate, CreatedBy = @UserID
			WHERE Id = @Id;

			--SELECT @message = 'Update Person Id: ' + CAST(@Id as varchar(50));
			--PRINT @message;

			--PRINT @Status;

			UPDATE Patient
			SET PatientIndex = @PatientFacilityId, PatientType = @PatientType, FacilityId = @FacilityId, Active = @Status, DateOfBirth = @DateOfBirth, DobPrecision = @DobPrecision, NationalId = @IDNational, DeleteFlag = @DeleteFlag, CreatedBy = @UserID, CreateDate = @CreateDate, RegistrationDate = @RegistrationDate
			WHERE PersonId = @Id;

			SELECT @PatientId=(SELECT TOP 1 Id FROM Patient WHERE PersonId = @Id);
			--SELECT @message = 'Updated Patient ' +  cast(@PatientId as varchar);
			--PRINT @message;

			

			UPDATE PatientEnrollment
			SET EnrollmentDate = (SELECT top 1 StartDate FROM Lnk_PatientProgramStart WHERE Ptn_pk=@ptn_pk), EnrollmentStatusId = 0, TransferIn = @transferIn, CareEnded = 0, DeleteFlag = 0, CreatedBy = @UserID, CreateDate = @CreateDate
			WHERE PatientId = @PatientId;
			If(@@rowcount = 0) Begin
			INSERT INTO [dbo].[PatientEnrollment] ([PatientId] ,[ServiceAreaId] ,[EnrollmentDate] ,[EnrollmentStatusId] ,[TransferIn] ,[CareEnded] ,[DeleteFlag] ,[CreatedBy] ,[CreateDate] ,[AuditData])
			VALUES (@PatientId,1,(SELECT top 1 StartDate FROM Lnk_PatientProgramStart WHERE Ptn_pk=@ptn_pk),0, @transferIn,0 ,0 ,@UserID ,@CreateDate ,NULL)
			End

			SELECT @EnrollmentId = (SELECT TOP 1 Id FROM PatientEnrollment WHERE PatientId = @PatientId and ServiceAreaId=1);
			--SELECT @message = 'Updated PatientEnrollment Id: ' + CAST(@EnrollmentId as varchar);
			--PRINT @message;

			IF @CCCNumber IS NOT NULL		BEGIN
				IF NOT EXISTS ( SELECT PatientId FROM PatientIdentifier WHERE PatientId = @PatientId AND PatientEnrollmentId = @EnrollmentId AND IdentifierTypeId = (select top 1 Id from Identifiers where Code='CCCNumber'))
					BEGIN
						-- Patient Identifier
						INSERT INTO [dbo].[PatientIdentifier] ([PatientId], [PatientEnrollmentId], [IdentifierTypeId], [IdentifierValue] ,[DeleteFlag] ,[CreatedBy] ,[CreateDate] ,[Active] ,[AuditData])
						VALUES (@PatientId , @EnrollmentId ,(select top 1 Id from Identifiers where Code='CCCNumber') ,@CCCNumber ,0 ,@UserID ,@CreateDate ,0 ,NULL);

						SELECT @PatientIdentifierId=scope_identity();
						--SELECT @message = 'Created PatientIdentifier Id: ' + CAST(@PatientIdentifierId as varchar);
						--PRINT @message;
					END
				ELSE					BEGIN
						UPDATE PatientIdentifier
						SET IdentifierTypeId = (select top 1 Id from Identifiers where Code='CCCNumber'), IdentifierValue = @CCCNumber, DeleteFlag = 0, CreatedBy = @UserID, CreateDate = @CreateDate, Active = 0
						WHERE PatientId = @PatientId AND PatientEnrollmentId = @EnrollmentId AND IdentifierTypeId = (SELECT Id FROM LookupItem WHERE Name='CCCNumber')
				END
			END
			

			--Insert into ServiceEntryPoint
			IF @ReferredFrom > 0
				BEGIN
					SET @entryPoint = (select TOP 1 ItemId from [dbo].[LookupItemView] where ItemName like '%' + (SELECT Name FROM mst_Decode WHERE ID=@ReferredFrom AND CodeID=17) + '%');
					
					IF @entryPoint IS NULL
						BEGIN
							SET @entryPoint = (select top 1 ItemId from LookupItemView where MasterName = 'Unknown' and ItemName = 'Unknown');
						END
						
					UPDATE ServiceEntryPoint
					SET EntryPointId = @entryPoint, CreatedBy = @UserID, CreateDate = @CreateDate
					WHERE PatientId = @PatientId;
					
					SELECT @ServiceEntryPointId=scope_identity();
					--SELECT @message = 'Updated ServiceEntryPoint Id: ' + CAST(@ServiceEntryPointId as varchar);
					--PRINT @message;
				END
	
			--Updated into MaritalStatus
			IF @MaritalStatus > 0
				BEGIN
					BEGIN
						IF EXISTS (select TOP 1 ItemId from [dbo].[LookupItemView] where ItemName like '%' + (select Name from mst_Decode where ID = @MaritalStatus and CodeID = 12) + '%')
							SET @MaritalStatusId = (select TOP 1 ItemId from [dbo].[LookupItemView] where ItemName like '%' + (select Name from mst_Decode where ID = @MaritalStatus and CodeID = 12) + '%');
						ELSE
							SET @MaritalStatusId = (select ItemId from LookupItemView where MasterName = 'Unknown' and ItemName = 'Unknown');
					END
					UPDATE PatientMaritalStatus
					SET MaritalStatusId = @MaritalStatusId, CreatedBy = @UserID, CreateDate = @CreateDate
					WHERE PersonId = @Id;

					SELECT @PatientMaritalStatusID=scope_identity();
					--SELECT @message = 'Updated PatientMaritalStatus Id: ' + CAST(@PatientMaritalStatusID as varchar);
					--PRINT @message;
				END

			--Update into Treatment Supporter
			--DECLARE Treatment_Supporter_cursor CURSOR FOR
			Select top 1 @FirstNameT = substring(TreatmentSupporterName, 0, charindex(' ', TreatmentSupporterName))									--  As firstname
				 , @LastNameT = substring(TreatmentSupporterName, charindex(' ', TreatmentSupporterName) + 1, len(TreatmentSupporterName) + 1) --As lastname
				 , @TreatmentSupportTelNumber_VARCHAR= TreatmentSupportTelNumber
				 , @CreateDateT=CreateDate
				 , @UserIDT = UserID
			From dtl_PatientContacts
			Where ptn_pk = @ptn_pk and nullif(TreatmentSupporterName,'') Is Not Null;


			--OPEN Treatment_Supporter_cursor
			--FETCH NEXT FROM Treatment_Supporter_cursor INTO @FirstNameT, @LastNameT, @TreatmentSupportTelNumber_VARCHAR, @CreateDateT , @UserIDT

			--IF @@FETCH_STATUS <> 0   
			--	PRINT '         <<None>>'       

			--WHILE @@FETCH_STATUS = 0  
			If(@@rowcount =1 ) BEGIN

				--SET @TreatmentSupportTelNumber = ENCRYPTBYKEY(KEY_GUID('Key_CTC'),@TreatmentSupportTelNumber);
				IF @FirstNameT IS NOT NULL AND @LastNameT IS NOT NULL
					BEGIN
						IF NOT EXISTS (SELECT PersonId FROM PatientTreatmentSupporter WHERE PersonId = @Id)
							BEGIN
								Insert into Person(FirstName, MidName, LastName, Sex, Active, DeleteFlag, CreateDate, CreatedBy)
								Values(ENCRYPTBYKEY(KEY_GUID('Key_CTC'),@FirstNameT), NULL, ENCRYPTBYKEY(KEY_GUID('Key_CTC'),@LastNameT), (select ItemId from LookupItemView where MasterName = 'Unknown' and ItemName = 'Unknown'), 1, 0, getdate(), @UserIDT);

								SELECT @IDT=scope_identity();
								--SELECT @message = 'Created Person Treatment Supporter Id: ' + CAST(@IDT as varchar(50));
								--PRINT @message;

								IF @TreatmentSupportTelNumber_VARCHAR IS NOT NULL
								SET @TreatmentSupportTelNumber = ENCRYPTBYKEY(KEY_GUID('Key_CTC'),@TreatmentSupportTelNumber_VARCHAR)

								INSERT INTO PatientTreatmentSupporter(PersonId, [SupporterId], [MobileContact], [DeleteFlag], [CreatedBy], [CreateDate])
								VALUES(@Id, @IDT, @TreatmentSupportTelNumber, 0, @UserIDT, getdate());

							END
						ELSE
							BEGIN
								SET @IDT = (SELECT SupporterId FROM PatientTreatmentSupporter WHERE PersonId = @Id);

								UPDATE Person
								SET FirstName = ENCRYPTBYKEY(KEY_GUID('Key_CTC'),@FirstNameT), LastName = ENCRYPTBYKEY(KEY_GUID('Key_CTC'),@LastNameT)
								WHERE Id = @IDT;

								IF @TreatmentSupportTelNumber_VARCHAR IS NOT NULL
								SET @TreatmentSupportTelNumber = ENCRYPTBYKEY(KEY_GUID('Key_CTC'),@TreatmentSupportTelNumber_VARCHAR)

								UPDATE PatientTreatmentSupporter
								SET MobileContact = @TreatmentSupportTelNumber
								WHERE PersonId = @Id;

							END
						END

				--FETCH NEXT FROM Treatment_Supporter_cursor INTO  @FirstNameT, @LastNameT, @TreatmentSupportTelNumber_VARCHAR, @CreateDateT, @UserIDT
				END 

			--CLOSE Treatment_Supporter_cursor  
			--DEALLOCATE Treatment_Supporter_cursor

			--UPDATE into Person Contact
			IF @Address IS NOT NULL OR @Phone IS NOT NULL
				BEGIN
					UPDATE PersonContact
					SET PhysicalAddress = Isnull(@Address,PhysicalAddress), MobileNumber = Isnull(@Phone,MobileNumber)
					WHERE PersonId = @Id;
					If @@rowcount = 0 Begin
					INSERT INTO PersonContact(PersonId, [PhysicalAddress], [MobileNumber], [AlternativeNumber], [EmailAddress], [Active], [DeleteFlag], [CreatedBy], [CreateDate])
					VALUES(@Id, @Address, @Phone, null, null, @Status, 0, @UserID, @CreateDate);
					end
				END

		END

	-- Get the next mst_patient.
  --  FETCH NEXT FROM mstPatient_cursor   
   -- INTO @FirstName, @MiddleName, @LastName, @Sex, @Status, @DeleteFlag, @CreateDate, @UserID, @PatientFacilityId, @FacilityId, @DateOfBirth, @DobPrecision, @NationalId, @CCCNumber, @ReferredFrom, @RegistrationDate, @MaritalStatus , @DistrictName, @Address, @Phone
END   
--CLOSE mstPatient_cursor;  
--DEALLOCATE mstPatient_cursor;  
END
GO
/****** Object:  StoredProcedure [dbo].[sp_deletePatientEncounterAdverseEvents]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_deletePatientEncounterAdverseEvents]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_deletePatientEncounterAdverseEvents] AS' 
END
GO
-- =============================================
-- Author:		John Macharia
-- Create date: 29th Jan 2017
-- Description:	save patient encounter - Adverse Events
-- =============================================
ALTER PROCEDURE [dbo].[sp_deletePatientEncounterAdverseEvents]
	-- Add the parameters for the stored procedure here
	@PatientMasterVisitID int = null,
	@PatientID int = null

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;
-- Insert statements for procedure here
	update AdverseEvent set DeleteFlag = 1 where PatientMasterVisitId = @PatientMasterVisitID and PatientId = @PatientID
	
End


/****** Object:  StoredProcedure [dbo].[sp_getPharmacyDrugList]    Script Date: 3/22/2017 6:17:35 PM ******/
SET ANSI_NULLS ON


GO
/****** Object:  StoredProcedure [dbo].[sp_deletePatientEncounterAllergies]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_deletePatientEncounterAllergies]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_deletePatientEncounterAllergies] AS' 
END
GO
-- =============================================
-- Author:		John Macharia
-- Create date: 19th Mar 2017
-- Description:	save patient encounter - delete allergies
-- =============================================
ALTER PROCEDURE [dbo].[sp_deletePatientEncounterAllergies]
	-- Add the parameters for the stored procedure here
	@PatientMasterVisitID int = null,
	@PatientID int = null

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;
-- Insert statements for procedure here
	update patientallergy set DeleteFlag = 1 where PatientId = @PatientID
End








GO
/****** Object:  StoredProcedure [dbo].[sp_deletePatientEncounterChronicIllness]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_deletePatientEncounterChronicIllness]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_deletePatientEncounterChronicIllness] AS' 
END
GO
-- =============================================
-- Author:		John Macharia
-- Create date: 29th Jan 2017
-- Description:	save patient encounter - Adverse Events
-- =============================================
ALTER PROCEDURE [dbo].[sp_deletePatientEncounterChronicIllness]
	-- Add the parameters for the stored procedure here
	@PatientMasterVisitID int = null,
	@PatientID int = null

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;
-- Insert statements for procedure here
	update PatientChronicIllness set DeleteFlag = 1 where PatientId = @PatientID
End








GO
/****** Object:  StoredProcedure [dbo].[sp_deletePatientEncounterComplaints]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_deletePatientEncounterComplaints]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_deletePatientEncounterComplaints] AS' 
END
GO
-- =============================================
-- Author:		John Macharia
-- Create date: 26th April 2017
-- Description:	save patient encounter - Presenting Complaints
-- =============================================
ALTER PROCEDURE [dbo].[sp_deletePatientEncounterComplaints]
	-- Add the parameters for the stored procedure here
	@PatientMasterVisitID int = null,
	@PatientID int = null

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;
-- Insert statements for procedure here
	update PresentingComplaints set DeleteFlag = 1 where PatientMasterVisitId = @PatientMasterVisitID and PatientId = @PatientID
	
End


/****** Object:  StoredProcedure [dbo].[sp_getPharmacyDrugList]    Script Date: 3/22/2017 6:17:35 PM ******/
SET ANSI_NULLS ON





GO
/****** Object:  StoredProcedure [dbo].[sp_deletePatientEncounterDiagnosis]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_deletePatientEncounterDiagnosis]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_deletePatientEncounterDiagnosis] AS' 
END
GO
-- =============================================
-- Author:		John Macharia
-- Create date: 29th Jan 2017
-- Description:	save patient encounter - Adverse Events
-- =============================================
ALTER PROCEDURE [dbo].[sp_deletePatientEncounterDiagnosis]
	-- Add the parameters for the stored procedure here
	@PatientMasterVisitID int = null,
	@PatientID int = null

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;
-- Insert statements for procedure here
	update PatientDiagnosis set DeleteFlag = 1 where PatientMasterVisitId = @PatientMasterVisitID and PatientId = @PatientID
End







GO
/****** Object:  StoredProcedure [dbo].[sp_deletePatientEncounterGeneralExam]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_deletePatientEncounterGeneralExam]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_deletePatientEncounterGeneralExam] AS' 
END
GO
-- =============================================
-- Author:		John Macharia
-- Create date: 29th Jan 2017
-- Description:	save patient encounter - Chronic Illness
-- =============================================
ALTER PROCEDURE [dbo].[sp_deletePatientEncounterGeneralExam]
	-- Add the parameters for the stored procedure here
	@PatientMasterVisitID int = null,
	@PatientID int = null

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;
-- Insert statements for procedure here
		declare @generalExamID int = (select top 1 Id from lookupmaster where Name = 'GeneralExamination')
		
		UPDATE PhysicalExamination SET DeleteFlag = 1
		where PatientMasterVisitId = @PatientMasterVisitID and PatientId = @PatientID and ExaminationTypeId = @generalExamID
		
End







GO
/****** Object:  StoredProcedure [dbo].[sp_deletePatientEncounterPHDP]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_deletePatientEncounterPHDP]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_deletePatientEncounterPHDP] AS' 
END
GO
-- =============================================
-- Author:		John Macharia
-- Create date: 29th Jan 2017
-- Description:	save patient encounter - Chronic Illness
-- =============================================
ALTER PROCEDURE [dbo].[sp_deletePatientEncounterPHDP]
	-- Add the parameters for the stored procedure here
	@PatientMasterVisitID int = null,
	@PatientID int = null

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;
-- Insert statements for procedure here
		UPDATE PatientPHDP SET DeleteFlag = 1
		where PatientMasterVisitId = @PatientMasterVisitID and PatientId = @PatientID
		
End







GO
/****** Object:  StoredProcedure [dbo].[sp_deletePatientEncounterPhysicalExam]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_deletePatientEncounterPhysicalExam]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_deletePatientEncounterPhysicalExam] AS' 
END
GO
-- =============================================
-- Author:		John Macharia
-- Create date: 14th Feb 2017
-- Description:	get patient encounter Adverse Events
-- =============================================
ALTER PROCEDURE [dbo].[sp_deletePatientEncounterPhysicalExam]
	-- Add the parameters for the stored procedure here
	@PatientMasterVisitID int = null,
	@PatientID int = null

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;
-- Insert statements for procedure here
	declare @generalExamID int = (select top 1 Id from lookupmaster where Name = 'ReviewOfSystems')

	update PhysicalExamination set DeleteFlag = 1 
	where PatientMasterVisitId = @PatientMasterVisitID and PatientId = @PatientID and ExaminationTypeId = @generalExamID
End
GO
/****** Object:  StoredProcedure [dbo].[sp_deletePatientEncounterPresentingComplaints]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_deletePatientEncounterPresentingComplaints]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_deletePatientEncounterPresentingComplaints] AS' 
END
GO
-- =============================================
-- Author:		John Macharia
-- Create date: 26th April 2017
-- Description:	save patient encounter - Presenting Complaints
-- =============================================
ALTER PROCEDURE [dbo].[sp_deletePatientEncounterPresentingComplaints]
	-- Add the parameters for the stored procedure here
	@PatientMasterVisitID int = null,
	@PatientID int = null

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;
-- Insert statements for procedure here
	update PresentingComplaints set DeleteFlag = 1 where PatientMasterVisitId = @PatientMasterVisitID and PatientId = @PatientID
	
End


/****** Object:  StoredProcedure [dbo].[sp_getPharmacyDrugList]    Script Date: 3/22/2017 6:17:35 PM ******/
SET ANSI_NULLS ON





GO
/****** Object:  StoredProcedure [dbo].[sp_deletePatientEncounterVaccines]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_deletePatientEncounterVaccines]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_deletePatientEncounterVaccines] AS' 
END
GO
-- =============================================
-- Author:		John Macharia
-- Create date: 29th Jan 2017
-- Description:	save patient encounter - Adverse Events
-- =============================================
ALTER PROCEDURE [dbo].[sp_deletePatientEncounterVaccines]
	-- Add the parameters for the stored procedure here
	@PatientMasterVisitID int = null,
	@PatientID int = null

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;
-- Insert statements for procedure here
	update Vaccination set DeleteFlag = 1 where PatientId = @PatientID
End








GO
/****** Object:  StoredProcedure [dbo].[sp_deletePatientFamilyPlanningMethod]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_deletePatientFamilyPlanningMethod]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_deletePatientFamilyPlanningMethod] AS' 
END
GO
-- =============================================
-- Author:		John Macharia
-- Create date: 29th Jan 2017
-- Description:	delete family planning method
-- =============================================
ALTER PROCEDURE [dbo].[sp_deletePatientFamilyPlanningMethod]
	-- Add the parameters for the stored procedure here
	@PatientID varchar(50) = null,
	@FPId varchar(50) = null

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;
-- Insert statements for procedure here
	update PatientFamilyPlanningMethod set DeleteFlag = 1 where PatientId = @PatientID and PatientFPId = @FPId
End








GO
/****** Object:  StoredProcedure [dbo].[sp_deletePatientPharmacyOrder]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_deletePatientPharmacyOrder]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_deletePatientPharmacyOrder] AS' 
END
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[sp_deletePatientPharmacyOrder]
	@ptn_pharmacy_pk int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    Update ord_PatientPharmacyOrder set DeleteFlag = 1 where ptn_pharmacy_pk = @ptn_pharmacy_pk

	update dtl_regimenmap set deleteflag = 1 where orderid = @ptn_pharmacy_pk

	delete from dtl_stocktransaction where ptn_pharmacy_pk = @ptn_pharmacy_pk
END
GO
/****** Object:  StoredProcedure [dbo].[sp_DeletePharmacyPrescription_GreenCard]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_DeletePharmacyPrescription_GreenCard]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_DeletePharmacyPrescription_GreenCard] AS' 
END
GO
ALTER PROCEDURE [dbo].[sp_DeletePharmacyPrescription_GreenCard]                                    
	@ptn_pharmacy_pk int = null                             
                                    
AS                                        
Begin
	delete from dtl_PatientPharmacyOrder where ptn_pharmacy_pk = @ptn_pharmacy_pk
	delete from Dtl_StockTransaction where ptn_pharmacy_pk = @ptn_pharmacy_pk
End





GO
/****** Object:  StoredProcedure [dbo].[sp_DifferentiatedCareParameters]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_DifferentiatedCareParameters]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_DifferentiatedCareParameters] AS' 
END
GO
-- =============================================
-- Author:		John Macharia
-- Create date: 13th May 2018
-- Description:	Differentiated Care Parameters
-- =============================================
ALTER PROCEDURE [dbo].[sp_DifferentiatedCareParameters] 
	-- Add the parameters for the stored procedure here
	@PatientId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	declare @ptn_pk int = (select ptn_pk from patient where id = @PatientId)

    -- Age
	Select datediff(year, DateOfBirth, getdate()) Age from Patient where Id = @PatientId

	-- BMI
	select top 1 BMI from patientvitals where PatientId = @PatientId order by VisitDate desc

	-- Viral Load
	select top 1 a.orderdate,c.ResultDate,b.ResultValue,Undetectable from ord_laborder a inner join [dtl_LabOrderTestResult] b on a.id = b.laborderid inner join dtl_LabOrderTest c on a.id = c.laborderid
	where a.ptn_pk = @ptn_pk and b.labtestid = 3 and c.labtestid = 3 and (b.ResultValue is not null or b.Undetectable is not null)
	order by a.orderdate desc

	-- Current Regimen for > 12 months
		DECLARE @CurrentRegimen varchar(20) = (select top 1 RegimenType from ord_PatientPharmacyOrder a inner join dtl_regimenmap b on a.ptn_pharmacy_pk = b.orderID where a.ptn_pk = @ptn_pk and a.deleteflag = 0 order by a.DispensedByDate desc);
	DECLARE @RegimenYearAgo varchar(20) = (select top 1 RegimenType from ord_PatientPharmacyOrder a inner join dtl_regimenmap b on a.ptn_pharmacy_pk = b.orderID where a.ptn_pk = @ptn_pk and a.deleteflag = 0 and a.DispensedByDate <= dateadd(year, -1, getdate()) order by a.DispensedByDate desc);
	DECLARE @counter int = 1;
	DECLARE @SumCurrentRegimen int = 0;
	DECLARE @SumRegimenYearAgo int = 0;

	WHILE @counter <= DATALENGTH(@CurrentRegimen)
	   BEGIN
	   SET @SumCurrentRegimen = @SumCurrentRegimen + ASCII(SUBSTRING(@CurrentRegimen, @counter, 1))
	   SET @counter = @counter + 1
	   END
	   

	SET @counter = 1
	WHILE @counter <= DATALENGTH(@RegimenYearAgo)
	   BEGIN
	   SET @SumRegimenYearAgo = @SumRegimenYearAgo + ASCII(SUBSTRING(@RegimenYearAgo, @counter, 1))
	   SET @counter = @counter + 1
	   END
	   
	If(@SumCurrentRegimen > 0)
	BEGIN
		If(@SumCurrentRegimen = @SumRegimenYearAgo)
		BEGIN
			SELECT 1 SameRegimenFor12Months
		END
		ELSE
		BEGIN
			SELECT 0 SameRegimenFor12Months
		END
	END
	ELSE
	BEGIN
		SELECT 0 SameRegimenFor12Months
	END

	--- Completed 6 months of IPT
	select sum(duration) TotalIPTDuration
	from ord_patientpharmacyorder a inner join dtl_patientpharmacyorder b on a.ptn_pharmacy_pk = b.ptn_pharmacy_pk
	inner join mst_drug c on b.Drug_pk = c.Drug_pk
	where drugname like '%isonia%' and ptn_pk = @ptn_pk

	-- No Active OIs
	select top 1 cast(a.AnyComplaint as varchar) AnyComplaint from ComplaintsHistory a inner join patientmastervisit b on a.patientmastervisitid = b.id
	where a.PatientId = @PatientId and a.deleteflag = 0 and a.AnyComplaint = 1 and PatientMasterVisitId in (select Id from patientmastervisit where PatientId = @PatientId and deleteflag = 0 and VisitDate >= dateadd(month, -6, getdate()))
	UNION
	select b.Name from PhysicalExamination a inner join lookupitem b on a.ExamId = b.Id inner join patientmastervisit c on a.PatientMasterVisitId = c.Id
	where a.PatientId = @PatientId and a.deleteflag = 0 and b.Name <> 'None' and PatientMasterVisitId in (select Id from patientmastervisit where PatientId = @PatientId and deleteflag = 0 and VisitDate >= dateadd(month, -6, getdate()))
	UNION
	select top 1 cast(a.OnAntiTbDrugs as varchar) OnAntiTbDrugs from PatientICF a inner join patientmastervisit b on a.patientmastervisitid = b.id
	where a.PatientId = @PatientId and a.deleteflag = 0 and a.OnAntiTbDrugs = 1 and PatientMasterVisitId in (select Id from patientmastervisit where PatientId = @PatientId and deleteflag = 0 and VisitDate >= dateadd(month, -6, getdate()))
END
GO
/****** Object:  StoredProcedure [dbo].[sp_DifferentiatedCarePatientsPerCategory]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_DifferentiatedCarePatientsPerCategory]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_DifferentiatedCarePatientsPerCategory] AS' 
END
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[sp_DifferentiatedCarePatientsPerCategory] 
	@category varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	if(@category = 'Advanced')
	begin
		select * from (
			select Pin.IdentifierValue PatientId,
			case when (LUI.Name = 'Stage1' OR LUI.Name = 'Stage2') AND (PB.CD4Count > 200) Then 'Well'
			when (LUI.Name = 'Stage3' OR LUI.Name = 'Stage4') OR (PB.CD4Count <= 200) Then 'Advanced'
			ELSE 'Unknown (Missing Baseline WHO Stage or CD4)' END AS Category 
			from PatientBaselineAssessment PB 
			inner join Patient PT on PB.PatientId = PT.ID
			inner join person P on P.Id = PT.PersonId
			inner join LookUpItem LUI on PB.WHOStage = LUI.Id
			inner join PatientEnrollment PE on PB.PatientId = PE.PatientID
			inner join PatientIdentifier PIn on PIn.PatientId = PT.Id
			where DATEDIFF(MONTH, PE.EnrollmentDate, GETDATE()) <= 12 AND PE.CareEnded = 0) data
		where data.Category = 'Advanced'
	end
	else if(@category = 'Well')
	begin
		select * from (
			select Pin.IdentifierValue PatientId,
			case when (LUI.Name = 'Stage1' OR LUI.Name = 'Stage2') AND (PB.CD4Count > 200) Then 'Well'
			when (LUI.Name = 'Stage3' OR LUI.Name = 'Stage4') OR (PB.CD4Count <= 200) Then 'Advanced'
			ELSE 'Unknown (Missing Baseline WHO Stage or CD4)' END AS Category 
			from PatientBaselineAssessment PB 
			inner join Patient PT on PB.PatientId = PT.ID
			inner join person P on P.Id = PT.PersonId
			inner join LookUpItem LUI on PB.WHOStage = LUI.Id
			inner join PatientEnrollment PE on PB.PatientId = PE.PatientID
			inner join PatientIdentifier PIn on PIn.PatientId = PT.Id
			where DATEDIFF(MONTH, PE.EnrollmentDate, GETDATE()) <= 12 AND PE.CareEnded = 0) data
		where data.Category = 'Well'
	end
	else if(@category = 'Unknown (Missing Baseline WHO Stage or CD4)')
	begin
		select * from (
			select Pin.IdentifierValue PatientId,
			case when (LUI.Name = 'Stage1' OR LUI.Name = 'Stage2') AND (PB.CD4Count > 200) Then 'Well'
			when (LUI.Name = 'Stage3' OR LUI.Name = 'Stage4') OR (PB.CD4Count <= 200) Then 'Advanced'
			ELSE 'Unknown (Missing Baseline WHO Stage or CD4)' END AS Category 
			from PatientBaselineAssessment PB 
			inner join Patient PT on PB.PatientId = PT.ID
			inner join person P on P.Id = PT.PersonId
			inner join LookUpItem LUI on PB.WHOStage = LUI.Id
			inner join PatientEnrollment PE on PB.PatientId = PE.PatientID
			inner join PatientIdentifier PIn on PIn.PatientId = PT.Id
			where DATEDIFF(MONTH, PE.EnrollmentDate, GETDATE()) <= 12 AND PE.CareEnded = 0) data
		where data.Category = 'Unknown (Missing Baseline WHO Stage or CD4)'
	end
	else if(@category = 'Stable')
	begin
		select * from (
			SELECT PI.IdentifierValue PatientId, CASE WHEN C.Id IS NULL OR C.Categorization = 2 THEN 'Unstable' ELSE 'Stable' END AS Category
				FROM PatientEnrollment PE INNER JOIN dbo.Patient PT ON PT.Id = pe.PatientId 
				INNER JOIN dbo.PatientIdentifier PI ON PE.Id = PI.PatientEnrollmentId 
				INNER JOIN dbo.Identifiers IE ON PI.IdentifierTypeId = IE.Id 
				LEFT OUTER JOIN (SELECT PatientId, Id, Categorization, row_number() OVER (Partition BY PatientId
				ORDER BY DateAssessed DESC) RowNum FROM PatientCategorization) C ON C.PatientId = Pe.PatientId AND C.RowNum = 1
			WHERE ServiceAreaId = 1 AND IE.Name = 'CCC Registration Number' AND PT.DeleteFlag = 0 AND DATEDIFF(MONTH, PE.EnrollmentDate, GETDATE()) > 12 AND PE.CareEnded = 0) data
		where data.Category = 'Stable'
	end
	else if(@category = 'Unstable')
	begin
		select * from (
			SELECT PI.IdentifierValue PatientId, CASE WHEN C.Id IS NULL OR C.Categorization = 2 THEN 'Unstable' ELSE 'Stable' END AS Category
				FROM PatientEnrollment PE INNER JOIN dbo.Patient PT ON PT.Id = pe.PatientId 
				INNER JOIN dbo.PatientIdentifier PI ON PE.Id = PI.PatientEnrollmentId 
				INNER JOIN dbo.Identifiers IE ON PI.IdentifierTypeId = IE.Id 
				LEFT OUTER JOIN (SELECT PatientId, Id, Categorization, row_number() OVER (Partition BY PatientId
				ORDER BY DateAssessed DESC) RowNum FROM PatientCategorization) C ON C.PatientId = Pe.PatientId AND C.RowNum = 1
			WHERE ServiceAreaId = 1 AND IE.Name = 'CCC Registration Number' AND PT.DeleteFlag = 0 AND DATEDIFF(MONTH, PE.EnrollmentDate, GETDATE()) > 12 AND PE.CareEnded = 0) data
		where data.Category = 'Unstable'
	end
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllARTSponsor]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllARTSponsor]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_GetAllARTSponsor] AS' 
END
GO
ALTER PROCEDURE [dbo].[sp_GetAllARTSponsor]
AS
BEGIN
	SELECT *
	FROM Mst_ARTSponsor
	WHERE (
			DeleteFlag = 0
			OR DeleteFlag IS NULL
			)
	ORDER BY [Name] asc
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllCouncellingTopic]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllCouncellingTopic]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_GetAllCouncellingTopic] AS' 
END
GO
ALTER PROCEDURE [dbo].[sp_GetAllCouncellingTopic]
AS
BEGIN
	SELECT *
	FROM mst_CouncellingTopic
	WHERE (
			DeleteFlag = 0
			OR DeleteFlag IS NULL
			)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllCouncellingType]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllCouncellingType]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_GetAllCouncellingType] AS' 
END
GO
ALTER PROCEDURE [dbo].[sp_GetAllCouncellingType]
AS
BEGIN
	SELECT *
	FROM mst_CouncellingType
	WHERE (
			DeleteFlag = 0
			OR DeleteFlag IS NULL
			)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllCountries]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllCountries]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_GetAllCountries] AS' 
END
GO
ALTER PROCEDURE [dbo].[sp_GetAllCountries]
AS
BEGIN
	SELECT *
	FROM mst_Countries
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllDesignation]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllDesignation]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_GetAllDesignation] AS' 
END
GO
ALTER Procedure [dbo].[sp_GetAllDesignation]
AS

BEGIN
	SELECT * FROM mst_Designation WHERE(DeleteFlag = 0 or DeleteFlag IS NULL) 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllDistrict]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllDistrict]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_GetAllDistrict] AS' 
END
GO
ALTER PROCEDURE [dbo].[sp_GetAllDistrict]
AS
BEGIN
	SELECT *
	FROM mst_District
	WHERE (
			DeleteFlag = 0
			OR DeleteFlag IS NULL
			)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllDivision]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllDivision]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_GetAllDivision] AS' 
END
GO
ALTER PROCEDURE [dbo].[sp_GetAllDivision]
AS
BEGIN
	SELECT *
	FROM Mst_Division
	WHERE (
			DeleteFlag = 0
			OR DeleteFlag IS NULL
			)
	ORDER BY [Name] asc
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllDivisions]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllDivisions]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_GetAllDivisions] AS' 
END
GO
ALTER PROCEDURE [dbo].[sp_GetAllDivisions]
AS
BEGIN
	SELECT *
	FROM mst_Division
	WHERE (
			DeleteFlag = 0
			OR DeleteFlag IS NULL
			)
	ORDER BY [Name] asc
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllEducation]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllEducation]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_GetAllEducation] AS' 
END
GO
ALTER PROCEDURE [dbo].[sp_GetAllEducation]
AS
BEGIN
	SELECT *
	FROM Mst_Education
	WHERE (
			DeleteFlag = 0
			OR DeleteFlag IS NULL
			)
	ORDER BY [Name] asc
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllEmployees]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllEmployees]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_GetAllEmployees] AS' 
END
GO
ALTER PROCEDURE [dbo].[sp_GetAllEmployees]
AS
BEGIN
	SELECT mst_User.[UserID]
		,mst_User.[UserLastName] FirstName
		,mst_User.[UserFirstName] LastName
		,LTRIM(RTRIM(dbo.mst_User.UserLastName)) + ' ' + LTRIM(RTRIM(dbo.mst_User.UserFirstName)) AS UserName
		,dbo.mst_User.Email
		,dbo.mst_Designation.Id DesignationID
		,LTRIM(RTRIM(dbo.mst_Designation.NAME)) AS Designation
		,dbo.mst_User.DeleteFlag
		,dbo.mst_User.EmployeeID
	FROM dbo.mst_Designation
	INNER JOIN dbo.mst_User ON dbo.mst_Designation.Id = dbo.mst_User.Designation
END

GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllHivDisclosure]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllHivDisclosure]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_GetAllHivDisclosure] AS' 
END
GO
ALTER PROCEDURE [dbo].[sp_GetAllHivDisclosure]
AS
BEGIN
	SELECT *
	FROM Mst_HivDisclosure
	WHERE (
			DeleteFlag = 0
			OR DeleteFlag IS NULL
			)
	ORDER BY [Name] asc
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllHIVDiseases]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllHIVDiseases]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_GetAllHIVDiseases] AS' 
END
GO


ALTER Procedure [dbo].[sp_GetAllHIVDiseases]

AS



BEGIN

	SELECT * FROM Mst_HivDisease WHERE(DeleteFlag = 0 or DeleteFlag IS NULL) 

END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllLPTF]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllLPTF]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_GetAllLPTF] AS' 
END
GO


ALTER Procedure [dbo].[sp_GetAllLPTF]

AS



BEGIN

	SELECT * FROM mst_LPTF WHERE(DeleteFlag = 0 or DeleteFlag IS NULL) 

END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllMSTCode]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllMSTCode]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_GetAllMSTCode] AS' 
END
GO
ALTER  Procedure [dbo].[sp_GetAllMSTCode]
AS

BEGIN
	SELECT * FROM Mst_Code WHERE(DeleteFlag = 0 or DeleteFlag IS NULL) 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllMSTDecode]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllMSTDecode]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_GetAllMSTDecode] AS' 
END
GO


ALTER Procedure [dbo].[sp_GetAllMSTDecode]

@Codes varchar(50)

AS

BEGIN
	Declare @sqlQuery varchar(500)
	Set @sqlQuery = 'SELECT * FROM Mst_Decode WHERE CodeID IN( '+@Codes+') and (DeleteFlag = 0 or DeleteFlag IS NULL) and SystemId in(0,1) ORDER BY SRNo;'
	Exec (@sqlQuery)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllMSTSymptoms]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllMSTSymptoms]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_GetAllMSTSymptoms] AS' 
END
GO

ALTER PROCEDURE [dbo].[sp_GetAllMSTSymptoms]

AS
BEGIN
	SELECT *
	FROM mst_Symptom WHERE 
	 (
			DeleteFlag = 0
			OR DeleteFlag IS NULL
			)
	ORDER BY [Name] asc
END
GO
/****** Object:  StoredProcedure [dbo].[sp_getAllPatientVitals]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_getAllPatientVitals]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_getAllPatientVitals] AS' 
END
GO
-- =============================================
-- Author:		John Macharia
-- Create date: 23rd Jan 2018
-- Description:	Get all vitals from all modules
-- =============================================
ALTER PROCEDURE [dbo].[sp_getAllPatientVitals]
	-- Add the parameters for the stored procedure here
	@PatientId int = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select top 12 * from (
	select patientid, height,[weight],bmi, createdate from patientvitals where patientid = @PatientId and deleteflag=0
	union
	select b.id patientid, a.height,a.[weight], cast(isnull(a.[weight]/((a.height/100)*(a.height/100)),0) as decimal(36,2)) bmi, c.visitdate from dtl_patientvitals a inner join patient b on a.ptn_pk = b.ptn_pk 
	inner join ord_visit c on a.visit_pk = c.visit_id
	where b.id = @PatientId) vitals
	where vitals.height > 0 
	and vitals.[weight] > 0 and vitals.createdate > dateadd(year, -1, getdate())
	order by vitals.createdate desc
	
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllProvince]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllProvince]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_GetAllProvince] AS' 
END
GO
ALTER PROCEDURE [dbo].[sp_GetAllProvince]
AS
BEGIN
	SELECT *
	FROM mst_Province
	WHERE (
			DeleteFlag = 0
			OR DeleteFlag IS NULL
			)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllProvince_Country]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllProvince_Country]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_GetAllProvince_Country] AS' 
END
GO
ALTER PROCEDURE [dbo].[sp_GetAllProvince_Country] 
@CountryID int
AS



BEGIN

	SELECT *

	FROM mst_Province

	WHERE (

			DeleteFlag = 0

			OR DeleteFlag IS NULL AND CountryID = @CountryID)

END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllReasons]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllReasons]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_GetAllReasons] AS' 
END
GO

ALTER PROCEDURE [dbo].[sp_GetAllReasons]

AS
BEGIN
	SELECT *
	FROM mst_Reason WHERE 
	 (
			DeleteFlag = 0
			OR DeleteFlag IS NULL
			)
	ORDER BY [Name] asc
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllVillages]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllVillages]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_GetAllVillages] AS' 
END
GO
ALTER PROCEDURE [dbo].[sp_GetAllVillages]
AS
BEGIN
	SELECT *
	FROM mst_Village
	WHERE (
			DeleteFlag = 0
			OR DeleteFlag IS NULL
			)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_getAllViralLoads]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_getAllViralLoads]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_getAllViralLoads] AS' 
END
GO
-- =============================================
-- Author:		John Macharia
-- Create date: 23rd Jan 2018
-- Description:	Get a patients viral loads
-- =============================================
ALTER PROCEDURE [dbo].[sp_getAllViralLoads] 
	-- Add the parameters for the stored procedure here
	@PatientId int = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    declare @ptnpk int = (select top 1 ptn_pk from patient where id = @PatientId)

	select distinct * from (
	select a.ptn_pk,a.orderdate,orderstatus,parameterid,
	coalesce(
	case when resultvalue is not null then resultvalue else null end,
	case when undetectable = 1 then 50 else null end
	) resultvalue,
	b.deleteflag,Isnull(c.resultdate ,c.StatusDate) ResultDate
	from ord_laborder a inner join dtl_LabOrderTestResult b on a.id = b.laborderid
	inner join dtl_LabOrderTest c on a.id = c.laborderid
	where b.parameterid in (3,107) and a.ptn_pk=@ptnpk ) VLs
	where VLs.resultvalue is not null
	ORDER BY OrderDate DESC
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllWards]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllWards]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_GetAllWards] AS' 
END
GO
ALTER PROCEDURE [dbo].[sp_GetAllWards]
AS
BEGIN
	SELECT *
	FROM mst_Ward
	WHERE (
			DeleteFlag = 0
			OR DeleteFlag IS NULL
			)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_getCurrentRegimen]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_getCurrentRegimen]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_getCurrentRegimen] AS' 
END
GO
-- =============================================
-- Author:		John Macharia
-- Create date: 14th Feb 2017
-- Description:	get current regimen
-- =============================================
ALTER PROCEDURE [dbo].[sp_getCurrentRegimen]
	-- Add the parameters for the stored procedure here
	@PatientID int = null

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;

	--select top 1 a.RegimenId, a.RegimenLineId, b.VisitDate
	--from ARVTreatmentTracker a inner join PatientMasterVisit b on a.PatientMasterVisitId = b.id
	--where a.PatientId = @PatientID
	--order by b.VisitDate desc

	select top 1 V.RegimenId,V.RegimenLineId, V.VisitDate from PatientTreatmentTrackerView V
	where v.PatientId=@PatientID AND v.RegimenId <> 0
	order by V.Id desc

End








GO
/****** Object:  StoredProcedure [dbo].[sp_getFacility]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_getFacility]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_getFacility] AS' 
END
GO
-- =============================================
-- Author:		John Macharia
-- Create date: 11th April 2017
-- Description:	get Facility
-- =============================================
ALTER PROCEDURE [dbo].[sp_getFacility]
	-- Add the parameters for the stored procedure here
AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;
	select FacilityID,FacilityName,SatelliteID,DeleteFlag, UserID from mst_facility where deleteflag=0

End








GO
/****** Object:  StoredProcedure [dbo].[sp_getItemIdByGroupAndItemName]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_getItemIdByGroupAndItemName]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_getItemIdByGroupAndItemName] AS' 
END
GO
-- =============================================
-- Author:		John Macharia
-- Create date: 11th April 2017
-- Description:	get ItemId By Group And ItemName
-- =============================================
ALTER PROCEDURE [dbo].[sp_getItemIdByGroupAndItemName]
	-- Add the parameters for the stored procedure here
	@groupName varchar(100) = null,
	@ItemName varchar(100) = null
AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;
	select * from [dbo].[LookupItemView] where MasterName = @groupName and ItemName = @ItemName

End








GO
/****** Object:  StoredProcedure [dbo].[sp_GetMSTDecode]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetMSTDecode]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_GetMSTDecode] AS' 
END
GO

ALTER Procedure [dbo].[sp_GetMSTDecode]

@CodeID int

AS

BEGIN
	SELECT * FROM Mst_Decode WHERE CodeID = @CodeID and (DeleteFlag = 0 or DeleteFlag IS NULL) and SystemId in(0,1) ORDER BY SRNo
END
GO
/****** Object:  StoredProcedure [dbo].[sp_getPatientEncounter]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_getPatientEncounter]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_getPatientEncounter] AS' 
END
GO
-- =============================================
-- Author:		John Macharia
-- Create date: 10th Feb 2017
-- Description:	get patient encounter
-- =============================================
ALTER PROCEDURE [dbo].[sp_getPatientEncounter]
	-- Add the parameters for the stored procedure here
	@PatientMasterVisitID int = null,
	@PatientID int = null

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;
	declare @TBScreeningTypeID int = (Select Id from LookupMaster where name = 'TBStatus')
	declare @NutritionScreeningTypeID int = (Select Id from LookupMaster where name = 'NutritionStatus')
	declare @GeneralExamMasterId int = (Select top 1 Id from LookupMaster where name = 'GeneralExamination')
	declare @ARVAdherenceType int = (Select Id from LookupMaster where name = 'ARVAdherence')
	declare @CTXAdherenceType int = (Select Id from LookupMaster where name = 'CTXAdherence')

	--0
	--select * from PatientMasterVisit 
	--where id = @PatientMasterVisitID and patientId = @PatientID	and (DeleteFlag is null OR DeleteFlag = 0)
	Select id, PatientId, ServiceId, Start, [End], Active, REPLACE(CONVERT(VARCHAR(11), VisitDate, 106), ' ', '-') VisitDate, VisitScheduled, VisitBy, VisitType, [Status], CreateDate,DeleteFlag,	CreatedBy, AuditData FROM PatientMasterVisit
	where id = @PatientMasterVisitID and patientId = @PatientID	and (DeleteFlag is null OR DeleteFlag = 0)
	
	--1
	select * from ComplaintsHistory where PatientMasterVisitId = @PatientMasterVisitID and patientId = @PatientID
	and (DeleteFlag is null OR DeleteFlag = 0)
	
	--2
	select * from PhysicalExamination where PatientMasterVisitId = @PatientMasterVisitID and patientId = @PatientID
	and ExaminationTypeId = @GeneralExamMasterId and (DeleteFlag is null OR DeleteFlag = 0)
	
	--TB Screening 3
	select ScreeningValueId from PatientScreening 
	where PatientMasterVisitId = @PatientMasterVisitID and patientId = @PatientID and ScreeningTypeId = @TBScreeningTypeID
	and (DeleteFlag is null OR DeleteFlag = 0)
	
	--Nutrition Screening 4
	select ScreeningValueId from PatientScreening 
	where PatientMasterVisitId = @PatientMasterVisitID and patientId = @PatientID and ScreeningTypeId = @NutritionScreeningTypeID
	and (DeleteFlag is null OR DeleteFlag = 0)
	
	--5
	select * from PatientPHDP where PatientMasterVisitId = @PatientMasterVisitID and patientId = @PatientID 
	and (DeleteFlag is null OR DeleteFlag = 0)

	--6 ARV Adherence
	select Score from AdherenceOutcome 
	where PatientMasterVisitId = @PatientMasterVisitID and patientId = @PatientID and AdherenceType = @ARVAdherenceType
	and (DeleteFlag is null OR DeleteFlag = 0)

	--7 CTX Adherence
	select Score from AdherenceOutcome 
	where PatientMasterVisitId = @PatientMasterVisitID and patientId = @PatientID and AdherenceType = @CTXAdherenceType
	and (DeleteFlag is null OR DeleteFlag = 0)

	--8 workplan
	select * from PatientClinicalNotes
	where PatientMasterVisitId = @PatientMasterVisitID and patientId = @PatientID and deleteflag <> 1

	--9 ICF
	select * from [dbo].[PatientIcf]
	where PatientMasterVisitId = @PatientMasterVisitID and patientId = @PatientID and deleteflag <> 1

	--10 ICF Action
	select * from [dbo].[PatientIcfAction]
	where PatientMasterVisitId = @PatientMasterVisitID and patientId = @PatientID and deleteflag <> 1

	--11 IPT
	select * from [dbo].[PatientIpt]
	where PatientMasterVisitId = @PatientMasterVisitID and patientId = @PatientID and deleteflag <> 1

	--12 IPT Outcome
	select * from [dbo].[PatientIptOutcome]
	where PatientMasterVisitId = @PatientMasterVisitID and patientId = @PatientID and deleteflag <> 1

	--13 IPT Workup
	select *, REPLACE(CONVERT(VARCHAR(11), iptstartdate, 106), ' ', '-') StartIPTDate from [dbo].[PatientIptWorkup]
	where PatientMasterVisitId = @PatientMasterVisitID and patientId = @PatientID and deleteflag <> 1
	
	--14 WHO Stage
	select * from [dbo].[PatientWHOStage]
	where PatientMasterVisitId = @PatientMasterVisitID and patientId = @PatientID

	--15 appointment
	--select * from PatientAppointment
	--where PatientMasterVisitId = @PatientMasterVisitID and patientId = @PatientID

	Select Id, PatientMasterVisitId, ServiceAreaId, PatientId, REPLACE(CONVERT(VARCHAR(11), AppointmentDate, 106), ' ', '-') AppointmentDate, ReasonId, Description, StatusId, StatusDate, DifferentiatedCareId, DeleteFlag, CreatedBy, CreateDate, AuditData from PatientAppointment
	where PatientMasterVisitId = @PatientMasterVisitID and patientId = @PatientID

End
GO
/****** Object:  StoredProcedure [dbo].[sp_getPatientEncounterAdverseEvents]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_getPatientEncounterAdverseEvents]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_getPatientEncounterAdverseEvents] AS' 
END
GO
-- =============================================
-- Author:		John Macharia
-- Create date: 14th Feb 2017
-- Description:	get patient encounter Adverse Events
-- =============================================
ALTER PROCEDURE [dbo].[sp_getPatientEncounterAdverseEvents]
	-- Add the parameters for the stored procedure here
	@PatientMasterVisitID int = null,
	@PatientID int = null

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;

	select Severity SeverityID,AdverseEventId,EventName,EventCause,b.DisplayName Severity,[Action] 
	from AdverseEvent a left join LookupItem b on a.Severity = b.Id
	where patientId = @PatientID and (a.DeleteFlag is null or a.DeleteFlag = 0)

	-- PatientMasterVisitId = @PatientMasterVisitID and  //commented to show all adverseEvents patient has had.
	
End
GO
/****** Object:  StoredProcedure [dbo].[sp_getPatientEncounterAllergies]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_getPatientEncounterAllergies]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_getPatientEncounterAllergies] AS' 
END
GO
-- =============================================
-- Author:		John Macharia
-- Create date: 19th Mar 2017
-- Description:	get patient encounter Allergies
-- =============================================
ALTER PROCEDURE [dbo].[sp_getPatientEncounterAllergies]
	-- Add the parameters for the stored procedure here
	@PatientMasterVisitID int = null,
	@PatientID int = null

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;

	select Allergen allergyId,reaction reactionId, severity severityId, b.displayname allergy, c.DisplayName reaction, 
	d.DisplayName severity, CONVERT(varchar(20),a.onsetdate,106) onsetDate
	from patientallergy a inner join lookupitem b on a.allergen = b.Id
	left join lookupitem c on a.Reaction = c.id
	left join lookupitem d on a.severity = d.id
	where patientId = @PatientID and (a.DeleteFlag is null or a.DeleteFlag = 0)
	
End








GO
/****** Object:  StoredProcedure [dbo].[sp_getPatientEncounterChronicIllness]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_getPatientEncounterChronicIllness]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_getPatientEncounterChronicIllness] AS' 
END
GO
-- =============================================
-- Author:		John Macharia
-- Create date: 14th Feb 2017
-- Description:	get patient encounter Chronic Illness
-- =============================================
ALTER PROCEDURE [dbo].[sp_getPatientEncounterChronicIllness]
	-- Add the parameters for the stored procedure here
	@PatientMasterVisitID int = null,
	@PatientID int = null

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;

	select chronicIllness chronicIllnessID, b.DisplayName chronicIllnessName, Treatment,dose,
	convert(varchar(20),OnsetDate,106) OnsetDate,active 
	from PatientChronicIllness a inner join LookupItem b on a.ChronicIllness = b.Id
	where patientId = @PatientID and (a.DeleteFlag is null or a.DeleteFlag = 0)
	
End








GO
/****** Object:  StoredProcedure [dbo].[sp_getPatientEncounterComplaints]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_getPatientEncounterComplaints]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_getPatientEncounterComplaints] AS' 
END
GO
-- =============================================
-- Author:		John Macharia
-- Create date: 14th Feb 2017
-- Description:	get patient encounter complaints
-- =============================================
ALTER PROCEDURE [dbo].[sp_getPatientEncounterComplaints]
	-- Add the parameters for the stored procedure here
	@PatientMasterVisitID int = null,
	@PatientID int = null

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;

	select presentingComplaintsId, b.DisplayName complaint, convert(varchar(20), onsetDate, 106) onsetDate
	from presentingComplaints a left join LookupItem b on a.presentingComplaintsId = b.Id
	where PatientMasterVisitId = @PatientMasterVisitID and patientId = @PatientID and (a.DeleteFlag is null or a.DeleteFlag = 0)
	
End








GO
/****** Object:  StoredProcedure [dbo].[sp_getPatientEncounterDiagnosis]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_getPatientEncounterDiagnosis]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_getPatientEncounterDiagnosis] AS' 
END
GO
-- =============================================
-- Author:		John Macharia
-- Create date: 14th Feb 2017
-- Description:	get patient encounter Diagnosis
-- =============================================
ALTER PROCEDURE [dbo].[sp_getPatientEncounterDiagnosis]
	-- Add the parameters for the stored procedure here
	@PatientMasterVisitID int = null,
	@PatientID int = null

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;

	select a.Diagnosis, b.DisplayName, ManagementPlan
	from PatientDiagnosis a inner join lookupitem b on a.diagnosis = b.id
	where PatientMasterVisitId = @PatientMasterVisitID and patientId = @PatientID and (a.DeleteFlag is null or a.DeleteFlag = 0)
	
End








GO
/****** Object:  StoredProcedure [dbo].[sp_getPatientEncounterExam]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_getPatientEncounterExam]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_getPatientEncounterExam] AS' 
END
GO
-- =============================================
-- Author:		John Macharia
-- Create date: 14th Feb 2017
-- Description:	get patient encounter Physical Exam
-- =============================================
ALTER PROCEDURE [dbo].[sp_getPatientEncounterExam]
	-- Add the parameters for the stored procedure here
	@PatientMasterVisitID int = null,
	@PatientID int = null

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;

SELECT 
	PYE.ExaminationTypeId AS examTypeID, 
	PYE.ExamId AS examID,
	PYE.FindingId AS findingID,
	LV.DisplayName AS examType, 
	(SELECT TOP 1 ItemName FROM LookupItemView where ItemId = PYE.FindingId) AS exam, 
	PYE.FindingsNotes AS findings
	FROM dbo.PhysicalExamination AS PYE LEFT OUTER JOIN
	dbo.LookupItemView AS LV ON PYE.ExaminationTypeId = LV.MasterId AND PYE.ExamId = LV.ItemId
	WHERE (LV.MasterName = 'ReviewOfSystems') and PYE.PatientMasterVisitId = @PatientMasterVisitID and PYE.PatientId = @PatientID and (PYE.DeleteFlag is null or PYE.DeleteFlag = 0)
	
End
GO
/****** Object:  StoredProcedure [dbo].[sp_getPatientEncounterHistory]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_getPatientEncounterHistory]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_getPatientEncounterHistory] AS' 
END
GO

-- =============================================
-- Author:		John Macharia
-- Create date: 10th Feb 2017
-- Description:	get patient encounter History
-- =============================================
ALTER PROCEDURE [dbo].[sp_getPatientEncounterHistory]
	-- Add the parameters for the stored procedure here
	@PatientID int = null

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;

select * from (
select distinct 
a.patientmastervisitid VisitID
,b.displayname VisitName
,a.patientid
,
(case b.displayname 
	when 'Pharmacy' then (select top 1 ISNULL(orderedbydate,dispensedbydate)
	from ord_patientpharmacyorder where patientmastervisitid = a.patientmastervisitid)
	when 'Lab' then (select top 1 OrderDate	from ord_laborder where patientmastervisitid = a.patientmastervisitid)
	when 'CCC' then (select top 1 visitdate
	from PatientMasterVisit where id = a.patientmastervisitid)
	when 'Triage' then (select top 1 visitdate from PatientVitals where patientmastervisitid = a.patientmastervisitid)
	else a.encounterstarttime	end) VisitDate,

c.username, a.deleteflag,
(case b.displayname 
	when 'Pharmacy' then convert(varchar(50),isnull((select top 1 orderstatus from ord_patientpharmacyorder where patientmastervisitid = a.patientmastervisitid),'0'))
	when 'Lab' then convert(varchar(50),isnull((select top 1 orderstatus from ord_laborder where patientmastervisitid = a.patientmastervisitid),'0'))
	else '0'
	end) [status]
from patientencounter a inner join lookupitem b on a.encountertypeid = b.id
inner join mst_user c on a.createdby = c.userid
inner join PatientMasterVisit d on a.patientmastervisitid = d.id
where a.patientid = @PatientID and d.visitdate is not null) ph
order by convert(date,ph.VisitDate) desc


End
GO
/****** Object:  StoredProcedure [dbo].[sp_getPatientEncounterVaccines]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_getPatientEncounterVaccines]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_getPatientEncounterVaccines] AS' 
END
GO
-- =============================================
-- Author:		John Macharia
-- Create date: 14th Feb 2017
-- Description:	get patient encounter Vaccines
-- =============================================
ALTER PROCEDURE [dbo].[sp_getPatientEncounterVaccines]
	-- Add the parameters for the stored procedure here
	@PatientMasterVisitID int = null,
	@PatientID int = null

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;

	select vaccine vaccineID, VaccineStage VaccineStageID, b.DisplayName VaccineName, c.DisplayName VaccineStageName, Convert(varchar(12),VaccineDate,106)VaccineDate
	from Vaccination a 
	inner join LookupItem b on a.Vaccine = b.Id
	left join LookupItem c on a.VaccineStage = c.Id
	where patientId = @PatientID and (a.DeleteFlag is null or a.DeleteFlag = 0)
	
End








GO
/****** Object:  StoredProcedure [dbo].[sp_getPatientLatestPharmacyPrescription]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_getPatientLatestPharmacyPrescription]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_getPatientLatestPharmacyPrescription] AS' 
END
GO
-- =============================================
-- Author:		John Macharia
-- Create date: 29th May 2017
-- Description:	get patient latest pharmacy prescription
-- =============================================
ALTER PROCEDURE [dbo].[sp_getPatientLatestPharmacyPrescription]
	-- Add the parameters for the stored procedure here
	@PatientId int = null,
	@FacilityId int = null

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;
	declare @pharmacy_pk int, @latestDispenseDate datetime
	set @latestDispenseDate = (select top 1 max(dispensedbydate) from ord_PatientPharmacyOrder where patientid = @PatientId and deleteflag <> 1) 
	set @pharmacy_pk = (select top 1 ptn_pharmacy_pk from ord_PatientPharmacyOrder 
						where dispensedbydate = @latestDispenseDate and DeleteFlag <> 1)


	if exists (select 1 from lnk_FacilityModule where facilityid = @FacilityId and ModuleId = 201)
	begin
		select a.Drug_Pk, 0 batchId, a.FrequencyID, null abbr, b.DrugName, '' batchName, a.SingleDose dose, 
		d.Name freq, a.duration, a.OrderedQuantity,0 DispensedQuantity, a.Prophylaxis
		from dtl_PatientPharmacyOrder a inner join mst_drug b on a.Drug_Pk = b.Drug_pk
		--left join Mst_Batch c on a.BatchNo = c.ID
		left join mst_Frequency d on a.FrequencyID = d.ID
		where a.ptn_pharmacy_pk = @pharmacy_pk
	end
	Else
	begin
		select a.Drug_Pk, 0 batchId, a.FrequencyID, null abbr, b.DrugName, '' batchName, a.SingleDose dose, 
		d.Name freq, a.duration, a.OrderedQuantity, a.DispensedQuantity, a.Prophylaxis
		from dtl_PatientPharmacyOrder a inner join mst_drug b on a.Drug_Pk = b.Drug_pk
		--left join Mst_Batch c on a.BatchNo = c.ID
		left join mst_Frequency d on a.FrequencyID = d.ID
		where a.ptn_pharmacy_pk = @pharmacy_pk
	end
	
End
GO
/****** Object:  StoredProcedure [dbo].[sp_getPatientPharmacyPrescription]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_getPatientPharmacyPrescription]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_getPatientPharmacyPrescription] AS' 
END
GO
-- =============================================
-- Author:		John Macharia
-- Create date: 13th Mar 2017
-- Description:	get patient pharmacy prescription
-- =============================================
ALTER PROCEDURE [dbo].[sp_getPatientPharmacyPrescription]
	-- Add the parameters for the stored procedure here
	@PatientMasterVisitID int = null

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;
	declare @pharmacy_pk int
	set @pharmacy_pk = (select top 1 ptn_pharmacy_pk from ord_PatientPharmacyOrder 
						where PatientMasterVisitId = @PatientMasterVisitID and DeleteFlag <> 1)

	select a.Drug_Pk,
	--(select batchId from dtl_patientPharmacyDispensed where ptn_pharmacy_pk = a.ptn_pharmacy_pk and drug_pk = a.Drug_Pk) batchId,
	a.BatchNo batchId,
	a.FrequencyID,null abbr,b.DrugName,c.Name batchName,a.SingleDose dose, 
	d.Name freq,a.duration,a.OrderedQuantity,a.DispensedQuantity,
	--(select dispensedQuantity from dtl_patientPharmacyDispensed where ptn_pharmacy_pk = a.ptn_pharmacy_pk and drug_pk = a.Drug_Pk)DispensedQuantity,
	a.Prophylaxis
	from dtl_PatientPharmacyOrder a inner join mst_drug b on a.Drug_Pk = b.Drug_pk
	left join Mst_Batch c on a.BatchNo = c.ID
	left join mst_Frequency d on a.FrequencyID = d.ID
	--left join dtl_patientPharmacyDispensed e on a.ptn_pharmacy_pk = e.ptn_pharmacy_pk
	where a.ptn_pharmacy_pk IN(SELECT ptn_pharmacy_pk from ord_PatientPharmacyOrder WHERE PatientMasterVisitId=@PatientMasterVisitID) -- a.ptn_pharmacy_pk = @pharmacy_pk (old implementation)
	
End
GO
/****** Object:  StoredProcedure [dbo].[sp_getPatientWorkPlan]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_getPatientWorkPlan]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_getPatientWorkPlan] AS' 
END
GO
-- =============================================
-- Author:		John Macharia
-- Create date: 13th May 2017
-- Description:	get patient work plan
-- =============================================
ALTER PROCEDURE [dbo].[sp_getPatientWorkPlan]
	-- Add the parameters for the stored procedure here
	@PatientID int = null

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;

	select convert(varchar(20),b.visitdate,106) visitDate, a.clinicalNotes
	from patientclinicalnotes a inner join PatientMasterVisit b on a.PatientMasterVisitId = b.Id
	where b.patientid = @PatientID and b.DeleteFlag <> 1
	order by b.visitdate desc
	
End








GO
/****** Object:  StoredProcedure [dbo].[sp_getPendingPrescriptions]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_getPendingPrescriptions]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_getPendingPrescriptions] AS' 
END
GO
-- =============================================
-- Author:		John Macharia
-- Create date: 16th Mar 2017
-- Description:	get patient encounter Chronic Illness
-- =============================================
ALTER PROCEDURE [dbo].[sp_getPendingPrescriptions]
	-- Add the parameters for the stored procedure here
	@PatientMasterVisitID int = null,
	@PatientID int = null

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;

	select a.PatientMasterVisitId, a.Ptn_pk, e.identifiervalue, c.FirstName, c.MidName, c.LastName, d.UserLastName + d.UserFirstName as prescribedBy 
	from ord_PatientPharmacyOrder a inner join patient b on a.ptn_pk = b.Id
	inner join person c on b.PersonId = c.Id
	inner join mst_User d on a.OrderedBy = d.UserID
	inner join PatientIdentifier e on e.PatientId = a.Ptn_pk
	where (a.DeleteFlag is null or a.DeleteFlag = 0) and (a.orderstatus = 1 or a.orderstatus = 3)
	
End








GO
/****** Object:  StoredProcedure [dbo].[sp_getPharmacyBatch]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_getPharmacyBatch]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_getPharmacyBatch] AS' 
END
GO
-- =============================================
-- Author:		John Macharia
-- Create date: 14th Feb 2017
-- Description:	get pharmacy drug batches
-- =============================================
ALTER PROCEDURE [dbo].[sp_getPharmacyBatch]
	-- Add the parameters for the stored procedure here
	@DrugPk int = null

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;

	select a.id, a.Name + ' ~ Expiry Date: ' + Convert(varchar(20), a.ExpiryDate,106) + ' ~ Quantity: ' + CONVERT(varchar(20),sum(b.Quantity)) as Name 
	from Mst_Batch a inner join Dtl_StockTransaction b on a.id = b.batchid
	where a.ItemID = @DrugPk and a.DeleteFlag <> 1
	group by a.id, a.Name, a.ExpiryDate
	order by a.ExpiryDate asc

End








GO
/****** Object:  StoredProcedure [dbo].[sp_getPharmacyDrugFrequency]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_getPharmacyDrugFrequency]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_getPharmacyDrugFrequency] AS' 
END
GO
-- =============================================
-- Author:		John Macharia
-- Create date: 3rd June 2017
-- Description:	get pharmacy drug frequency
-- =============================================
ALTER PROCEDURE [dbo].[sp_getPharmacyDrugFrequency]
	-- Add the parameters for the stored procedure here

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;

	select id,name,multiplier from mst_Frequency where DeleteFlag <> 1
End

GO
/****** Object:  StoredProcedure [dbo].[sp_getPharmacyDrugList]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_getPharmacyDrugList]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_getPharmacyDrugList] AS' 
END
GO

-- =============================================
-- Author:		John Macharia
-- Create date: 14th Feb 2017
-- Description:	get pharmacy drug list
-- =============================================
ALTER PROCEDURE [dbo].[sp_getPharmacyDrugList]
	-- Add the parameters for the stored procedure here
	@pmscm int = null,@tp varchar(10)=null
	

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;
	DECLARE @drugTypeId int =0;

	--select Drug_pk, DrugName,CONCAT(Drug_pk, '~',abbreviation, '~', DrugName)val 
	--from mst_drug
	-- ////////////////////////////////////////////////////////////////////////////////////////
	IF(@tp IN('ART','PMTCT','PEP','PREP','HBV','Hepatitis B'))
		BEGIN
		  SET @drugTypeId=37
		END


	-- ///////////////////////////////////////////////////////////////////////////////////////

	
	IF(@pmscm = 1)
	BEGIN

		IF(@drugTypeId=37)
		  BEGIN
				SELECT
					D.Drug_pk
					,CASE WHEN D.abbreviation IS NULL THEN D.DrugName
					ELSE 
						CONCAT(D.DrugName,' (', D.abbreviation, ')')
					END drugName					
				  -- , (Convert(varchar(8),D.Drug_pk)+ '~' + isnull(D.abbreviation,D.DrugName) + '~' + D.DrugName) val
				  ,CONCAT(D.Drug_pk, '~',D.abbreviation, '~', D.DrugName)val 
				FROM Dtl_StockTransaction AS ST
				INNER JOIN Mst_Store AS S
					ON S.Id = ST.StoreId
						AND S.DispensingStore = 1
				RIGHT OUTER JOIN Mst_Drug AS D
					ON D.Drug_pk = ST.ItemId
				INNER JOIN lnk_DrugGeneric l
					ON D.Drug_pk = l.Drug_pk
				--INNER JOIN lnk_DrugTypeGeneric g
				--	ON l.GenericID = g.GenericId
				WHERE D.DeleteFlag = 0
				-- AND g.DrugTypeId =37
				GROUP BY D.Drug_pk
						,D.DrugName
						,D.abbreviation
				HAVING SUM(ST.Quantity) > 0

				--select D.*, G.DrugTypeId From Mst_Drug D Inner join lnk_DrugGeneric DG on DG.Drug_pk=D.drug_pk
				-- inner join lnk_DrugTypeGeneric G on G.GenericId= DG.GenericID and g.DrugTypeId=37

			END
		ELSE
		 BEGIN 
			SELECT
					D.Drug_pk
					,CASE WHEN D.abbreviation IS NULL THEN D.DrugName
					ELSE 
						CONCAT(D.DrugName,' (', D.abbreviation, ')')
					END drugName					
				   -- ,(Convert(varchar(8),D.Drug_pk) + '~' + isnull(D.abbreviation,D.DrugName) +  '~' + D.DrugName) val
				   ,CONCAT(D.Drug_pk, '~',D.abbreviation, '~', D.DrugName)val 
				FROM Dtl_StockTransaction AS ST
				INNER JOIN Mst_Store AS S
					ON S.Id = ST.StoreId
						AND S.DispensingStore = 1
				RIGHT OUTER JOIN Mst_Drug AS D
					ON D.Drug_pk = ST.ItemId
				INNER JOIN lnk_DrugGeneric l
					ON D.Drug_pk = l.Drug_pk

				--INNER JOIN lnk_DrugTypeGeneric g
				--	ON l.GenericID = g.GenericId
				WHERE D.DeleteFlag = 0 AND D.Drug_pk IN(SELECT x.Drug_pk FROM lnk_DrugGeneric x WHERE x.GenericID IN(SELECT k.GenericId FROM lnk_DrugTypeGeneric k WHERE k.DrugTypeId<>37))
				-- AND g.DrugTypeId <>37
				GROUP BY D.Drug_pk
						,D.DrugName
						,D.abbreviation
				HAVING SUM(ST.Quantity) > 0   
		 END

	END
	ELSE
		BEGIN

			IF(@drugTypeId=37)
			BEGIN
				Select	D.Drug_pk, 
					CASE WHEN D.abbreviation IS NULL THEN D.DrugName
					ELSE 
						CONCAT(D.DrugName,' (', D.abbreviation, ')')
					END drugName,					
					CONCAT(D.Drug_pk, '~',D.abbreviation, '~', D.DrugName)val 
				-- (Convert(varchar(8),D.Drug_pk) +  '~' + isnull(D.abbreviation,D.DrugName) +  '~' + D.DrugName) val 
				From Dtl_StockTransaction As ST	Inner Join Mst_Store As S On S.Id = ST.StoreId And S.DispensingStore = 1
				Right Outer Join Mst_Drug As D On D.Drug_pk = ST.ItemId 
								INNER JOIN lnk_DrugGeneric l
						ON D.Drug_pk = l.Drug_pk
					--INNER JOIN lnk_DrugTypeGeneric g
					--	ON l.GenericID = g.GenericId
					WHERE D.DeleteFlag = 0
					--AND g.DrugTypeId = @drugTypeId
				Group By D.Drug_pk,	D.DrugName, D.abbreviation
			END
			ELSE
			BEGIN
						Select	D.Drug_pk, D.DrugName,CONCAT(D.Drug_pk, '~',D.abbreviation, '~', D.DrugName)val 
				-- (Convert(varchar(8),D.Drug_pk) + '~' + isnull(D.abbreviation,D.DrugName) + '~' + D.DrugName) val 
				From Dtl_StockTransaction As ST	Inner Join Mst_Store As S On S.Id = ST.StoreId And S.DispensingStore = 1
				Right Outer Join Mst_Drug As D On D.Drug_pk = ST.ItemId 
								INNER JOIN lnk_DrugGeneric l
						ON D.Drug_pk = l.Drug_pk
					INNER JOIN lnk_DrugTypeGeneric g
						ON l.GenericID = g.GenericId
					WHERE D.DeleteFlag = 0 --AND D.Drug_pk IN(SELECT x.Drug_pk FROM lnk_DrugGeneric x WHERE x.GenericID IN(SELECT k.GenericId FROM lnk_DrugTypeGeneric k WHERE k.DrugTypeId<>37))
					 AND g.DrugTypeId <> 37 
				Group By D.Drug_pk,	D.DrugName, D.abbreviation
			END
		END

End
GO
/****** Object:  StoredProcedure [dbo].[sp_getPharmacyDrugSwitchSubReasons]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_getPharmacyDrugSwitchSubReasons]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_getPharmacyDrugSwitchSubReasons] AS' 
END
GO
-- =============================================
-- Author:		John Macharia
-- Create date: 8th Mar 2017
-- Description:	get pharmacy drug switch, substitution reasons
-- =============================================
ALTER PROCEDURE [dbo].[sp_getPharmacyDrugSwitchSubReasons]
	-- Add the parameters for the stored procedure here
	@TreatmentPlan int = null

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;

	select LookupItemId, DisplayName from LookupMasterItem where LookupMasterId = @TreatmentPlan
	order by OrdRank
End








GO
/****** Object:  StoredProcedure [dbo].[sp_getPharmacyFields]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_getPharmacyFields]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_getPharmacyFields] AS' 
END
GO
-- =============================================
-- Author:		John Macharia
-- Create date: 14th Feb 2017
-- Description:	get pharmacy fields
-- =============================================
ALTER PROCEDURE [dbo].[sp_getPharmacyFields]
	-- Add the parameters for the stored procedure here
	@PatientMasterVisitID int = null

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;

		--13 Pharmacy Parameters
	select b.ProgID, b.pharmacyPeriodTaken ,a.TreatmentStatusId,a.TreatmentStatusReasonId, a.RegimenLineId, a.RegimenId,
	convert(varchar(30),b.OrderedByDate,106) OrderedByDate,convert(varchar(30),b.DispensedByDate,106) DispensedByDate
	from ARVTreatmentTracker a right join ord_PatientPharmacyOrder b on a.PatientMasterVisitId = b.PatientMasterVisitId
	where b.PatientMasterVisitId = @PatientMasterVisitID
End








GO
/****** Object:  StoredProcedure [dbo].[sp_getPharmacyPatientsExpected]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_getPharmacyPatientsExpected]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_getPharmacyPatientsExpected] AS' 
END
GO
-- =============================================
-- Author:		John Macharia
-- Create date: 14th Feb 2017
-- Description:	get number of patients expected to come for pharmacy
-- =============================================
ALTER PROCEDURE [dbo].[sp_getPharmacyPatientsExpected]
	-- Add the parameters for the stored procedure here
	@Date datetime

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;
	--declare @pharmacyReason int = (select top 1 id from mst_decode where name = 'Pharmacy Refill')
	--0 expected
	select count(distinct Ptn_Pk) expected from dtl_patientappointment 
	where (deleteflag = 0 or deleteflag is null) and cast(AppDate as date) = cast(@Date as date)

	--1 Actual
	select count(distinct ptn_pk) actual  from ord_patientpharmacyorder 
	where (deleteflag=0 or deleteflag is null) and cast(dispensedbydate as date) = cast(@Date as date)
	
End
GO
/****** Object:  StoredProcedure [dbo].[sp_getPharmacyRegimens]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_getPharmacyRegimens]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_getPharmacyRegimens] AS' 
END
GO
-- =============================================
-- Author:		John Macharia
-- Create date: 8th Mar 2017
-- Description:	get pharmacy drug switch, substitution reasons
-- =============================================
ALTER PROCEDURE [dbo].[sp_getPharmacyRegimens]
	-- Add the parameters for the stored procedure here
	@regimenLine varchar(50) = null

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On

	select LookupItemId, b.name + '(' + b.displayname + ')' DisplayName 
	from LookupMasterItem a inner join lookupitem b on a.lookupitemid = b.id
	where a.LookupMasterId = (select id from lookupmaster where name = @regimenLine)
	order by OrdRank
End








GO
/****** Object:  StoredProcedure [dbo].[sp_GetPluginModuleAndFeaturesForFacility]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetPluginModuleAndFeaturesForFacility]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_GetPluginModuleAndFeaturesForFacility] AS' 
END
GO
-- =============================================
-- Author:		Akhil Dwivedi
-- Create date: Feb 18, 2015
-- Description:	Procedure will return modules and features which 
-- are plugin and have associated with facility
-- =============================================
ALTER PROCEDURE [dbo].[sp_GetPluginModuleAndFeaturesForFacility] (@FacilityID INT)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT mst_module.ModuleID
		,mst_module.ModuleName
	FROM mst_module
	INNER JOIN lnk_FacilityModule ON mst_module.ModuleID = lnk_FacilityModule.ModuleID
	WHERE mst_module.IsPlugIn = 1
		AND lnk_FacilityModule.FacilityID = @FacilityID

		SELECT mst_module.ModuleID
		,mst_module.ModuleName
		,mst_Feature.FeatureID
		,mst_Feature.FeatureName
		,mst_Feature.FeatureURL
	FROM mst_module
	INNER JOIN lnk_FacilityModule ON mst_module.ModuleID = lnk_FacilityModule.ModuleID
	INNER JOIN mst_Feature ON mst_module.ModuleID = mst_Feature.ModuleId
	WHERE mst_module.IsPlugIn = 1
		AND lnk_FacilityModule.FacilityID = @FacilityID
END

GO
/****** Object:  StoredProcedure [dbo].[sp_getPMTCTPeriodDrugTaken]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_getPMTCTPeriodDrugTaken]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_getPMTCTPeriodDrugTaken] AS' 
END
GO
-- =============================================
-- Author:		John Macharia
-- Create date: 14th Feb 2017
-- Description:	get regimen classification
-- =============================================
ALTER PROCEDURE [dbo].[sp_getPMTCTPeriodDrugTaken]
	-- Add the parameters for the stored procedure here

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;

	declare @lookUpMasterID int = (select Id from lookupmaster where name = 'PeriodDrugsTaken')

	select * from lookupmasteritem where lookupmasterid = @lookUpMasterID order by ordrank

End








GO
/****** Object:  StoredProcedure [dbo].[sp_getRegimenClassification]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_getRegimenClassification]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_getRegimenClassification] AS' 
END
GO
-- =============================================
-- Author:		John Macharia
-- Create date: 14th Feb 2017
-- Description:	get regimen classification
-- =============================================
ALTER PROCEDURE [dbo].[sp_getRegimenClassification]
	-- Add the parameters for the stored procedure here

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;

	declare @lookUpMasterID int = (select Id from lookupmaster where name = 'RegimenClassification')

	select * from lookupmasteritem where lookupmasterid = @lookUpMasterID order by ordrank

End








GO
/****** Object:  StoredProcedure [dbo].[sp_getTreatmentProgram]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_getTreatmentProgram]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_getTreatmentProgram] AS' 
END
GO
-- =============================================
-- Author:		John Macharia
-- Create date: 4th May 2017
-- Description:	get pharmacy Treatment Program
-- =============================================
ALTER PROCEDURE [dbo].[sp_getTreatmentProgram]
	-- Add the parameters for the stored procedure here
AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;
	select id, name from [dbo].[mst_decode] where codeid = 33 and deleteflag = 0

End








GO
/****** Object:  StoredProcedure [dbo].[sp_getZScores]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_getZScores]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_getZScores] AS' 
END
GO
-- =============================================      
-- Author:  John Macharia      
-- Create date:       
-- Modify date: 31 July 2014    
-- Description: Paediatric  scores    
-- =============================================  
ALTER procedure [dbo].[sp_getZScores]
(
	@PatientID int=null,
	@sex varchar(10)=null,
	@height float = null
)

As

begin
Declare @ageInDays int, @ageInMonths int;

Select @ageInMonths = Datediff(Month, DateOfBirth, Getdate()),
	@ageInDays = Datediff(Day, DateOfBirth, Getdate())
From patient
Where Id = @PatientID;


--0 weight for Age
If (@ageInDays <= 1856) 
Begin
	Select *
	From [dbo].[z_waz_young]
	Where Case  When @Sex= 'Female' And Sex= 2 Then 1
				When @Sex = 'Male' And Sex = 1 Then 1
				Else 0 End = 1
	And agedays = @ageInDays;
End
Else If(@ageInMonths >=61)
Begin
	Select *
	From [dbo].[z_waz_old]
	Where Case  When @Sex= 'Female' And Sex= 2 Then 1
				When @Sex = 'Male' And Sex = 1 Then 1
				Else 0 End = 1
	And ageMos = @ageInMonths;
End
Else
Begin	
	Select 1
End
--0 weight for Age
--If (@sex = 'Female' And @ageInDays <= 1856) Begin
--Select * From [dbo].[z_waz_young] Where Sex = 2 And agedays = @ageInDays
--End 
--Else If (@sex = 'Male' And @ageInDays <= 1856) Begin
--Select * From [dbo].[z_waz_young] Where Sex = 1 And agedays = @ageInDays
--End 

--Else If (@sex = 'Female' And @ageInMonths >= 61) Begin
--Select *
--From [dbo].[z_waz_old]
--Where Sex = 2
--And Agemos = @ageInMonths
--End Else If (@sex = 'Male' And @ageInMonths >= 61) Begin
--Select *
--From [dbo].[z_waz_old]
--Where Sex = 1
--And Agemos = @ageInMonths
--End Else Begin
--Select 1
--End

--1 weight for Height

If (@height Between 45 And 110) 
Begin
	Select *
	From [dbo].[z_whz_young]
	Where Case  When @Sex= 'Female' And Sex= 2 Then 1
				When @Sex = 'Male' And Sex = 1 Then 1
				Else 0 End = 1
	And LengthCm = @height;
End
Else If (@height Between 65 And 120) 
Begin
	Select *
	From [dbo].[z_whz_old]
	Where Case  When @Sex= 'Female' And Sex= 2 Then 1
				When @Sex = 'Male' And Sex = 1 Then 1
				Else 0 End = 1
	And HeightCm = @height;
End
Else
Begin	
	Select 1
End

--If (@sex = 'Female' And @height >= 45 And @height <= 110) Begin
--Select *
--From [dbo].[z_whz_young]
--Where Sex = 2
--And LengthCm = @height
--End 
--Else If (@sex = 'Male' And @height >= 45 And @height <= 110) Begin
--Select *
--From [dbo].[z_whz_young]
--Where Sex = 1
--And LengthCm = @height
--End 
--Else If (@sex = 'Female' And @height >= 65 And @height <= 120) Begin
--Select *
--From [dbo].[z_whz_old]
--Where Sex = 2
--And HeightCm = @height
--End Else If (@sex = 'Male' And @height >= 65 And @height <= 120) Begin
--Select *
--From [dbo].[z_whz_old]
--Where Sex = 1
--And HeightCm = @height
--End Else Begin
--Select 1
--End

/* 2 BMIz */
If (@ageInDays Between 0 And 1856) 
Begin
	Select *
	From [dbo].z_bmiz_young
	Where Case  When @Sex= 'Female' And Sex= 2 Then 1
				When @Sex = 'Male' And Sex = 1 Then 1
				Else 0 End = 1
	And agedays = @ageInDays;
End
Else If (@ageInMonths Between 61 And 229) 
Begin
	Select *
	From [dbo].[z_bmiz_old]
	Where Case  When @Sex= 'Female' And Sex= 2 Then 1
				When @Sex = 'Male' And Sex = 1 Then 1
				Else 0 End = 1
	And Agemos = @ageInMonths;
End
Else
Begin	
	Select 1
End

--If (@sex = 'Female' And @ageInDays >= 0 And @ageInDays <= 1856) Begin
--Select *
--From z_bmiz_young
--Where Sex = 2
--And agedays = @ageInDays
--End Else If (@sex = 'Male' And @ageInDays >= 0 And @ageInDays <= 1856) Begin
--Select *
--From z_bmiz_young
--Where Sex = 1
--And agedays = @ageInDays
--End Else If (@sex = 'Female' And @ageInMonths >= 61 And @ageInMonths <= 229) Begin
--Select *
--From z_bmiz_old
--Where Sex = 2
--And Agemos = @ageInMonths
--End Else If (@sex = 'Male' And @ageInMonths >= 61 And @ageInMonths <= 229) Begin
--Select *
--From z_bmiz_old
--Where Sex = 1
--And Agemos = @ageInMonths
--End Else Begin
--Select 1
--End
End




GO
/****** Object:  StoredProcedure [dbo].[sp_IsVisitScheduled]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_IsVisitScheduled]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_IsVisitScheduled] AS' 
END
GO
-- =============================================
-- Author:		John Macharia
-- Create date: 11 May 2018
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[sp_IsVisitScheduled] 
	@PatientId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	declare @ptn_pk int = (select ptn_pk from patient where id = @PatientId)
	declare @GracePeriod int = (Select top 1 AppGracePeriod from mst_facility where deleteflag=0)
    
	select * from (
	select AppointmentDate from patientappointment where PatientId = @PatientId
	UNION
	select AppDate from dtl_patientappointment where ptn_pk=@ptn_pk) AppDates
	where AppointmentDate between dateadd(day, -@GracePeriod, getdate()) and dateadd(day, @GracePeriod, getdate())

END
GO

/****** Object:  StoredProcedure [dbo].[sp_patientCategorizationAtEnrollment]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_patientCategorizationAtEnrollment]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_patientCategorizationAtEnrollment] AS' 
END
GO
-- =============================================
-- Author:		John Macharia
-- Create date: 31st Jan 2018
-- Description:	Patient categorization at enrollment
-- =============================================
ALTER PROCEDURE [dbo].[sp_patientCategorizationAtEnrollment] 
	-- Add the parameters for the stored procedure here
	@PatientId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	declare @enrollmentDate datetime = (Select top 1 enrollmentDate from PatientEnrollment where patientid = @PatientId order by enrollmentDate asc)
	declare @baselineWHOStage varchar(20) = (Select top 1 b.Name from PatientBaselineAssessment a inner join lookupitem b on a.whostage = b.id where a.patientid = @PatientId)
    declare @baselineCD4Count int = (Select top 1 a.cd4count from PatientBaselineAssessment a inner join lookupitem b on a.whostage = b.id where a.patientid = @PatientId)

	if(@enrollmentDate > Dateadd(year, -1, getdate()))
	begin
		if((@baselineWHOStage = 'Stage1' OR @baselineWHOStage = 'Stage2') AND @baselineCD4Count > 200)
		begin
			select 'Well' Categorization, 'label-success'
		end
		else if((@baselineWHOStage = 'Stage3' OR @baselineWHOStage = 'Stage4') OR @baselineCD4Count <= 200)
		begin
			select 'Advanced' Categorization, 'label-danger'
		end
		else
		begin
			select 'Unknown' Categorization, 'label-danger'
		end
	end
	else
	begin
		select 'N/A' Categorization, 'label-danger'
	end
	print @enrollmentDate
END
GO
/****** Object:  StoredProcedure [dbo].[sp_PharmacyPendingOrders]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_PharmacyPendingOrders]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_PharmacyPendingOrders] AS' 
END
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[sp_PharmacyPendingOrders] 

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	select count(*) Number from ord_patientpharmacyorder where orderstatus = 1 and dispensedbydate is null and (deleteflag = 0 or deleteflag is null)


    select convert(varchar(20),orderedbydate,106) [Prescription Date], count(*) [Pending Orders] from ord_patientpharmacyorder where orderstatus = 1 and dispensedbydate is null and (deleteflag = 0 or deleteflag is null)
	group by orderedbydate
END
GO
/****** Object:  StoredProcedure [dbo].[sp_savePatientEncounterAdverseEvents]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_savePatientEncounterAdverseEvents]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_savePatientEncounterAdverseEvents] AS' 
END
GO
-- =============================================
-- Author:		John Macharia | sosewe- added adverseEventId parameter
-- Create date: 14th Feb 2017
-- Description:	get patient encounter Adverse Events
-- =============================================
ALTER PROCEDURE [dbo].[sp_savePatientEncounterAdverseEvents]
	-- Add the parameters for the stored procedure here
	@masterVisitID int = null,
	@PatientID int = null,
	@adverseEventId int =null,
	@adverseEvent varchar(250) = null,
	@medicineCausingAE varchar(250) = null,
	@adverseSeverity varchar(250) = null,
	@adverseAction varchar(250) = null,
	@userID int = null

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;
-- Insert statements for procedure here
if exists(select 1 from AdverseEvent where PatientMasterVisitId = @masterVisitID and PatientId = @PatientID and EventName = @adverseEvent)
	BEGIN
		update AdverseEvent set EventCause = @medicineCausingAE, Severity = @adverseSeverity,[Action] = @adverseAction, DeleteFlag = 0
		where PatientMasterVisitId = @masterVisitID and PatientId = @PatientID and EventName = @adverseEvent
	END
	ELSE
	BEGIN
		insert into AdverseEvent(PatientId,PatientMasterVisitId,AdverseEventId,EventName,EventCause,Severity,[Action],DeleteFlag,CreateBy,CreateDate) 
		values(@PatientID,@MasterVisitID,@adverseEventId,@adverseEvent,@medicineCausingAE,@adverseSeverity,@adverseAction,0,@userID,GETDATE())
	END
	
End
GO
/****** Object:  StoredProcedure [dbo].[sp_savePatientEncounterAllergies]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_savePatientEncounterAllergies]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_savePatientEncounterAllergies] AS' 
END
GO
-- =============================================
-- Author:		John Macharia
-- Create date: 19th Mar 2017
-- Description:	save patient encounter - Allergies
-- =============================================
ALTER PROCEDURE [dbo].[sp_savePatientEncounterAllergies]
	-- Add the parameters for the stored procedure here
	@MasterVisitID int = null,
	@PatientID int = null,
	@allergy varchar(50) = null,
	@allergyReaction varchar(50) = null,
	@allergySeverity varchar(50) = null,
	@allergyOnsetDate varchar(50) = null,
	@userID int = null

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;
-- Insert statements for procedure here
	if exists(select 1 from patientallergy where Allergen = @allergy and PatientId = @PatientID)
	BEGIN
		update patientallergy set Allergen = @allergy, Reaction = @allergyReaction, severity = @allergySeverity,
		OnsetDate = @allergyOnsetDate, DeleteFlag = 0
		where Allergen = @allergy and PatientId = @PatientID
	END
	ELSE
	BEGIN
		insert into patientallergy(PatientId,PatientMasterVisitId,Allergen,Reaction,Severity,OnsetDate,DeleteFlag,CreateBy,CreateDate) 
		values(@PatientID,@MasterVisitID,@allergy,@allergyReaction,@allergySeverity,@allergyOnsetDate, 0,@userID,GETDATE())
	END

End








GO
/****** Object:  StoredProcedure [dbo].[sp_savePatientEncounterChronicIllness]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_savePatientEncounterChronicIllness]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_savePatientEncounterChronicIllness] AS' 
END
GO
-- =============================================
-- Author:		John Macharia
-- Create date: 29th Jan 2017
-- Description:	save patient encounter - Chronic Illness
-- =============================================
ALTER PROCEDURE [dbo].[sp_savePatientEncounterChronicIllness]
	-- Add the parameters for the stored procedure here
	@MasterVisitID int = null,
	@PatientID int = null,
	@chronicIllness varchar(50) = null,
	@treatment varchar(250) = null,
	@dose varchar(50) = null,
	@onsetDate varchar(20) = null,
	@active int = null,
	@userID int = null

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;
-- Insert statements for procedure here
	if exists(select 1 from PatientChronicIllness where ChronicIllness = @chronicIllness and PatientId = @PatientID)
	BEGIN
		update PatientChronicIllness set Treatment = @treatment,Dose = @dose,OnsetDate = @onsetDate, active = @active, DeleteFlag = 0
		where ChronicIllness = @chronicIllness and PatientId = @PatientID
	END
	ELSE
	BEGIN
		insert into PatientChronicIllness(PatientId,PatientMasterVisitId,ChronicIllness,Treatment,Dose,OnsetDate,active,DeleteFlag,CreateBy,CreateDate) 
		values(@PatientID,@MasterVisitID,@chronicIllness,@treatment,@dose,@onsetDate,@active,0,@userID,GETDATE())
	END
	
End








GO
/****** Object:  StoredProcedure [dbo].[sp_savePatientEncounterComplaints]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_savePatientEncounterComplaints]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_savePatientEncounterComplaints] AS' 
END
GO
-- =============================================
-- Author:		John Macharia
-- Create date: 26th Apr 2017
-- Description:	save patient encounter - Adverse Events
-- =============================================
ALTER PROCEDURE [dbo].[sp_savePatientEncounterComplaints]
	-- Add the parameters for the stored procedure here
	@masterVisitID int = null,
	@PatientID int = null,
	@presentingComplaintID int = null,
	@onsetDate varchar(50) = null,
	@userID int = null

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;
-- Insert statements for procedure here
if exists(select 1 from presentingComplaints where PatientMasterVisitId = @masterVisitID and PatientId = @PatientID and PresentingComplaintsId = @presentingComplaintID)
	BEGIN
		update presentingComplaints set onsetDate = @onsetDate, DeleteFlag = 0
		where PatientMasterVisitId = @masterVisitID and PatientId = @PatientID and PresentingComplaintsId = @presentingComplaintID
	END
	ELSE
	BEGIN
		insert into presentingComplaints(PatientId,PatientMasterVisitId,PresentingComplaintsId,onsetDate,DeleteFlag,CreatedBy,CreatedDate) 
		values(@PatientID,@MasterVisitID,@presentingComplaintID,@onsetDate,0,@userID,GETDATE())
	END
	
End








GO
/****** Object:  StoredProcedure [dbo].[sp_savePatientEncounterDiagnosis]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_savePatientEncounterDiagnosis]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_savePatientEncounterDiagnosis] AS' 
END
GO
-- =============================================
-- Author:		John Macharia
-- Create date: 29th Jan 2017
-- Description:	save patient encounter - Adverse Events
-- =============================================
ALTER PROCEDURE [dbo].[sp_savePatientEncounterDiagnosis]
	-- Add the parameters for the stored procedure here
	@masterVisitID int = null,
	@PatientID int = null,
	@diagnosis varchar(250) = null,
	@treatment varchar(250) = null,
	@userID int = null

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;
-- Insert statements for procedure here
	if exists(select 1 from PatientDiagnosis where Diagnosis = @diagnosis and PatientId = @PatientID and PatientMasterVisitID = @masterVisitID)
	BEGIN
		update PatientDiagnosis set ManagementPlan = @treatment, DeleteFlag = 0
		where Diagnosis = @diagnosis and PatientId = @PatientID and PatientMasterVisitID = @masterVisitID
	END
	ELSE
	BEGIN
		insert into PatientDiagnosis(PatientId,PatientMasterVisitId,Diagnosis,ManagementPlan,DeleteFlag,CreateBy,CreateDate) 
		values(@PatientID,@MasterVisitID,@diagnosis,@treatment,0,@userID,GETDATE())
	END
End








GO
/****** Object:  StoredProcedure [dbo].[sp_savePatientEncounterGeneralExam]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_savePatientEncounterGeneralExam]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_savePatientEncounterGeneralExam] AS' 
END
GO
-- =============================================
-- Author:		John Macharia
-- Create date: 27th Apr 2017
-- Description:	save patient encounter - General Examination
-- =============================================
ALTER PROCEDURE [dbo].[sp_savePatientEncounterGeneralExam]
	-- Add the parameters for the stored procedure here
	@MasterVisitID int = null,
	@PatientID int = null,
	@Exam varchar(50) = null,
	@userID int = null

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;
-- Insert statements for procedure here

	declare @generalExamMasterID int = (select top 1 Id from lookupmaster where Name = 'GeneralExamination')
	declare @ExamID int = (select LookupItemId from LookupMasterItem where LookupMasterId = @generalExamMasterID and DisplayName = @Exam)

	if exists(select 1 from PhysicalExamination where PatientMasterVisitId = @MasterVisitID
	and PatientId = @PatientID and ExaminationTypeId = @generalExamMasterID and ExamId = @ExamID)
	BEGIN
		update PhysicalExamination set DeleteFlag = 0
		where PatientMasterVisitId = @MasterVisitID and PatientId = @PatientID and ExaminationTypeId = @generalExamMasterID
		and ExamId = @ExamID
	END
	ELSE
	BEGIN
		insert into PhysicalExamination(PatientId,PatientMasterVisitId,ExaminationTypeId,ExamId,DeleteFlag,CreateBy,CreateDate) 
		values(@PatientID,@MasterVisitID,@generalExamMasterID,@ExamID,0,@userID,GETDATE())
	END
	
End








GO
/****** Object:  StoredProcedure [dbo].[sp_savePatientEncounterPatientManagement]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_savePatientEncounterPatientManagement]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_savePatientEncounterPatientManagement] AS' 
END
GO
-- =============================================
-- Author:		John Macharia
-- Create date: 29th Jan 2017
-- Description:	save patient encounter - Patient Management
-- =============================================
ALTER PROCEDURE [dbo].[sp_savePatientEncounterPatientManagement]
	-- Add the parameters for the stored procedure here
	@PatientMasterVisitID int = null,
	@PatientID int = null,
	@ARVAdherence int = null,
	@CTXAdherence int = null,
	@WorkPlan varchar(1000) = null,
	@userID int = null

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;
-- Insert statements for procedure here
	declare @ARVAdherenceType int = (Select Id from LookupMaster where name = 'ARVAdherence')
	declare @CTXAdherenceType int = (Select Id from LookupMaster where name = 'CTXAdherence')

	if(@PatientMasterVisitID > 0)
	BEGIN
		if(@ARVAdherence > 0)
		BEGIN
			if exists(select 1 from AdherenceOutcome where PatientMasterVisitId = @PatientMasterVisitID and PatientId = @PatientID and AdherenceType = @ARVAdherenceType)
			BEGIN
				update AdherenceOutcome set Score = @ARVAdherence
				where PatientMasterVisitId = @PatientMasterVisitID and PatientId = @PatientID and AdherenceType = @ARVAdherenceType
			END
			ELSE
			BEGIN
				insert into [dbo].[AdherenceOutcome] (PatientId, PatientMasterVisitId,AdherenceType,Score,DeleteFlag,CreateBy,CreateDate)
				values(@PatientID,@PatientMasterVisitID,@ARVAdherenceType,@ARVAdherence,0,@userID,GETDATE())
			END
		END

		if(@CTXAdherence > 0)
		BEGIN
			if exists(select 1 from AdherenceOutcome where PatientMasterVisitId = @PatientMasterVisitID and PatientId = @PatientID and AdherenceType = @CTXAdherenceType)
			BEGIN
				update AdherenceOutcome set Score = @CTXAdherence
				where PatientMasterVisitId = @PatientMasterVisitID and PatientId = @PatientID and AdherenceType = @CTXAdherenceType
			END
			ELSE
			BEGIN
				insert into [dbo].[AdherenceOutcome] (PatientId, PatientMasterVisitId,AdherenceType,Score,DeleteFlag,CreateBy,CreateDate)
				values(@PatientID,@PatientMasterVisitID,@CTXAdherenceType,@CTXAdherence,0,@userID,GETDATE())
			END
		END

		if exists(select 1 from PatientClinicalNotes where PatientMasterVisitId = @PatientMasterVisitID and PatientId = @PatientID)
		BEGIN
			update PatientClinicalNotes set ClinicalNotes = @WorkPlan
			where PatientMasterVisitId = @PatientMasterVisitID and PatientId = @PatientID
		END
		ELSE
		BEGIN
			insert into PatientClinicalNotes(PatientId,PatientMasterVisitId,ServiceAreaId,ClinicalNotes,DeleteFlag,CreatedBy,CreateDate) 
			values(@PatientID,@PatientMasterVisitID,203,@WorkPlan,0,@userID,GETDATE())
		END
	END
	ELSE
	BEGIN
		if(@ARVAdherence > 0)
		BEGIN
			insert into [dbo].[AdherenceOutcome] (PatientId, PatientMasterVisitId,AdherenceType,Score,DeleteFlag,CreateBy,CreateDate)
			values(@PatientID,@PatientMasterVisitID,@ARVAdherenceType,@ARVAdherence,0,@userID,GETDATE())
		END

		if(@CTXAdherence > 0)
		BEGIN
			insert into [dbo].[AdherenceOutcome] (PatientId, PatientMasterVisitId,AdherenceType,Score,DeleteFlag,CreateBy,CreateDate)
			values(@PatientID,@PatientMasterVisitID,@CTXAdherenceType,@CTXAdherence,0,@userID,GETDATE())
		END

		insert into PatientClinicalNotes(PatientId,PatientMasterVisitId,ServiceAreaId,ClinicalNotes,DeleteFlag,CreatedBy,CreateDate) 
		values(@PatientID,@PatientMasterVisitID,203,@WorkPlan,0,@userID,GETDATE())
	END
End








GO
/****** Object:  StoredProcedure [dbo].[sp_savePatientEncounterPHDP]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_savePatientEncounterPHDP]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_savePatientEncounterPHDP] AS' 
END
GO
-- =============================================
-- Author:		John Macharia
-- Create date: 29th Jan 2017
-- Description:	save patient encounter - Chronic Illness
-- =============================================
ALTER PROCEDURE [dbo].[sp_savePatientEncounterPHDP]
	-- Add the parameters for the stored procedure here
	@MasterVisitID int = null,
	@PatientID int = null,
	@phdp varchar(50) = null,
	@userID int = null

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;
-- Insert statements for procedure here
	declare @phdpMasterID int = (select Id from LookupMaster where Name = 'PHDP')
	declare @phdpID int = (select LookupItemId from LookupMasterItem where LookupMasterId = @phdpMasterID and DisplayName = @phdp)

	if exists(select 1 from PatientPHDP where PatientMasterVisitId = @MasterVisitID and PatientId = @PatientID and Phdp = @phdpID)
	BEGIN
		UPDATE PatientPHDP SET DeleteFlag = 0
		where PatientMasterVisitId = @MasterVisitID and PatientId = @PatientID and Phdp = @phdpID
	END
	ELSE
	BEGIN
		insert into PatientPHDP(PatientId,PatientMasterVisitId,phdp,DeleteFlag,CreateBy,CreateDate) 
		values(@PatientID,@MasterVisitID,@phdpID,0,@userID,GETDATE())
	END
	
	
End







GO
/****** Object:  StoredProcedure [dbo].[sp_savePatientEncounterPhysicalExam]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_savePatientEncounterPhysicalExam]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_savePatientEncounterPhysicalExam] AS' 
END
GO
-- =============================================
-- Author:		John Macharia
-- Create date: 7th Feb 2017
-- Description:	save patient encounter - Physical Examination
-- =============================================
ALTER PROCEDURE [dbo].[sp_savePatientEncounterPhysicalExam]
	-- Add the parameters for the stored procedure here
	@MasterVisitID int = null,
	@PatientID int = null,
	@reviewOfSystemsID int = null,
	@systemTypeId int = null,
	@findingId int = null,
	@findingsNotes varchar(50) = null,
	@userID int = null

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;
-- Insert statements for procedure here
	if exists(select 1 from PhysicalExamination where PatientMasterVisitId = @MasterVisitID
	and PatientId = @PatientID and ExaminationTypeId = @reviewOfSystemsID and ExamId = @systemTypeId and FindingId = @findingId and DeleteFlag = 0)
	BEGIN
		update PhysicalExamination set FindingsNotes= @findingsNotes, DeleteFlag = 0, FindingId = @findingId
		where PatientMasterVisitId = @MasterVisitID and PatientId = @PatientID and ExaminationTypeId = @reviewOfSystemsID and ExamId = @systemTypeId
	END
	ELSE
	BEGIN
		insert into PhysicalExamination(PatientId,PatientMasterVisitId,ExaminationTypeId,ExamId,FindingsNotes,DeleteFlag,CreateBy,CreateDate, FindingId) 
		values(@PatientID, @MasterVisitID, @reviewOfSystemsID, @systemTypeId, @findingsNotes, 0 , @userID, GETDATE(), @findingId)
	END
	
End
GO
/****** Object:  StoredProcedure [dbo].[sp_savePatientEncounterPresentingComplaints]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_savePatientEncounterPresentingComplaints]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_savePatientEncounterPresentingComplaints] AS' 
END
GO
-- =============================================
-- Author:		John Macharia
-- Create date: 20th Jan 2017
-- Description:	save patient encounter - Presenting Complaints
-- =============================================
ALTER PROCEDURE [dbo].[sp_savePatientEncounterPresentingComplaints]
	-- Add the parameters for the stored procedure here
	@PatientMasterVisitID int = null,
	@PatientID int = null,
	@serviceID int = null,
	@VisitDate datetime = null,
	@VisitScheduled int =null,
	@VisitBy int = null,
	@anyPresentingComplaints int = null,
	@ComplaintsNotes nvarchar(1000) = null,
	@TBScreening int = null,
	@NutritionalStatus int = null,
	@userID int = null

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;

	declare @TBScreeningTypeID int = (Select Id from LookupMaster where name = 'TBStatus')
	declare @NutritionScreeningTypeID int = (Select Id from LookupMaster where name = 'NutritionStatus')

	IF(@PatientMasterVisitID > 0)
	BEGIN
		update PatientMasterVisit set visitDate = @VisitDate, visitScheduled = @VisitScheduled, visitBy = @VisitBy
		where id = @PatientMasterVisitID and PatientId = @PatientID

		if exists(select 1 from ComplaintsHistory where PatientMasterVisitId = @PatientMasterVisitID and PatientId = @PatientID)
		BEGIN
			update ComplaintsHistory set PresentingComplaint = @ComplaintsNotes, AnyComplaint = @anyPresentingComplaints 
			where PatientMasterVisitId = @PatientMasterVisitID and PatientId = @PatientID
		END
		ELSE
		BEGIN
			insert into ComplaintsHistory (PatientId,PatientMasterVisitId,AnyComplaint,PresentingComplaint,DeleteFlag,CreateBy,CreateDate) 
			values(@PatientID,@PatientMasterVisitID,@anyPresentingComplaints,@ComplaintsNotes,0,@userID,GETDATE())
		END

		if(@TBScreening > 0)
		begin
			IF EXISTS(SELECT 1 FROM PatientScreening WHERE PatientMasterVisitId = @PatientMasterVisitID and PatientId = @PatientID 
			and ScreeningTypeId = @TBScreeningTypeID)
			BEGIN
				update PatientScreening set ScreeningValueId = @TBScreening
				where PatientMasterVisitId = @PatientMasterVisitID and PatientId = @PatientID and ScreeningTypeId = @TBScreeningTypeID
			END
			ELSE
			BEGIN
				insert into PatientScreening (PatientId,PatientMasterVisitId,ScreeningTypeId,ScreeningDone,ScreeningValueId,DeleteFlag,CreatedBy,CreateDate)
				values(@PatientID,@PatientMasterVisitID,@TBScreeningTypeID,1,@TBScreening,0,@userID,GETDATE())
			END
		end

		if(@NutritionalStatus > 0)
		begin
			IF EXISTS(SELECT 1 FROM PatientScreening WHERE PatientMasterVisitId = @PatientMasterVisitID and PatientId = @PatientID 
			and ScreeningTypeId = @NutritionScreeningTypeID)
			BEGIN
				update PatientScreening set ScreeningValueId = @NutritionalStatus
				where PatientMasterVisitId = @PatientMasterVisitID and PatientId = @PatientID and ScreeningTypeId = @NutritionScreeningTypeID
			END
			ELSE
			BEGIN
				insert into PatientScreening (PatientId,PatientMasterVisitId,ScreeningTypeId,ScreeningDone,ScreeningValueId,DeleteFlag,CreatedBy,CreateDate)
				values(@PatientID,@PatientMasterVisitID,@NutritionScreeningTypeID,1,@NutritionalStatus,0,@userID,GETDATE())
			END
		end
		
		select @PatientMasterVisitID as PatientMasterVisitID
	END
	ELSE
	BEGIN
		insert into PatientMasterVisit (patientId,serviceId,start,active,createdBy,createDate,visitDate,visitScheduled,visitBy)
		values(@PatientID,@serviceID,CONVERT (time, GETDATE()),1,@userID,GETDATE(),@VisitDate,@VisitScheduled,@VisitBy)
		SELECT @PatientMasterVisitID = SCOPE_IDENTITY()

		insert into ComplaintsHistory (PatientId,PatientMasterVisitId,AnyComplaint,PresentingComplaint,DeleteFlag,CreateBy,CreateDate) 
		values(@PatientID,@PatientMasterVisitID,@anyPresentingComplaints,@ComplaintsNotes,0,@userID,GETDATE())

		if(@TBScreening > 0)
		begin
			insert into PatientScreening (PatientId,PatientMasterVisitId,ScreeningTypeId,ScreeningDone,ScreeningValueId,DeleteFlag,CreatedBy,CreateDate)
			values(@PatientID,@PatientMasterVisitID,@TBScreeningTypeID,1,@TBScreening,0,@userID,GETDATE())
		end
		if(@NutritionalStatus > 0)
		begin
			insert into PatientScreening (PatientId,PatientMasterVisitId,ScreeningTypeId,ScreeningDone,ScreeningValueId,DeleteFlag,CreatedBy,CreateDate)
			values(@PatientID,@PatientMasterVisitID,@NutritionScreeningTypeID,1,@NutritionalStatus,0,@userID,GETDATE())
		end
		

		select @PatientMasterVisitID as PatientMasterVisitID

	END
End








GO
/****** Object:  StoredProcedure [dbo].[sp_savePatientEncounterTS]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_savePatientEncounterTS]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_savePatientEncounterTS] AS' 
END
GO
-- =============================================
-- Author:		John Macharia
-- Create date: 20th Jan 2017
-- Description:	save patient encounter - Presenting Complaints
-- =============================================
ALTER PROCEDURE [dbo].[sp_savePatientEncounterTS]
	-- Add the parameters for the stored procedure here
	@PatientMasterVisitID int = null,
	@PatientID int = null,
	@serviceID int = null,
	@VisitDate datetime = null,
	@VisitScheduled int =null,
	@VisitBy int = null,
	@userID int = null

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;

	IF(@PatientMasterVisitID > 0)
	BEGIN
		update PatientMasterVisit set visitDate = @VisitDate, visitScheduled = @VisitScheduled, visitBy = @VisitBy
		where id = @PatientMasterVisitID and PatientId = @PatientID
		
		select @PatientMasterVisitID as PatientMasterVisitID
	END
	ELSE
	BEGIN
		insert into PatientMasterVisit (patientId,serviceId,start,active,createdBy,createDate,visitDate,visitScheduled,visitBy)
		values(@PatientID,@serviceID,CONVERT (time, GETDATE()),1,@userID,GETDATE(),@VisitDate,@VisitScheduled,@VisitBy)
		SELECT @PatientMasterVisitID = SCOPE_IDENTITY()
		

		select @PatientMasterVisitID as PatientMasterVisitID

	END
End








GO
/****** Object:  StoredProcedure [dbo].[sp_savePatientEncounterVaccines]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_savePatientEncounterVaccines]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_savePatientEncounterVaccines] AS' 
END
GO
-- =============================================
-- Author:		John Macharia
-- Create date: 29th Jan 2017
-- Description:	save patient encounter - Chronic Illness
-- =============================================
ALTER PROCEDURE [dbo].[sp_savePatientEncounterVaccines]
	-- Add the parameters for the stored procedure here
	@MasterVisitID int = null,
	@PatientID int = null,
	@vaccine varchar(50) = null,
	@vaccineStage varchar(50) = null,
	@vaccineDate varchar(50) = null,
	@dose int = null,
	@duration int = null

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;
-- Insert statements for procedure here
	if exists(select 1 from Vaccination where Vaccine = @vaccine and VaccineStage = @vaccineStage and PatientId = @PatientID)
	BEGIN
		update Vaccination set VaccineDate = @vaccineDate, DeleteFlag = 0
		where Vaccine = @vaccine and VaccineStage = @vaccineStage and PatientId = @PatientID
	END
	ELSE
	BEGIN
		insert into Vaccination(PatientId,PatientMasterVisitId,Vaccine,VaccineStage,VaccineDate,DeleteFlag,CreatedBy,CreateDate) 
		values(@PatientID,@MasterVisitID,@vaccine,@vaccineStage,@vaccineDate, 0,1,GETDATE())
	END
	
End








GO
/****** Object:  StoredProcedure [dbo].[sp_savePatientFamilyPlanningMethod]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_savePatientFamilyPlanningMethod]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_savePatientFamilyPlanningMethod] AS' 
END
GO
-- =============================================
-- Author:		John Macharia
-- Create date: 11th Mar 2017
-- Description:	save patient family planning method
-- =============================================
ALTER PROCEDURE [dbo].[sp_savePatientFamilyPlanningMethod]
	-- Add the parameters for the stored procedure here
	@PatientID int = null,
	@FPId int = null,
	@fpMethod int = null
	

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;

	IF EXISTS(SELECT 1 FROM PatientFamilyPlanningMethod where patientid = @PatientID and PatientFPId = @FPId and FPMethodId = @fpMethod)
	BEGIN
		update PatientFamilyPlanningMethod set DeleteFlag = 0
		where patientid = @PatientID and PatientFPId = @FPId and FPMethodId = @fpMethod
	END
	ELSE
	BEGIN
		insert into PatientFamilyPlanningMethod (PatientId,PatientFPId, FPMethodId,DeleteFlag)
		values(@PatientID,@FPId,@fpMethod,0)
	END
END







GO
/****** Object:  StoredProcedure [dbo].[sp_SaveUpdatePharmacy_GreenCard]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_SaveUpdatePharmacy_GreenCard]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_SaveUpdatePharmacy_GreenCard] AS' 
END
GO
ALTER PROCEDURE [dbo].[sp_SaveUpdatePharmacy_GreenCard]                                                
( 
 @PatientMasterVisitID int = 0,                                               
 @PatientId int = null,                                                
 @LocationID int = null,                                                
 @OrderedBy int = null,                                                                                                                                          
 @UserID int = null,                                                 
 @RegimenType varchar(50) = null,                                                
 @DispensedBy int=null,                                                    
 @RegimenLine int = null,                
 @PharmacyNotes varchar(200) = null,
 @ModuleID int = null,

 @TreatmentProgram int = null,
 @PeriodTaken int = null,

 @TreatmentPlan int = null, 
 @TreatmentPlanReason int = null,
 @Regimen int = null,
 @PrescribedDate varchar(50) = null,
 @DispensedDate varchar(50) = null                 
)                                                
                                                
As       
Begin               
	Declare @ptn_pharmacy int,@RegimenMap_Pk int,@ARTStartDate datetime,@Ptn_Pharmacy_Pk int=null , @ptn_pk int, @visitPK int

	Select @RegimenType = Nullif(Ltrim(Rtrim(@RegimenType)), '')

	set @ptn_pk = (select ptn_pk from patient where id = @PatientId)

	if(@DispensedDate = '')
	begin
		set @DispensedDate = null
		set @DispensedBy = null
	end

	IF EXISTS(select 1 from ord_PatientPharmacyOrder where PatientMasterVisitId = @PatientMasterVisitID) 
	--IF EXISTS(select 1 from ord_PatientPharmacyOrder where ptn_pharmacy_pk = @Ptn_Pharmacy_Pk) 
	BEGIN
		set @Ptn_Pharmacy_Pk = (select top 1 ptn_pharmacy_pk from ord_PatientPharmacyOrder where patientmasterVisitID = @PatientMasterVisitID);
		IF @TreatmentPlan = 0 BEGIN (select TOP 1 @Regimenline = RegimenLine, @TreatmentProgram = [ProgID] from ord_PatientPharmacyOrder where patientmasterVisitID = @PatientMasterVisitID); END;
		Update [ord_PatientPharmacyOrder] Set
			[OrderedBy] = @OrderedBy, [DispensedBy] = @DispensedBy,
			[ProgID] = @TreatmentProgram, [UpdateDate] = Getdate(),
			[ProviderID] = 1, OrderedByDate = @PrescribedDate, [DispensedByDate] = @DispensedDate,
			UserID = @UserID,	Regimenline = @Regimenline,
			PharmacyNotes = @PharmacyNotes, pharmacyperiodtaken = @PeriodTaken
		Where patientmasterVisitID = @PatientMasterVisitID;

		IF @TreatmentPlan = 0 BEGIN (SELECT TOP 1 @Regimen = RegimenId, @RegimenLine = RegimenLineId, @TreatmentPlan = TreatmentStatusId, @TreatmentPlanReason = TreatmentStatusReasonId FROM ARVTreatmentTracker WHERE PatientMasterVisitId = @PatientMasterVisitID); END;
		Update ARVTreatmentTracker set regimenid = @Regimen, regimenLineId = @RegimenLine, TreatmentStatusId = @TreatmentPlan,
		TreatmentStatusReasonId = @TreatmentPlanReason

		If(@RegimenType Is Not Null) 
		Begin
		
			Select @RegimenMap_Pk = RegimenMap_Pk
			From dtl_regimenmap a, ord_patientpharmacyorder b
			Where a.ptn_pk = b.ptn_pk
			And b.ptn_pharmacy_pk = a.orderID
			And b.Ptn_Pharmacy_Pk = @Ptn_Pharmacy_Pk;

			Update [dtl_RegimenMap] Set
				[RegimenType] = @RegimenType,
				[UpdateDate] = Getdate()
			Where ([RegimenMap_Pk] = @RegimenMap_Pk)
		End
		
		Select @ARTStartDate = dbo.fn_GetPatientARTStartDate_constella(@ptn_pk)
		
		Update mst_Patient Set
			ARTStartDate = @ARTStartDate
		Where ptn_pk = @ptn_pk;

		Select @ptn_pharmacy_pk;
	END
	ELSE
	BEGIN
		insert into ord_Visit (ptn_pk,locationid,VisitDate,VisitType,DataQuality,DeleteFlag,UserID,CreateDate,CreatedBy)
		values(@ptn_pk, @locationID,GETDATE(),4,1,0,@UserID,GETDATE(),@UserID)

		set @visitPK = SCOPE_IDENTITY();

		Insert Into dbo.ord_PatientPharmacyOrder (
			Ptn_pk, PatientID, patientmasterVisitID, LocationID, OrderedBy, OrderedByDate, DispensedBy, DispensedByDate, ProgID,
			UserID, CreateDate, ProviderID, Regimenline, PharmacyNotes, VisitID, pharmacyPeriodTaken)
		Values (
			@ptn_pk,@PatientId, @PatientMasterVisitID, @LocationID, @OrderedBy, @PrescribedDate, @DispensedBy, @DispensedDate, @TreatmentProgram, 
			@UserID, Getdate(), 1, @RegimenLine, @PharmacyNotes, @visitPK, @PeriodTaken);

		Set @ptn_pharmacy =SCOPE_IDENTITY();

		Insert into ARVTreatmentTracker (PatientId,ServiceAreaId,PatientMasterVisitId,RegimenId,RegimenLineId,
		TreatmentStatusId,TreatmentStatusReasonId, DeleteFlag, CreateBy, createdate)
		values(@patientid,@moduleid,@PatientMasterVisitID,@Regimen,@RegimenLine,@TreatmentPlan,@TreatmentPlanReason,
		0,@UserID,GETDATE())

		Update ord_PatientPharmacyOrder Set
			ReportingID = (Select Right('000000' + Convert(varchar, @ptn_pharmacy), 6))
		Where ptn_pharmacy_pk = @ptn_pharmacy;

		--If (@DispensedByDate Is Not Null And @DispensedBy > 0) Begin
		--	Update ord_PatientPharmacyOrder Set
		--		OrderStatus = 2
		--	Where ptn_pharmacy_pk = @ptn_pharmacy;
		--End

		
		If(@RegimenType Is Not Null) 
		Begin	
			Insert Into dtl_RegimenMap (Ptn_Pk,	LocationID,	Visit_Pk, RegimenType, OrderId,	UserID,	CreateDate)
			Values (@ptn_pk, @LocationID, @visitPK, @RegimenType, @ptn_pharmacy, @UserID, Getdate());
		End

		Select @ARTStartDate = dbo.fn_GetPatientARTStartDate_constella(@ptn_pk)
		Update mst_Patient Set
			ARTStartDate = @ARTStartDate
		Where ptn_pk = @ptn_pk;

		Select @ptn_pharmacy;

	END
End

-- get prescription
--IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_getPatientPharmacyPrescription]') AND type in (N'P', N'PC'))
/****** Object:  StoredProcedure [dbo].[sp_getPatientPharmacyPrescription]    Script Date: 11/21/2017 8:38:04 AM ******/
--SET ANSI_NULLS ON
GO
/****** Object:  StoredProcedure [dbo].[sp_SaveUpdatePharmacyPrescription_GreenCard]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_SaveUpdatePharmacyPrescription_GreenCard]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_SaveUpdatePharmacyPrescription_GreenCard] AS' 
END
GO
ALTER PROCEDURE [dbo].[sp_SaveUpdatePharmacyPrescription_GreenCard]                                    
	@ptn_pharmacy_pk int = null,
	@DrugId int = null,
	@BatchId varchar(50) = null,
	@Dose decimal(18,2)=0,                                 
	@FreqId int = null,
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
			
	Insert Into dtl_PatientPharmacyOrder (
		ptn_pharmacy_pk,Drug_Pk,SingleDose,FrequencyID,Duration,OrderedQuantity,BatchNo, DispensedQuantity, UserID,CreateDate,Prophylaxis,
		genericid,StrengthID)
	Values (
		@ptn_pharmacy_pk,@DrugId,@Dose,@FreqId,@Duration,@qtyPres,@BatchId,@qtyDisp,@UserID,Getdate(),@Prophylaxis,0,0);



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
/****** Object:  StoredProcedure [dbo].[WaitingList_QueuePatient]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WaitingList_QueuePatient]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[WaitingList_QueuePatient] AS' 
END
GO

-- =============================================
-- Author:		Joseph Njung'e
-- Create date: 20150607
-- Description:	Queue Patient
-- =============================================
ALTER PROCEDURE [dbo].[WaitingList_QueuePatient] 
	-- Add the parameters for the stored procedure here
	@PatientId int , 
	@QueueId int,
	@ModuleId int ,
	@Priority int =1,
	@QueueStatus int = 0,
	@UserId int
AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;

	Insert Into dtl_WaitingList (
		Ptn_PK
		,ListID
		,ModuleID
		,Priority
		,Status
		,CreateDate
		,CreatedBy
	)
	Values (
		@PatientId
		,@QueueId
		,@ModuleId
		,@Priority
		,@QueueStatus
		,getdate()
		,@UserId
	);

	Select scope_identity() WaitingListId

End

GO
/****** Object:  StoredProcedure [dbo].[WaitingList_SystemCleanup]    Script Date: 6/6/2018 3:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WaitingList_SystemCleanup]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[WaitingList_SystemCleanup] AS' 
END
GO

-- =============================================
-- Author:		Joseph Njung'e
-- Create date: 20160706
-- Description:	Remove overdue patient from the queue
-- Statuses 0=Pending, 1 = Served Inactive, 2 = Not Served (System Clean up), 3 = Not Served (User deleted)
-- =============================================
ALTER PROCEDURE [dbo].[WaitingList_SystemCleanup] 	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	declare	@MaxHrs int ;
	Set @MaxHrs =  12;

	Update W Set
		[Status] = 2,
		UpdateDate = getdate(),
		UpdatedBy = 0
	From dtl_WaitingList As W
	Where (Status = 0)
		And (datediff(Hour, CreateDate, getdate()) > @MaxHrs);
END

GO
