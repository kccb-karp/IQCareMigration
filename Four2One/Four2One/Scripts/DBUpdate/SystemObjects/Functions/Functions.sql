/****** Object:  UserDefinedFunction [dbo].[ufn_GetLastDayOfMonth]    Script Date: 6/6/2018 4:14:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ufn_GetLastDayOfMonth]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[ufn_GetLastDayOfMonth]
GO
/****** Object:  UserDefinedFunction [dbo].[udf_GetNumeric]    Script Date: 6/6/2018 4:14:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[udf_GetNumeric]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[udf_GetNumeric]
GO
/****** Object:  UserDefinedFunction [dbo].[udf_GetGRNoteSellingPrice]    Script Date: 6/6/2018 4:14:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[udf_GetGRNoteSellingPrice]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[udf_GetGRNoteSellingPrice]
GO
/****** Object:  UserDefinedFunction [dbo].[split]    Script Date: 6/6/2018 4:14:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[split]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[split]
GO
/****** Object:  UserDefinedFunction [dbo].[RemoveNonAlphaCharacters]    Script Date: 6/6/2018 4:14:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RemoveNonAlphaCharacters]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[RemoveNonAlphaCharacters]
GO

/****** Object:  UserDefinedFunction [dbo].[fun_GetGenDrugAbbr_Constella]    Script Date: 6/6/2018 4:14:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fun_GetGenDrugAbbr_Constella]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fun_GetGenDrugAbbr_Constella]
GO
/****** Object:  UserDefinedFunction [dbo].[fnSplitRegmen]    Script Date: 6/6/2018 4:14:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fnSplitRegmen]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fnSplitRegmen]
GO
/****** Object:  UserDefinedFunction [dbo].[fnSplit]    Script Date: 6/6/2018 4:14:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fnSplit]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fnSplit]
GO
/****** Object:  UserDefinedFunction [dbo].[fnParseTilteDelimitedList]    Script Date: 6/6/2018 4:14:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fnParseTilteDelimitedList]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fnParseTilteDelimitedList]
GO
/****** Object:  UserDefinedFunction [dbo].[fnParseDelimitedList]    Script Date: 6/6/2018 4:14:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fnParseDelimitedList]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fnParseDelimitedList]
GO
/****** Object:  UserDefinedFunction [dbo].[fnGetParmTilteForHighphen]    Script Date: 6/6/2018 4:14:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fnGetParmTilteForHighphen]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fnGetParmTilteForHighphen]
GO
/****** Object:  UserDefinedFunction [dbo].[fnGetParmTilte_new]    Script Date: 6/6/2018 4:14:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fnGetParmTilte_new]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fnGetParmTilte_new]
GO
/****** Object:  UserDefinedFunction [dbo].[fnGetParmTilte]    Script Date: 6/6/2018 4:14:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fnGetParmTilte]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fnGetParmTilte]
GO
/****** Object:  UserDefinedFunction [dbo].[fnGetModulename]    Script Date: 6/6/2018 4:14:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fnGetModulename]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fnGetModulename]
GO
/****** Object:  UserDefinedFunction [dbo].[fnFormatDate]    Script Date: 6/6/2018 4:14:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fnFormatDate]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fnFormatDate]
GO
/****** Object:  UserDefinedFunction [dbo].[fnCheckDate]    Script Date: 6/6/2018 4:14:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fnCheckDate]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fnCheckDate]
GO
/****** Object:  UserDefinedFunction [dbo].[fnCalculate_Nutritional_Assessment]    Script Date: 6/6/2018 4:14:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fnCalculate_Nutritional_Assessment]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fnCalculate_Nutritional_Assessment]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_ViewExistingFormUsername]    Script Date: 6/6/2018 4:14:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_ViewExistingFormUsername]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fn_ViewExistingFormUsername]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_tstPreg]    Script Date: 6/6/2018 4:14:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_tstPreg]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fn_tstPreg]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_Sum_of_Duration_Constella]    Script Date: 6/6/2018 4:14:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_Sum_of_Duration_Constella]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fn_Sum_of_Duration_Constella]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_stripsingleQuote]    Script Date: 6/6/2018 4:14:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_stripsingleQuote]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fn_stripsingleQuote]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_SplitRegimen_Constella]    Script Date: 6/6/2018 4:14:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_SplitRegimen_Constella]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fn_SplitRegimen_Constella]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_Split]    Script Date: 6/6/2018 4:14:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_Split]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fn_Split]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_RegimenID_Constella]    Script Date: 6/6/2018 4:14:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_RegimenID_Constella]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fn_RegimenID_Constella]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_patientsymptoms]    Script Date: 6/6/2018 4:14:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_patientsymptoms]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fn_patientsymptoms]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_PatientProf_ViralLoadCommaSeparatedLabConstella]    Script Date: 6/6/2018 4:14:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_PatientProf_ViralLoadCommaSeparatedLabConstella]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fn_PatientProf_ViralLoadCommaSeparatedLabConstella]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_PatientProf_CommaSeparatedLabConstella]    Script Date: 6/6/2018 4:14:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_PatientProf_CommaSeparatedLabConstella]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fn_PatientProf_CommaSeparatedLabConstella]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_PatientProf_CommaSeparatedDateConstella]    Script Date: 6/6/2018 4:14:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_PatientProf_CommaSeparatedDateConstella]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fn_PatientProf_CommaSeparatedDateConstella]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_PatientProf_CommaSeparatedDate]    Script Date: 6/6/2018 4:14:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_PatientProf_CommaSeparatedDate]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fn_PatientProf_CommaSeparatedDate]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_PatientProf_CD4CommaSeparatedLabConstella]    Script Date: 6/6/2018 4:14:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_PatientProf_CD4CommaSeparatedLabConstella]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fn_PatientProf_CD4CommaSeparatedLabConstella]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_PatientModulesIds_Futures]    Script Date: 6/6/2018 4:14:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_PatientModulesIds_Futures]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fn_PatientModulesIds_Futures]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_PatientIdentificationNumber_Constella]    Script Date: 6/6/2018 4:14:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_PatientIdentificationNumber_Constella]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fn_PatientIdentificationNumber_Constella]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_PatientExitResion]    Script Date: 6/6/2018 4:14:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_PatientExitResion]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fn_PatientExitResion]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_PatientDiedStatus]    Script Date: 6/6/2018 4:14:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_PatientDiedStatus]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fn_PatientDiedStatus]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_ModulesIds_Futures]    Script Date: 6/6/2018 4:14:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_ModulesIds_Futures]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fn_ModulesIds_Futures]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_Modules_Futures]    Script Date: 6/6/2018 4:14:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_Modules_Futures]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fn_Modules_Futures]
GO

/****** Object:  UserDefinedFunction [dbo].[fn_Lab_GetSpecimenID]    Script Date: 6/6/2018 4:14:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_Lab_GetSpecimenID]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fn_Lab_GetSpecimenID]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_KNH_DCC_PatientWABStage]    Script Date: 6/6/2018 4:14:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_KNH_DCC_PatientWABStage]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fn_KNH_DCC_PatientWABStage]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_InitialRegimen_Constella]    Script Date: 6/6/2018 4:14:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_InitialRegimen_Constella]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fn_InitialRegimen_Constella]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetViralLoad_DueDate]    Script Date: 6/6/2018 4:14:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetViralLoad_DueDate]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fn_GetViralLoad_DueDate]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetTrack1PatientExitReason_Constella]    Script Date: 6/6/2018 4:14:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetTrack1PatientExitReason_Constella]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fn_GetTrack1PatientExitReason_Constella]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetTBstatus]    Script Date: 6/6/2018 4:14:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetTBstatus]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fn_GetTBstatus]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetSubstitutionsInterruptions]    Script Date: 6/6/2018 4:14:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetSubstitutionsInterruptions]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fn_GetSubstitutionsInterruptions]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetSideEffects_Futures]    Script Date: 6/6/2018 4:14:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetSideEffects_Futures]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fn_GetSideEffects_Futures]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetSellingPrice_Futures]    Script Date: 6/6/2018 4:14:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetSellingPrice_Futures]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fn_GetSellingPrice_Futures]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetSelectlistvalue_Decode]    Script Date: 6/6/2018 4:14:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetSelectlistvalue_Decode]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fn_GetSelectlistvalue_Decode]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetSelectlistvalue]    Script Date: 6/6/2018 4:14:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetSelectlistvalue]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fn_GetSelectlistvalue]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetSatelliteName]    Script Date: 6/6/2018 4:14:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetSatelliteName]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fn_GetSatelliteName]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetRelationshipTypeID]    Script Date: 6/6/2018 4:14:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetRelationshipTypeID]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fn_GetRelationshipTypeID]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetRelationshipType]    Script Date: 6/6/2018 4:14:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetRelationshipType]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fn_GetRelationshipType]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetRelationShipinfo]    Script Date: 6/6/2018 4:14:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetRelationShipinfo]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fn_GetRelationShipinfo]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetReferredTo]    Script Date: 6/6/2018 4:14:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetReferredTo]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fn_GetReferredTo]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetPhysicalfindingsbyvisitdate]    Script Date: 6/6/2018 4:14:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetPhysicalfindingsbyvisitdate]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fn_GetPhysicalfindingsbyvisitdate]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetPhysicalfindings]    Script Date: 6/6/2018 4:14:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetPhysicalfindings]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fn_GetPhysicalfindings]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetPatientStatusOnDate]    Script Date: 6/6/2018 4:14:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetPatientStatusOnDate]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fn_GetPatientStatusOnDate]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetPatientStatus]    Script Date: 6/6/2018 4:14:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetPatientStatus]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fn_GetPatientStatus]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetPatientRegistrationNumber]    Script Date: 6/6/2018 4:14:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetPatientRegistrationNumber]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fn_GetPatientRegistrationNumber]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetPatientRegimenLine_futures]    Script Date: 6/6/2018 4:14:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetPatientRegimenLine_futures]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fn_GetPatientRegimenLine_futures]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetPatientregChangReason_futures]    Script Date: 6/6/2018 4:14:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetPatientregChangReason_futures]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fn_GetPatientregChangReason_futures]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetPatientProgramStatus_Naveen]    Script Date: 6/6/2018 4:14:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetPatientProgramStatus_Naveen]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fn_GetPatientProgramStatus_Naveen]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetPatientProgramStatus_Constella]    Script Date: 6/6/2018 4:14:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetPatientProgramStatus_Constella]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fn_GetPatientProgramStatus_Constella]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetPatientPMTCTProgramStatus_Futures]    Script Date: 6/6/2018 4:14:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetPatientPMTCTProgramStatus_Futures]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fn_GetPatientPMTCTProgramStatus_Futures]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetPatientPMTCTProgramStage_Futures]    Script Date: 6/6/2018 4:14:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetPatientPMTCTProgramStage_Futures]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fn_GetPatientPMTCTProgramStage_Futures]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetPatientOriginalOrderID]    Script Date: 6/6/2018 4:14:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetPatientOriginalOrderID]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fn_GetPatientOriginalOrderID]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_getPatientNameDoubleMetaphone]    Script Date: 6/6/2018 4:14:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_getPatientNameDoubleMetaphone]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fn_getPatientNameDoubleMetaphone]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetPatientMaxRefillExpirationdate]    Script Date: 6/6/2018 4:14:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetPatientMaxRefillExpirationdate]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fn_GetPatientMaxRefillExpirationdate]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetPatientMaxRefill]    Script Date: 6/6/2018 4:14:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetPatientMaxRefill]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fn_GetPatientMaxRefill]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetPatientLastHIVCareVisit_Constella]    Script Date: 6/6/2018 4:14:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetPatientLastHIVCareVisit_Constella]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fn_GetPatientLastHIVCareVisit_Constella]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetPatientFirstLineARTStartDate_futures]    Script Date: 6/6/2018 4:14:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetPatientFirstLineARTStartDate_futures]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fn_GetPatientFirstLineARTStartDate_futures]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetPatientFirstLineARTRegimen_Futures]    Script Date: 6/6/2018 4:14:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetPatientFirstLineARTRegimen_Futures]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fn_GetPatientFirstLineARTRegimen_Futures]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetPatientEnrollmentNumber_Constella]    Script Date: 6/6/2018 4:14:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetPatientEnrollmentNumber_Constella]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fn_GetPatientEnrollmentNumber_Constella]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetPatientDuefortermination_futures]    Script Date: 6/6/2018 4:14:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetPatientDuefortermination_futures]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fn_GetPatientDuefortermination_futures]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetPatientCurrentProphylaxisStartDate_Constella]    Script Date: 6/6/2018 4:14:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetPatientCurrentProphylaxisStartDate_Constella]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fn_GetPatientCurrentProphylaxisStartDate_Constella]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetPatientCurrentProphylaxisRegimen_Constella]    Script Date: 6/6/2018 4:14:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetPatientCurrentProphylaxisRegimen_Constella]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fn_GetPatientCurrentProphylaxisRegimen_Constella]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetPatientCurrentARTStartDate_Constella]    Script Date: 6/6/2018 4:14:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetPatientCurrentARTStartDate_Constella]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fn_GetPatientCurrentARTStartDate_Constella]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetPatientCurrentARTRegimen_Constella]    Script Date: 6/6/2018 4:14:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetPatientCurrentARTRegimen_Constella]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fn_GetPatientCurrentARTRegimen_Constella]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetPatientClinicNumber]    Script Date: 6/6/2018 4:14:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetPatientClinicNumber]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fn_GetPatientClinicNumber]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetPatientARTStatusOnDateTrack1_Constella]    Script Date: 6/6/2018 4:14:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetPatientARTStatusOnDateTrack1_Constella]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fn_GetPatientARTStatusOnDateTrack1_Constella]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetPatientARTStatusOnDate_Futures]    Script Date: 6/6/2018 4:14:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetPatientARTStatusOnDate_Futures]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fn_GetPatientARTStatusOnDate_Futures]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetPatientARTStatusOnDate_Constella]    Script Date: 6/6/2018 4:14:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetPatientARTStatusOnDate_Constella]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fn_GetPatientARTStatusOnDate_Constella]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetPatientARTStatus_Futures]    Script Date: 6/6/2018 4:14:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetPatientARTStatus_Futures]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fn_GetPatientARTStatus_Futures]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetPatientArtStartRegimen_futures]    Script Date: 6/6/2018 4:14:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetPatientArtStartRegimen_futures]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fn_GetPatientArtStartRegimen_futures]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetPatientARTStartDate_Constella]    Script Date: 6/6/2018 4:14:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetPatientARTStartDate_Constella]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fn_GetPatientARTStartDate_Constella]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetPatientARTStartDate]    Script Date: 6/6/2018 4:14:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetPatientARTStartDate]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fn_GetPatientARTStartDate]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetPatientAgeInYearsMonth]    Script Date: 6/6/2018 4:14:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetPatientAgeInYearsMonth]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fn_GetPatientAgeInYearsMonth]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetPatientAge]    Script Date: 6/6/2018 4:14:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetPatientAge]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fn_GetPatientAge]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetPASDPTBstatus]    Script Date: 6/6/2018 4:14:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetPASDPTBstatus]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fn_GetPASDPTBstatus]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetParmTilteFormBuilder]    Script Date: 6/6/2018 4:14:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetParmTilteFormBuilder]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fn_GetParmTilteFormBuilder]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetOverHeadPerVisit_Futures]    Script Date: 6/6/2018 4:14:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetOverHeadPerVisit_Futures]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fn_GetOverHeadPerVisit_Futures]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetOverHeadPerVisit_BillAmount_Futures]    Script Date: 6/6/2018 4:14:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetOverHeadPerVisit_BillAmount_Futures]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fn_GetOverHeadPerVisit_BillAmount_Futures]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetModSelectlistvalue_Decode]    Script Date: 6/6/2018 4:14:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetModSelectlistvalue_Decode]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fn_GetModSelectlistvalue_Decode]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetModSelectlistvalue]    Script Date: 6/6/2018 4:14:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetModSelectlistvalue]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fn_GetModSelectlistvalue]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetLabPerVisit_BillAmount_Futures]    Script Date: 6/6/2018 4:14:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetLabPerVisit_BillAmount_Futures]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fn_GetLabPerVisit_BillAmount_Futures]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetItemStock_Futures]    Script Date: 6/6/2018 4:14:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetItemStock_Futures]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fn_GetItemStock_Futures]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetItemOpeningStockwithoutAdjustmentStock]    Script Date: 6/6/2018 4:14:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetItemOpeningStockwithoutAdjustmentStock]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fn_GetItemOpeningStockwithoutAdjustmentStock]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetItemOpeningStockwithopeningflag]    Script Date: 6/6/2018 4:14:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetItemOpeningStockwithopeningflag]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fn_GetItemOpeningStockwithopeningflag]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetItemOpeningStock]    Script Date: 6/6/2018 4:14:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetItemOpeningStock]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fn_GetItemOpeningStock]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetItemBatchStock_ItemId]    Script Date: 6/6/2018 4:14:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetItemBatchStock_ItemId]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fn_GetItemBatchStock_ItemId]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetIQCareNumber_Constella]    Script Date: 6/6/2018 4:14:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetIQCareNumber_Constella]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fn_GetIQCareNumber_Constella]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_getImportDataTable]    Script Date: 6/6/2018 4:14:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_getImportDataTable]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fn_getImportDataTable]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetImmunisation]    Script Date: 6/6/2018 4:14:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetImmunisation]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fn_GetImmunisation]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetIdentifiers_Futures]    Script Date: 6/6/2018 4:14:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetIdentifiers_Futures]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fn_GetIdentifiers_Futures]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetHivStatusDesc]    Script Date: 6/6/2018 4:14:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetHivStatusDesc]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fn_GetHivStatusDesc]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetHIVStatus_Constella]    Script Date: 6/6/2018 4:14:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetHIVStatus_Constella]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fn_GetHIVStatus_Constella]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetHivStatus]    Script Date: 6/6/2018 4:14:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetHivStatus]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fn_GetHivStatus]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetHivCareStatusID]    Script Date: 6/6/2018 4:14:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetHivCareStatusID]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fn_GetHivCareStatusID]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetHivCareStatusDesc]    Script Date: 6/6/2018 4:14:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetHivCareStatusDesc]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fn_GetHivCareStatusDesc]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetHIVCareStatus_Constella]    Script Date: 6/6/2018 4:14:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetHIVCareStatus_Constella]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fn_GetHIVCareStatus_Constella]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetHivCareStatus]    Script Date: 6/6/2018 4:14:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetHivCareStatus]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fn_GetHivCareStatus]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetFixedDoseDrugAbbrevation]    Script Date: 6/6/2018 4:14:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetFixedDoseDrugAbbrevation]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fn_GetFixedDoseDrugAbbrevation]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetFirstDayOfNextMonth]    Script Date: 6/6/2018 4:14:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetFirstDayOfNextMonth]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fn_GetFirstDayOfNextMonth]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetfieldSelectedValue]    Script Date: 6/6/2018 4:14:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetfieldSelectedValue]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fn_GetfieldSelectedValue]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_getFieldsBusinessRule]    Script Date: 6/6/2018 4:14:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_getFieldsBusinessRule]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fn_getFieldsBusinessRule]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetFeatureName]    Script Date: 6/6/2018 4:14:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetFeatureName]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fn_GetFeatureName]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetEnrollmentDate]    Script Date: 6/6/2018 4:14:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetEnrollmentDate]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fn_GetEnrollmentDate]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetEmployeeName]    Script Date: 6/6/2018 4:14:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetEmployeeName]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fn_GetEmployeeName]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetDrugTypeName_futures]    Script Date: 6/6/2018 4:14:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetDrugTypeName_futures]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fn_GetDrugTypeName_futures]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetDrugTypeId_futures]    Script Date: 6/6/2018 4:14:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetDrugTypeId_futures]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fn_GetDrugTypeId_futures]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetDrugGenericCommaSeprated]    Script Date: 6/6/2018 4:14:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetDrugGenericCommaSeprated]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fn_GetDrugGenericCommaSeprated]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetDevelopmentalScreening]    Script Date: 6/6/2018 4:14:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetDevelopmentalScreening]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fn_GetDevelopmentalScreening]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetDataType]    Script Date: 6/6/2018 4:14:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetDataType]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fn_GetDataType]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetCTXadherence]    Script Date: 6/6/2018 4:14:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetCTXadherence]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fn_GetCTXadherence]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetCountDrugTypeId_futures]    Script Date: 6/6/2018 4:14:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetCountDrugTypeId_futures]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fn_GetCountDrugTypeId_futures]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetConsultationPerVisit_Futures]    Script Date: 6/6/2018 4:14:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetConsultationPerVisit_Futures]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fn_GetConsultationPerVisit_Futures]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetConsultationPerVisit_BillAmount_Futures]    Script Date: 6/6/2018 4:14:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetConsultationPerVisit_BillAmount_Futures]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fn_GetConsultationPerVisit_BillAmount_Futures]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetCareEndedDate]    Script Date: 6/6/2018 4:14:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetCareEndedDate]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fn_GetCareEndedDate]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetBudgetSalary]    Script Date: 6/6/2018 4:14:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetBudgetSalary]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fn_GetBudgetSalary]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetBudgetOverhead]    Script Date: 6/6/2018 4:14:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetBudgetOverhead]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fn_GetBudgetOverhead]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetBudgetLab]    Script Date: 6/6/2018 4:14:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetBudgetLab]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fn_GetBudgetLab]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetAllergyDesc]    Script Date: 6/6/2018 4:14:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetAllergyDesc]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fn_GetAllergyDesc]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetAgeConstella]    Script Date: 6/6/2018 4:14:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetAgeConstella]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fn_GetAgeConstella]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_FormatRegimen]    Script Date: 6/6/2018 4:14:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_FormatRegimen]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fn_FormatRegimen]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_fieldencryptdecrypt]    Script Date: 6/6/2018 4:14:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_fieldencryptdecrypt]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fn_fieldencryptdecrypt]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_Drug_Abbrev3]    Script Date: 6/6/2018 4:14:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_Drug_Abbrev3]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fn_Drug_Abbrev3]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_Drug_Abbrev2]    Script Date: 6/6/2018 4:14:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_Drug_Abbrev2]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fn_Drug_Abbrev2]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_Drug_Abbrev_Constella]    Script Date: 6/6/2018 4:14:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_Drug_Abbrev_Constella]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fn_Drug_Abbrev_Constella]
GO
/****** Object:  UserDefinedFunction [dbo].[FN_DistinctList]    Script Date: 6/6/2018 4:14:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FN_DistinctList]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[FN_DistinctList]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_DaysinMonth_Constella]    Script Date: 6/6/2018 4:14:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_DaysinMonth_Constella]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fn_DaysinMonth_Constella]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_CustomField_RemovePrefixFromFieldNameConstella_bkp]    Script Date: 6/6/2018 4:14:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_CustomField_RemovePrefixFromFieldNameConstella_bkp]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fn_CustomField_RemovePrefixFromFieldNameConstella_bkp]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_CustomField_RemovePrefixFromFieldNameConstella]    Script Date: 6/6/2018 4:14:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_CustomField_RemovePrefixFromFieldNameConstella]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fn_CustomField_RemovePrefixFromFieldNameConstella]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_CustomField_GetNewFieldNameConstella]    Script Date: 6/6/2018 4:14:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_CustomField_GetNewFieldNameConstella]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fn_CustomField_GetNewFieldNameConstella]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_Billing_PriceList]    Script Date: 6/6/2018 4:14:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_Billing_PriceList]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fn_Billing_PriceList]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_Billing_PatientAvailableDeposit]    Script Date: 6/6/2018 4:14:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_Billing_PatientAvailableDeposit]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fn_Billing_PatientAvailableDeposit]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_Billing_getBillID]    Script Date: 6/6/2018 4:14:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_Billing_getBillID]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fn_Billing_getBillID]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_Billing_GenerateReceiptNumber]    Script Date: 6/6/2018 4:14:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_Billing_GenerateReceiptNumber]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fn_Billing_GenerateReceiptNumber]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_Batch_SellingPrice]    Script Date: 6/6/2018 4:14:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_Batch_SellingPrice]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fn_Batch_SellingPrice]
GO
/*
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_Admission_GetWardOccupancy]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fn_Admission_GetWardOccupancy]
GO
*/
/****** Object:  UserDefinedFunction [dbo].[fn_add]    Script Date: 6/6/2018 4:14:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_add]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fn_add]
GO


/****** Object:  UserDefinedFunction [dbo].[fn_GetPatientStatus]    Script Date: 6/6/2018 4:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetPatientStatus]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE function [dbo].[fn_GetPatientStatus]    
(    
   @ptn_pk int,    
   @ModuleId int    
)    
returns varchar(50)    
as    
Begin    
  declare @PatStatus varchar(50)   
     set @PatStatus = '''' 
     select top 1 @PatStatus = (Case @ModuleId when 1 then PMTCTCareEnded when 2 then CareEnded end) from
     VW_PatientCareEnd where Ptn_Pk = @Ptn_Pk order by CareEndedId desc   
   
	  if(@PatStatus = ''1'')   
		  set @PatStatus = ''In-Active''  
      else  
		  set @PatStatus = ''Active''  
  
  return @PatStatus      
    
End
' 
END
GO


/****** Object:  UserDefinedFunction [dbo].[fn_add]    Script Date: 6/6/2018 4:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_add]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'Create FUNCTION [dbo].[fn_add]
(
	@a int,
    @b varchar(50)
	
)
RETURNS int
AS
Begin

	return (@a + @b)

End
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_Admission_GetWardOccupancy]    Script Date: 6/6/2018 4:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_Admission_GetWardOccupancy]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
-- =============================================
-- Author:		Joseph Njung''e
-- Create date: 27 Jan 2015
-- Description:	Get the occupancy of a ward at the moment
-- =============================================
Create FUNCTION [dbo].[fn_Admission_GetWardOccupancy] 
(
	-- Add the paraers for the function here
	@WardID int
)
	
RETURNS int
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Occupancy int;

	-- Add the T-SQL statements to compute the return value here
	Select @Occupancy = Count(AdmissionID)
	From DTL_PatientWardAdmission
	Where WardID = @WardID
	And Discharged = 0;
	-- Return the result of the function
	Return @Occupancy;

End
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_Batch_SellingPrice]    Script Date: 6/6/2018 4:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_Batch_SellingPrice]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Naveen Sharma
-- Create date: Sept 09 2015
-- Description:	Get Selling Price of a given Item
-- =============================================
CREATE FUNCTION [dbo].[fn_Batch_SellingPrice] (
	-- Add the parameters for the function here
	@ItemID INT = NULL
	,@ItemTypeID INT = NULL
	)
RETURNS DECIMAL(18, 2)
AS
BEGIN
	DECLARE @SellingPrice DECIMAL(18, 2);

	IF @ItemTypeID IN (
			299
			,300
			)
	BEGIN
		SELECT TOP 1 @SellingPrice = CustomSellingPrice
		FROM Dtl_GRNote AS G
		JOIN Mst_Batch AS B ON G.BatchID = B.ID
		WHERE B.ItemID = @ItemID
		ORDER BY CustomSellingPrice DESC;

		IF (
				@SellingPrice IS NULL
				OR @SellingPrice = 0
				)
		BEGIN
			SELECT @SellingPrice = I.UnitSellingPrice
			FROM dbo.vw_Master_ItemList AS I
			WHERE I.ItemID = @ItemID
				AND I.ItemTypeID = @ItemTypeID;
		END;
	END;
	ELSE
	BEGIN
		SELECT @SellingPrice = I.UnitSellingPrice
		FROM dbo.vw_Master_ItemList AS I
		WHERE I.ItemID = @ItemID;
	END;

	RETURN ISNULL(@SellingPrice, 0);
END;


' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_Billing_GenerateReceiptNumber]    Script Date: 6/6/2018 4:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_Billing_GenerateReceiptNumber]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
-- =============================================
-- Author:		Joseph Njung''e
-- Create date: 2014-10-22
-- Description:	Get the Transaction Receipt Number
-- =============================================
CREATE FUNCTION [dbo].[fn_Billing_GenerateReceiptNumber] 
(

)
RETURNS varchar(50)
AS
BEGIN
	-- Declare the return variable here
	

	declare  @StartMonth datetime, @EndMonth datetime, @SettledAmount decimal(18,2), @BillAmount decimal(18,2);
		Select	
			@StartMonth = Dateadd(Month, Datediff(Month, 0, Getdate()), 0),
			@EndMonth = Dateadd(Month, 1, Getdate() - Day(Getdate()));
		
		Declare @Bill_Index Int, @Space Int,@Receipt_Number Varchar(50) ,@ItemCount int;
		Set @Space = 8;
		Select @Bill_Index= Count(TransactionID)+1 From dbo.ord_bill Where TransactionDate Between  @StartMonth And @EndMonth;

		Set @Space = @Space - Len(@Bill_Index);

		Select @Receipt_Number = Replace(Convert(varchar(7),Getdate(),102),''.'','''')+''-'' + Replicate(''0'', @Space)+  Convert(VarChar,@Bill_Index); 
		

	-- Return the result of the function
	RETURN @Receipt_Number

END

' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_Billing_getBillID]    Script Date: 6/6/2018 4:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_Billing_getBillID]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Vincent Yahuma
-- Create date: 2014-May-28
-- Description:	Gets the patients current open BillID
-- =============================================
CREATE FUNCTION [dbo].[fn_Billing_getBillID](@patientID int) RETURNS int

AS
BEGIN
	-- Declare the return variable here
return(	SELECT TOP 1 BillID from mst_Bill where ptn_pk=@patientID and BillStatus=1)

END
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_Billing_PatientAvailableDeposit]    Script Date: 6/6/2018 4:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_Billing_PatientAvailableDeposit]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
-- =============================================
-- Author:		Joseph Njunge
-- Create date: Oct 27 2014
-- Description:	Get the Availble deposit for a patient
-- =============================================
CREATE FUNCTION [dbo].[fn_Billing_PatientAvailableDeposit] 
(
	-- Add the parameters for the function here
	@PatientID int,
	@LocationID int
)
RETURNS decimal(9,2)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Balance decimal(9,2);

	-- Add the T-SQL statements to compute the return value here
	Select 
		@Balance = Sum(Case TransactionType When ''Credit'' Then 1.0* Amount Else -1.0* Amount End )
	From dtl_BillDepositTransaction 
	Where Ptn_PK = @PatientID 
	And LocationID = @LocationID;
	-- Return the result of the function
	RETURN @Balance;

END

' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_Billing_PriceList]    Script Date: 6/6/2018 4:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_Billing_PriceList]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Joseph Njung''e
-- Create date: March 09 2015
-- Description:	Get Price List on a given date
-- =============================================
CREATE FUNCTION [dbo].[fn_Billing_PriceList] 
(
	-- Add the parameters for the function here
	@ItemID int = null, 
	@ItemTypeID int = null,
	@PriceDate datetime = null
)
RETURNS 
@PriceTable TABLE 
(
	-- Add the column definitions for the TABLE variable here
	ItemID int, 
	ItemTypeID int,
	ItemName varchar(250),
	ItemTypeName varchar(250),
	PriceOnDate decimal(18,2),
	PriceDate datetime,
	IsCurrentPrice bit,
	PriceAge int,
	PriceIndex int,
	PharmacyPriceType bit,	
	VersionStamp bigint,	
	CurrentPrice decimal(18,2),
	CurrentPriceDate datetime,
	CurrentPriceType bit
)
AS
BEGIN
	-- Fill the table variable with the rows for your result set
	Select @PriceDate = Isnull(@PriceDate,Getdate());
	With PriceList As (
	Select	
			CC.ItemId,
			CC.ItemType ItemTypeID,
			ML.ItemName,
			ML.ItemTypeName,
			CC.ItemSellingPrice PriceOnDate,
			CC.EffectiveDate PriceDate,
			Convert(bit,CC.PriceStatus) IsCurrentPrice,
			Abs(Datediff(dd,@PriceDate,cc.EffectiveDate))PriceAge,
			CC.statusDate,
			Isnull(CC.PharmacyPriceType, 0) PharmacyPriceType,
			CC.VersionStamp,				
			Row_number() Over(Partition By Checksum(cc.ItemId,CC.ItemType) Order by Abs(Datediff(dd,@PriceDate,cc.EffectiveDate)) Asc) PriceIndex,
			ML.PriceDate CurrentPriceDate,
			ML.UnitSellingPrice CurrentPrice ,
			ML.PharmacyPriceType CurrentPriceType
	From dbo.lnk_ItemCostConfiguration CC
	Inner Join
		dbo.vw_Master_ItemList ML On ML.ItemID = CC.ItemId
		And ML.ItemTypeID = CC.ItemType
	Where 
	Case When @ItemId Is Null OR @ItemID=CC.ItemId  Then 1 Else 0 End =1
	And Case	When  @ItemTypeID Is Null OR CC.ItemType= @ItemTypeID Then 1 Else 0 End = 1		
	And (Dateadd(dd, 0, Datediff(dd, 0, CC.EffectiveDate)) <= @PriceDate)
	And CC.DeleteFlag = 0
	And ML.DeleteFlag=0)
	Insert Into @PriceTable
	(
		ItemID , 
		ItemTypeID ,
		ItemName ,
		ItemTypeName ,
		PriceOnDate ,
		PriceDate ,
		IsCurrentPrice ,
		PriceAge ,
		PriceIndex,
		VersionStamp,
		PharmacyPriceType ,			
		CurrentPrice ,
		CurrentPriceDate ,
		CurrentPriceType 
	)
	Select
		ItemID,
		ItemTypeID,
		ItemName ,
		ItemTypeName ,
		PriceOnDate ,
		PriceDate ,
		IsCurrentPrice ,
		PriceAge ,
		PriceIndex,
		VersionStamp,		
		PharmacyPriceType ,	
		CurrentPrice ,
		CurrentPriceDate ,
		CurrentPriceType 
	From PriceList -- Where PriceIndex = 1;
		--Select * From PriceList  Where DaysDiff = 1
		--;
	RETURN 
END
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_CustomField_GetNewFieldNameConstella]    Script Date: 6/6/2018 4:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_CustomField_GetNewFieldNameConstella]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[fn_CustomField_GetNewFieldNameConstella]          
(          
 @FeatureId int,          
    @FieldName varchar(50)          
           
)          
RETURNS varchar(50)          
AS          
Begin          
              
 Declare  @newfieldName varchar(50);          
          
     if @FeatureId = 1          
   begin          
   set @newfieldName = ''Enroll_'' + @FieldName;          
   end          
     else if @FeatureId = 2          
   begin          
   set @newfieldName = ''IEval_'' + @FieldName;          
   end          
     else if @FeatureId = 3          
   begin          
   set @newfieldName = ''APharm_'' + @FieldName;          
   end          
     else if @FeatureId = 4          
   begin          
   set @newfieldName = ''PPharm_'' + @FieldName;          
   end          
     else if @FeatureId = 5          
   begin          
   set @newfieldName = ''Lab_'' + @FieldName;          
   end          
     else if @FeatureId = 6          
   begin          
   set @newfieldName = ''NonART_'' + @FieldName;          
   end          
     else if @FeatureId = 7          
   begin          
   set @newfieldName = ''ART_'' + @FieldName;          
   end          
     else if @FeatureId = 8          
   begin          
   set @newfieldName = ''CareTrack_'' + @FieldName;          
   end          
     else if @FeatureId = 9          
   begin          
   set @newfieldName = ''HomeVisit_'' + @FieldName;          
   end          
else if @FeatureId = 72          
   begin          
   set @newfieldName = ''CTCPharm_'' + @FieldName;          
   end          
else if @FeatureId = 73          
   begin          
   set @newfieldName = ''PRecord_'' + @FieldName;          
   end          
          
else if @FeatureId = 117         
   begin          
   set @newfieldName = ''PMTCTEnroll_'' + @FieldName;          
   end         
        
else if @FeatureId = 163         
   begin          
   set @newfieldName = ''PAHCare_'' + @FieldName;          
   end        
      
else if @FeatureId = 164         
   begin          
   set @newfieldName = ''ARTCare_'' + @FieldName;          
   end        
      
else if @FeatureId = 165         
   begin          
   set @newfieldName = ''HCAEnc_'' + @FieldName;          
   end        
  else if @FeatureId = 168         
   begin          
   set @newfieldName = ''AHistory_'' + @FieldName;          
   end        
      
else if @FeatureId = 169         
   begin          
   set @newfieldName = ''ATherapy_'' + @FieldName;          
   end        
      
else if @FeatureId = 167         
   begin          
   set @newfieldName = ''IFVisit_'' + @FieldName;          
   end    
      
 RETURN @newfieldName;          
End
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_CustomField_RemovePrefixFromFieldNameConstella]    Script Date: 6/6/2018 4:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_CustomField_RemovePrefixFromFieldNameConstella]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[fn_CustomField_RemovePrefixFromFieldNameConstella]                  
(                  
 @FieldName varchar(100)                  
                   
)                  
RETURNS varchar(100)                  
AS                  
Begin                  
                      
 Declare  @newfieldName varchar(100);                  
                
 Set @newfieldName = @FieldName                  
    if ((charindex (''Enroll_'',@FieldName)  =1) or (charindex (''IEval_'',@FieldName) =1) or (charindex (''APharm_'',@FieldName) =1) or                  
        (charindex (''PPharm_'',@FieldName) =1) or (charindex (''Lab_'',@FieldName) =1) or (charindex (''NonART_'',@FieldName) =1) or                  
        (charindex (''ART_'',@FieldName) =1) or (charindex (''CareTrack_'',@FieldName) =1) or (charindex (''HomeVisit_'',@FieldName) =1)or                
  (charindex (''CTCPharm_'',@FieldName) =1)   or (charindex (''PRecord_'',@FieldName) =1) or (charindex (''PMTCTEnroll_'',@FieldName) =1)        
or (charindex (''PAHCare_'',@FieldName) =1) or (charindex (''ARTCare_'',@FieldName) =1) or (charindex (''HCAEnc_'',@FieldName) =1)
or (charindex (''AHistory_'',@FieldName) =1) or (charindex (''ATherapy_'',@FieldName) =1) or (charindex (''IFVisit_'',@FieldName) =1) )                  
  Begin                  
   set @newfieldName = Replace(@FieldName,''Enroll_'','''')                   
   set @newfieldName = Replace(@newfieldName,''IEval_'','''')                   
   set @newfieldName = Replace(@newfieldName,''APharm_'','''')                   
   set @newfieldName = Replace(@newfieldName,''PPharm_'','''')                   
   set @newfieldName = Replace(@newfieldName,''Lab_'','''')                   
   set @newfieldName = Replace(@newfieldName,''NonART_'','''')                  
   set @newfieldName = Replace(@newfieldName,''ART_'','''')                   
   set @newfieldName = Replace(@newfieldName,''CareTrack_'','''')                   
   set @newfieldName = Replace(@newfieldName,''HomeVisit_'','''')                
   set @newfieldName = Replace(@newfieldName,''CTCPharm_'','''')                
            
  set @newfieldName = Replace(@newfieldName,''PRecord_'','''')          
  set @newfieldName = Replace(@newfieldname, ''PMTCTEnroll_'', '''')                 
set @newfieldName = Replace(@newfieldname, ''PAHCare_'', '''')          
set @newfieldName = Replace(@newfieldname, ''ARTCare_'', '''')          
set @newfieldName = Replace(@newfieldname, ''HCAEnc_'', '''')     
  
set @newfieldName = Replace(@newfieldname, ''AHistory_'', '''')          
set @newfieldName = Replace(@newfieldname, ''ATherapy_'', '''')          
set @newfieldName = Replace(@newfieldname, ''IFVisit_'', '''')    
            
  End                   
                  
 RETURN ltrim(@newfieldName);                  
End
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_CustomField_RemovePrefixFromFieldNameConstella_bkp]    Script Date: 6/6/2018 4:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_CustomField_RemovePrefixFromFieldNameConstella_bkp]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[fn_CustomField_RemovePrefixFromFieldNameConstella_bkp]              
(              
 @FieldName varchar(100)              
               
)              
RETURNS varchar(100)              
AS              
Begin              
                  
 Declare  @newfieldName varchar(100);              
            
 Set @newfieldName = @FieldName              
    if ((charindex (''Enroll_'',@FieldName)  =1) or (charindex (''IEval_'',@FieldName) =1) or (charindex (''APharm_'',@FieldName) =1) or              
        (charindex (''PPharm_'',@FieldName) =1) or (charindex (''Lab_'',@FieldName) =1) or (charindex (''NonART_'',@FieldName) =1) or              
        (charindex (''ART_'',@FieldName) =1) or (charindex (''CareTrack_'',@FieldName) =1) or (charindex (''HomeVisit_'',@FieldName) =1)or            
  (charindex (''CTCPharm_'',@FieldName) =1)   or (charindex (''PRecord_'',@FieldName) =1) or (charindex (''PMTCTEnroll_'',@FieldName) =1)    
or (charindex (''PAHCare_'',@FieldName) =1) or (charindex (''ARTCare_'',@FieldName) =1) or (charindex (''HCAEnc_'',@FieldName) =1)  
or (charindex (''AHistory_'',@FieldName) =1) or (charindex (''ATherapy_'',@FieldName) =1) or (charindex (''IFVisit_'',@FieldName) =1))              
  Begin              
   set @newfieldName = Replace(@FieldName,''Enroll_'','''')               
   set @newfieldName = Replace(@newfieldName,''IEval_'','''')               
   set @newfieldName = Replace(@newfieldName,''APharm_'','''')               
   set @newfieldName = Replace(@newfieldName,''PPharm_'','''')               
   set @newfieldName = Replace(@newfieldName,''Lab_'','''')               
   set @newfieldName = Replace(@newfieldName,''NonART_'','''')              
   set @newfieldName = Replace(@newfieldName,''ART_'','''')               
   set @newfieldName = Replace(@newfieldName,''CareTrack_'','''')               
   set @newfieldName = Replace(@newfieldName,''HomeVisit_'','''')            
   set @newfieldName = Replace(@newfieldName,''CTCPharm_'','''')            
        
  set @newfieldName = Replace(@newfieldName,''PRecord_'','''')      
  set @newfieldName = Replace(@newfieldname, ''PMTCTEnroll_'', '''')             
set @newfieldName = Replace(@newfieldname, ''PAHCare_'', '''')      
set @newfieldName = Replace(@newfieldname, ''ARTCare_'', '''')      
set @newfieldName = Replace(@newfieldname, ''HCAEnc_'', '''')  
set @newfieldName = Replace(@newfieldname, ''AHistory_'', '''')  
set @newfieldName = Replace(@newfieldname, ''ATherapy_'', '''')  
set @newfieldName = Replace(@newfieldname, ''IFVisit_'', '''')         
         
  End               
              
 RETURN ltrim(@newfieldName);              
End
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_DaysinMonth_Constella]    Script Date: 6/6/2018 4:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_DaysinMonth_Constella]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'create FUNCTION [dbo].[fn_DaysinMonth_Constella](

    @month int -- List of delimited items
  , @year int  -- delimiter that separates items
) RETURNS VARCHAR(20)
BEGIN
DECLARE @days INT
DECLARE @date DATETIME
	BEGIN
		SET @date = CONVERT(DATETIME, STR(@month) + ''/01/''+STR(@year))
		SELECT @days = DAY(DATEADD (m, 1, DATEADD (d, 1 - DAY(@date), @date)) - 1) 
 END
RETURN @days

END
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[FN_DistinctList]    Script Date: 6/6/2018 4:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FN_DistinctList]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[FN_DistinctList]
(
@List VARCHAR(MAX),
@Delim CHAR
)
RETURNS VARCHAR(MAX)
AS
BEGIN
	DECLARE @ParsedList TABLE
	(
		Item VARCHAR(MAX)
	)
	DECLARE @list1 VARCHAR(MAX), @Pos INT, @rList VARCHAR(MAX)
	SET @list = LTRIM(RTRIM(@list)) + @Delim
	SET @pos = CHARINDEX(@delim, @list, 1)
	WHILE @pos > 0
	BEGIN
		SET @list1 = LTRIM(RTRIM(LEFT(@list, @pos - 1)))
		IF @list1 <> ''''
		INSERT INTO @ParsedList VALUES (CAST(@list1 AS VARCHAR(MAX)))
		SET @list = SUBSTRING(@list, @pos+1, LEN(@list))
		SET @pos = CHARINDEX(@delim, @list, 1)
	END
	SELECT @rlist = COALESCE(@rlist+''/'','''') + item
	FROM (SELECT DISTINCT Item FROM @ParsedList) t

	RETURN @rlist
END

' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_Drug_Abbrev_Constella]    Script Date: 6/6/2018 4:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_Drug_Abbrev_Constella]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[fn_Drug_Abbrev_Constella]
(
	@param_drug_pk int
)
RETURNS varchar(max)
AS
BEGIN

	DECLARE @GenAbbr nvarchar(max)
	Declare @genVar varchar(max)
	DECLARE @drug_pk nvarchar(100)
	DECLARE @genericAbbrevation nvarchar(max)

	declare  cr_GenAb cursor for 
    select b.genericAbbrevation
	from mst_drug a,mst_generic b,lnk_druggeneric c  
	where c.genericid = b.genericid 
    and c.drug_pk = a.drug_pk
	and a.drug_pk=@param_drug_pk 
	and	a.deleteflag = 0
	order by a.drugname                                                 
	
	
	open cr_GenAb
	
	fetch next from cr_GenAb into @genericAbbrevation
	while @@FETCH_STATUS = 0
	begin
		if(@GenAbbr is Null)
			set @GenAbbr = @genericAbbrevation;
		else
			set @GenAbbr = @GenAbbr + ''/'' +  @genericAbbrevation ;
		fetch  next from cr_GenAb into @genericAbbrevation;
	end
	close cr_GenAb;
	Deallocate cr_GenAb;
	RETURN @GenAbbr 
END
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_Drug_Abbrev2]    Script Date: 6/6/2018 4:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_Drug_Abbrev2]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[fn_Drug_Abbrev2] -- used from druglist - concatenate genericAbbreviation 
(  
 @param_drug_pk int  
)  
RETURNS varchar(max)  
AS  
BEGIN  
  
 DECLARE @GenAbbr nvarchar(max)  
 Declare @genVar varchar(max)  
 DECLARE @drug_pk nvarchar(100)  
 DECLARE @genericAbbrevation nvarchar(max)  
  
 declare  cr_GenAb cursor for   


Select b.GenericAbbrevation          
from mst_drug a,mst_generic b,mst_DrugType c, lnk_DrugGeneric d,lnk_drugtypegeneric e            
where a.Drug_pk = d.Drug_pk and b.GenericID = d.GenericId and b.GenericID= e.GenericId and   
e.DrugTypeId = c.DrugTypeId
and a.Drug_pk=@param_drug_pk
order by drugname                                                  
   
   
 open cr_GenAb  
   
 fetch next from cr_GenAb into @genericAbbrevation  
 while @@FETCH_STATUS = 0  
 begin  
  if(@GenAbbr is Null)  
   set @GenAbbr = @genericAbbrevation;  
  else  
   set @GenAbbr = @GenAbbr + ''/'' +  @genericAbbrevation ;  
  fetch  next from cr_GenAb into @genericAbbrevation;  
 end  
 close cr_GenAb;  
 Deallocate cr_GenAb;  
 RETURN @GenAbbr   
END
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_Drug_Abbrev3]    Script Date: 6/6/2018 4:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_Drug_Abbrev3]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[fn_Drug_Abbrev3] -- used from druglist - concatenate genericName     
(    
 @param_drug_pk int    
)    
RETURNS varchar(max)    
AS    
BEGIN    
    
 DECLARE @GenAbbr nvarchar(max)    
 Declare @genVar varchar(max)    
 DECLARE @drug_pk nvarchar(100)    
 DECLARE @genericAbbrevation nvarchar(max)    
    
 declare  cr_GenAb cursor for     
  
  
Select b.GenericName            
from mst_drug a,mst_generic b,mst_DrugType c, lnk_DrugGeneric d,lnk_drugtypegeneric e              
where a.Drug_pk = d.Drug_pk and b.GenericID = d.GenericId and b.GenericID= e.GenericId and     
e.DrugTypeId = c.DrugTypeId  
and a.Drug_pk=@param_drug_pk  
and b.GenericAbbrevation is not null  
order by drugname                                                    
     
     
 open cr_GenAb    
     
 fetch next from cr_GenAb into @genericAbbrevation    
 while @@FETCH_STATUS = 0    
 begin    
  if(@GenAbbr is Null)    
   set @GenAbbr = @genericAbbrevation;    
  else    
   set @GenAbbr = @GenAbbr + ''/'' +  @genericAbbrevation ;    
  fetch  next from cr_GenAb into @genericAbbrevation;    
 end    
 close cr_GenAb;    
 Deallocate cr_GenAb;    
 RETURN @GenAbbr     
END
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_fieldencryptdecrypt]    Script Date: 6/6/2018 4:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_fieldencryptdecrypt]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
CREATE FUNCTION [dbo].[fn_fieldencryptdecrypt] 
(
	@fieldName varchar(150)
	,@FieldType varchar(50)
)
RETURNS varchar(200)
AS
BEGIN

	declare @valuereturn varchar(200)
	if @FieldType = ''varbinary''
	begin
	select @valuereturn = convert(varchar(50),decryptbykey(@fieldName))
	end
	else
	begin
	select @valuereturn = @fieldName
	end
return @valuereturn
END



' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_FormatRegimen]    Script Date: 6/6/2018 4:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_FormatRegimen]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'

CREATE FUNCTION [dbo].[fn_FormatRegimen](@Regimen VARCHAR(100))

RETURNS VARCHAR(50)

AS
BEGIN
      DECLARE @Formatted VARCHAR(50)
      
      SET @Formatted = @Regimen     
      
      --Order the regimens
      DECLARE @SplitRegimens TABLE( Item VARCHAR(10))
      DECLARE @item VARCHAR(10), @Pos INT, @Ordered VARCHAR(50), @delim VARCHAR(2)
      
      SET @delim = ''/''
      
      SET @Formatted = @Formatted + @Delim
      SET @pos = CHARINDEX(@delim, @Formatted, 1)
      WHILE @pos > 0
      BEGIN
            SET @item = LTRIM(RTRIM(LEFT(@Formatted, @pos - 1)))
            IF @item <> '''' INSERT INTO @SplitRegimens VALUES (CAST(@item AS VARCHAR(10)))
            
            SET @Formatted = SUBSTRING(@Formatted, @pos+1, LEN(@Formatted))
            
            SET @pos = CHARINDEX(@delim, @Formatted, 1)
      END
      SELECT @Ordered = COALESCE(@Ordered + @delim,'''') + item
      FROM (SELECT DISTINCT TOP 10 Item FROM @SplitRegimens ORDER BY Item) t

      RETURN Isnull(@Ordered,'''')
END' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetAgeConstella]    Script Date: 6/6/2018 4:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetAgeConstella]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE function [dbo].[fn_GetAgeConstella]
(@in_DOB AS datetime, @now as datetime)
returns decimal(8,2)
as
begin

DECLARE @age decimal(8,2)
SET @age = (datediff(day,@in_DOB,@now)/365.25)
RETURN @age

end
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetAllergyDesc]    Script Date: 6/6/2018 4:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetAllergyDesc]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE function [dbo].[fn_GetAllergyDesc]    
(   
 @Id int ,  
 @Type int   
     
)    
returns varchar(20)    
as    
Begin    
 DECLARE @AllergyStatusdesc varchar(20)    
if (@Type = 1)  
 begin  
    select @AllergyStatusdesc=Name from mst_decode where id=@Id   
  end  
else  
begin  
    select @AllergyStatusdesc=Name from mst_code where codeid=@Id   
  end  
 return @AllergyStatusdesc   
end



' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetBudgetLab]    Script Date: 6/6/2018 4:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetBudgetLab]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[fn_GetBudgetLab]   
(  
 @year int  
 ,@month int  
)  
RETURNS decimal(18,2)  
AS  
BEGIN  
   
 declare @return decimal(18,2)  
  
 select @return = sum(budgetamt)  
 from ord_budgetconfig obc   
 join dtl_budgetconfig dbc on obc.budgetConfigId = dbc.budgetconfigid  
 join mst_decode md on md.id =dbc.costallocationid  
 where programstartyear = @year  
 and budgetmonthid = @month  
 and md.Name = ''Lab''  
 and md.CodeID = 202  
 and obc.DeleteFlag =0  
 and dbc.DeleteFlag =0  
  
 RETURN isnull(@return,0.00)  
  
END
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetBudgetOverhead]    Script Date: 6/6/2018 4:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetBudgetOverhead]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[fn_GetBudgetOverhead] 
(
	@year int
	,@month int
)
RETURNS decimal(18,2)
AS
BEGIN
	
	declare @return decimal(18,2)

	select @return = sum(budgetamt)
	from ord_budgetconfig obc 
	join dtl_budgetconfig dbc on obc.budgetConfigId = dbc.budgetconfigid
	join mst_decode md on md.id =dbc.costallocationid
	where startyear = @year
	and budgetmonthid = @month
	and md.Name = ''overhead''
	and md.CodeID = 201
	and obc.DeleteFlag =0
	and dbc.DeleteFlag =0

	RETURN isnull(@return,0.00)

END
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetBudgetSalary]    Script Date: 6/6/2018 4:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetBudgetSalary]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[fn_GetBudgetSalary] 
(
	@year int
	,@month int
)
RETURNS decimal(18,2)
AS
BEGIN
	
	declare @return decimal(18,2)

	select @return = sum(budgetamt)
	from ord_budgetconfig obc 
	join dtl_budgetconfig dbc on obc.budgetConfigId = dbc.budgetconfigid
	join mst_decode md on md.id =dbc.costallocationid
	where startyear = @year
	and budgetmonthid = @month
	and md.Name IN(''salary'')
	and md.CodeID = 201
	and obc.DeleteFlag =0
	and dbc.DeleteFlag =0

	RETURN isnull(@return,0.00)

END
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetCareEndedDate]    Script Date: 6/6/2018 4:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetCareEndedDate]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'create function [dbo].[fn_GetCareEndedDate]
(
@Ptn_pk int
)
Returns datetime
as
Begin
declare @CareendedDate datetime;
select @CareendedDate=max(CareEndedDate) from dtl_PatientCareEnded where ptn_pk=@Ptn_pk and CareEndedDate is not null 
return @CareendedDate
END


' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetConsultationPerVisit_BillAmount_Futures]    Script Date: 6/6/2018 4:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetConsultationPerVisit_BillAmount_Futures]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE Function [dbo].[fn_GetConsultationPerVisit_BillAmount_Futures]  
(  
  @VisitDate datetime  
)  
Returns decimal(18,2)  
as  
Begin  
  
  declare @ConsultationFee decimal(18,2)  
  declare @RowCount int
  declare @Visits int 
  select @Visits=Visits from dbo.lnk_patientvisitspermonth where [year] = datepart(year,@VisitDate) and [month] = datepart(month,@VisitDate) 
  
 if(@Visits>0)
 Begin
  select @ConsultationFee = convert(decimal(18,2), dbo.fn_GetBudgetSalary(datepart(year,@VisitDate),datepart(month,@VisitDate))/visits)   
  from dbo.lnk_patientvisitspermonth where [year] = datepart(year,@VisitDate) and [month] = datepart(month,@VisitDate)  
    
  select @RowCount = count(donorid) from dbo.lnk_donorprogram where @VisitDate>=fundingstartdate and @VisitDate<= fundingenddate   
  if(@RowCount>0)  
    begin  
        Return 0.00  
    end     
  else  
    begin  
        Return isnull(@ConsultationFee,0.00)  
    end 
  End 

  Return 0.00  
  
End
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetConsultationPerVisit_Futures]    Script Date: 6/6/2018 4:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetConsultationPerVisit_Futures]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE Function [dbo].[fn_GetConsultationPerVisit_Futures]  
(  
  @VisitDate datetime  
)  
Returns decimal(18,2)  
as  
Begin  
  
  declare @ConsultationFee decimal(18,2)
  declare @Visits int 
  select @Visits=Visits from dbo.lnk_patientvisitspermonth where [year] = datepart(year,@VisitDate) and [month] = datepart(month,@VisitDate) 
  
 if(@Visits>0)
 Begin   
  select @ConsultationFee = convert(decimal(18,2), dbo.fn_GetBudgetSalary(datepart(year,@VisitDate),datepart(month,@VisitDate))/visits)   
  from lnk_patientvisitspermonth where [year] = datepart(year,@VisitDate) and [month] = datepart(month,@VisitDate)  
 End 
  Return isnull(@ConsultationFee,0.00)  
  
End
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetCountDrugTypeId_futures]    Script Date: 6/6/2018 4:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetCountDrugTypeId_futures]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'create function [dbo].[fn_GetCountDrugTypeId_futures]  
(  
   @Drug_Pk int  
)  
returns int  
as  
begin  
    declare @DrugType int   
    select @DrugType=Count(a.drugtypeid) from mst_drugtype a inner join lnk_drugtypegeneric b on a.drugtypeid = b.drugtypeid  
    inner join mst_generic c on c.genericid = b.genericid  
    inner join lnk_druggeneric d on d.genericid = c.genericid   
    where d.drug_pk = @Drug_Pk  
  
    return @DrugType  
end
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetCTXadherence]    Script Date: 6/6/2018 4:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetCTXadherence]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'create FUNCTION [dbo].[fn_GetCTXadherence]
(
   @Id int
)
RETURNS varchar(200)
AS
BEGIN
	declare @Name varchar(200)
	select @Name=name from mst_adherence where id=@id
	return @Name
END



' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetDataType]    Script Date: 6/6/2018 4:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetDataType]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE function [dbo].[fn_GetDataType]      
(      
@ColumnName varchar(500),      
@TableName varchar(500)      
)      
returns varchar(20)      
as      
begin      
 declare @DataTypeReturn varchar(50)      
 declare @dtype varchar(10)      
    declare @xscalr int      
    declare @xprec int    
    declare @length int      
          
    select @dtype=b.name,@xprec=a.xprec,@length=a.length,@xscalr=a.xscale from syscolumns a,systypes b,sysobjects c      
 where a.xtype = b.xtype and c.id = a.id       
 and a.name = @ColumnName and c.name=@TableName      
 if @dtype=''decimal''      
  begin      
   set @DataTypeReturn=convert(varchar,@dtype)+''(''+Convert(varchar,@xprec)+'',''+Convert(varchar,@xscalr)+'')''      
  end    
  else if @dtype=''varchar''    
 begin    
  set @DataTypeReturn=convert(varchar,@dtype)+''(''+Convert(varchar,@length)+'')''      
 end      
   else      
  begin      
   set @DataTypeReturn=''varchar(100)''      
  end       
 return @DataTypeReturn      
end
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetDevelopmentalScreening]    Script Date: 6/6/2018 4:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetDevelopmentalScreening]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'create FUNCTION [dbo].[fn_GetDevelopmentalScreening]
(
   @Id int
)
RETURNS varchar(200)
AS
BEGIN
	declare @Name varchar(200)
	select @Name=name from mst_decode where codeid=(select codeid from mst_code where name=''Developmental Screening'') and id=@Id
    return @Name
END



' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetDrugGenericCommaSeprated]    Script Date: 6/6/2018 4:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetDrugGenericCommaSeprated]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[fn_GetDrugGenericCommaSeprated]  
(  
   @DrugId int  
)  
RETURNS Varchar(2000)  
AS  
BEGIN  
   declare @GenName varchar(500)  
   declare @GenAbb Varchar(100)  
   declare @ReturnAbb Varchar(2000)  
   set @ReturnAbb = ''''  
   declare GenericAbb Cursor   
   for  
   select a.genericname,a.genericabbrevation from mst_generic a,lnk_druggeneric b  
   where a.genericid = b.genericid and b.drug_pk = @DrugId  
     
   open GenericAbb  
   fetch next from GenericAbb into @GenName,@GenAbb  
   while @@fetch_status =0  
   begin  
       if @ReturnAbb = ''''  
          set @ReturnAbb = @GenName  
       else      
          set @ReturnAbb = @ReturnAbb +'', ''+@GenName  
       fetch next from GenericAbb into @GenName,@GenAbb  
   end  
   close GenericAbb  
   deallocate GenericAbb  
  
   Return @ReturnAbb    
END
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetDrugTypeId_futures]    Script Date: 6/6/2018 4:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetDrugTypeId_futures]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE function [dbo].[fn_GetDrugTypeId_futures]  
(  
   @Drug_Pk int  
)  
returns int  
as  
begin  
    declare @DrugType int   
    select top 1 @DrugType = a.drugtypeid from mst_drugtype a inner join lnk_drugtypegeneric b on a.drugtypeid = b.drugtypeid  
    inner join mst_generic c on c.genericid = b.genericid  
    inner join lnk_druggeneric d on d.genericid = c.genericid   
    where d.drug_pk = @Drug_Pk  
  
    return @DrugType  
end
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetDrugTypeName_futures]    Script Date: 6/6/2018 4:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetDrugTypeName_futures]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE function [dbo].[fn_GetDrugTypeName_futures]    
(    
   @Drug_Pk int    
)    
returns varchar(200)    
as    
begin    
    declare @DrugTypeName varchar(200)     
    select top 1 @DrugTypeName = a.DrugTypeName from mst_drugtype a inner join lnk_drugtypegeneric b on a.drugtypeid = b.drugtypeid    
    inner join mst_generic c on c.genericid = b.genericid    
    inner join lnk_druggeneric d on d.genericid = c.genericid     
    where d.drug_pk = @Drug_Pk    
    
    return @DrugTypeName    
end
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetEmployeeName]    Script Date: 6/6/2018 4:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetEmployeeName]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'create FUNCTION [dbo].[fn_GetEmployeeName]
(
   @EmployeeId int
)
RETURNS varchar(200)
AS
BEGIN
	declare @Name varchar(200)
    select @Name = FirstName+'' ''+lastName from dbo.mst_Employee where EmployeeID = @EmployeeId
    return @Name
END



' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetEnrollmentDate]    Script Date: 6/6/2018 4:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetEnrollmentDate]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'create function [dbo].[fn_GetEnrollmentDate]
(
@Ptn_pk int,
@ModuleID int
)
Returns datetime
as
Begin
declare @EnrollmentDate datetime;
select @EnrollmentDate=StartDate from lnk_PatientProgramStart where ptn_pk=@Ptn_pk and moduleID=@ModuleID
return @EnrollmentDate
END
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetFeatureName]    Script Date: 6/6/2018 4:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetFeatureName]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'Create FUNCTION [dbo].[fn_GetFeatureName]
(
   @FeatureId int
)
RETURNS varchar(200)
AS
BEGIN
	declare @FeatureName varchar(200)
    select @FeatureName = FeatureName from dbo.Mst_Feature where FeatureId = @FeatureId
    return @FeatureName
END
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_getFieldsBusinessRule]    Script Date: 6/6/2018 4:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_getFieldsBusinessRule]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE function [dbo].[fn_getFieldsBusinessRule]  
   (  
    @fieldid int,
    @predefine int  
   )  
   returns varchar(max)  
   begin  
 DECLARE @listStr VARCHAR(MAX)  
 SELECT @listStr = COALESCE(@listStr+'','','''') + Convert(varchar,BusRuleID)  
 FROM lnk_fieldsBusinessRule where fieldid=@fieldid and predefined=@predefine  
 return @listStr  
   end
' 
END
GO

/****** Object:  UserDefinedFunction [dbo].[fn_GetFirstDayOfNextMonth]    Script Date: 6/6/2018 4:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetFirstDayOfNextMonth]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[fn_GetFirstDayOfNextMonth] ( @pInputDate    DATETIME )  
RETURNS DATETIME  
BEGIN  
  
    DECLARE @vOutputDate        DATETIME  
  
    SET @vOutputDate = CAST(YEAR(@pInputDate) AS VARCHAR(4)) + ''/'' +   
                       CAST(MONTH(@pInputDate) AS VARCHAR(2)) + ''/01''  
    SET @vOutputDate = DATEADD(DD, 0, DATEADD(M, 1, @vOutputDate))  
  
    RETURN @vOutputDate  
  
END
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetFixedDoseDrugAbbrevation]    Script Date: 6/6/2018 4:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetFixedDoseDrugAbbrevation]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[fn_GetFixedDoseDrugAbbrevation]
(
   @DrugId int
)
RETURNS Varchar(100)
AS
BEGIN
   declare @GenName varchar(500)
   declare @GenAbb Varchar(100)
   declare @ReturnAbb Varchar(200)
   set @ReturnAbb = ''''
   declare GenericAbb Cursor 
   for
   select a.genericname,a.genericabbrevation from mst_generic a,lnk_druggeneric b
   where a.genericid = b.genericid and b.drug_pk = @DrugId
   
   open GenericAbb
   fetch next from GenericAbb into @GenName,@GenAbb
   while @@fetch_status =0
   begin
       if @ReturnAbb = ''''
          set @ReturnAbb = @GenAbb
       else    
          set @ReturnAbb = @ReturnAbb +''/''+@GenAbb
       fetch next from GenericAbb into @GenName,@GenAbb
   end
   close GenericAbb
   deallocate GenericAbb

   Return @ReturnAbb  
END
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetHivCareStatus]    Script Date: 6/6/2018 4:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetHivCareStatus]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE function [dbo].[fn_GetHivCareStatus]
(
	@ptn_pk int
	
)
returns varchar(50)
as
Begin
DECLARE @HivCareStatus Varchar(50)
declare @HivCareEnded varchar(50)
select top 1 @HivCareEnded=a.status from mst_patient a where a.ptn_pk = @ptn_pk 
if @HivCareEnded=1
	Begin
		set @HivCareStatus=''Care Ended''
		
	end
else
	begin
		select top 1 @HivCareStatus=case when dateadd(dd,Duration,Dateadd(dd,90,DispensedbyDate))>=getdate() then ''On ART'' else ''In HIV Care'' end from                                 
		(select a.Dispensedbydate,max(b.duration) [Duration], a.createdate from ord_patientpharmacyorder a,               
		dtl_patientpharmacyorder b, lnk_drugtypegeneric c                                
		where a.ptn_pharmacy_pk = b.ptn_pharmacy_pk and (a.DeleteFlag is null or a.DeleteFlag=0) and                                
		b.genericid = c.genericid and c.drugtypeid = 37 and a.progid = 222 and                            
		a.ptn_pk=@ptn_pk group by a.ptn_pk,a.Dispensedbydate,a.createdate                                
		union                                
		select a.Dispensedbydate,max(b.duration) [Duration], a.createdate from ord_patientpharmacyorder a,               
		dtl_patientpharmacyorder b, lnk_drugtypegeneric c,lnk_druggeneric d                                
		where a.ptn_pharmacy_pk = b.ptn_pharmacy_pk and (a.DeleteFlag is null or a.DeleteFlag=0) and a.progid = 222 and                            
		b.drug_pk = d.drug_pk and d.genericid = c.genericid and c.drugtypeid = 37 and                                 
		a.ptn_pk=@ptn_pk group by a.ptn_pk,a.Dispensedbydate, a.createdate) z                             
		where getdate() <= dateadd(dd,z.Duration,Dateadd(dd,90,z.DispensedbyDate)) and                            
			  z.dispensedbydate in (select max(dispensedbydate) from ord_patientpharmacyorder               
		   where ord_patientpharmacyorder.ptn_pk=@ptn_pk and (ord_patientpharmacyorder.DeleteFlag=0 or ord_patientpharmacyorder.DeleteFlag IS NULL)                         
		and progid = 222)                               
		order by z.dispensedbydate desc

		
	end
		return @HivCareStatus
End
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetHIVCareStatus_Constella]    Script Date: 6/6/2018 4:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetHIVCareStatus_Constella]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE function [dbo].[fn_GetHIVCareStatus_Constella]    
(    
 @Ptn_Pk int    
)    
returns varchar(50)    
as    
BEGIN    
 declare @CareStatusID int  
 declare @CareStatusDesc varchar(50)      
    
 set @CareStatusID=(select HivCareStatus from dtl_FamilyInfo where ReferenceId=@Ptn_Pk and (DeleteFlag=0 or DeleteFlag is null)) -- patient not registered    
 if @CareStatusID is null  -- patient IS registered  
 begin --A    
  set @CareStatusID=(select PatientExitReason from dtl_PatientCareended where Ptn_Pk=@Ptn_Pk and PatientExitReason=93 )    
     
  if @CareStatusID=93    
   set @CareStatusID=4 -- Died=4    
  else    
  begin    
   --set @CareStatus=(select status from mst_Patient where Ptn_Pk=@Ptn_Pk)    
   set @CareStatusID=(select CareEnded from dtl_PatientCareended where Ptn_Pk=@Ptn_Pk)    
   if  @CareStatusID=1    
    set @CareStatusID=3 -- careended / Not in HIV Care -3    
   else    
   begin    
    if exists(select RegimenType from dtl_RegimenMap where Ptn_Pk=@Ptn_Pk and (DeleteFlag=0 or DeleteFlag is null))    
    begin    
     if exists(select ARTended from dtl_PatientCareEnded where Ptn_Pk=@Ptn_Pk and ARTended=1)    
      set @CareStatusID=1  -- non-ART / inHIV/Care =1     
     else    
      set @CareStatusID=2  --- on ART=2    
    end    
    else    
    begin    
     set @CareStatusID=1  --- non-ART / inHIV/Care =1    
    end    
   end    
  end    
 end    
 set @CareStatusDesc=(select Name from mst_HIVCareStatus where ID=@CareStatusID)  
 return @CareStatusDesc    
END
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetHivCareStatusDesc]    Script Date: 6/6/2018 4:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetHivCareStatusDesc]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE function [dbo].[fn_GetHivCareStatusDesc]  
(  
 @ptn_pk int,  
 @ReferenceId int=null,  
 @Id int  
   
)  
returns varchar(20)  
as  
Begin  
DECLARE @HivCareStatusdesc varchar(20)  
declare @HivCareStatus int  
  
if exists(select * from dtl_familyinfo where Ptn_pk=@ptn_pk and id=@Id and ReferenceId=@ReferenceId and (DeleteFlag is null or DeleteFlag=0))  
 Begin  
----   if Not exists (select * from dtl_patientcareended where (PatientExitReason=93 or PatientExitReason=118) and ptn_pk=@ReferenceId)  
----    begin    
----     select top 1 @HivCareStatusdesc=case when dateadd(dd,Duration,Dateadd(dd,90,DispensedbyDate))>=getdate() then ''On ART'' else ''In HIV/Care'' end from                                   
----     (select a.Dispensedbydate,max(b.duration) [Duration], a.createdate from ord_patientpharmacyorder a,                 
----     dtl_patientpharmacyorder b, lnk_drugtypegeneric c                                  
----     where a.ptn_pharmacy_pk = b.ptn_pharmacy_pk and (a.DeleteFlag is null or a.DeleteFlag=0) and                                  
----     b.genericid = c.genericid and c.drugtypeid = 37 and a.progid = 222 and                              
----     a.ptn_pk=@ReferenceId group by a.ptn_pk,a.Dispensedbydate,a.createdate                                  
----     union                                  
----     select a.Dispensedbydate,max(b.duration) [Duration], a.createdate from ord_patientpharmacyorder a,                 
----     dtl_patientpharmacyorder b, lnk_drugtypegeneric c,lnk_druggeneric d                                  
----     where a.ptn_pharmacy_pk = b.ptn_pharmacy_pk and (a.DeleteFlag is null or a.DeleteFlag=0) and a.progid = 222 and                              
----     b.drug_pk = d.drug_pk and d.genericid = c.genericid and c.drugtypeid = 37 and                                   
----     a.ptn_pk=@ReferenceId group by a.ptn_pk,a.Dispensedbydate, a.createdate) z                               
----     where getdate() <= dateadd(dd,z.Duration,Dateadd(dd,90,z.DispensedbyDate)) and                              
----        z.dispensedbydate in (select max(dispensedbydate) from ord_patientpharmacyorder                 
----        where ord_patientpharmacyorder.ptn_pk=@ReferenceId and (ord_patientpharmacyorder.DeleteFlag=0 or ord_patientpharmacyorder.DeleteFlag IS NULL)                           
----     and progid = 222)                                 
----     order by z.dispensedbydate desc  
----    end  
----       if (@HivCareStatusdesc IS NULL)  
----    begin  
----     if exists (select * from dtl_patientcareended c inner join mst_patient m on c.ptn_pk=m.ptn_pk and m.Status=1 where (c.PatientExitReason=93 or c.PatientExitReason=118) and c.ptn_pk=@ReferenceId)  
----      begin  
----      set @HivCareStatusdesc=''Died''  
----      end  
----     else  
----      begin  
----      set @HivCareStatusdesc=''In HIV Care''  
----      end  
----       
----    End  
----  
---- end  
----else  
---- begin  
----  select @HivCareStatus=HivCareStatus from dtl_familyinfo where Ptn_pk=@ptn_pk and id=@Id and (DeleteFlag is null or DeleteFlag=0)  
----  select @HivCareStatusdesc=Name from mst_HIVCareStatus  where  ID=@HivCareStatus 
	select @HivCareStatusdesc=dbo.fn_GetPatientProgramStatus_Constella(@ReferenceId) 
 end  
 return @HivCareStatusdesc  
end
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetHivCareStatusID]    Script Date: 6/6/2018 4:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetHivCareStatusID]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE function [dbo].[fn_GetHivCareStatusID]  
(  
 @ptn_pk int,  
 @ReferenceId int=null,  
 @Id int  
   
)  
returns int  
as  
Begin  
DECLARE @HivCareStatusdesc varchar(20)  
declare @HivCareStatus int  
if exists(select * from dtl_familyinfo where Ptn_pk=@ptn_pk and id=@Id and ReferenceId=@ReferenceId and (DeleteFlag is null or DeleteFlag=0))  
Begin  
   if Not exists (select * from dtl_patientcareended where (PatientExitReason=93 or PatientExitReason=118) and ptn_pk=@ReferenceId)  
   begin  
     select top 1 @HivCareStatusdesc=case when dateadd(dd,Duration,Dateadd(dd,90,DispensedbyDate))>=getdate() then ''On ART'' else ''In HIV/Care'' end from                                   
     (select a.Dispensedbydate,max(b.duration) [Duration], a.createdate from ord_patientpharmacyorder a,                 
     dtl_patientpharmacyorder b, lnk_drugtypegeneric c                                  
     where a.ptn_pharmacy_pk = b.ptn_pharmacy_pk and (a.DeleteFlag is null or a.DeleteFlag=0) and                                  
     b.genericid = c.genericid and c.drugtypeid = 37 and a.progid = 222 and                              
     a.ptn_pk=@ReferenceId group by a.ptn_pk,a.Dispensedbydate,a.createdate                                  
     union                                  
     select a.Dispensedbydate,max(b.duration) [Duration], a.createdate from ord_patientpharmacyorder a,                 
     dtl_patientpharmacyorder b, lnk_drugtypegeneric c,lnk_druggeneric d                                  
     where a.ptn_pharmacy_pk = b.ptn_pharmacy_pk and (a.DeleteFlag is null or a.DeleteFlag=0) and a.progid = 222 and                              
     b.drug_pk = d.drug_pk and d.genericid = c.genericid and c.drugtypeid = 37 and                                   
     a.ptn_pk=@ReferenceId group by a.ptn_pk,a.Dispensedbydate, a.createdate) z                               
     where getdate() <= dateadd(dd,z.Duration,Dateadd(dd,90,z.DispensedbyDate)) and                              
        z.dispensedbydate in (select max(dispensedbydate) from ord_patientpharmacyorder                 
        where ord_patientpharmacyorder.ptn_pk=@ReferenceId and (ord_patientpharmacyorder.DeleteFlag=0 or ord_patientpharmacyorder.DeleteFlag IS NULL)                           
     and progid = 222)                                 
     order by z.dispensedbydate desc  
   end   
       if (@HivCareStatusdesc IS NULL)  
    begin  
     if exists (select * from dtl_patientcareended where (PatientExitReason=93 or PatientExitReason=118) and ptn_pk=@ReferenceId)  
      begin  
      set @HivCareStatusdesc=''Died''  
      end  
     else  
      begin  
      set @HivCareStatusdesc=''In HIV Care''  
      end  
       
    End  
    select @HivCareStatus=ID from mst_HIVCareStatus where Name=@HivCareStatusdesc  
  
 end  
else  
 begin  
  select @HivCareStatus=HivCareStatus from dtl_familyinfo where Ptn_pk=@ptn_pk and id=@Id and (DeleteFlag is null or DeleteFlag=0)  
 end  
 return @HivCareStatus  
end  
    
  
--select * from mst_HIVCareStatus where Name=NULL  
--select dbo.fn_GetHivCareStatusID(33,35,358)  
--select dbo.fn_GetHivCareStatusDesc(33,35,358)  
--select * from dtl_familyinfo  
  
--select * from dtl_patientcareended where (PatientExitReason=93 or PatientExitReason=118) and ptn_pk=35  
--select * from dtl_patientcareended  where ptn_pk=35  
--delete dtl_patientcareended where CareEndedID=25  
--select * from dtl_familyinfo where Ptn_pk=33 and id=358 and ReferenceId=35 and (DeleteFlag is null or DeleteFlag=0)
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetHivStatus]    Script Date: 6/6/2018 4:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetHivStatus]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE function [dbo].[fn_GetHivStatus]
(
	@ptn_pk int,
	@ReferenceId int=null,
	@Id int
	
)
returns int
as
Begin
DECLARE @HivStatus int

--select @HivStatus=HivStatus from dtl_familyinfo where Ptn_pk=@Ptn_pk and (DeleteFlag is null or DeleteFlag=0)

if(@ReferenceId!=null or @ReferenceId!=0 or @ReferenceId!='''')
	Begin
			select @HivStatus=HivStatus from dtl_PatientHivOther where Ptn_pk=@ReferenceId
			if(@HivStatus=0 or @HivStatus is null)
			begin
				set @HivStatus=39
			end
	end
else
	begin
		select @HivStatus=HivStatus from dtl_familyinfo where Ptn_pk=@ptn_pk and id=@Id and (DeleteFlag is null or DeleteFlag=0)
	end
	return @HivStatus
end


--select * from dtl_familyinfo where ptn_pk=2575

--select * from dtl_PatientHivOther where Ptn_pk=2551
--select * from mst_code
--select * from mst_decode where codeid=10

--select dbo.fn_GetHivStatus(14,909,363)
--DECLARE @HivStatus int
--select @HivStatus=HivStatus from dtl_PatientHivOther where Ptn_pk=909
--select @HivStatus
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetHIVStatus_Constella]    Script Date: 6/6/2018 4:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetHIVStatus_Constella]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE function [dbo].[fn_GetHIVStatus_Constella]      
(      
 @ptn_pk int,  
 @ReferenceId int=null,  
 @Id int       
)      
returns varchar(50)      
as      
BEGIN --A      
-- declare @HIVStatusID int    
-- declare @HIVStatusDesc varchar(50)    
-- set @HIVStatusID=(select HIVStatus from dtl_FamilyInfo where ReferenceId=@Ptn_Pk and (deleteflag=0 or deleteFlag is null))      
-- if(@HIVStatusID is null)--Patient is Registered      
-- Begin --B      
--  set @HIVStatusID=(select HIVStatus from dtl_PatientHIVOther where Ptn_Pk=@Ptn_Pk)      
-- End   --B      
-- set @HIVStatusDesc=(select Name from mst_Decode where ID=@HIVStatusID)    
-- return @HIVStatusDesc    

declare @HIVStatusID int
declare @HIVStatusDesc varchar(50)

if(@ReferenceId!=null or @ReferenceId!=0 or @ReferenceId!='''')  
 Begin  
   set @HIVStatusID =(select HivStatus from dtl_PatientHivOther where Ptn_pk=@ReferenceId)  
   if(@HIVStatusID=0 or @HIVStatusID is null)  
   begin  
    set @HIVStatusID=39  
   end  
 end  
else  
 begin  
  set @HIVStatusID=(select HivStatus from dtl_familyinfo where Ptn_pk=@ptn_pk and id=@Id and (DeleteFlag is null or DeleteFlag=0))  
 end
 set @HIVStatusDesc=(select Name from mst_Decode where ID=@HIVStatusID)  
 return @HIVStatusDesc  

END   --A
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetHivStatusDesc]    Script Date: 6/6/2018 4:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetHivStatusDesc]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE function [dbo].[fn_GetHivStatusDesc]
(
	@ptn_pk int,
	@ReferenceId int=null,
	@Id int
	
)
returns varchar(20)
as
Begin
DECLARE @HivStatusdesc varchar(20)
declare @HivStatus int
--select @HivStatus=HivStatus from dtl_familyinfo where Ptn_pk=@Ptn_pk and (DeleteFlag is null or DeleteFlag=0)

if(@ReferenceId!=null or @ReferenceId!=0 or @ReferenceId!='''')
	Begin
			select @HivStatus=HivStatus from dtl_PatientHivOther where Ptn_pk=@ReferenceId
			if(@HivStatus=0 or @HivStatus is null )
			begin
				set @HivStatus=39
			end
			select @HivStatusdesc=Name from mst_decode where codeid=10 and ID=@HivStatus
	end
else
	begin
		select @HivStatus=HivStatus from dtl_familyinfo where Ptn_pk=@ptn_pk and id=@Id and (DeleteFlag is null or DeleteFlag=0)
		select @HivStatusdesc=Name from mst_decode where codeid=10 and ID=@HivStatus
	end
	return @HivStatusdesc
end


--select * from dtl_familyinfo where ptn_pk=2575

--select * from dtl_PatientHivOther where Ptn_pk=2551
--select * from mst_code
--select * from mst_decode where codeid=10
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetIdentifiers_Futures]    Script Date: 6/6/2018 4:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetIdentifiers_Futures]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[fn_GetIdentifiers_Futures]    
(     
 @ModuleId int    
)    
Returns varchar(Max)        
as        
BEGIN      
    
Declare @Identifier varchar(Max)       
    -- set @Module = ''''     
Select @Identifier=COALESCE (@Identifier+'','','''')+FieldName     
From lnk_patientmoduleidentifier a,mst_PatientIdentifier b     
Where a.ModuleId=@ModuleId and a.FieldId=b.ID and a.DeleteFlag=0    
    
return @Identifier    
     
END
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetImmunisation]    Script Date: 6/6/2018 4:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetImmunisation]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'create FUNCTION [dbo].[fn_GetImmunisation]
(
@ID Int
)
RETURNS varchar(200)
AS
BEGIN
	declare @Name varchar(max)
	select @Name=NAME from mst_ModDeCode where CodeID=507 and id=@ID
	return @Name

END


' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_getImportDataTable]    Script Date: 6/6/2018 4:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_getImportDataTable]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE FUNCTION [dbo].[fn_getImportDataTable](@param1 varchar(100),@param2 varchar(100),@param3 varchar(100),@param4 varchar(100))
 RETURNS @tblsNames  table (
    tblname varchar(500) )
 AS 
 BEGIN 
 INSERT @tblsNames
Select name as tblname from sysobjects where name  like ''dtl%'' and name not like @param1  
and name not like @param2 and name not like @param3 and name not like @param4 
and type = ''u'' 
 return
 END


' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetIQCareNumber_Constella]    Script Date: 6/6/2018 4:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetIQCareNumber_Constella]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE function [dbo].[fn_GetIQCareNumber_Constella]  
(  
   @Ptn_Pk int  
)  
RETURNS varchar(15)  
as  
begin  
  declare @IQCareNumber varchar(15)  
  select @IQCareNumber = ''IQ''+ replicate(''0'',10-len(ptn_pk))+convert(varchar,ptn_pk)   
  from mst_patient where ptn_pk = @ptn_pk  
    
  return @IQCareNumber   
end
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetItemBatchStock_ItemId]    Script Date: 6/6/2018 4:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetItemBatchStock_ItemId]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE function [dbo].[fn_GetItemBatchStock_ItemId]  
(  
  @ItemId int,  
  @BatchId int
)  
returns int  
as  
Begin  
  declare @Qty int  
  select @Qty = sum(Quantity) from dtl_stocktransaction where itemid =  @ItemId and
  BatchId=@BatchId and expirydate >=getdate() 
  return @Qty  
End




' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetItemOpeningStock]    Script Date: 6/6/2018 4:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetItemOpeningStock]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE  Function [dbo].[fn_GetItemOpeningStock]    
(    
  @ItemId int,    
  @StoreId int,    
  @OpeningDate datetime     
)    
returns int    
as    
begin    
  declare @OpQty1 int   
  select @OpQty1 = isnull(sum(Quantity),0) from dtl_StockTransaction where ItemId = @ItemId and StoreId = @StoreId    
  and TransactionDate < @OpeningDate and ExpiryDate >= getdate()     
  
  return @OpQty1  
end
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetItemOpeningStockwithopeningflag]    Script Date: 6/6/2018 4:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetItemOpeningStockwithopeningflag]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'Create  Function [dbo].[fn_GetItemOpeningStockwithopeningflag]      
(      
  @ItemId int,      
  @StoreId int,      
  @OpeningDate datetime       
)      
returns int      
as      
begin      
  declare @OpQty1 int     
  select @OpQty1 = isnull(sum(Quantity),0) from dtl_StockTransaction where ItemId = @ItemId and StoreId = @StoreId      
  and TransactionDate < @OpeningDate and ExpiryDate >= getdate() and openingstock=1       
    
  return @OpQty1    
end



' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetItemOpeningStockwithoutAdjustmentStock]    Script Date: 6/6/2018 4:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetItemOpeningStockwithoutAdjustmentStock]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE  Function [dbo].[fn_GetItemOpeningStockwithoutAdjustmentStock]      
(      
  @ItemId int,      
  @StoreId int,      
  @OpeningDate datetime       
)      
returns int      
as      
begin      
  declare @OpQty1 int     
  select @OpQty1 = isnull(sum(Quantity),0) from dtl_StockTransaction where ItemId = @ItemId and StoreId = @StoreId      
  and TransactionDate < @OpeningDate and ExpiryDate >= getdate() and POID IS NOT NULL and GRNID IS NOT NULL 
  and DisposeId IS NOT NULL and Ptn_Pharmacy_pk IS NOT NULL and PtnPk IS NOT NULL      
    
  return @OpQty1    
end
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetItemStock_Futures]    Script Date: 6/6/2018 4:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetItemStock_Futures]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE function [dbo].[fn_GetItemStock_Futures]  
(  
  @ItemId int,  
  @BatchId int,  
  @ExpiryDate datetime,
  @StoreId int  
)  
returns int  
as  
Begin  
  declare @Qty int  
  select @Qty = sum(Quantity) from dtl_stocktransaction where itemid =  @ItemId and   
  --batchid = @BatchId and expirydate = @ExpiryDate and StoreId = @StoreId
  batchid = @BatchId and StoreId = @StoreId
  return @Qty  
End
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetLabPerVisit_BillAmount_Futures]    Script Date: 6/6/2018 4:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetLabPerVisit_BillAmount_Futures]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE Function [dbo].[fn_GetLabPerVisit_BillAmount_Futures]  
(  
  @SellingPrice decimal(18,2), 
  @ItemId int 
)  
Returns decimal(18,2)  
as  
Begin  
  
 
  declare @RowCount int
  
 select @RowCount=count(e.ItemId) from           
 dbo.Lnk_ProgramItem e Inner Join dbo.Lnk_DonorProgram f on f.ProgramId = e.ProgramId and           
 getdate()>=fundingstartdate and getdate()<= fundingenddate where e.ItemId=@ItemId
  
  if(@RowCount>0)  
    begin  
        Return 0.00  
    end     
  else  
    begin  
        Return isnull(@SellingPrice,0.00)  
    end 

  Return 0.00  
  
End
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetModSelectlistvalue]    Script Date: 6/6/2018 4:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetModSelectlistvalue]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- select dbo.fn_GetSelectlistvalue(1)  
CREATE function [dbo].[fn_GetModSelectlistvalue]          
(@CodeID AS int)          
returns varchar(1000)          
as          
begin          
          
declare @List varchar(1000)       
declare @count int      
select @count=count(*) from mst_Moddecode where codeid=@CodeID and (DeleteFlag is null or deleteflag=0)       
if @count=1      
begin      
select @List = Name from mst_Moddecode where codeid=@CodeID and (DeleteFlag is null or deleteflag=0)        
end      
else      
begin      
select @List = coalesce(@List + ''; '', '''') + Name from mst_Moddecode where codeid=@CodeID and (DeleteFlag is null or deleteflag=0)            
end         
return @List          
          
End
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetModSelectlistvalue_Decode]    Script Date: 6/6/2018 4:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetModSelectlistvalue_Decode]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE function [dbo].[fn_GetModSelectlistvalue_Decode]            
(@CodeID AS int)            
returns varchar(1000)            
as            
begin            
            
declare @List varchar(1000)            
select @List = coalesce(@List + ''; '', '''') + Name from mst_ModDecode where (deleteflag = 0 or deleteflag is null)  
and systemid <> 2 and codeid=@CodeID            
            
return @List            
            
End
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetOverHeadPerVisit_BillAmount_Futures]    Script Date: 6/6/2018 4:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetOverHeadPerVisit_BillAmount_Futures]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE Function [dbo].[fn_GetOverHeadPerVisit_BillAmount_Futures]    
(    
  @VisitDate datetime    
)    
Returns decimal(18,2)    
as    
Begin    
    
  declare @OverHeadFee decimal(18,2)    
  declare @RowCount int
  declare @Visits int 
  select @Visits=Visits from dbo.lnk_patientvisitspermonth where [year] = datepart(year,@VisitDate) and [month] = datepart(month,@VisitDate) 
  
 if(@Visits>0)
 Begin  
  select @OverHeadFee = convert(decimal(18,2), dbo.fn_GetBudgetOverhead(datepart(year,@VisitDate),datepart(month,@VisitDate))/visits)     
  from lnk_patientvisitspermonth where [year] = datepart(year,@VisitDate) and [month] = datepart(month,@VisitDate)    
    
  select @RowCount = count(donorid) from dbo.lnk_donorprogram where @VisitDate>=fundingstartdate and @VisitDate<= fundingenddate   
  if(@RowCount>0)  
    begin  
        Return 0.00  
    end     
  else  
    begin  
        Return isnull(@OverHeadFee,0.00)  
    end  
  End  
  Return 0.00    
End
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetOverHeadPerVisit_Futures]    Script Date: 6/6/2018 4:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetOverHeadPerVisit_Futures]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE Function [dbo].[fn_GetOverHeadPerVisit_Futures]    
(    
  @VisitDate datetime    
)    
Returns decimal(18,2)    
as    
Begin    
    
  declare @OverHeadFee decimal(18,2) 
  declare @Visits int 
  select @Visits=Visits from dbo.lnk_patientvisitspermonth where [year] = datepart(year,@VisitDate) and [month] = datepart(month,@VisitDate) 
  
 if(@Visits>0)
 Begin   
  select @OverHeadFee = convert(decimal(18,2), dbo.fn_GetBudgetOverhead(datepart(year,@VisitDate),datepart(month,@VisitDate))/visits)     
  from lnk_patientvisitspermonth where [year] = datepart(year,@VisitDate) and [month] = datepart(month,@VisitDate)    
 End   
  Return isnull(@OverHeadFee,0.00)    
    
End
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetParmTilteFormBuilder]    Script Date: 6/6/2018 4:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetParmTilteFormBuilder]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE  FUNCTION [dbo].[fn_GetParmTilteFormBuilder](@RID INT,@Message VARCHAR(8000))          
RETURNS VARCHAR(5000) AS          
BEGIN         
 RETURN        
 (        
  select ltrim(rtrim(ItemId)) from dbo.fnParseDelimitedList(@Message,'';'') WHERE RID = @RID        
 )        
END
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetPASDPTBstatus]    Script Date: 6/6/2018 4:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetPASDPTBstatus]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[fn_GetPASDPTBstatus]
(
   @Id int
)
RETURNS varchar(200)
AS
BEGIN
	declare @Name varchar(200)
	select @Name=name from mst_decode where id=@id and 
	codeid=(Select CodeID from mst_Code where Name=''TB Status'') and SystemId=3
	return @Name

END


' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetPatientAge]    Script Date: 6/6/2018 4:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetPatientAge]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE function [dbo].[fn_GetPatientAge]    
(    
   @Ptn_Pk int  
)    
returns varchar(10)    
as    
Begin    
  
   declare @DeathDate datetime
   declare @DOB datetime 
   declare @Age varchar(10)
   select @DeathDate = a.DeathDate from dtl_patientcareended a 
   inner join mst_patient b on a.ptn_pk = b.ptn_pk
   where b.status = 1 and a.careended = 1 and a.ptn_pk = @Ptn_Pk

   select @DOB = Dob from mst_patient where ptn_pk = @Ptn_Pk

   if (@DeathDate is not null or @DeathDate > ''1900-01-01'')
     begin
        select @Age = convert(varchar,round(cast(datediff(dd,@DOB,@DeathDate)/365.25 as decimal(5,2)),2))
     end  
   else
     begin
		select @Age = convert(varchar,round(cast(datediff(dd,@DOB,getdate())/365.25 as decimal(5,2)),2))
     end  
  return @Age   
End
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetPatientAgeInYearsMonth]    Script Date: 6/6/2018 4:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetPatientAgeInYearsMonth]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
CREATE function [dbo].[fn_GetPatientAgeInYearsMonth]    
(    
   @Ptn_Pk int  
)    
returns varchar(25)    
as    
Begin    
  
   declare @DeathDate datetime
   declare @DOB datetime 
   declare @Age decimal(5,2);--varchar(10)
   declare @ReturnValue varchar(25);
   select @DeathDate = a.DeathDate from dtl_patientcareended a 
   inner join mst_patient b on a.ptn_pk = b.ptn_pk
   where b.status = 1 and a.careended = 1 and a.ptn_pk = @Ptn_Pk

   select @DOB = Dob from mst_patient where ptn_pk = @Ptn_Pk

   if (@DeathDate is not null or @DeathDate > ''1900-01-01'')    begin
        select @Age = convert(decimal(5,2),round(cast(datediff(dd,@DOB,@DeathDate)/365.25 as decimal(5,2)),2))
     end  
   else     begin
		select @Age = convert(decimal(5,2),round(cast(datediff(dd,@DOB,getdate())/365.25 as decimal(5,2)),2))
     end  

	 declare @ageYears int;
	 Select @ageYears = floor(@Age);
	 declare @ageMonths int;
	 select @ageMonths = CEILING(@Age - @ageYears)*12

	 Select @ReturnValue = CONVERT(varchar,@age) + '' Yrs '' + CONVERT(varchar,@ageMonths) + '' Mths''

  return @ReturnValue
End

' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetPatientARTStartDate]    Script Date: 6/6/2018 4:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetPatientARTStartDate]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE function [dbo].[fn_GetPatientARTStartDate]          
(          
@Ptn_Pk as int          
)          
Returns datetime          
as          
          
begin          
declare @StartDate datetime;          
SELECT top 1 @StartDate = a.DispensedByDate FROM                          
ord_PatientPharmacyOrder a,                             
dtl_RegimenMap b where a.ptn_pk = b.Ptn_Pk and a.ptn_pharmacy_pk = b.orderid  and   
(a.DeleteFlag=0 or a.DeleteFlag is null)         
and (b.DeleteFlag=0 or b.DeleteFlag is null) and a.ptn_pk=@ptn_pk   
and a.dispensedbydate is not null and b.regimentype is not null and b.regimentype <> '''' and b.RegimenType  <> ''0''       
order by a.dispensedbydate asc                    
          
Return @StartDate         
end

' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetPatientARTStartDate_Constella]    Script Date: 6/6/2018 4:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetPatientARTStartDate_Constella]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
CREATE function [dbo].[fn_GetPatientARTStartDate_Constella]          
(          
@Ptn_Pk as int          
)          
Returns datetime          
as          
          
begin
          
declare @StartDate datetime;
Select Top 1 @StartDate = a.DispensedByDate
From	ord_PatientPharmacyOrder a,
		dtl_RegimenMap b
Where a.ptn_pk = b.Ptn_Pk
	And a.ptn_pharmacy_pk = b.orderid
	And (a.DeleteFlag = 0 Or a.DeleteFlag Is Null)
	And (b.DeleteFlag = 0 Or b.DeleteFlag Is Null)
	And a.ptn_pk = @ptn_pk
	And a.ProgId In (222,223)
	And a.dispensedbydate Is Not Null
	And b.regimentype Is Not Null
	And b.regimentype <> ''''
Order By a.dispensedbydate Asc

Return @StartDate
End
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetPatientArtStartRegimen_futures]    Script Date: 6/6/2018 4:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetPatientArtStartRegimen_futures]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'Create function [dbo].[fn_GetPatientArtStartRegimen_futures]              
(              
@dispensedate as datetime,
@Ptn_pk as int              
)              
Returns varchar(50)              
as              
              
begin              
declare @RegimenLine varchar(50);              
SELECT @RegimenLine = c.Regimentype FROM                              
ord_PatientPharmacyOrder a,                                 
mst_RegimenLine b,dtl_regimenmap c where a.ptn_pharmacy_pk = c.OrderId 
and a.dispensedbydate=@dispensedate and a.ptn_pk=@ptn_pk and b.ID=a.RegimenLine            
              
Return @RegimenLine             
end
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetPatientARTStatus_Futures]    Script Date: 6/6/2018 4:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetPatientARTStatus_Futures]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE function [dbo].[fn_GetPatientARTStatus_Futures]        
(        
   @Ptn_Pk int        
)        
returns varchar(50)        
as        
Begin        
  declare @PatStatus varchar(50)       
  declare @ARVCount int    
  declare @ARVStop int    
  declare @ARVRestart int    
  declare @ARVStopDate datetime    
  declare @ARVRestartDate datetime    
    
  set @PatStatus = ''''     
  --------------- ART Start--------------    
  select @ARVCount = count(ptn_pk) from mst_patient where (deleteflag = 0 or deleteflag is null)    
  and (artstartdate <> ''1900-01-01'' or artstartdate is not null) and ptn_pk = @Ptn_Pk         
  --------------- ART End--------------    
  Select @ARVStop=count(ptn_pk),@ARVStopDate=max(artenddate) from dtl_patientcareended where ptn_pk = @Ptn_Pk
  and artended = 1    
  --------------- ART Restart--------------    
  Select @ARVRestart=count(ptn_pk),@ARVRestartDate=max(Restartdate) from dtl_patientartrestart     
  where (deleteflag = 0 or deleteflag is null) and ptn_pk = @Ptn_Pk  
    
  -------------------------------------------------------    
  if(@ARVCount > 0 and @ARVStop=0)    
     begin    
        set @PatStatus = ''ART''    
     end    
  else if(@ARVCount>0 and @ARVStop>0 and @ARVRestart > 0)    
     begin    
  if(@ARVStopDate <= @ARVRestartDate)    
            set @PatStatus = ''ART''    
        else    
            set @PatStatus = ''ART Stopped''    
     end    
  else if(@ARVCount>0 and @ARVStop>0 and @ARVRestart=0)    
     begin    
        set @PatStatus = ''ART Stopped''    
     end       
  else if(@ARVCount = 0)    
     begin    
        set @PatStatus = ''Non ART''    
     end    
  else    
       set @PatStatus = ''''    
      
  return @PatStatus          
        
End
' 
END
GO

/****** Object:  UserDefinedFunction [dbo].[fn_GetPatientARTStatusOnDate_Futures]    Script Date: 6/6/2018 4:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetPatientARTStatusOnDate_Futures]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'Create function [dbo].[fn_GetPatientARTStatusOnDate_Futures]      
(      
   @Ptn_Pk int,
   @LastDate datetime      
)      
returns varchar(50)      
as      
Begin      
  declare @PatStatus varchar(50)     
  declare @ARVCount int  
  declare @ARVStop int  
  declare @ARVRestart int  
  declare @ARVStopDate datetime  
  declare @ARVRestartDate datetime  
  
  set @PatStatus = ''''   
  --------------- ART Start--------------  
  select @ARVCount = count(ptn_pk) from mst_patient where (deleteflag = 0 or deleteflag is null)  
  and (artstartdate <> ''1900-01-01'' or artstartdate is not null) and artstartdate <= @LastDate and ptn_pk = @Ptn_Pk       
  --------------- ART End--------------  
  Select @ARVStop=count(ptn_pk),@ARVStopDate=max(artenddate) from dtl_patientcareended 
  where artenddate <=@LastDate and ptn_pk = @Ptn_Pk  
  --------------- ART Restart--------------  
  Select @ARVRestart=count(ptn_pk),@ARVRestartDate=max(Restartdate) from dtl_patientartrestart   
  where (deleteflag = 0 or deleteflag is null) and RestartDate <=@LastDate and ptn_pk = @Ptn_Pk
  
  -------------------------------------------------------  
  if(@ARVCount > 0 and @ARVStop=0)  
     begin  
        set @PatStatus = ''ART''  
     end  
  else if(@ARVCount>0 and @ARVStop>0 and @ARVRestart > 0)  
     begin  
  if(@ARVStopDate <= @ARVRestartDate)  
            set @PatStatus = ''ART''  
        else  
            set @PatStatus = ''ART Stopped''  
     end  
  else if(@ARVCount>0 and @ARVStop>0 and @ARVRestart=0)  
     begin  
        set @PatStatus = ''ART Stopped''  
     end     
  else if(@ARVCount = 0)  
     begin  
        set @PatStatus = ''Non ART''  
     end  
  else  
       set @PatStatus = ''''  
    
  return @PatStatus        
      
End
' 
END
GO

/****** Object:  UserDefinedFunction [dbo].[fn_GetPatientClinicNumber]    Script Date: 6/6/2018 4:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetPatientClinicNumber]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'Create function [dbo].[fn_GetPatientClinicNumber]
(
	@ptn_pk int,
	@ReferenceId int=null,
	@Id int
	
)
returns varchar(20)
as
Begin
DECLARE @ClinicNumber varchar(20)


if exists(select * from dtl_familyinfo where Ptn_pk=@ptn_pk and id=@Id and ReferenceId=@ReferenceId and (DeleteFlag is null or DeleteFlag=0))
	Begin
		select @ClinicNumber=PatientClinicID from mst_patient where ptn_pk=@ReferenceId and (DeleteFlag is null or DeleteFlag=0)
	end
else
	begin
		select @ClinicNumber=FileNo from dtl_familyinfo where Ptn_pk=@ptn_pk and id=@Id and (DeleteFlag is null or DeleteFlag=0)
		
	end
	return @ClinicNumber
end



--select * from  dtl_familyinfo
--select * from mst_patient

--select dbo.fn_GetHivCareStatusDesc(2551,2569,249)

--declare @HivCareStatusdesc varchar(20)
--select top 1 @HivCareStatusdesc=case when dateadd(dd,Duration,Dateadd(dd,90,DispensedbyDate))>=getdate() then ''On ART'' else ''In HIV/Care'' end from                                 
--			(select a.Dispensedbydate,max(b.duration) [Duration], a.createdate from ord_patientpharmacyorder a,               
--			dtl_patientpharmacyorder b, lnk_drugtypegeneric c                                
--			where a.ptn_pharmacy_pk = b.ptn_pharmacy_pk and (a.DeleteFlag is null or a.DeleteFlag=0) and                                
--			b.genericid = c.genericid and c.drugtypeid = 37 and a.progid = 222 and                            
--			a.ptn_pk=2569 group by a.ptn_pk,a.Dispensedbydate,a.createdate                                
--			union                                
--			select a.Dispensedbydate,max(b.duration) [Duration], a.createdate from ord_patientpharmacyorder a,               
--			dtl_patientpharmacyorder b, lnk_drugtypegeneric c,lnk_druggeneric d                                
--			where a.ptn_pharmacy_pk = b.ptn_pharmacy_pk and (a.DeleteFlag is null or a.DeleteFlag=0) and a.progid = 222 and                            
--			b.drug_pk = d.drug_pk and d.genericid = c.genericid and c.drugtypeid = 37 and                                 
--			a.ptn_pk=2569 group by a.ptn_pk,a.Dispensedbydate, a.createdate) z                             
--			where getdate() <= dateadd(dd,z.Duration,Dateadd(dd,90,z.DispensedbyDate)) and                            
--				  z.dispensedbydate in (select max(dispensedbydate) from ord_patientpharmacyorder               
--			   where ord_patientpharmacyorder.ptn_pk=2569 and (ord_patientpharmacyorder.DeleteFlag=0 or ord_patientpharmacyorder.DeleteFlag IS NULL)                         
--			and progid = 222)                               
--			order by z.dispensedbydate desc
--
--			    if (@HivCareStatusdesc IS NULL)
--				begin
--					if exists (select * from dtl_patientcareended where PatientExitReason=93 and ptn_pk=2569)
--						begin
--						set @HivCareStatusdesc=''Died''
--						end
--					else
--						begin
--						set @HivCareStatusdesc=''In HIV/Care''
--						end
--					
--				End
--select @HivCareStatusdesc
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetPatientCurrentARTRegimen_Constella]    Script Date: 6/6/2018 4:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetPatientCurrentARTRegimen_Constella]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE function [dbo].[fn_GetPatientCurrentARTRegimen_Constella]                
(                
@Ptn_Pk as int                
)                
Returns varchar(100)                
as                
                
begin                
   declare @CurrentRegimen varchar(100)                
   ---set @CurrentRegimen = ''''                
   select Top 1 @CurrentRegimen = RegimenType from                            
   (select b.CurrentART [RegimenType], b.CurrentARTStartDate [VisitDate] from ord_visit a, dtl_PatientHivPrevCareIE b                                
   where a.ptn_pk = b.ptn_pk and a.visit_id = b.visit_pk and b.CurrentART is not null and b.CurrentART != ''''                
   and a.ptn_pk = @Ptn_Pk                
   union            
   select a.RegimenName [RegimenType] ,b.RegistrationDate [VisitDate] from mst_Regimen a,mst_patient b,dtl_patienthivprevcareie c            
   where a.RegimenId=c.InitialRegimenCode and b.Ptn_Pk = c.Ptn_Pk and c.initialRegimenCode <> 0            
   and c.Ptn_Pk = @Ptn_Pk              
   union            
   select a.CurrentART,a.CurrentARTStartDate from mst_patient b,dtl_patienthivprevcareie a            
   where a.Ptn_Pk = b.Ptn_Pk and (a.PrevARVRegimen <> '''' or a.PrevARVRegimen is not null) and a.CurrentART is not null           
   and a.Ptn_Pk = @Ptn_Pk                             
   union                              
   SELECT b.RegimenType [RegimenType], a.DispensedByDate [VisitDate] FROM                              
   ord_PatientPharmacyOrder a,                                 
   dtl_RegimenMap b, dtl_PatientPharmacyOrder c where a.ptn_pk = b.Ptn_Pk and a.ptn_pharmacy_pk = b.orderid     
   and a.ptn_pharmacy_pk = c.ptn_pharmacy_pk               
   and (a.deleteflag = 0 or a.deleteflag is null) and a.ptn_pk=@Ptn_Pk and a.DispensedByDate is not null) a  
-- and (a.deleteflag = 0 or a.deleteflag is null) and a.ptn_pk=@Ptn_Pk and a.DispensedByDate is not null and isnull(c.Prophylaxis,0) != 1) a                           
   order by a.visitdate desc      
Return @CurrentRegimen                
end
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetPatientCurrentARTStartDate_Constella]    Script Date: 6/6/2018 4:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetPatientCurrentARTStartDate_Constella]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE function [dbo].[fn_GetPatientCurrentARTStartDate_Constella]                        
(                        
@Ptn_Pk as int                        
)                        
Returns datetime                        
as                        
                        
begin                        
   declare @RegType varchar(100)                                    
   declare @VisitDate datetime                                    
   Declare @StoreVisitDate datetime                                     
   Declare @StoreRegType varchar(100)                        
                         
   set @StoreVisitDate = ''''                      
   set @StoreRegType = ''''                      
                                    
   declare RegimenCursor Cursor                                    
   for                                    
   select * from                                    
   (select b.CurrentART [RegimenType], b.CurrentARTStartDate [VisitDate] from ord_visit a, dtl_PatientHivPrevCareIE b                                        
   where a.ptn_pk = b.ptn_pk and a.visit_id = b.visit_pk and b.CurrentART is not null and b.CurrentART != ''''                        
   and a.ptn_pk = @Ptn_Pk                                         
   union                   
   select a.RegimenName [RegimenType], d.ARTStartDate[VisitDate] from mst_Regimen a,mst_patient b,                  
   dtl_patienthivprevcareie c, dtl_PatientHivPrevCareEnrollment d                  
   where a.RegimenId=c.InitialRegimenCode and c.Visit_pk=d.Visit_pk and b.Ptn_Pk = c.Ptn_Pk                  
   and b.Ptn_Pk=d.Ptn_pk and c.initialRegimenCode <> 0 and c.Ptn_Pk = @Ptn_Pk                      
   union                    
   select a.CurrentART,a.CurrentARTStartDate[VisitDate] from mst_patient b,dtl_patienthivprevcareie a                    
   where a.Ptn_Pk = b.Ptn_Pk and (a.PrevARVRegimen <> '''' and a.PrevARVRegimen is not null)                    
   and a.Ptn_Pk = @Ptn_Pk                                     
   union                                                         
   SELECT b.RegimenType [RegimenType], a.DispensedByDate [VisitDate] FROM                                      
   ord_PatientPharmacyOrder a,                                         
   dtl_RegimenMap b,  dtl_PatientPharmacyOrder c where a.ptn_pk = b.Ptn_Pk and a.ptn_pharmacy_pk = b.orderid        
   and a.ptn_pharmacy_pk = c.ptn_pharmacy_pk and isnull(c.Prophylaxis,0) != 1                         
   and (a.deleteflag = 0 or a.deleteflag is null) and a.ptn_pk=@Ptn_Pk and a.dispensedbydate is not null) a                                    
   order by a.visitdate desc                                  
                                  
   open RegimenCursor                                    
   fetch next from RegimenCursor into @RegType,@VisitDate                                    
   while @@fetch_status = 0                                    
     begin                       
        if @StoreRegType = '''' and @StoreVisitDate = ''''                                    
          begin                                    
            set @StoreRegType = @RegType                                    
            set @StoreVisitDate = @VisitDate                                    
          end                                    
        else                                    
          begin                                    
             if @StoreRegType <> @RegType                                    
               begin                                    
    break                                    
               end                                    
            else                                    
                set @StoreVisitDate = @VisitDate                                     
          end                                    
    fetch next from RegimenCursor into @RegType,@VisitDate                                    
    continue                                    
   end                
close RegimenCursor                                    
deallocate RegimenCursor                                  
                  
Return nullif(@StoreVisitDate,'''')                        
end
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetPatientCurrentProphylaxisRegimen_Constella]    Script Date: 6/6/2018 4:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetPatientCurrentProphylaxisRegimen_Constella]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE function [dbo].[fn_GetPatientCurrentProphylaxisRegimen_Constella]                
(                
@Ptn_Pk as int                
)                
Returns varchar(100)                
as                
                
begin                
   declare @CurrentRegimen varchar(100) 
   select Top 1 @CurrentRegimen = RegimenType from                            
   (SELECT b.RegimenType [RegimenType], a.DispensedByDate [VisitDate] FROM                              
   ord_PatientPharmacyOrder a,                                 
   dtl_RegimenMap b, dtl_PatientPharmacyOrder c where a.ptn_pk = b.Ptn_Pk and a.ptn_pharmacy_pk = b.orderid     
   and a.ptn_pharmacy_pk = c.ptn_pharmacy_pk               
   and (a.deleteflag = 0 or a.deleteflag is null) and a.ptn_pk=@Ptn_Pk and a.DispensedByDate is not null and c.Prophylaxis= 1) a                            
   order by a.visitdate desc      
Return @CurrentRegimen                
end
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetPatientCurrentProphylaxisStartDate_Constella]    Script Date: 6/6/2018 4:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetPatientCurrentProphylaxisStartDate_Constella]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE function [dbo].[fn_GetPatientCurrentProphylaxisStartDate_Constella]                      
(                      
@Ptn_Pk as int                      
)                      
Returns datetime                      
as                      
                      
begin                      
   declare @RegType varchar(100)                                  
   declare @VisitDate datetime                                  
   Declare @StoreVisitDate datetime                                   
   Declare @StoreRegType varchar(100)                      
                       
   set @StoreVisitDate = ''''                    
   set @StoreRegType = ''''                    
                                  
   declare RegimenCursor Cursor                                  
   for                                  
   select * from                                  
   (SELECT b.RegimenType [RegimenType], a.DispensedByDate [VisitDate] FROM                                    
   ord_PatientPharmacyOrder a,                                       
   dtl_RegimenMap b,  dtl_PatientPharmacyOrder c where a.ptn_pk = b.Ptn_Pk and a.ptn_pharmacy_pk = b.orderid      
   and a.ptn_pharmacy_pk = c.ptn_pharmacy_pk and c.Prophylaxis = 1                       
   and (a.deleteflag = 0 or a.deleteflag is null) and a.ptn_pk=@Ptn_Pk and a.dispensedbydate is not null) a                                  
   order by a.visitdate desc                                 
                                
   open RegimenCursor                                  
   fetch next from RegimenCursor into @RegType,@VisitDate                                  
   while @@fetch_status = 0                                  
     begin                     
        if @StoreRegType = '''' and @StoreVisitDate = ''''                                  
          begin                                  
            set @StoreRegType = @RegType                                  
            set @StoreVisitDate = @VisitDate                                  
          end                                  
        else                                  
          begin                                  
             if @StoreRegType <> @RegType                                  
               begin                                  
    break                                  
               end                                  
            else                                  
                set @StoreVisitDate = @VisitDate                                   
          end                                  
    fetch next from RegimenCursor into @RegType,@VisitDate                                  
    continue                                  
   end                                   
close RegimenCursor                                  
deallocate RegimenCursor                                
                      
Return nullif(@StoreVisitDate,'''')                      
end
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetPatientDuefortermination_futures]    Script Date: 6/6/2018 4:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetPatientDuefortermination_futures]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE Function [dbo].[fn_GetPatientDuefortermination_futures]                                                  
(                                                  
@Ptn_Pk int                                       
)         
                                                 
Returns varchar(50)                                                  
                                                  
begin                                                  
                                                 
declare @DispenseDate datetime                                                  
declare @LongestDate datetime            
declare @CurrentArvRegimen int                                            
declare @CareEnded int                     
declare @HIVCarePt int                        
                                          
            
declare @PtnMstStatus varchar(100)                  
                                                   
 --------------------------------Check HIVCare Patient---------------------------------------------------------                    
 select @HIVCarePt = Count(Ptn_Pk), @PtnMstStatus = ARTStatus from VW_PatientDetail where ptn_pk = @Ptn_Pk             
 group by ARTStatus                    
 --------------------------------------------------------------------------------------------------------------                                             
 ------------------------------ ARV Dispense + Longest Duration + 90 Days -------------------------------------                      
 select @DispenseDate = max(b.dispensedbydate),@LongestDate = dateadd(dd,Max(Duration)+90,b.DispensedByDate)                    
 from vw_patientdetail a,vw_patientpharmacy b where a.ptn_pk = b.ptn_pk  and a.ptn_pk = @Ptn_Pk                    
 group by b.dispensedbydate                                          
 -------------------------------------------------------------------------------------------------------------                                             
                                        
 -----------------------------CareEnd-------------------------------------------------------------------------                                            
 select top 1 @CareEnded = CareEnded from VW_PatientCareEnd where (CareEnded is not null or CareEnded <> 0)                    
 and  ptn_pk = @ptn_pk order by CareEndedId desc                            
 ------------------------------------------------------------------------------------------------------------                                            
 ---------------------------------------------Prior Exposure-Transfer in----------------------------------------------------------------                                            
 select @CurrentArvRegimen=Count(ptn_pk) from dtl_PatientHivPrevCareEnrollment where PrevHivCare=265 and ptn_pk=@ptn_pk                                            
 ----------------------------------------------------------------------------------------------------------------------                                            
 --Return @LongestDate                  
if(@HIVCarePt<1)                    
  begin                    
    Return ''''                    
  end                                  
if (@CareEnded>0)                                            
  begin                                            
    Return ''Care Ended''                                            
  end                                                   
                                            
if(@PtnMstStatus = ''Non ART'' )                                                
  begin                                            
       Return ''Non-ART''                                                  
  end                                             
                                               
if (@PtnMstStatus = ''ART'' and @LongestDate >= getdate())                                             
   begin                                            
        Return ''ART''                                                  
   end                                                  
                                            
if(((@LongestDate < getdate()) or (@LongestDate= '''' or @LongestDate is null))or @CurrentArvRegimen >0 )                                            
   begin                                            
        Return ''Due for Termination''                                             
   end                                            
                                            
if (@PtnMstStatus = ''ART Stopped'')                                                 
  begin                                                  
    Return ''Stopped ART''                                                   
  end                   
                                         
Return ''''                                                  
end
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetPatientEnrollmentNumber_Constella]    Script Date: 6/6/2018 4:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetPatientEnrollmentNumber_Constella]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'create function [dbo].[fn_GetPatientEnrollmentNumber_Constella]
(
	@ptn_pk int
)
returns varchar(50)
as
Begin
DECLARE @RegistrationNumber varchar(20)

select @RegistrationNumber=CountryId +''-''+PosId+''-''+SatelliteId+''-''+PatientEnrollmentId from mst_patient where ptn_pk=@ptn_pk 
return @RegistrationNumber
end
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetPatientFirstLineARTRegimen_Futures]    Script Date: 6/6/2018 4:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetPatientFirstLineARTRegimen_Futures]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
CREATE function [dbo].[fn_GetPatientFirstLineARTRegimen_Futures]              
(              
@Ptn_Pk as int              
)              
Returns varchar(200)              
as              
              
begin
              
declare @Regimen varchar(200);

Select Top 1 @Regimen = b.regimentype
From	ord_PatientPharmacyOrder a,
		dtl_RegimenMap b
Where a.ptn_pk = b.Ptn_Pk
	And a.ptn_pharmacy_pk = b.orderid
	And (a.DeleteFlag = 0 Or a.DeleteFlag Is Null)
	And a.regimenline In (1, 2)
	And a.ProgID In (222,223)
	And (b.DeleteFlag = 0 Or b.DeleteFlag Is Null)
	And a.ptn_pk = @ptn_pk
	And a.dispensedbydate Is Not Null
	And b.regimentype Is Not Null
	And b.regimentype <> ''''
Order By a.dispensedbydate Asc

Return @Regimen
End
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetPatientFirstLineARTStartDate_futures]    Script Date: 6/6/2018 4:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetPatientFirstLineARTStartDate_futures]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
CREATE function [dbo].[fn_GetPatientFirstLineARTStartDate_futures]                
(                
@Ptn_Pk as int                
)                
Returns datetime                
as                
                
begin
                
declare @StartDate datetime;
Select Top 1 @StartDate = a.DispensedByDate
From	ord_PatientPharmacyOrder a,
		dtl_RegimenMap b
Where a.ptn_pk = b.Ptn_Pk
	And a.ptn_pharmacy_pk = b.orderid
	And (a.DeleteFlag = 0 Or a.DeleteFlag Is Null)
	And a.regimenline In (1, 2)
	And a.ProgID In (222, 223)
	And (b.DeleteFlag = 0 Or b.DeleteFlag Is Null)
	And a.ptn_pk = @ptn_pk
	And a.dispensedbydate Is Not Null
	And b.regimentype Is Not Null
	And b.regimentype <> ''''
Order By a.dispensedbydate Asc

Return @StartDate
End
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetPatientLastHIVCareVisit_Constella]    Script Date: 6/6/2018 4:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetPatientLastHIVCareVisit_Constella]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE Function [dbo].[fn_GetPatientLastHIVCareVisit_Constella]                          
(                          
  @Ptn_Pk int,  
  @FromDate DateTime= '''',  
  @ToDate DateTime= ''''   
)                          
Returns DateTime                          
begin     
  declare @VisitDate datetime  
  if(@FromDate <> '''' and @ToDate <> '''')  
     select top 1 @VisitDate = VisitDate from vw_patientvisit where visittypeid in (1,2,3,4,6,7,8,10)    
     and ptn_pk = @Ptn_Pk and VisitDate between @FromDate and @ToDate order by visitdate desc      
  else  
     select top 1 @VisitDate = VisitDate from vw_patientvisit where visittypeid in (1,2,3,4,6,7,8,10)    
     and ptn_pk = @Ptn_Pk order by visitdate desc      
    
  return @VisitDate    
end
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetPatientMaxRefill]    Script Date: 6/6/2018 4:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetPatientMaxRefill]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'create FUNCTION [dbo].[fn_GetPatientMaxRefill] 
(

	@ptn_pharmacy_pk int
)
RETURNS int
AS
BEGIN
	
	declare @return int

	select @return = max(Refill)
	from dtl_patientpharmacyorder where ptn_pharmacy_pk=@ptn_pharmacy_pk and (refill is not null or refill<>0)

	RETURN isnull(@return,0)

END



' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetPatientMaxRefillExpirationdate]    Script Date: 6/6/2018 4:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetPatientMaxRefillExpirationdate]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'create FUNCTION [dbo].[fn_GetPatientMaxRefillExpirationdate]     
(    
    
 @ptn_pharmacy_pk int    
)    
RETURNS datetime    
AS    
BEGIN    
     
 declare @return datetime    
    
 select @return = max(RefillExpirationdate)    
 from dtl_patientpharmacyorder where ptn_pharmacy_pk=@ptn_pharmacy_pk and (refillexpirationdate is not null)    
    
 RETURN isnull(@return,0)    
    
END  
  
  


' 
END
GO

/****** Object:  UserDefinedFunction [dbo].[fn_GetPatientOriginalOrderID]    Script Date: 6/6/2018 4:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetPatientOriginalOrderID]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'create FUNCTION [dbo].[fn_GetPatientOriginalOrderID]   
(  
 @ptn_pk int,
 @ptn_pharmacy_pk int  
)  
RETURNS INT  
AS  
BEGIN  
   
 declare @return INT  
  
 select @return = max(Original_ptn_pharmacy_pk)  
 from dtl_PatientPharmacyRefillTrack where New_ptn_pharmacy_pk=@ptn_pharmacy_pk and ptn_pk=@ptn_pk
  
 RETURN isnull(@return,0)  
  
END



' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetPatientPMTCTProgramStage_Futures]    Script Date: 6/6/2018 4:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetPatientPMTCTProgramStage_Futures]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE Function [dbo].[fn_GetPatientPMTCTProgramStage_Futures]                                    
(                                    
   @Ptn_Pk int        
)                                    
Returns varchar(50)                                    
                                    
begin                                    
Declare @PMTCTProgStage varchar(50)      
Declare @PMTCTCount int    
set @PMTCTCount = 0    
    
 select @PMTCTCount = q.ptn_pk from VW_PatientDetail p inner join VW_PatientVisit q on p.ptn_pk = q.ptn_pk    
 where q.visitname like ''%ANC%'' and q.visit_id in (select top 1 x.visit_id from VW_PatientVisit x where 
 x.ptn_pk = @Ptn_Pk and (x.visitname like ''%ANC%'' or x.visitname like ''%L&D%'' or x.visitname like ''%PN%'') order by x.visitdate desc)    
        
    if @PMTCTCount > 0    
       return ''ANC''    
    
 select @PMTCTCount = q.ptn_pk from VW_PatientDetail p inner join VW_PatientVisit q on p.ptn_pk = q.ptn_pk    
 where q.visitname like ''%L&D%'' and q.visit_id in (select top 1 x.visit_id from VW_PatientVisit x where 
 x.ptn_pk = @Ptn_Pk and (x.visitname like ''%ANC%'' or x.visitname like ''%L&D%'' or x.visitname like ''%PN%'') order by x.visitdate desc)    
 
        
    if @PMTCTCount > 0    
       return ''L&D''    
    
 select @PMTCTCount = q.ptn_pk from VW_PatientDetail p inner join VW_PatientVisit q on p.ptn_pk = q.ptn_pk    
 where q.visitname like ''%PN%'' and q.visit_id in (select top 1 x.visit_id from VW_PatientVisit x where 
 x.ptn_pk = @Ptn_Pk and (x.visitname like ''%ANC%'' or x.visitname like ''%L&D%'' or x.visitname like ''%PN%'') order by x.visitdate desc)    
        
    if @PMTCTCount > 0    
       return ''PN''    
    
    return ''''    
    
end
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetPatientPMTCTProgramStatus_Futures]    Script Date: 6/6/2018 4:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetPatientPMTCTProgramStatus_Futures]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE Function [dbo].[fn_GetPatientPMTCTProgramStatus_Futures]                                    
(                                    
   @Ptn_Pk int        
)                                    
Returns varchar(50)                                    
/************************************/      
/*****Only for Current PMTCT*********/      
/************************************/      
                                    
begin                                    
Declare @VisitDatePMTCT datetime          
Declare @CurrentDate datetime                                   
Declare @PMTCTCareEnded int          
Declare @PMTCTOutLimit int                      
set @PMTCTCareEnded = 0       
      
  select top 1 @VisitDatePMTCT = z.VisitDate from (select b.VisitDate             
  from mst_patient a, ord_visit b, mst_visittype c            
  where a.ptn_pk=@Ptn_Pk and a.ptn_pk=b.ptn_pk and b.VisitType=c.VisitTypeID            
  and (c.VisitName like ''%ANC%'' or c.VisitName like ''%L&D%'' or c.VisitName like ''%PN%'' or VisitType in(6,11))            
  and (a.ANCNumber is not null or a.PMTCTNumber is not null                   
  Or a.OutpatientNumber is not null or a.AdmissionNumber is not null)                     
  and (a.DeleteFlag=0 or  a.DeleteFlag IS NULL) and (b.DeleteFlag=0 or  b.DeleteFlag IS NULL)            
  union        
  select VisitDate        
  from VW_PatientPharmacy       
  where ProgId = 223 and Ptn_Pk = @Ptn_Pk)z        
  order by z.visitdate desc        
      
select @CurrentDate = getdate()          
--------------------------90 Days Calculation------------------------------------          
if(dateadd(dd,90,@VisitDatePMTCT)<@CurrentDate)          
     set @PMTCTOutLimit = 1          
else          
     set @PMTCTOutLimit = 0          
---------------------------------------------------------------------------------          
                       
----PMTCT Care Ended--------------------------------------------------------------                    
select  top 1 @PMTCTCareEnded = PMTCTCareEnded from dtl_patientcareended where Ptn_Pk = @Ptn_Pk and PMTCTCareEnded is not null  order by CareEndedid desc                   
----------------------------------------------------------------------------------                    
                    
                    
if ((@VisitDatePMTCT <> '''' or @VisitDatePMTCT <> ''1900-01-01'') and @PMTCTCareEnded = 0 and @PMTCTOutLimit = 0)                      
begin                      
  Return ''PMTCT''                      
end                      
                    
if ((@VisitDatePMTCT <> '''' or @VisitDatePMTCT <> ''1900-01-01'') and @PMTCTCareEnded > 0)                    
begin                              
    Return ''PMTCT Care Ended''                              
end                                   
                          
Return ''''                                    
end
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetPatientProgramStatus_Constella]    Script Date: 6/6/2018 4:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetPatientProgramStatus_Constella]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE Function [dbo].[fn_GetPatientProgramStatus_Constella]                                        
(                                        
@Ptn_Pk int                                        
)                                        
Returns varchar(50)                                        
                                        
begin                                        
--declare @RegistrationDatePMTCT datetime                                         
declare @DispenseDate datetime                                        
declare @LongestDate datetime                                        
--declare @ARTEndDate datetime                                 
--declare @RecCount int                                         
--declare @ARTStart int                                  
declare @CurrentArvRegimen int                                  
declare @CareEnded int           
declare @HIVCarePt int              
--declare @ARTStartDate int         
                                 
--declare @ARTReStartDate datetime --Added Naveen 23-Sept-2010                                 
  
declare @PtnMstStatus varchar(100)        
                                         
 --------------------------------Check HIVCare Patient---------------------------------------------------------          
 select @HIVCarePt = Count(Ptn_Pk), @PtnMstStatus = ARTStatus from VW_PatientDetail where ModuleId in (203, 2) and ptn_pk = @Ptn_Pk   
 group by ARTStatus          
 --------------------------------------------------------------------------------------------------------------                                   
 ------------------------------ ARV Dispense + Longest Duration + 90 Days -------------------------------------            
 select @DispenseDate = max(b.dispensedbydate),@LongestDate = dateadd(dd,Max(Duration)+90,b.DispensedByDate)          
 from vw_patientdetail a,vw_patientpharmacy b where a.ptn_pk = b.ptn_pk and a.moduleid in(203, 2) and a.ptn_pk = @Ptn_Pk          
 group by b.dispensedbydate                                
 -------------------------------------------------------------------------------------------------------------                                   
                                  
-- ------------------------------ARV End Date------------------------------------------------------------------                                            
-- select top 1 @ARTEndDate = ARTenddate from (select 1 [ExistFlag], ARTended,                                                                           
-- ARTenddate, createdate, CareEndedId from  dtl_PatientCareEnded where ptn_pk=@Ptn_Pk)Z                                 
-- order by CareEndedId desc                      
-- ------------------------------------------------------------------------------------------------------------          
--------------------------------ARV Restart Date------------------------------------------------------------------                                            
-- select top 1 @ARTReStartDate = Restartdate from (select 1 [ExistFlag], DeleteFlag,                                                                           
-- Restartdate, createdate, ARTRestart_Id from  dtl_PatientARTRestart where ptn_pk=@Ptn_Pk and (DeleteFlag=0 or DeleteFlag is null))Z                                 
-- order by ARTRestart_Id desc                      
-- ------------------------------------------------------------------------------------------------------------                                  
                                  
-- -----------------------------NONART-------------------------------------------------------------------------   
--  
--                                 
-- select @ARTStart = count(a.ptn_pk) from VW_PatientDetail a  where (a.artstartdate = ''1900-01-01'' or a.artstartdate is null) and                                   
-- a.ptn_pk = @ptn_pk and a.moduleid = 2 and a.ptn_pk in ( select b.ptn_pk from VW_PatientCareEnd b     
-- where b.artended in (select  top 1 ARTEnded from VW_PatientCareEnd where artended = 1  and ptn_pk = @Ptn_Pk  order by artenddate desc) and b.ptn_pk = a.ptn_Pk)    
-- and @ARTReStartDate is null                  
-- ------------------------------------------------------------------------------------------------------------                                  
 -----------------------------CareEnd-------------------------------------------------------------------------                                  
 select top 1 @CareEnded = CareEnded from VW_PatientCareEnd where (CareEnded is not null or CareEnded <> 0)          
 and  ptn_pk = @ptn_pk order by CareEndedId desc                  
 ------------------------------------------------------------------------------------------------------------                                  
 ---------------------------------------------Prior Exposure-Transfer in----------------------------------------------------------------                                  
 select @CurrentArvRegimen=Count(ptn_pk) from dtl_PatientHivPrevCareEnrollment where PrevHivCare=265 and ptn_pk=@ptn_pk                                  
 ----------------------------------------------------------------------------------------------------------------------                                  
          
if(@HIVCarePt<1)          
  begin          
    Return ''''          
  end                        
if (@CareEnded>0)                                  
  begin                                  
    Return ''Care Ended''                                  
  end                                         
                                  
if(@PtnMstStatus = ''Non ART'' )                                      
  begin                                  
       Return ''Non-ART''                                        
  end                                   
                                     
if (@PtnMstStatus = ''ART'' and @LongestDate >= getdate())                                   
   begin                                  
        Return ''ART''                                        
   end                                        
                                  
if(((@LongestDate < getdate()) or (@LongestDate= '''' or @LongestDate is null))or @CurrentArvRegimen >0 )                                  
   begin                                  
        Return ''Due for Termination''                                   
   end                                  
                                  
if (@PtnMstStatus = ''ART Stopped'')                                       
  begin                                        
    Return ''Stopped ART''                                         
  end         
                               
Return ''''                                        
end  ' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetPatientProgramStatus_Naveen]    Script Date: 6/6/2018 4:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetPatientProgramStatus_Naveen]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE Function [dbo].[fn_GetPatientProgramStatus_Naveen]                                                
(                                                
@Ptn_Pk int,        
@ModuleId int                                                
)       
                                               
Returns varchar(50)                                                
                                                
begin                                                
--declare @RegistrationDatePMTCT datetime                                                 
declare @DispenseDate datetime                                                
declare @LongestDate datetime                                                
--declare @ARTEndDate datetime                                         
--declare @RecCount int                                                 
--declare @ARTStart int                                          
declare @CurrentArvRegimen int                                          
declare @CareEnded int                   
declare @HIVCarePt int                      
--declare @ARTStartDate int                 
                                         
--declare @ARTReStartDate datetime --Added Naveen 23-Sept-2010                                         
          
declare @PtnMstStatus varchar(100)                
                                                 
 --------------------------------Check HIVCare Patient---------------------------------------------------------                  
 select @HIVCarePt = Count(Ptn_Pk), @PtnMstStatus = ARTStatus from VW_PatientDetail where ModuleId = 2 and ptn_pk = @Ptn_Pk           
 group by ARTStatus                  
 --------------------------------------------------------------------------------------------------------------                                           
 ------------------------------ ARV Dispense + Longest Duration + 90 Days -------------------------------------                    
 select @DispenseDate = max(b.dispensedbydate),@LongestDate = dateadd(dd,Max(Duration)+90,b.DispensedByDate)                  
 from vw_patientdetail a,vw_patientpharmacy b where a.ptn_pk = b.ptn_pk and a.moduleid = 2 and a.ptn_pk = @Ptn_Pk                  
 group by b.dispensedbydate                                        
 -------------------------------------------------------------------------------------------------------------                                           
                                          
-- ------------------------------ARV End Date------------------------------------------------------------------                                                    
-- select top 1 @ARTEndDate = ARTenddate from (select 1 [ExistFlag], ARTended,                                                                                   
-- ARTenddate, createdate, CareEndedId from  dtl_PatientCareEnded where ptn_pk=@Ptn_Pk)Z                                         
-- order by CareEndedId desc                              
-- ------------------------------------------------------------------------------------------------------------                  
--------------------------------ARV Restart Date------------------------------------------------------------------                                                    
-- select top 1 @ARTReStartDate = Restartdate from (select 1 [ExistFlag], DeleteFlag,                                                                                   
-- Restartdate, createdate, ARTRestart_Id from  dtl_PatientARTRestart where ptn_pk=@Ptn_Pk and (DeleteFlag=0 or DeleteFlag is null))Z                                         
-- order by ARTRestart_Id desc                              
-- ------------------------------------------------------------------------------------------------------------                                          
                                          
-- -----------------------------NONART-------------------------------------------------------------------------           
--       
--                                         
-- select @ARTStart = count(a.ptn_pk) from VW_PatientDetail a  where (a.artstartdate = ''''1900-01-01'''' or a.artstartdate is null) and                                 
-- a.ptn_pk = @ptn_pk and a.moduleid = 2 and a.ptn_pk in ( select b.ptn_pk from VW_PatientCareEnd b             
-- where b.artended in (select  top 1 ARTEnded from VW_PatientCareEnd where artended = 1  and ptn_pk = @Ptn_Pk  order by artenddate desc) and b.ptn_pk = a.ptn_Pk)            
-- and @ARTReStartDate is null                          
-- ------------------------------------------------------------------------------------------------------------                                          
 -----------------------------CareEnd-------------------------------------------------------------------------                                          
 select top 1 @CareEnded = CareEnded from VW_PatientCareEnd where (CareEnded is not null or CareEnded <> 0)                  
 and  ptn_pk = @ptn_pk and ModuleId=@ModuleId order by CareEndedId desc                          
 ------------------------------------------------------------------------------------------------------------                                          
 ---------------------------------------------Prior Exposure-Transfer in----------------------------------------------------------------                                          
 select @CurrentArvRegimen=Count(ptn_pk) from dtl_PatientHivPrevCareEnrollment where PrevHivCare=265 and ptn_pk=@ptn_pk                                          
 ----------------------------------------------------------------------------------------------------------------------                                          
 --Return @LongestDate                
if(@HIVCarePt<1)                  
  begin                  
    Return ''''                  
  end                                
if (@CareEnded>0)                                          
  begin                                          
    Return ''Care Ended''                                          
  end                                                 
                                          
if(@PtnMstStatus = ''Non ART'' )                                              
  begin                                          
       Return ''Non-ART''                                                
  end                                           
                                             
if (@PtnMstStatus = ''ART'' and @LongestDate >= getdate())                                           
   begin                                          
        Return ''ART''                                                
   end                                                
                                          
if(((@LongestDate < getdate()) or (@LongestDate= '''' or @LongestDate is null))or @CurrentArvRegimen >0 )                                          
   begin                                          
        Return ''Due for Termination''                                           
   end                                          
                                          
if (@PtnMstStatus = ''ART Stopped'')                                               
  begin                                                
    Return ''Stopped ART''                                                 
  end                 
                                       
Return ''''                                                
end
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetPatientregChangReason_futures]    Script Date: 6/6/2018 4:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetPatientregChangReason_futures]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE function [dbo].[fn_GetPatientregChangReason_futures]                  
(                  
@Ptn_Pk as int,    
@LocationId as int,     
@dispenseddate as datetime                 
)                  
Returns varchar(100)                  
as                  
                  
begin                  
declare @Reason varchar(100)    
    
-- Comment by Deepak 12/06/2012  
/*select top 1 @Reason = Case dtl.TherapyReasonCode when 24 then ''Others: ''+dtl.TherapyOther Else res.name End     
from dtl_patientarvtherapy dtl join ord_visit ord on dtl.Visit_pk=ord.Visit_Id    
join mst_reason res on res.Id=dtl.TherapyReasonCode    
where dtl.Ptn_Pk=@Ptn_Pk and ord.LocationId=@LocationId and ord.Visitdate<=@dispenseddate    
order by abs(DATEDIFF(DAY,Ord.VisitDate,@dispenseddate)) desc*/  
  
select top 1 @Reason = Case charindex(''Other'', res.name) when 0 then res.name else ''Others: ''+dtl.TherapyOther End  
from dtl_patientarvtherapy dtl join ord_visit ord on dtl.Visit_pk=ord.Visit_Id    
join mst_bluedecode res on res.Id=dtl.TherapyReasonCode    
where dtl.Ptn_Pk=@Ptn_Pk and ord.LocationId=@LocationId and ord.Visitdate<=@dispenseddate    
order by abs(DATEDIFF(DAY,Ord.VisitDate,@dispenseddate)) desc  
                  
Return @Reason                 
end
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetPatientRegimenLine_futures]    Script Date: 6/6/2018 4:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetPatientRegimenLine_futures]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE function [dbo].[fn_GetPatientRegimenLine_futures]              
(              
@dispensedate as datetime,
@Ptn_pk as int              
)              
Returns varchar(50)              
as              
              
begin              
declare @RegimenLine varchar(50);              
SELECT @RegimenLine = b.name FROM                              
ord_PatientPharmacyOrder a,                                 
mst_RegimenLine b,dtl_regimenmap c where a.ptn_pharmacy_pk = c.OrderId 
and a.dispensedbydate=@dispensedate and a.ptn_pk=@ptn_pk and b.ID=a.RegimenLine            
              
Return @RegimenLine             
end
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetPatientRegistrationNumber]    Script Date: 6/6/2018 4:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetPatientRegistrationNumber]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE function [dbo].[fn_GetPatientRegistrationNumber]    
(    
 @ptn_pk int,    
 @ReferenceId int=null,    
 @Id int    
     
)    
returns varchar(20)    
as    
Begin    
DECLARE @RegistrationNumber varchar(20)    
    
    
if exists(select * from dtl_familyinfo where Ptn_pk=@ptn_pk and id=@Id and ReferenceId=@ReferenceId and (DeleteFlag is null or DeleteFlag=0))    
 Begin    
  select @RegistrationNumber=CountryId +''-''+PosId+''-''+SatelliteId+''-''+PatientEnrollmentId from mst_patient where ptn_pk=@ReferenceId and (DeleteFlag is null or DeleteFlag=0)    
 end    
else    
 begin    
  select @RegistrationNumber=RegistrationNo from dtl_familyinfo where Ptn_pk=@ptn_pk and id=@Id and (DeleteFlag is null or DeleteFlag=0)    
      
 end    
 return @RegistrationNumber    
end
' 
END
GO

/****** Object:  UserDefinedFunction [dbo].[fn_GetPatientStatusOnDate]    Script Date: 6/6/2018 4:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetPatientStatusOnDate]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'create function [dbo].[fn_GetPatientStatusOnDate]        
(        
   @ptn_pk int,        
   @ModuleId int,  
   @EndDate datetime        
)        
returns varchar(50)        
as        
Begin        
  declare @PatStatus varchar(50)       
     set @PatStatus = ''''     
     select top 1 @PatStatus = (Case @ModuleId when 1 then PMTCTCareEnded when 2 then CareEnded end) from    
     VW_PatientCareEnd where Ptn_Pk = @Ptn_Pk and CareEndedDate <= @EndDate  order by CareEndedId desc       
       
     if(@PatStatus = ''1'')       
  set @PatStatus = ''In-Active''      
     else      
  set @PatStatus = ''Active''      
      
  return @PatStatus          
        
End
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetPhysicalfindings]    Script Date: 6/6/2018 4:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetPhysicalfindings]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[fn_GetPhysicalfindings]
(
   @Id int
)
RETURNS varchar(200)
AS
BEGIN
	declare @Name varchar(200)
	select @Name=name from mst_symptom where id=@id  and CategoryID=11
	return @Name

END



' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetPhysicalfindingsbyvisitdate]    Script Date: 6/6/2018 4:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetPhysicalfindingsbyvisitdate]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[fn_GetPhysicalfindingsbyvisitdate]

(

   @ptn_pk int,

   @visitdate datetime

)

RETURNS varchar(200)

AS

BEGIN

	declare @Name varchar(max)



	select @Name=COALESCE(@Name+'','','''')+ dbo.fn_GetPhysicalfindings(s.symptomid) from dtl_PatientSymptoms s

    inner join ord_visit o on o.visit_id=s.visit_pk

	and o.Ptn_Pk=@ptn_pk and o.visitdate=@visitdate



	return @Name



END


' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetReferredTo]    Script Date: 6/6/2018 4:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetReferredTo]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'create FUNCTION [dbo].[fn_GetReferredTo]
(
   @Id int
)
RETURNS varchar(200)
AS
BEGIN
	declare @Name varchar(200)
	select @Name=name from mst_decode where id=@id and codeid=1005
	return @Name
END




' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetRelationShipinfo]    Script Date: 6/6/2018 4:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetRelationShipinfo]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'create function [dbo].[fn_GetRelationShipinfo]
(
@ptn_pk int
)
returns int
as
begin
	declare @find int
	if exists(select * from dtl_InfantParent where parentptnpk=@ptn_pk)
	begin
		set @find=1
	end
	else
	begin
		set @find=0
	end	
return @find		
end
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetRelationshipType]    Script Date: 6/6/2018 4:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetRelationshipType]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[fn_GetRelationshipType]
(
 @ptn_pk INT
)
RETURNS varchar(100)
AS
BEGIN
    declare @id varchar(100)
    select @id=case RelationshipType 
    when 1 then ''Niece/Nephew''
    when 2 then ''Brother/Sister''
    when 3 then ''Parent''
    when 4 then ''Cousin''
    when 5 then ''GrandParent''
    when 6 then ''GrandChild''
    when 7 then ''Aunt/Uncle''
    when 8 then ''Not Family''
    when 9 then ''Other''
    when 10 then ''Child''
    when 11 then ''Spouse/Partner''
    end
   from dtl_familyinfo where Ptn_pk=@ptn_pk and (DeleteFlag is null or DeleteFlag=0)
return @id
END
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetRelationshipTypeID]    Script Date: 6/6/2018 4:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetRelationshipTypeID]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[fn_GetRelationshipTypeID]
(
 @ptn_pk INT
)
RETURNS int
AS
BEGIN
    declare @id int
    select @id=case RelationshipType 
    when 1 then 7
    when 2 then 2
    when 3 then 10
    when 4 then 4
    when 5 then 6
    when 6 then 5
    when 7 then 1
    when 8 then 8
    when 9 then 9
    when 10 then 3
    when 11 then 11
    else 0 
    end
   from dtl_familyinfo where Ptn_pk=@ptn_pk and (DeleteFlag is null or DeleteFlag=0)
return @id
END
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetSatelliteName]    Script Date: 6/6/2018 4:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetSatelliteName]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE function [dbo].[fn_GetSatelliteName]
(@SatID AS int)
returns varchar(50)
as
begin

DECLARE @SatelliteName Varchar(50)
Select @SatelliteName=FacilityName from mst_facility where facilityId=@SatID
RETURN @SatelliteName

End
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetSelectlistvalue]    Script Date: 6/6/2018 4:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetSelectlistvalue]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE function [dbo].[fn_GetSelectlistvalue]      
(@CodeID AS int)      
returns varchar(1000)      
as      
begin      
      
declare @List varchar(1000)   
declare @count int  
select @count=count(*) from mst_pmtctdecode where codeid=@CodeID and (DeleteFlag is null or deleteflag=0)   
if @count=1  
begin  
select @List = Name from mst_pmtctdecode where codeid=@CodeID and (DeleteFlag is null or deleteflag=0)    
end  
else  
begin  
select @List = coalesce(@List + '', '', '''') + Name from mst_pmtctdecode where codeid=@CodeID and (DeleteFlag is null or deleteflag=0)        
end     
return @List      
      
End
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetSelectlistvalue_Decode]    Script Date: 6/6/2018 4:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetSelectlistvalue_Decode]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE function [dbo].[fn_GetSelectlistvalue_Decode]    
(@CodeID AS int)    
returns varchar(1000)    
as    
begin    
    
declare @List varchar(1000)    
select @List = coalesce(@List + '', '', '''') + Name from mst_decode where codeid=@CodeID    
    
return @List    
    
End
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetSellingPrice_Futures]    Script Date: 6/6/2018 4:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetSellingPrice_Futures]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE function [dbo].[fn_GetSellingPrice_Futures]  
(  
  @ItemId int,  
  @BatchId int,  
  @ExpiryDate datetime,
  @StoreId int  
)  
returns decimal  
as  
Begin  
  declare @SellingPrice decimal  
  select @SellingPrice = SellingPrice from dtl_stocktransaction where itemid =  @ItemId and   
  batchid = @BatchId and expirydate = @ExpiryDate and StoreId = @StoreId
  return @SellingPrice  
End
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetSideEffects_Futures]    Script Date: 6/6/2018 4:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetSideEffects_Futures]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		John Macharia
-- Create date: 6th Sept 2012
-- Description:	Get Side effects of regimens
-- =============================================
CREATE function [dbo].[fn_GetSideEffects_Futures]
(
	@ptn_pk int,
	@visitDt datetime
)
returns varchar(MAX)
as
Begin
DECLARE @sideEffects VARCHAR(MAX)

if not exists(select * from ord_PatientPharmacyOrder where Ptn_pk = @ptn_pk and DispensedByDate > @visitDt and 
DispensedByDate < (select top 1 ord.VisitDate from dtl_PatientSymptoms dtl inner join mst_Symptom mst 
on dtl.SymptomID = mst.ID inner join ord_Visit ord on dtl.Visit_pk=ord.Visit_Id  where mst.CategoryID=11 
	and dtl.Ptn_pk=@ptn_pk and ord.VisitDate > @visitDt
	and ord.VisitDate = (select MIN(VisitDate) from ord_Visit where VisitDate > @visitDt and Ptn_pk=@ptn_pk)))
begin
	select @sideEffects = COALESCE(@sideEffects + '', '', '''') + mst.Name from dtl_PatientSymptoms dtl inner join mst_Symptom mst 
	on dtl.SymptomID = mst.ID inner join ord_Visit ord on dtl.Visit_pk=ord.Visit_Id  where mst.CategoryID=11 
	and dtl.Ptn_pk=@ptn_pk and ord.VisitDate > @visitDt
	and ord.VisitDate = (select MIN(VisitDate) from ord_Visit where VisitDate > @visitDt and Ptn_pk=@ptn_pk)
end
else
begin
	select @sideEffects = ''''
end

return @sideEffects
END
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetSubstitutionsInterruptions]    Script Date: 6/6/2018 4:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetSubstitutionsInterruptions]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'create FUNCTION [dbo].[fn_GetSubstitutionsInterruptions]
(
   @Id int
)
RETURNS varchar(200)
AS
BEGIN
	declare @Name varchar(200)
	select @Name=name from mst_decode where id=@id and codeid=24
	return @Name
END




' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetTBstatus]    Script Date: 6/6/2018 4:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetTBstatus]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'create FUNCTION [dbo].[fn_GetTBstatus]
(
   @Id int
)
RETURNS varchar(200)
AS
BEGIN
	declare @Name varchar(200)
	select @Name=name from mst_pmtctdecode where id=@id and codeid=32
	return @Name

END


' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetTrack1PatientExitReason_Constella]    Script Date: 6/6/2018 4:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetTrack1PatientExitReason_Constella]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE Function [dbo].[fn_GetTrack1PatientExitReason_Constella]            
(            
 @Ptn_Pk int,             
 @Locationid varchar(1000),    
 @CareEndedDate datetime            
)            
            
Returns Int            
BEGIN            
            
declare @PtnId int    
declare @PtnExitReason int    
declare @CareEndDate datetime    
declare @CareEnd int    
declare @ReturnReason int    
set @ReturnReason = 0    
            
declare Ptn_CareEnd cursor             
for            
select a.Ptn_Pk,b.PatientExitReason,b.CareEndedDate,b.CareEnded from vw_Patientdetail a,Vw_PatientCareEnd b     
where charindex('',''+convert(varchar,a.LocationId)+'','','',''+@LocationId+'','')>0 
 and a.Ptn_Pk = b.Ptn_Pk and a.Ptn_Pk = @Ptn_Pk and a.[Patient Status] = ''In-Active'' and     
b.CareEndedDate is not null and a.Ptn_Pk not in (select Ptn_Pk from VW_PatientCareEnd where CareEndedDate > @CareEndedDate)    
order by b.CareEndedDate asc    
         
open Ptn_CareEnd            
fetch next from Ptn_CareEnd into @PtnId,@PtnExitReason,@CareEndDate,@CareEnd            
while @@fetch_status =0            
  begin            
     if (@ReturnReason = 0)    
        begin    
   set @ReturnReason = @PtnExitReason    
        end    
     else if(@ReturnReason <> 118 and @ReturnReason <> 92)    
        begin    
   set @ReturnReason = @PtnExitReason    
        end     
     fetch next from Ptn_CareEnd into @PtnId,@PtnExitReason,@CareEndDate,@CareEnd            
  end             
close Ptn_CareEnd            
deallocate Ptn_CareEnd            
            
Return @ReturnReason            
END
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetViralLoad_DueDate]    Script Date: 6/6/2018 4:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetViralLoad_DueDate]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Naveen Sharma
-- Create date: May 03 2016
-- Description:	Get Viral Load Due date for a Patient
-- =============================================

CREATE FUNCTION [dbo].[fn_GetViralLoad_DueDate] (
                -- Add the parameters for the function here
                @Ptn_pk INT= NULL )
RETURNS @ViralLoadTable TABLE(
					   -- Add the column definitions for the TABLE variable here
                              ViralLoadDueDate DATETIME, TestResults FLOAT
                             )
AS
     BEGIN

         -- Fill the table variable with the rows for your result set

         DECLARE @ReturnViralLoadDate DATETIME;
         DECLARE @ReturnViralLoad FLOAT;
         DECLARE @LMPViralLoadDate DATETIME;
         DECLARE @LatestViralLoadDate DATETIME;
         DECLARE @Pregnant INT;
         DECLARE @LMPDate DATETIME;
         DECLARE @LatestViralLoad FLOAT;
         DECLARE @ARTStartDate DATETIME=(SELECT TOP 1 ISNULL(dtl.RestartDate, mst.ARTStartDate)
                                          FROM mst_Patient AS mst LEFT OUTER JOIN dtl_PatientARTRestart AS dtl ON mst.Ptn_pk = dtl.Ptn_pk
                                          WHERE mst.Ptn_pk = @Ptn_pk
                                                AND
                                                (dtl.DeleteFlag IS NULL OR dtl.DeleteFlag = 0)
                                          ORDER BY dtl.RestartDate DESC
                                         );
         SELECT TOP 1 @Pregnant = dtlCS.Pregnant, @LMPDate = dtlCS.LMP
         FROM dtl_PatientClinicalStatus AS dtlCS INNER JOIN ord_Visit AS ordV ON dtlCS.Visit_pk = ordV.Visit_Id
         WHERE dtlCS.Ptn_pk = @Ptn_pk
               AND
               (ordV.DeleteFlag IS NULL
                OR
                ordV.DeleteFlag = 0)
         ORDER BY ordV.VisitDate DESC;
         SELECT TOP 1 @LatestViralLoadDate = ord.OrderedbyDate, @LatestViralLoad = dtl.TestResults
         FROM ord_PatientLabOrder AS ord INNER JOIN dtl_PatientLabResults AS dtl ON ord.LabID = dtl.LabID
                                         INNER JOIN ord_Visit AS ordV ON ord.VisitId = ordV.Visit_Id
         WHERE dtl.LabTestID = 3
               AND
               ord.Ptn_pk = @Ptn_pk
               AND
               (ord.DeleteFlag IS NULL OR ord.DeleteFlag = 0)
               AND
               ord.OrderedbyDate <> ''''
               AND
               ord.OrderedbyDate IS NOT NULL
         ORDER BY ord.OrderedbyDate DESC;
         DECLARE @viralloaddays INT;
	    DECLARE @viralloaddone bit=0; ----0 if viralload not done 
		  IF(@LatestViralLoadDate IS NULL)
			 BEGIN
				SET @viralloaddays = (DATEDIFF(day, @ARTStartDate, GETDATE()));
				
			 END;
		  ELSE
			 BEGIN
				SET @viralloaddays = (DATEDIFF(day, @LatestViralLoadDate, GETDATE()));
				SET @viralloaddone=1;
			 END;
         IF(@ARTStartDate IS NOT NULL)
             BEGIN                 
				IF(@viralloaddays >= 180 and @viralloaddone=0)
				    BEGIN
					   SET @ReturnViralLoadDate = DATEADD(day, 180, @ARTStartDate);
					   SET @ReturnViralLoad = @LatestViralLoad;
				    END;
				ELSE IF(@viralloaddone=1 and @LatestViralLoad <1000)
                     BEGIN
				    IF((DATEADD(YEAR, 1,@viralloaddays) <= GETDATE()))
				    BEGIN
					   SET @ReturnViralLoadDate = (DATEADD(YEAR, 1,@LatestViralLoadDate));
					   SET @ReturnViralLoad = @LatestViralLoad;
				    END
                     END;
			    ELSE IF(@viralloaddays >= 90 and @viralloaddone=1 and @LatestViralLoad >1000)
                     BEGIN
                        SET @ReturnViralLoadDate = DATEADD(day, 90,@LatestViralLoadDate);
                        SET @ReturnViralLoad = @LatestViralLoad;
                     END;
				ELSE IF(@Pregnant = 1  AND  (@LMPDate IS NOT NULL AND YEAR(@LMPDate) <> ''1900''))
                    BEGIN
                        SELECT @LMPViralLoadDate = ord.ReportedbyDate
                        FROM ord_PatientLabOrder AS ord INNER JOIN dtl_PatientLabResults AS dtl ON ord.LabID = dtl.LabID
                                                        INNER JOIN ord_Visit AS ordV ON ord.VisitId = ordV.Visit_Id
                        WHERE dtl.LabTestID = 3  AND  ord.Ptn_pk = @Ptn_pk AND (ord.DeleteFlag IS NULL OR ord.DeleteFlag = 0)
                            AND ord.ReportedbyDate <> ''''  AND ord.ReportedbyDate IS NOT NULL
                            AND ord.ReportedbyDate BETWEEN DATEADD(DAY, -180, @LMPDate) AND @LMPDate
                        ORDER BY ord.ReportedbyDate DESC;
                        IF(@LMPViralLoadDate IS NULL and DATEADD(DAY, 180,@LMPDate) < GETDATE())
                            BEGIN
                                SELECT @ReturnViralLoadDate = DATEADD(DAY, 180,@LMPDate), @ReturnViralLoad = '''';                                
                            END;
                        ELSE
                            BEGIN
                                SELECT @ReturnViralLoadDate = '''', @ReturnViralLoad = ''''
                                FROM ord_PatientLabOrder
                                WHERE Ptn_pk = -1;
                            END;
                    END;
                    ELSE
				  BEGIN
                        SELECT @ReturnViralLoadDate = '''', @ReturnViralLoad = ''''
                        FROM ord_PatientLabOrder
                        WHERE Ptn_pk = -1;
                    END;
			END
		ELSE IF (@ARTStartDate IS NULL)
		 BEGIN
		  IF(@viralloaddone=1 and @LatestViralLoad <1000)
			 BEGIN
				IF((DATEADD(YEAR, 1,@viralloaddays) <= GETDATE()))
				    BEGIN
					   SET @ReturnViralLoadDate = (DATEADD(YEAR, 1,@LatestViralLoadDate));
					   SET @ReturnViralLoad = @LatestViralLoad;
				    END
			 END;
		  ELSE IF(@Pregnant = 1  AND  (@LMPDate IS NOT NULL AND YEAR(@LMPDate) <> ''1900''))
                BEGIN
                    SELECT @LMPViralLoadDate = ord.ReportedbyDate
                    FROM ord_PatientLabOrder AS ord INNER JOIN dtl_PatientLabResults AS dtl ON ord.LabID = dtl.LabID
                                                    INNER JOIN ord_Visit AS ordV ON ord.VisitId = ordV.Visit_Id
                    WHERE dtl.LabTestID = 3  AND  ord.Ptn_pk = @Ptn_pk AND (ord.DeleteFlag IS NULL OR ord.DeleteFlag = 0)
                        AND ord.ReportedbyDate <> ''''  AND ord.ReportedbyDate IS NOT NULL
                        AND ord.ReportedbyDate BETWEEN DATEADD(DAY, -180, @LMPDate) AND @LMPDate
                    ORDER BY ord.ReportedbyDate DESC;
                    IF(@LMPViralLoadDate IS NULL and DATEADD(DAY, 180,@LMPDate) < GETDATE())
                        BEGIN
                            ---SELECT @ReturnViralLoadDate = DATEADD(DAY, 180,@LMPDate), @ReturnViralLoad = '''';  
					   SELECT @ReturnViralLoadDate = @LMPDate, @ReturnViralLoad = '''';                              
                        END;
                    ELSE
                        BEGIN
                            SELECT @ReturnViralLoadDate = '''', @ReturnViralLoad = ''''
                            FROM ord_PatientLabOrder
                            WHERE Ptn_pk = -1;
                        END;
                END;
            ELSE
			 BEGIN
				SELECT @ReturnViralLoadDate = '''', @ReturnViralLoad = ''''
				FROM ord_PatientLabOrder
				WHERE Ptn_pk = -1;
			 END;
		 END
		 ELSE
			 BEGIN
				SELECT @ReturnViralLoadDate = '''', @ReturnViralLoad = ''''
				FROM ord_PatientLabOrder
				WHERE Ptn_pk = -1;
			 END; 
				
         INSERT INTO @ViralLoadTable
                                    (ViralLoadDueDate, TestResults
                                    )
         VALUES
                (@ReturnViralLoadDate, @ReturnViralLoad
                );
         RETURN;
     END;

' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_InitialRegimen_Constella]    Script Date: 6/6/2018 4:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_InitialRegimen_Constella]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[fn_InitialRegimen_Constella](
    @RegimenID VARCHAR(50) -- List of delimited items
  
) RETURNS VARCHAR(MAX)

BEGIN
Declare @RegimenName varchar(Max)
select @RegimenName=RegimenName from mst_regimen where RegimenID=@RegimenID

RETURN @RegimenName
END
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_KNH_DCC_PatientWABStage]    Script Date: 6/6/2018 4:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_KNH_DCC_PatientWABStage]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE function [dbo].[fn_KNH_DCC_PatientWABStage]      
(      
 @ID int    
)      
returns int      
as      
begin      
declare @WABID int
declare @WABName varchar(max)
select @WABName=Name from mst_Decode where Id=@ID and CodeID=21 and SystemId=0 and DeleteFlag=0
select @WABID=ID from mst_Decode c where CodeID=(Select CodeID from mst_Code where Name=''WAB Stage'') and Name=@WABName
if @ID=0 or @ID is null
begin
set @WABID=@ID
end
if @ID is null
set @WABID=@ID
return @WABID 
end


' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_Lab_GetSpecimenID]    Script Date: 6/6/2018 4:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_Lab_GetSpecimenID]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[fn_Lab_GetSpecimenID](@SpecimeNumber varchar(200)) RETURNS int

AS
BEGIN
	-- Declare the return variable here
RETURN
(	SELECT TOP 1 m.ID from mst_LabSpecimen m Where (m.DeleteFlag=0 or m.DeleteFlag IS NULL) AND m.SpecimeNumber=@SpecimeNumber ORDER BY m.ID DESC)

END



' 
END
GO

/****** Object:  UserDefinedFunction [dbo].[fn_Modules_Futures]    Script Date: 6/6/2018 4:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_Modules_Futures]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[fn_Modules_Futures]    
(     
 @ptn_pk int    
)    
Returns varchar(Max)        
as        
BEGIN      
    
Declare @Module varchar(Max)       
    -- set @Module = ''''     
Select @Module=COALESCE (@Module+'', '','''')+ModuleName     
From lnk_patientProgramstart a,mst_module b     
Where a.ptn_pk=@ptn_pk and a.ModuleId=b.ModuleID    
    
return @Module    
     
END
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_ModulesIds_Futures]    Script Date: 6/6/2018 4:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_ModulesIds_Futures]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[fn_ModulesIds_Futures]      
(       
 @ptn_pk int      
)      
Returns varchar(Max)          
as          
BEGIN        
      
Declare @Module varchar(Max)         
    -- set @Module = ''''       
Select @Module=COALESCE (@Module+'', '','''')+Convert(varchar, b.ModuleID)       
From lnk_patientProgramstart a,mst_module b       
Where a.ptn_pk=@ptn_pk and a.ModuleId=b.ModuleID      
      
return @Module      
       
END
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_PatientDiedStatus]    Script Date: 6/6/2018 4:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_PatientDiedStatus]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE function [dbo].[fn_PatientDiedStatus]
(
	@ptn_pk int
)
returns varchar(20)
as
Begin
declare @PatientStauts varchar(20)
 if exists (select * from dtl_patientcareended c inner join mst_patient m on c.ptn_pk=m.ptn_pk and m.Status=1 where (c.PatientExitReason=93 or c.PatientExitReason=118) and c.ptn_pk=@ptn_pk)
   set @PatientStauts=''Died''
 else
   set @PatientStauts=''''

return @PatientStauts
End
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_PatientExitResion]    Script Date: 6/6/2018 4:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_PatientExitResion]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'create FUNCTION [dbo].[fn_PatientExitResion]
(
   @ptn_pk int
)
RETURNS varchar(200)
AS
BEGIN
	declare @Name varchar(200)
	declare @id int
	select top 1 @id=PatientExitReason from dtl_PatientCareEnded where  CareEndedDate is not null and ptn_pk=@ptn_pk order by CareEndedDate desc
	select @Name=name from mst_decode where id=@id and codeid=23
	return @Name
END



' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_PatientIdentificationNumber_Constella]    Script Date: 6/6/2018 4:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_PatientIdentificationNumber_Constella]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE function [dbo].[fn_PatientIdentificationNumber_Constella]  
(  
    @ptn_pk int,  
    @PtnId Varchar(50),
    @ResultType int = 0 ----1--For Number, ---2--- For Type  
)  
returns varchar(20)  
as  
Begin  
Declare @Enroll varchar(50)
declare @Type varchar(50)  
set @Enroll = ''''  
if @PtnId <> ''''  
begin  
 select @Enroll=Mst_Patient.CountryId +''-''+Mst_Patient.PosId+''-''+Mst_Patient.SatelliteId+''-''+ PatientEnrollmentID from mst_patient where ptn_pk=@ptn_pk  
 and PatientEnrollmentId = @PtnId
 set @Type = ''ART Enrollment''  
 if(@Enroll = '''' or @Enroll IS NULL)  
  Begin  
  select @Enroll=PatientClinicID from mst_patient where ptn_pk=@ptn_pk and PatientClinicId = @PtnId  
  set @Type = ''Clinic ID'' 
  if (@Enroll = '''' or @Enroll IS NULL)  
   Begin  
   select @Enroll=ANCNumber from mst_patient where ptn_pk=@ptn_pk and ANCNumber = @PtnId  
   set @Type = ''ANC Number''
   if (@Enroll = '''' or @Enroll IS NULL)  
    Begin  
    select @Enroll=PMTCTNumber from mst_patient where ptn_pk=@ptn_pk and PMTCTNumber = @PtnId  
    set @Type = ''PMTCT Number''
    if (@Enroll = '''' or @Enroll IS NULL)  
     Begin  
     select @Enroll=AdmissionNumber from mst_patient where ptn_pk=@ptn_pk and AdmissionNumber = @PtnId  
     set @Type = ''Admission Number''
     if (@Enroll = '''' or @Enroll IS NULL)   
      Begin  
      Select @Enroll=OutpatientNumber from mst_patient where ptn_pk=@ptn_pk and OutpatientNumber = @PtnId  
      set @Type = ''Out-Patient Number'' 
      End  
     End  
    End  
     
   End  
  End  
end  
else  
begin  
 select @Enroll=Mst_Patient.CountryId +''-''+Mst_Patient.PosId+''-''+Mst_Patient.SatelliteId+''-''+Nullif(PatientEnrollmentID,'''') from mst_patient where ptn_pk=@ptn_pk  
 set @Type = ''ART Enrollment''  
 if(@Enroll = '''' or @Enroll IS NULL)  
  Begin  
  select @Enroll=PatientClinicID from mst_patient where ptn_pk=@ptn_pk   
  set @Type = ''Clinic ID'' 
  if (@Enroll = '''' or @Enroll IS NULL)  
   Begin  
   select @Enroll=ANCNumber from mst_patient where ptn_pk=@ptn_pk  
   set @Type = ''ANC Number''
   if (@Enroll = '''' or @Enroll IS NULL)  
    Begin  
    select @Enroll=PMTCTNumber from mst_patient where ptn_pk=@ptn_pk   
    set @Type = ''PMTCT Number''
    if (@Enroll = '''' or @Enroll IS NULL)  
     Begin  
     select @Enroll=AdmissionNumber from mst_patient where ptn_pk=@ptn_pk  
     set @Type = ''Admission Number''
     if (@Enroll = '''' or @Enroll IS NULL)   
      Begin  
      Select @Enroll=OutpatientNumber from mst_patient where ptn_pk=@ptn_pk 
      set @Type = ''Out-Patient Number'' 
      End  
     End  
    End  
     
   End  
  End  
end  
if @ResultType = 1
   return @Enroll  
else if @ResultType = 2
   return @Type
return ''''
End
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_PatientModulesIds_Futures]    Script Date: 6/6/2018 4:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_PatientModulesIds_Futures]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[fn_PatientModulesIds_Futures]        
(         
 @ModuleId int        
)        
Returns varchar(Max)            
as            
BEGIN          
        
Declare @Ptn_pks varchar(Max)           
    -- set @Module = ''''         
--Select DISTINCT @Ptn_pks=COALESCE (@Ptn_pks+'', '','''')+Convert(varchar, a.Ptn_pk)         
--From lnk_patientProgramstart a,mst_module b         
--Where a.ModuleId=@ModuleId        
Select DISTINCT @Ptn_pks=Convert(varchar, a.Ptn_pk)         
From lnk_patientProgramstart a,mst_module b         
Where a.ModuleId=@ModuleId          

return @Ptn_pks        
         
END
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_PatientProf_CD4CommaSeparatedLabConstella]    Script Date: 6/6/2018 4:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_PatientProf_CD4CommaSeparatedLabConstella]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[fn_PatientProf_CD4CommaSeparatedLabConstella]  
(        
 @VisitDate datetime,        
 @Ptn_pk int        
)        
RETURNS varchar(4000)        
AS        
BEGIN        
 DECLARE @CommaLab1 nvarchar(4000);      
 DECLARE @CommaLab nvarchar(4000)        
 declare @LabName nvarchar(4000);        
 declare @LabResult nvarchar(1000);  
 declare @LabUnit nvarchar(1000);      
 declare  cr_Lab cursor for         
   
select SubTestName,        
 convert(varchar,TestResults) as TestResultsnew,md.Name as Unit        
 from dtl_patientLabResults plr         
 inner join ord_PatientLabOrder plo on plr.labid=plo.labid        
 inner join lnk_TestParameter tp on plr.labTestId=tp.TestId  and plr.parameterId=tp.SubTestId  
 --inner join lnk_LabValue lv on lv.SubTestID=tp.TestId and lv.SubTestID=plr.LabTestID       
 inner join mst_Decode md on md.ID=plr.Units 
 --inner join mst_Code mc on mc.CodeID=md.CodeId          
 where plo.ptn_pk=@ptn_pk and (plo.DeleteFlag!=1 or plo.DeleteFlag is null)        
    and Plr.Parameterid in (1,2)      
 and TestResults is not null and plo.ReportedByDate=@VisitDate   
  
 union      
   
 select SubTestName,        
 TestResults1 as TestResultsnew ,Stuff(''0'', 1,1,'''')[Unit]         
 from dtl_patientLabResults plr         
 inner join ord_PatientLabOrder plo on plr.labid=plo.labid        
 inner join lnk_TestParameter tp on plr.labTestId=tp.TestId  and plr.parameterId=tp.SubTestId        
 where plo.ptn_pk=@ptn_pk and (plo.DeleteFlag!=1 or plo.DeleteFlag is null)        
    and Plr.Parameterid in (1,2)      
 and TestResults1 != ''''  and plo.ReportedByDate=@VisitDate   
  
open cr_Lab            
             
 fetch next from cr_Lab into @LabName,@LabResult,@LabUnit        
 while @@FETCH_STATUS = 0            
 begin            
  if @LabName is not null             
  begin            
  if @CommaLab is null             
    begin set @CommaLab = @LabName + ''-'' + @LabResult + ''-'' + @LabUnit ;        end    
   else            
    BEGIN     
  set @CommaLab = @CommaLab + '';'' + @LabName + ''-'' + @LabResult + ''-'' + @LabUnit ; END            
  end            
  fetch  next from cr_Lab into @LabName,@LabResult,@LabUnit            
 end      
  
 close cr_Lab;     
 Deallocate cr_Lab;        
 RETURN @CommaLab;        
END
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_PatientProf_CommaSeparatedDate]    Script Date: 6/6/2018 4:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_PatientProf_CommaSeparatedDate]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[fn_PatientProf_CommaSeparatedDate]
(
	@Id int,
    @Ptn_pk int
	
)
RETURNS varchar(4000)
AS
BEGIN

	DECLARE @CommaDate nvarchar(1000)
	declare @PatientDiseaseDate nvarchar(15);
	declare @PatientVisitDate nvarchar(15);
	declare  cr_PatientDisease cursor for select 
			convert(varchar,PD.DateOfDisease,103),convert(varchar,V.VisitDate,103) from dtl_PatientDisease PD 
			join mst_HivDisease HD On PD.Disease_Pk=HD.Id Join ord_Visit V on V.visit_id=PD.Visit_pk      
			where PD.Ptn_Pk=@Ptn_pk   and HD.ID=@Id
			and HD.ID not in (94,95,96,97,98,99)  
			order by Name , V.VisitDate asc     

	open cr_PatientDisease
	
	fetch next from cr_PatientDisease into @PatientDiseaseDate,@PatientVisitDate
	while @@FETCH_STATUS = 0
	begin
		if @PatientDiseaseDate is not null
		begin
			--return 0;
			if @CommaDate is null 
				set @CommaDate = @PatientDiseaseDate ;
			else
				set @CommaDate = @CommaDate + '', '' + @PatientDiseaseDate;
		end
		else
		begin
			--return 1;
			If @CommaDate is null
			begin
				--return 0;
				set @CommaDate =  @PatientVisitDate;
			end
			else
			begin
				--return 1;
				set @CommaDate = @CommaDate + '', '' + @PatientVisitDate;
			end
		end
		fetch  next from cr_PatientDisease into @PatientDiseaseDate,@PatientVisitDate
	end
	close cr_PatientDisease;
	Deallocate cr_PatientDisease;

	RETURN @CommaDate;


END
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_PatientProf_CommaSeparatedDateConstella]    Script Date: 6/6/2018 4:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_PatientProf_CommaSeparatedDateConstella]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[fn_PatientProf_CommaSeparatedDateConstella]        
(        
 @Id int,        
 @Ptn_pk int        
         
)        
RETURNS varchar(4000)        
AS        
BEGIN        
        
 DECLARE @CommaDate nvarchar(1000)        
 declare @PatientDiseaseDate nvarchar(15);        
 declare @PatientVisitDate nvarchar(15);        
 declare  cr_PatientDisease cursor for 
  select         
   Nullif(convert(varchar,PD.DateOfDisease,106), ''''),
   convert(varchar,V.VisitDate,106) from dtl_PatientDisease PD     
   join mst_HivDisease HD On PD.Disease_Pk=HD.Id Join ord_Visit V on V.visit_id=PD.Visit_pk              
   where PD.Ptn_Pk=@Ptn_pk and HD.DeleteFlag!=1 and (v.DeleteFlag!=1 or v.DeleteFlag is null)and HD.ID=@Id  
   and HD.SectionId = 1   
   order by Name, V.VisitDate asc             
        
 open cr_PatientDisease        
         
 fetch next from cr_PatientDisease into @PatientDiseaseDate,@PatientVisitDate        
 while @@FETCH_STATUS = 0        
 Begin        
  if @PatientDiseaseDate is not null        
  Begin        
   if @CommaDate is null         
    set @CommaDate = @PatientDiseaseDate ;        
   else        
    set @CommaDate = @CommaDate + '', '' + @PatientDiseaseDate;        
  End        
  else        
  Begin        
   If @CommaDate is null        
   begin        
   -- set @CommaDate =  @PatientVisitDate;
	set @CommaDate =  @PatientDiseaseDate;         
   end        
   else        
   begin        
   --set @CommaDate = @CommaDate + '', '' + @PatientVisitDate ;
	 set @CommaDate = @CommaDate + '', '' + @PatientDiseaseDate ;        
   end        
  End        
  fetch  next from cr_PatientDisease into @PatientDiseaseDate,@PatientVisitDate        
 End
 close cr_PatientDisease;        
 Deallocate cr_PatientDisease;        
        
 RETURN @CommaDate;        
    
END
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_PatientProf_CommaSeparatedLabConstella]    Script Date: 6/6/2018 4:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_PatientProf_CommaSeparatedLabConstella]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[fn_PatientProf_CommaSeparatedLabConstella]             
            
(                  
 @VisitDate datetime,                  
 @Ptn_pk int                  
                   
)                  
RETURNS varchar(4000)                  
AS                  
BEGIN                  
                  
 DECLARE @CommaLab nvarchar(4000);          
 DECLARE @CommaLab1 nvarchar(4000);                 
 declare @LabName nvarchar(4000);                  
 declare @LabResult nvarchar(1000);                  
 declare @LabUnit nvarchar(1000);            
 declare  cr_Lab cursor for             
                
--Commented by Jayant on 03-March-2008            
/*select SubTestName,                  
 convert(varchar,TestResults) as TestResultsnew,md.Name as Unit              
 from dtl_patientLabResults plr                   
 inner join ord_PatientLabOrder plo on plr.labid=plo.labid                  
 inner join lnk_TestParameter tp on plr.labTestId=tp.TestId  and plr.parameterId=tp.SubTestId            
 inner join lnk_LabValue lv on lv.SubTestID=tp.TestId             
 inner join mst_Decode md on md.ID=lv.UnitID            
 inner join mst_Code mc on mc.CodeID=md.CodeId            
 where plo.ptn_pk=@ptn_pk             
 and (plo.DeleteFlag!=1 or plo.DeleteFlag is null)                  
 and Plr.Parameterid not in (1,2,15,14,16,17,18,19,23,24,25,55,53)                
 and TestResults is not null and plo.ReportedByDate=@VisitDate             
 and md.CodeID=30            
 and lv.DefaultUnit=1   */          
          
          
select SubTestName,                  
 convert(varchar,TestResults) as TestResultsnew,md.Name as Unit              
 from dtl_patientLabResults plr                   
 inner join ord_PatientLabOrder plo on plr.labid=plo.labid                  
 inner join lnk_TestParameter tp on plr.labTestId=tp.TestId  and plr.parameterId=tp.SubTestId            
 --inner join lnk_LabValue lv on lv.SubTestID=tp.TestId and lv.SubTestID=plr.LabTestID             
 inner join mst_Decode md on md.ID=plr.Units --and md.ID=lv.UnitID            
 inner join mst_Code mc on mc.CodeID=md.CodeId            
 where plo.ptn_pk=@ptn_pk             
 and (plo.DeleteFlag!=1 or plo.DeleteFlag is null)                  
 and Plr.Parameterid not in (1,2,15,14,16,17,18,19,23,24,25,55,53)                
 and TestResults is not null and plo.ReportedByDate=@VisitDate            
 --and md.CodeID=30          
         
 union           
             
 select SubTestName, Case (TestResults) when ''0'' then ''Absent'' else ''Present'' end as TestResultsnew, Stuff(''0'', 1,1,'''')[Unit]                 
 from dtl_patientLabResults plr                   
 inner join ord_PatientLabOrder plo on plr.labid=plo.labid                  
 inner join lnk_TestParameter tp on plr.labTestId=tp.TestId  and plr.parameterId=tp.SubTestId                  
 where plo.ptn_pk=@ptn_pk and (plo.DeleteFlag!=1 or plo.DeleteFlag is null)                  
 and Plr.Parameterid =15                
 and TestResults is not null and plo.ReportedByDate=@VisitDate              
 union              
 select SubTestName, Case (TestResults) when ''0'' then ''Negative'' else ''Positive'' end as TestResultsnew , Stuff(''0'', 1,1,'''')[Unit]                  
 from dtl_patientLabResults plr                   
 inner join ord_PatientLabOrder plo on plr.labid=plo.labid                  
 inner join lnk_TestParameter tp on plr.labTestId=tp.TestId  and plr.parameterId=tp.SubTestId                  
 where plo.ptn_pk=@ptn_pk and (plo.DeleteFlag!=1 or plo.DeleteFlag is null)                  
 and Plr.Parameterid in (14,16,17,18,19,23,24,25,55,53)               
 and TestResults is not null and plo.ReportedByDate=@VisitDate         
             
union            
        
select SubTestName,lpr.Result TestResultsnew ,Stuff(''0'', 1,1,'''')[Unit]                 
 from dtl_patientLabResults plr                   
 inner join ord_PatientLabOrder plo on plr.labid=plo.labid                  
 inner join lnk_TestParameter tp on plr.labTestId=tp.TestId  and plr.parameterId=tp.SubTestId            
 inner join Lnk_ParameterResult lpr on lpr.ResultID=plr.TestResultId                  
 where plo.ptn_pk=@ptn_pk             
 and (plo.DeleteFlag!=1 or plo.DeleteFlag is null)                  
 and Plr.Parameterid not in (1,2,15,14,16,17,18,19,23,24,25,55,53)                
 and TestResultId is not null and plo.ReportedByDate=@VisitDate              
and TestResultId!=0           
            
union  
  
select SubTestName, TestResults1 as TestResultsnew,'''' as Unit              
 from dtl_patientLabResults plr                   
 inner join ord_PatientLabOrder plo on plr.labid=plo.labid                  
 inner join lnk_TestParameter tp on plr.labTestId=tp.TestId  and plr.parameterId=tp.SubTestId            
 --inner join lnk_LabValue lv on lv.SubTestID=tp.TestId and lv.SubTestID=plr.LabTestID             
 where plo.ptn_pk=@ptn_pk             
 and (plo.DeleteFlag!=1 or plo.DeleteFlag is null)                  
 and Plr.Parameterid not in (1,2,15,14,16,17,18,19,23,24,25,55,53)                
 and (TestResults1 is not null and ltrim(rtrim(TestResults1)) <> '''') and plo.ReportedByDate=@VisitDate           
 --and md.CodeID=30          
  
  
/* WITHOUT UNIT            
select SubTestName,                  
 convert(varchar,TestResults) as TestResultsnew                  
 from dtl_patientLabResults plr                   
 inner join ord_PatientLabOrder plo on plr.labid=plo.labid                  
 inner join lnk_TestParameter tp on plr.labTestId=tp.TestId  and plr.parameterId=tp.SubTestId                  
 where plo.ptn_pk=@ptn_pk             
 and (plo.DeleteFlag!=1 or plo.DeleteFlag is null)                  
 and Plr.Parameterid not in (1,2,15,14,16,17,18,19,23,24,25,55,53)                
 and TestResults is not null and plo.ReportedByDate=@VisitDate                   
 union                
 select SubTestName, Case (TestResults) when ''0'' then ''Absent'' else ''Present'' end as TestResultsnew                  
 from dtl_patientLabResults plr                   
 inner join ord_PatientLabOrder plo on plr.labid=plo.labid                  
 inner join lnk_TestParameter tp on plr.labTestId=tp.TestId  and plr.parameterId=tp.SubTestId                  
 where plo.ptn_pk=@ptn_pk and (plo.DeleteFlag!=1 or plo.DeleteFlag is null)                  
 and Plr.Parameterid =15                
 and TestResults is not null and plo.ReportedByDate=@VisitDate               
 union              
 select SubTestName, Case (TestResults) when ''0'' then ''Negative'' else ''Positive'' end as TestResultsnew                  
 from dtl_patientLabResults plr                   
 inner join ord_PatientLabOrder plo on plr.labid=plo.labid                  
 inner join lnk_TestParameter tp on plr.labTestId=tp.TestId  and plr.parameterId=tp.SubTestId                  
 where plo.ptn_pk=@ptn_pk and (plo.DeleteFlag!=1 or plo.DeleteFlag is null)                  
 and Plr.Parameterid in (14,16,17,18,19,23,24,25,55,53)               
 and TestResults is not null and plo.ReportedByDate=@VisitDate              
union            
select SubTestName,lpr.Result TestResultsnew                 
 from dtl_patientLabResults plr                   
 inner join ord_PatientLabOrder plo on plr.labid=plo.labid                  
 inner join lnk_TestParameter tp on plr.labTestId=tp.TestId  and plr.parameterId=tp.SubTestId            
 inner join Lnk_ParameterResult lpr on lpr.ResultID=plr.TestResultId                  
 where plo.ptn_pk=@ptn_pk             
 and (plo.DeleteFlag!=1 or plo.DeleteFlag is null)                  
 and Plr.Parameterid not in (1,2,15,14,16,17,18,19,23,24,25,55,53)                
 and TestResultId is not null and plo.ReportedByDate=@VisitDate                
and TestResultId!=0            
*/           
                 
open cr_Lab                  
                   
 fetch next from cr_Lab into @LabName,@LabResult,@LabUnit              
 while @@FETCH_STATUS = 0                  
 begin                  
  if @LabName is not null 
                  
  begin                  
  if @CommaLab is null                   
    begin set @CommaLab = @LabName + ''-'' + @LabResult + ''-'' + @LabUnit ;        end          
   else                  
    BEGIN           
  set @CommaLab = @CommaLab + '';'' + @LabName + ''-'' + @LabResult + ''-'' + @LabUnit ;  END 
  
  end 
       
  fetch  next from cr_Lab into @LabName,@LabResult,@LabUnit                  
 end            
 close cr_Lab;           
         
 Deallocate cr_Lab;                  
 RETURN @CommaLab            
END
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_PatientProf_ViralLoadCommaSeparatedLabConstella]    Script Date: 6/6/2018 4:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_PatientProf_ViralLoadCommaSeparatedLabConstella]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[fn_PatientProf_ViralLoadCommaSeparatedLabConstella]  

(

 @VisitDate datetime, 
 @Ptn_pk int

) 

RETURNS varchar(4000) 
AS   
BEGIN 
 DECLARE @CommaLab1 nvarchar(4000);

 DECLARE @CommaLab nvarchar(4000) 
 declare @LabName nvarchar(4000); 
 declare @LabResult nvarchar(1000);
 declare @LabUnit nvarchar(1000); 

 declare  cr_Lab cursor for  


   



select SubTestName,        



 convert(varchar,TestResults) as TestResultsnew,md.Name as Unit        



 from dtl_patientLabResults plr         



 inner join ord_PatientLabOrder plo on plr.labid=plo.labid        



 inner join lnk_TestParameter tp on plr.labTestId=tp.TestId  and plr.parameterId=tp.SubTestId  



 --inner join lnk_LabValue lv on lv.SubTestID=tp.TestId and lv.SubTestID=plr.LabTestID       



 LEFT join mst_Decode md on md.ID=plr.Units 



 --inner join mst_Code mc on mc.CodeID=md.CodeId          



 where plo.ptn_pk=@ptn_pk and (plo.DeleteFlag!=1 or plo.DeleteFlag is null)        



    and Plr.Parameterid =3      



 and TestResults is not null and plo.ReportedByDate=@VisitDate   



  



 union      



   



 select SubTestName,        



 TestResults1 as TestResultsnew ,Stuff(''0'', 1,1,'''')[Unit]         



 from dtl_patientLabResults plr         



 inner join ord_PatientLabOrder plo on plr.labid=plo.labid        



 inner join lnk_TestParameter tp on plr.labTestId=tp.TestId  and plr.parameterId=tp.SubTestId        



 where plo.ptn_pk=@ptn_pk and (plo.DeleteFlag!=1 or plo.DeleteFlag is null)        



    and Plr.Parameterid =3      



 and TestResults1 != ''''  and plo.ReportedByDate=@VisitDate   



  



open cr_Lab            



             



 fetch next from cr_Lab into @LabName,@LabResult,@LabUnit        



 while @@FETCH_STATUS = 0            



 begin            



  if @LabName is not null             



  begin            



  if @CommaLab is null

               



    begin 

	if(@LabUnit IS NOT NULL)

		set @CommaLab = @LabName + ''-'' + @LabResult + ''-'' + NULLIF(@LabUnit,'''') ;

	ELSE

	   set @CommaLab = @LabName + ''-'' + @LabResult  ;

	--set @CommaLab = @LabName + ''-'' + @LabResult + ''-'' + @LabUnit ;        

	end    



   else            



    BEGIN     

		if(@LabUnit IS NOT NULL)

		set @CommaLab = @CommaLab + '';'' + @LabName + ''-'' + @LabResult + ''-'' + NULLIF(@LabUnit,'''')  ;

	ELSE

	   set @CommaLab = @CommaLab + '';'' + @LabName + ''-'' + @LabResult  ;

	--set @CommaLab = @CommaLab + '';'' + @LabName + ''-'' + @LabResult + ''-'' + @LabUnit ; 

  

  END            



  end            



  fetch  next from cr_Lab into @LabName,@LabResult,@LabUnit            



 end      



  



 close cr_Lab;     



 Deallocate cr_Lab;        



 RETURN @CommaLab;        



END












' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_patientsymptoms]    Script Date: 6/6/2018 4:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_patientsymptoms]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'create FUNCTION [dbo].[fn_patientsymptoms](
    @ID VARCHAR(50) -- List of delimited items
  
) RETURNS VARCHAR(MAX)

BEGIN
Declare @Name varchar(Max)
select @Name=Name from mst_symptom  where ID=@ID

RETURN @Name
END
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_RegimenID_Constella]    Script Date: 6/6/2018 4:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_RegimenID_Constella]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[fn_RegimenID_Constella]  
(  
 @ptn_pk int,  
 @locationid int,
 @eddt datetime  
)  
RETURNS int  
AS  
Begin  
 Declare @pharmacy_Pk int  
  
 DECLARE regimen_cursor CURSOR  
 FOR SELECT b.ptn_pharmacy_pk from mst_patient a,   
    ord_patientpharmacyorder b, dtl_patientpharmacyorder c where  
    a.ptn_pk=b.ptn_pk and a.locationid = @locationid and a.ptn_pk = @ptn_pk and (a.deleteflag is null or a.deleteflag = 0)   
 and (b.deleteflag is null or b.deleteflag = 0) and  b.dispensedbydate <= @eddt and 
    b.ptn_pharmacy_pk = c.ptn_pharmacy_pk   
      order by b.dispensedbydate desc   
 Declare @RegimenID int  
   
  OPEN regimen_cursor  
  FETCH NEXT FROM regimen_cursor into  @pharmacy_Pk  
  WHILE @@FETCH_STATUS = 0  
  Begin  
  Select @RegimenID=Max(regimenID) from dtl_patientpharmacyorder a  
  where a.ptn_pharmacy_pk = @pharmacy_Pk  
    
  if (@regimenID > 0)  
   Begin  
   return @regimenID  
   End  
  fetch  next from regimen_cursor into @pharmacy_Pk;  
    End  
 close regimen_cursor;  
 Deallocate regimen_cursor;  
 return 0  
End
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_Split]    Script Date: 6/6/2018 4:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_Split]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'Create FUNCTION [dbo].[fn_Split](
    @sInputList VARCHAR(8000) -- List of delimited items
  , @sDelimiter VARCHAR(8000) = '','' -- delimiter that separates items
) RETURNS @List TABLE (item VARCHAR(8000))

BEGIN
DECLARE @sItem VARCHAR(8000)
WHILE CHARINDEX(@sDelimiter,@sInputList,0) <> 0
 BEGIN
 SELECT
  @sItem=RTRIM(LTRIM(SUBSTRING(@sInputList,1,CHARINDEX(@sDelimiter,@sInputList,0)-1))),
  @sInputList=RTRIM(LTRIM(SUBSTRING(@sInputList,CHARINDEX(@sDelimiter,@sInputList,0)+LEN(@sDelimiter),LEN(@sInputList))))
 
 IF LEN(@sItem) > 0
  INSERT INTO @List SELECT @sItem
 END

IF LEN(@sInputList) > 0
 INSERT INTO @List SELECT @sInputList -- Put the last item in
RETURN
END
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_SplitRegimen_Constella]    Script Date: 6/6/2018 4:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_SplitRegimen_Constella]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[fn_SplitRegimen_Constella](    
    @sInputList VARCHAR(8000) -- List of delimited items    
  , @sDelimiter VARCHAR(8000) = ''-'' -- delimiter that separates items    
) RETURNS VARCHAR(8000)    
    
BEGIN    
Set @sInputList = @sInputList+''-''    
DECLARE @sItem VARCHAR(8000), @ItemConcate varchar(8000),@SumItemConcate varchar(8000)    
Set @SumItemConcate=''''    
    
WHILE CHARINDEX(@sDelimiter,@sInputList,0) <> 0    
 BEGIN    
 SELECT    
  @sItem=RTRIM(LTRIM(SUBSTRING(@sInputList,1,CHARINDEX(@sDelimiter,@sInputList,0)-1))),    
  @sInputList=RTRIM(LTRIM(SUBSTRING(@sInputList,CHARINDEX(@sDelimiter,@sInputList,0)+LEN(@sDelimiter),LEN(@sInputList))))    
     
 IF LEN(@sItem) > 0    
-- select @ItemConcate=DrugName from (Select a.drug_pk[DrugId], a.GenericAbbrevation[Abbr],        
-- a.DrugName[DrugName], 0 [Generic],a.DrugTypeId                 
-- from mst_drug a where  a.deleteflag = 0 and a.DrugTypeId = 37 and         
-- a.GenericAbbrevation is not null              
       
select @ItemConcate=DrugName from (Select a.drug_pk[DrugId],   
 dbo.fn_GetFixedDoseDrugAbbrevation(a.drug_pk)[Abbr],        
 a.DrugName[DrugName], 0 [Generic], dbo.fn_GetDrugTypeId_futures(a.drug_pk) [DrugTypeId]            
 from mst_drug a where  a.deleteflag = 0 and dbo.fn_GetDrugTypeId_futures(a.drug_pk)  = 37  
and   dbo.fn_GetFixedDoseDrugAbbrevation(a.drug_pk) is not null              
     
 union          
            
 Select a.GenericId [DrugId],         
 a.GenericAbbrevation[Abbr], a.GenericName [DrugName],a.GenericId [Generic],b.drugTypeId          
 from mst_generic a,lnk_drugtypegeneric b           
 where a.genericid = b.genericid and a.deleteflag = 0 and b.drugtypeid = 37          
 and a.GenericAbbrevation is not null ) z where Abbr=@sItem    
 set @SumItemConcate = @SumItemConcate + '','' + @ItemConcate     
  
---- Select a.GenericId [DrugId],         
---- a.GenericAbbrevation[Abbr], a.GenericName [DrugName],a.GenericId [Generic],b.drugTypeId          
---- from mst_generic a,lnk_drugtypegeneric b           
---- where a.genericid = b.genericid and a.deleteflag = 0 and b.drugtypeid = 37          
---- and a.GenericAbbrevation is not null ) z where Abbr=@sItem    
---- set @SumItemConcate = @SumItemConcate + '','' + @ItemConcate   
       
 END    
RETURN substring(@SumItemConcate, 2, len(@sumItemConcate))    
END
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_stripsingleQuote]    Script Date: 6/6/2018 4:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_stripsingleQuote]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'Create Function [dbo].[fn_stripsingleQuote]
    (
	@strStrip varchar(Max)
	)
    returns varchar(max)
as
begin
    declare @CleanString varchar(Max)
    SET @CleanString=(Replace(@strStrip,'''''''',''''))
    return @CleanString
end


' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_Sum_of_Duration_Constella]    Script Date: 6/6/2018 4:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_Sum_of_Duration_Constella]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[fn_Sum_of_Duration_Constella]
(  
 @ptn_pk int,
 @locationid int
)
returns int
as
begin

 declare @Pharmacy_Pk int
 declare @max int
 declare @sum int 

 set @Max = 0
 set @sum = 0

 DECLARE sumofduration_cursor cursor

  for select ptn_pharmacy_pk from ord_patientpharmacyorder  where 
	ptn_pk = @ptn_pk  and locationid = @locationid
	and (deleteflag is null or deleteflag = 0)

 


open sumofduration_cursor

fetch next from sumofduration_cursor into @Pharmacy_Pk

while @@fetch_status = 0

begin

  Select @max=Max(duration) from dtl_patientpharmacyorder    
  where ptn_pharmacy_pk = @pharmacy_Pk 
 

set @sum = @sum + @max

set @max=0

fetch  next from sumofduration_cursor into @pharmacy_Pk;


--return @sum

end 

close sumofduration_cursor;  
Deallocate sumofduration_cursor;
return @sum 
end
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_tstPreg]    Script Date: 6/6/2018 4:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_tstPreg]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'--select dbo.fn_tstPreg(3)

CREATE function [dbo].[fn_tstPreg]
(
@Ptn_Pk int
)
returns varchar(3000)
as
begin
	declare @retPreg as varchar(3000)
	declare @Preg as varchar(5)
	declare cur cursor for select Pregnant from VW_PatientClinicalStatus where ptn_pk=@Ptn_Pk
	open cur
	fetch next from cur into @Preg
	while @@fetch_status=0
	begin
		
		if @Preg is not null
		begin 
			
			if @retPreg is null 
			begin 
				--return 0
				set @retPreg=@Preg
			end
			else
			begin
				set @retPreg=@retPreg + '', '' + @Preg
			end
		end	
		fetch next from cur into @Preg
	end
	close cur
	deallocate cur
	return @retPreg
end
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_ViewExistingFormUsername]    Script Date: 6/6/2018 4:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_ViewExistingFormUsername]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[fn_ViewExistingFormUsername] -- used from druglist - concatenate genericAbbreviation 
	(@VisitPk INT)
RETURNS VARCHAR(max)
AS
BEGIN
	DECLARE @UserName VARCHAR(100) = stuff((
				SELECT '', '' + username
				FROM (
					SELECT DISTINCT d.UserFirstName + '' '' + d.UserLastName [username]
					FROM (
						SELECT mst.UserFirstName
							,mst.UserLastName
						FROM lnk_FormTabOrdVisit lnk
						INNER JOIN mst_User mst ON mst.UserID = lnk.UserId
						WHERE lnk.Visit_pk = @VisitPk
						) d
					) test
				FOR XML path('''')
				), 1, 1, '''')

	RETURN @UserName
END


' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fnCalculate_Nutritional_Assessment]    Script Date: 6/6/2018 4:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fnCalculate_Nutritional_Assessment]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'/*  
var BMI = weight / ((height / 100) * (height / 100));
if (age > 15) { if (BMI < 18.5) {UnderWeight}}
if (age > 15) { if (BMI >= 18.5 && BMI < 25) {Normal}}
if (age > 15) { if (BMI > 25 && BMI < 30) {OverWeight}}
if (age > 15) { BMI >= 30) {Obese}}
  
SELECT dbo.Calculate_Nutritional_Assessment (798,25789)
 select * from dtl_patientvitals where ptn_pk = 798

 SELECT * FROM ORD_VISIT WHERE PTN_PK = 798
*/
  
CREATE FUNCTION [dbo].[fnCalculate_Nutritional_Assessment](@PatientID BIGINT, @Visit_Id BIGINT)  
	RETURNS VARCHAR(25) AS
		BEGIN   
			Declare @NutritionalAssessment Varchar(15), @Height decimal(10,2), @Weight decimal(10,2), @Age int, @BMI INT;

			SET @Age = (Select DISTINCT datediff(yy, dob, getdate()) from mst_patient p Where p.Ptn_Pk =  @PatientID); 

			SET @Height = (Select DISTINCT V.Height from dtl_patientvitals V JOIN mst_patient M on V.Ptn_Pk = M.Ptn_Pk and V.LocationID = M.LocationID
						   JOIN Ord_Visit OV on OV.Ptn_Pk = V.Ptn_Pk and V.Visit_Pk = OV.Visit_Id WHERE V.Ptn_Pk = @PatientID AND ov.Visit_Id = @Visit_Id
						   AND ISNULL(V.Height,0) <> 0 AND ISNULL(V.Weight,0) <> 0); 
			
			SET @Weight = (Select DISTINCT V.Weight from dtl_patientvitals V JOIN mst_patient M on V.Ptn_Pk = M.Ptn_Pk and V.LocationID = M.LocationID
						   JOIN Ord_Visit OV on OV.Ptn_Pk = V.Ptn_Pk and V.Visit_Pk = OV.Visit_Id WHERE V.Ptn_Pk = @PatientID AND ov.Visit_Id = @Visit_Id
						    AND ISNULL(V.Height,0) <> 0 AND ISNULL(V.Weight,0) <> 0);

			SET @BMI =   @Weight / ((@Height / 100) * (@Height / 100));
			IF  (@Age > 15) 
				BEGIN
					IF (@BMI < 18.5) 
						begin 
							SET @NutritionalAssessment = ''UnderWeight''
						end
					IF ( @BMI >= 18.5 AND @BMI < 25) 
						begin 
							SET @NutritionalAssessment = ''Normal''
						end
					IF (@BMI > 25 AND @BMI < 30) 
						begin 
							SET @NutritionalAssessment = ''OverWeight''
						end
					IF (@BMI >= 30) 
						begin 
							SET @NutritionalAssessment = ''Obese''
						end
				END
RETURN @NutritionalAssessment  
END  

  
  


' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fnCheckDate]    Script Date: 6/6/2018 4:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fnCheckDate]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[fnCheckDate]
(@InDate nvarchar(50))
RETURNS DATETIME
AS
    BEGIN
        declare @Return DATETIME

        select @return = CASE WHEN ISDATE(@InDate) = 1
                            THEN CASE WHEN CAST(@InDate as DATETIME) BETWEEN ''1/1/1901 12:00:00 AM'' AND ''6/6/2079 12:00:00 AM''
                                    THEN @InDate
                                    ELSE null
                                    END
                            ELSE null
                            END
        return @return
    END


' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fnFormatDate]    Script Date: 6/6/2018 4:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fnFormatDate]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE function [dbo].[fnFormatDate] 
( 
   
@inputDate datetime
) 
returns varchar(20) as
begin
    
declare @returnValue varchar(25) 
 
Select @returnValue= DATENAME(DAY,@inputDate) + ''-'' + Convert(varchar(3),DATENAME(MONTH,@inputDate),100) + ''-'' + DATENAME(YEAR, @inputDate) 


-- Return the formated value 
   
return @returnValue 
end
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fnGetModulename]    Script Date: 6/6/2018 4:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fnGetModulename]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[fnGetModulename] (@moduleid INT)
RETURNS VARCHAR(100)

BEGIN
	DECLARE @vModuleName VARCHAR(100)

	SELECT @vModuleName = modulename
	FROM mst_module
	WHERE ModuleID = @moduleid

	RETURN @vModuleName
END


' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fnGetParmTilte]    Script Date: 6/6/2018 4:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fnGetParmTilte]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE  FUNCTION [dbo].[fnGetParmTilte](@RID INT,@Message VARCHAR(8000))    
RETURNS VARCHAR(5000) AS    
BEGIN   
 RETURN  
 (  
  select ltrim(rtrim(ItemId)) from dbo.fnParseDelimitedList(@Message,'','') WHERE RID = @RID  
 )  
END
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fnGetParmTilte_new]    Script Date: 6/6/2018 4:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fnGetParmTilte_new]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE  FUNCTION [dbo].[fnGetParmTilte_new](@RID INT,@Message VARCHAR(8000))            
RETURNS VARCHAR(5000) AS            
BEGIN           
 RETURN          
 (          
  select ltrim(rtrim(ItemId)) from dbo.fnParseDelimitedList(@Message,'','') WHERE RID = @RID          
 )          
END
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fnGetParmTilteForHighphen]    Script Date: 6/6/2018 4:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fnGetParmTilteForHighphen]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE  FUNCTION [dbo].[fnGetParmTilteForHighphen](@RID INT,@Message VARCHAR(8000))      
RETURNS VARCHAR(5000) AS      
BEGIN     
 RETURN    
 (    
  select ltrim(rtrim(ItemId)) from dbo.fnParseDelimitedList(@Message,''-'') WHERE RID = @RID    
 )    
END
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fnParseDelimitedList]    Script Date: 6/6/2018 4:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fnParseDelimitedList]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'--select dbo.fn_ParseTilteDelimitedList(''zz~dd~ww~rr'')  

CREATE   FUNCTION [dbo].[fnParseDelimitedList]
(
   @TilteDelimitedList varchar(8000),
   @Seperator char(1)
)
RETURNS @TableVar TABLE (RID int,ItemID varchar(500) NOT NULL ) 
AS
BEGIN
	DECLARE @IDListPosition int 
	DECLARE @IDList varchar(8000)
	DECLARE @ArrValue varchar(8000) 
	DECLARE @RID int
    SET @IDList = COALESCE(@TilteDelimitedList, '''') 
    IF @IDList <> '''' 
    BEGIN 
	    -- Add comma to end of list so user doesn''t have to 
	    SET @IDList = @IDList + @Seperator
	    -- Loop through the comma demlimted string list 
		set @RID=0
	    WHILE PATINDEX(''%''+@Seperator+''%'' , @IDList ) <> 0 
	    BEGIN 
			set @RID=@RID+1
	        SELECT @IDListPosition = PATINDEX(''%''+@Seperator+''%'' , @IDList) 
	        SELECT @ArrValue = LEFT(@IDList, @IDListPosition - 1) 
	        -- Insert parsed ID into TableVar for "where in select"
	        INSERT INTO @TableVar (RID,ItemID) VALUES (@RID,@ArrValue) 
	        -- Remove processed string 
	        SELECT @IDList = STUFF(@IDList, 1, @IDListPosition, '''') 
	     END 
	END
	RETURN
END
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fnParseTilteDelimitedList]    Script Date: 6/6/2018 4:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fnParseTilteDelimitedList]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE   FUNCTION [dbo].[fnParseTilteDelimitedList]
(
   @TilteDelimitedList varchar(8000)
   
)
RETURNS @TableVar TABLE (RID int,ItemID varchar(500) NOT NULL ) 
AS
BEGIN
	DECLARE @IDListPosition int 
	DECLARE @IDList varchar(8000)
	DECLARE @ArrValue varchar(8000) 
	DECLARE @RID int
    SET @IDList = COALESCE(@TilteDelimitedList, '''''''') 
    IF @IDList <> '''''''' 
    BEGIN 
	    -- Add comma to end of list so user doesn''''t have to 
	    SET @IDList = @IDList + '''''',''''''
	    -- Loop through the comma demlimted string list 
		set @RID=0
	    WHILE PATINDEX(''''''%,%'''''' , @IDList ) <> 0 
	    BEGIN 
			set @RID=@RID+1
	        SELECT @IDListPosition = PATINDEX(''''''%,%'''''' , @IDList) 
	        SELECT @ArrValue = LEFT(@IDList, @IDListPosition - 1) 
	        -- Insert parsed ID into TableVar for "where in select"
	        INSERT INTO @TableVar (RID,ItemID) VALUES (@RID,@ArrValue) 
	        -- Remove processed string 
	        SELECT @IDList = STUFF(@IDList, 1, @IDListPosition, '''''''') 
	     END 
	END
	RETURN
END
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fnSplit]    Script Date: 6/6/2018 4:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fnSplit]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[fnSplit](
    @sInputList VARCHAR(8000) -- List of delimited items
  , @sDelimiter VARCHAR(8000) = '','' -- delimiter that separates items
) RETURNS @List TABLE (item VARCHAR(8000))

BEGIN
DECLARE @sItem VARCHAR(8000)
WHILE CHARINDEX(@sDelimiter,@sInputList,0) <> 0
 BEGIN
 SELECT
  @sItem=RTRIM(LTRIM(SUBSTRING(@sInputList,1,CHARINDEX(@sDelimiter,@sInputList,0)-1))),
  @sInputList=RTRIM(LTRIM(SUBSTRING(@sInputList,CHARINDEX(@sDelimiter,@sInputList,0)+LEN(@sDelimiter),LEN(@sInputList))))
 
 IF LEN(@sItem) > 0
  INSERT INTO @List SELECT @sItem
 END

IF LEN(@sInputList) > 0
 INSERT INTO @List SELECT @sInputList -- Put the last item in
RETURN
END
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fnSplitRegmen]    Script Date: 6/6/2018 4:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fnSplitRegmen]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[fnSplitRegmen](
    @sInputList VARCHAR(8000) -- List of delimited items
  , @sDelimiter VARCHAR(8000) = ''-'' -- delimiter that separates items
) RETURNS @List TABLE (item VARCHAR(8000))

BEGIN
DECLARE @sItem VARCHAR(8000)
WHILE CHARINDEX(@sDelimiter,@sInputList,0) <> 0
 BEGIN
 SELECT
  @sItem=RTRIM(LTRIM(SUBSTRING(@sInputList,1,CHARINDEX(@sDelimiter,@sInputList,0)-1))),
  @sInputList=RTRIM(LTRIM(SUBSTRING(@sInputList,CHARINDEX(@sDelimiter,@sInputList,0)+LEN(@sDelimiter),LEN(@sInputList))))
 
 IF LEN(@sItem) > 0
  Select @sItem=GenericName from mst_generic where GenericAbbrevation=@sItem
  INSERT INTO @List select @sItem
 END

IF LEN(@sInputList) > 0
 Select @sInputList=GenericName from mst_generic where GenericAbbrevation=@sInputList
 INSERT INTO @List SELECT @sInputList -- Put the last item in
RETURN
END
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fun_GetGenDrugAbbr_Constella]    Script Date: 6/6/2018 4:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fun_GetGenDrugAbbr_Constella]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'create function [dbo].[fun_GetGenDrugAbbr_Constella]  
(@DrugType varchar(1),   
@GenDrugID int)  
returns varchar(10)  
as  
BEGIN  
 declare @Abbr varchar(10)  
 set @Abbr='''';  
 if(@DrugType=''G'')  
    begin  
  set @Abbr=(select GenericAbbrevation from mst_Generic where GenericAbbrevation is not null   
           and GenericAbbrevation <>'''' and GenericID=@GenDrugID)  
    end  
 else  
    begin  
--     set @Abbr=(select GenericAbbrevation from mst_Drug where GenericAbbrevation is not null   
--           and GenericAbbrevation <>'''' and Drug_pk=@GenDrugID)
  set @Abbr=(select dbo.fn_GetFixedDoseDrugAbbrevation(Drug_pk) GenericAbbrevation 
  from mst_Drug where dbo.fn_GetFixedDoseDrugAbbrevation(Drug_pk) is not null   
          and dbo.fn_GetFixedDoseDrugAbbrevation(Drug_pk) <>'''' and Drug_pk=@GenDrugID)      
    end  
    return @Abbr  
END
' 
END
GO

/****** Object:  UserDefinedFunction [dbo].[RemoveNonAlphaCharacters]    Script Date: 6/6/2018 4:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RemoveNonAlphaCharacters]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'Create Function [dbo].[RemoveNonAlphaCharacters](@Temp VarChar(1000))
Returns VarChar(36)
AS
Begin

    Declare @KeepValues as varchar(50)
    Set @KeepValues = ''%[^a-z0-9#%_ ]%''
	set @temp = replace(@temp,'' '','''')
    While PatIndex(@KeepValues, @Temp) > 0
        Set @Temp = Stuff(@Temp, PatIndex(@KeepValues, @Temp), 1, ''_'')

    Return upper(left(replace(@Temp,'' '',''_''),36))
End
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[split]    Script Date: 6/6/2018 4:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[split]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[split]
(
	@csv nvarchar(max),
         @delim varchar(1)
)
RETURNS 
@entries TABLE 
(
	entry nvarchar(100)
)
AS
BEGIN
	DECLARE @commaindex int
	SELECT @commaindex = CHARINDEX(@delim, @csv)
	
	IF @commaindex > 0 
	BEGIN
		INSERT INTO @entries
		-- insert left side
		SELECT LTrim(RTrim(LEFT(@csv, @commaindex-1)))
		-- pass right side recursively
		UNION ALL
		SELECT entry
		FROM dbo.split(RIGHT(@csv, LEN(@csv) - @commaindex), @delim)		
	END
	ELSE
		INSERT INTO @entries
		SELECT LTrim(RTrim(@csv))
	
	RETURN
END
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[udf_GetGRNoteSellingPrice]    Script Date: 6/6/2018 4:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[udf_GetGRNoteSellingPrice]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[udf_GetGRNoteSellingPrice]
(@Item_pk int)
RETURNS Varchar(10)
AS
BEGIN
DECLARE @PurchaseUnit decimal(10,2), @DispenseUnit decimal(10,2)
DECLARE @RetrnValue decimal(10,2)
Select @PurchaseUnit=NULLIF(dbo.udf_GetNumeric(SUBSTRING(name,0, 6)),'''') from Mst_DispensingUnit where Id=(Select PurchaseUnit from mst_Drug where Drug_pk=@Item_pk) 
Select @DispenseUnit=NULLIF(dbo.udf_GetNumeric(SUBSTRING(name,0, 6)),'''') from Mst_DispensingUnit where Id=(Select DispensingUnit from mst_Drug where Drug_pk=@Item_pk)
Begin
Set @RetrnValue=((SELECT TOP 1 CustomSellingPrice
		FROM Dtl_GRNote WHERE ItemId = @Item_pk
		AND (DATEADD(dd, 0, DATEDIFF(dd, 0, ExpiryDate)) >= GETDATE())
		ORDER BY CreateDate DESC)/(@PurchaseUnit))*(@DispenseUnit)  
END
return @RetrnValue
END


' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[udf_GetNumeric]    Script Date: 6/6/2018 4:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[udf_GetNumeric]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[udf_GetNumeric]
(@strAlphaNumeric VARCHAR(256))
RETURNS VARCHAR(256)
AS
BEGIN
DECLARE @intAlpha INT
SET @intAlpha = PATINDEX(''%[^.0-9]%'', @strAlphaNumeric)
BEGIN
WHILE @intAlpha > 0
BEGIN
SET @strAlphaNumeric = STUFF(@strAlphaNumeric, @intAlpha, 1, '''')
SET @intAlpha = PATINDEX(''%[^.0-9]%'', @strAlphaNumeric )
END
END
RETURN ISNULL(@strAlphaNumeric,0)
END

' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[ufn_GetLastDayOfMonth]    Script Date: 6/6/2018 4:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ufn_GetLastDayOfMonth]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[ufn_GetLastDayOfMonth] ( @pInputDate    DATETIME )  
RETURNS DATETIME  
BEGIN  
  
    DECLARE @vOutputDate        DATETIME  
  
    SET @vOutputDate = CAST(YEAR(@pInputDate) AS VARCHAR(4)) + ''/'' +   
                       CAST(MONTH(@pInputDate) AS VARCHAR(2)) + ''/01''  
    SET @vOutputDate = DATEADD(DD, -1, DATEADD(M, 1, @vOutputDate))  
  
    RETURN @vOutputDate  
  
END
' 
END
GO




IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_getPatientNameDoubleMetaphone]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fn_getPatientNameDoubleMetaphone]
GO

/****** Object:  UserDefinedFunction [dbo].[fn_getPatientNameDoubleMetaphone]    Script Date: 25-May-2018 16:03:51 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[fn_getPatientNameDoubleMetaphone](@st VARCHAR(55)) 
RETURNS varchar(128) 

AS
BEGIN
	DECLARE @Length SMALLINT, @first SMALLINT, @Last SMALLINT, @pos SMALLINT, @prevpos SMALLINT, @is_slavo_germanic SMALLINT;
	DECLARE @pri VARCHAR(45) = '', @sec VARCHAR(45) = ''
	DECLARE @ch CHAR(1);
	-- returns the double metaphone code OR codes for given string
	-- if there is a @secondary dm it is separated with a semicolon
	-- there are no checks done on the input string, but it should be a single word OR name.
	--  st is short for string. I usually prefer descriptive over short, but this var is used a lot!

	SET @st = LTRIM(RTRIM(REPLACE(REPLACE(@st,'-',''),'''','')))
	SET @first = 3;
	SET @Length = LEN(@st);
	SET @Last = @first + @Length -1;

	SET @st = CONCAT(REPLICATE('-', @first -1), UPPER(@st), REPLICATE(' ', 5)); --  pad st so we can index beyond the begining AND end of the input string
	SET @is_slavo_germanic = CASE WHEN @st LIKE '%W%' OR @st LIKE '%K%' OR @st LIKE '%CZ%' THEN 1 ELSE 0 END;  -- the check for '%W%' will cat@ch WITZ
	SET @pos = @first; --  @pos is short for @position
	-- skip these silent letters IF at start of word
	IF SUBSTRING(@st, @first, 2) IN ('GN', 'KN', 'PN', 'WR', 'PS') 
    BEGIN
		SET @pos = @pos + 1;
	END
	--  Initial 'X' is pronounced 'Z' e.g. 'Xavier'
	IF SUBSTRING(@st, @first, 1) = 'X' 
	BEGIN
		SET @pri = 'S' SET @sec = 'S' SET @pos = @pos  + 1; -- 'Z' maps to 'S'
	END
	--  main loop through chars IN st
	WHILE @pos <= @Last 
	BEGIN --
		-- @print str(@pos) + '\t' + SUBSTRING(@st, @pos)
    SET @prevpos = @pos;
		SET @ch = SUBSTRING(@st, @pos, 1); --  @ch is short for character
		--CASE
		IF @ch IN ('A', 'E', 'I', 'O', 'U', 'Y') 
		BEGIN
			IF @pos = @first 
			BEGIN --  all init vowels now map to 'A'
				SET @pri = CONCAT(@pri, 'A') SET @sec = CONCAT(@sec, 'A') SET @pos = @pos  + 1; -- nxt = ('A', 1)
			END
			ELSE
				SET @pos = @pos + 1;
		END --end aeiouy
		--****
		IF @ch = 'B' 
		BEGIN
			-- '-mb', e.g', 'dumb', already skipped over... see 'M' below
			IF SUBSTRING(@st, @pos+1, 1) = 'B' 
			BEGIN
				SET @pri = CONCAT(@pri, 'P')SET @sec = CONCAT(@sec, 'P')SET @pos = @pos  + 2; -- nxt = ('P', 2)
			END
			ELSE
			BEGIN
				SET @pri = CONCAT(@pri, 'P')SET @sec = CONCAT(@sec, 'P')SET @pos = @pos  + 1; -- nxt = ('P', 1)
			END
		END			
		IF @ch = 'C' 
		BEGIN
			--  various germanic
			IF (@pos > (@first + 1) AND SUBSTRING(@st, @pos-2, 1) NOT IN ('A', 'E', 'I', 'O', 'U', 'Y') AND SUBSTRING(@st, @pos-1, 3) = 'ACH' AND
			   (SUBSTRING(@st, @pos+2, 1) NOT IN ('I', 'E') OR SUBSTRING(@st, @pos-2, 6) IN ('BACHER', 'MACHER'))) 
			BEGIN
				SET @pri = CONCAT(@pri, 'K')SET @sec = CONCAT(@sec, 'K')SET @pos = @pos  + 2; -- nxt = ('K', 2)
			END --  special case 'CAESAR'
			ELSE IF @pos = @first AND SUBSTRING(@st, @first, 6) = 'CAESAR' 
			BEGIN
				SET @pri = CONCAT(@pri, 'S')SET @sec = CONCAT(@sec, 'S')SET @pos = @pos  + 2; -- nxt = ('S', 2)
			END
			ELSE IF SUBSTRING(@st, @pos, 4) = 'CHIA' 
			BEGIN -- italian 'chianti'
				SET @pri = CONCAT(@pri, 'K')SET @sec = CONCAT(@sec, 'K')SET @pos = @pos  + 2; -- nxt = ('K', 2)
			END
			ELSE IF SUBSTRING(@st, @pos, 2) = 'CH' 
			BEGIN
				--  find 'michael'
				IF @pos > @first AND SUBSTRING(@st, @pos, 4) = 'CHAE' 
				BEGIN
					SET @pri = CONCAT(@pri, 'K')SET @sec = CONCAT(@sec, 'X')SET @pos = @pos  + 2; -- nxt = ('K', 'X', 2)
				END
				ELSE IF @pos = @first AND (SUBSTRING(@st, @pos+1, 5) IN ('HARAC', 'HARIS') OR  SUBSTRING(@st, @pos+1, 3) IN ('HOR', 'HYM', 'HIA', 'HEM')) AND SUBSTRING(@st, @first, 5) != 'CHORE' 
				BEGIN
					SET @pri = CONCAT(@pri, 'K')SET @sec = CONCAT(@sec, 'K')SET @pos = @pos  + 2; -- nxt = ('K', 2)
				END -- germanic, greek, OR otherwise 'ch' for 'kh' sound
				ELSE IF SUBSTRING(@st, @first, 4) IN ('VAN ', 'VON ') OR SUBSTRING(@st, @first, 3) = 'SCH' OR SUBSTRING(@st, @pos-2, 6) IN ('ORCHES', 'ARCHIT', 'ORCHID')
				   OR SUBSTRING(@st, @pos+2, 1) IN ('T', 'S') OR ((SUBSTRING(@st, @pos-1, 1) IN ('A', 'O', 'U', 'E') OR @pos = @first)
				   AND SUBSTRING(@st, @pos+2, 1) IN ('L', 'R', 'N', 'M', 'B', 'H', 'F', 'V', 'W', ' ')) 
				BEGIN
					SET @pri = CONCAT(@pri, 'K')SET @sec = CONCAT(@sec, 'K')SET @pos = @pos  + 2; -- nxt = ('K', 2)
				END
				ELSE IF @pos > @first 
				BEGIN
						IF SUBSTRING(@st, @first, 2) = 'MC' 
						BEGIN
							SET @pri = CONCAT(@pri, 'K')SET @sec = CONCAT(@sec, 'K')SET @pos = @pos  + 2; -- nxt = ('K', 2)
						END
						ELSE
							SET @pri = CONCAT(@pri, 'X')SET @sec = CONCAT(@sec, 'K')SET @pos = @pos  + 2; -- nxt = ('X', 'K', 2)

				END
				ELSE
					SET @pri = CONCAT(@pri, 'X')SET @sec = CONCAT(@sec, 'X')SET @pos = @pos  + 2; -- nxt = ('X', 2)
			END
		    	-- e.g, 'czerny'
			ELSE IF SUBSTRING(@st, @pos, 2) = 'CZ' AND SUBSTRING(@st, @pos-2, 4) != 'WICZ' 
			BEGIN
				SET @pri = CONCAT(@pri, 'S')SET @sec = CONCAT(@sec, 'X')SET @pos = @pos  + 2; -- nxt = ('S', 'X', 2)
			END-- e.g., 'focaccia'
			ELSE IF SUBSTRING(@st, @pos+1, 3) = 'CIA' 
			BEGIN
				SET @pri = CONCAT(@pri, 'X')SET @sec = CONCAT(@sec, 'X')SET @pos = @pos  + 3; -- nxt = ('X', 3)
			END-- double 'C', but not IF e.g. 'McClellan'
			ELSE IF SUBSTRING(@st, @pos, 2) = 'CC' AND NOT (@pos = (@first +1) AND SUBSTRING(@st, @first, 1) = 'M')
			BEGIN
				-- 'bellocchio' but not 'bacchus'
				IF SUBSTRING(@st, @pos+2, 1) IN ('I', 'E', 'H') AND SUBSTRING(@st, @pos+2, 2) != 'HU' 
				BEGIN
					-- 'accident', 'accede' 'succeed'
					IF (@pos = @first +1 AND SUBSTRING(@st, @first,1) = 'A') OR SUBSTRING(@st, @pos-1, 5) IN ('UCCEE', 'UCCES') 
					BEGIN
						SET @pri = CONCAT(@pri, 'KS')SET @sec = CONCAT(@sec, 'KS')SET @pos = @pos  + 3; -- nxt = ('KS', 3)
					END -- 'bacci', 'bertucci', other italian
					ELSE
					BEGIN
						SET @pri = CONCAT(@pri, 'X')SET @sec = CONCAT(@sec, 'X')SET @pos = @pos  + 3; -- nxt = ('X', 3)
					END
				END
				ELSE
					SET @pri = CONCAT(@pri, 'K')SET @sec = CONCAT(@sec, 'K')SET @pos = @pos  + 2; -- nxt = ('K', 2)
			END
			ELSE IF SUBSTRING(@st, @pos, 2) IN ('CK', 'CG', 'CQ') 
			BEGIN
				SET @pri = CONCAT(@pri, 'K')SET @sec = CONCAT(@sec, 'K')SET @pos = @pos  + 2; -- nxt = ('K', 'K', 2)
			END
			ELSE IF SUBSTRING(@st, @pos, 2) IN ('CI', 'CE', 'CY') 
			BEGIN
				-- italian vs. english
				IF SUBSTRING(@st, @pos, 3) IN ('CIO', 'CIE', 'CIA') 
				BEGIN
					SET @pri = CONCAT(@pri, 'S')SET @sec = CONCAT(@sec, 'X')SET @pos = @pos  + 2; -- nxt = ('S', 'X', 2)
				END
				ELSE
					SET @pri = CONCAT(@pri, 'S')SET @sec = CONCAT(@sec, 'S')SET @pos = @pos  + 2; -- nxt = ('S', 2)
			END
			ELSE IF SUBSTRING(@st, @pos+1, 2) IN (' C', ' Q', ' G') -- name sent IN 'mac caffrey', 'mac gregor
			BEGIN
				SET @pri = CONCAT(@pri, 'K')SET @sec = CONCAT(@sec, 'K')SET @pos = @pos  + 3; -- nxt = ('K', 3)
			END
			ELSE IF SUBSTRING(@st, @pos+1, 1) IN ('C', 'K', 'Q') AND SUBSTRING(@st, @pos+1, 2) NOT IN ('CE', 'CI') 
			BEGIN
				SET @pri = CONCAT(@pri, 'K')SET @sec = CONCAT(@sec, 'K')SET @pos = @pos  + 2; -- nxt = ('K', 2)
			END
			ELSE --  default for 'C'
			BEGIN
				SET @pri = CONCAT(@pri, 'K')SET @sec = CONCAT(@sec, 'K')SET @pos = @pos  + 1; -- nxt = ('K', 1)
			END
		END
		-- ELSE IF @ch = 'Ç' BEGIN --  will never get here with st.encode('ascii', 'replace') above
			-- SET @pri = CONCAT(@pri, '5')SET @sec = CONCAT(@sec, '5')SET @pos = @pos  + 1; -- nxt = ('S', 1)
		IF @ch = 'D' 
		BEGIN
			IF SUBSTRING(@st, @pos, 2) = 'DG' 
			BEGIN
				IF SUBSTRING(@st, @pos+2, 1) IN ('I', 'E', 'Y') 
				BEGIN -- e.g. 'edge'
					SET @pri = CONCAT(@pri, 'J')SET @sec = CONCAT(@sec, 'J')SET @pos = @pos  + 3; -- nxt = ('J', 3)
				END 
				ELSE
				BEGIN
					SET @pri = CONCAT(@pri, 'TK')SET @sec = CONCAT(@sec, 'TK')SET @pos = @pos  + 2; -- nxt = ('TK', 2)
				END
			END
			ELSE IF SUBSTRING(@st, @pos, 2) IN ('DT', 'DD') 
			BEGIN
				SET @pri = CONCAT(@pri, 'T')SET @sec = CONCAT(@sec, 'T')SET @pos = @pos  + 2; -- nxt = ('T', 2)
			END
			ELSE
			BEGIN
				SET @pri = CONCAT(@pri, 'T')SET @sec = CONCAT(@sec, 'T')SET @pos = @pos  + 1; -- nxt = ('T', 1)
			END
		END
		IF @ch = 'F' 
		BEGIN
			IF SUBSTRING(@st, @pos+1, 1) = 'F' 
			BEGIN
				SET @pri = CONCAT(@pri, 'F')SET @sec = CONCAT(@sec, 'F')SET @pos = @pos  + 2; -- nxt = ('F', 2)
			END
			ELSE
			BEGIN
				SET @pri = CONCAT(@pri, 'F')SET @sec = CONCAT(@sec, 'F')SET @pos = @pos  + 1; -- nxt = ('F', 1)
			END
		END
		IF @ch = 'G' 
		BEGIN
			IF SUBSTRING(@st, @pos+1, 1) = 'H' 
			BEGIN
				IF (@pos > @first AND SUBSTRING(@st, @pos-1, 1) NOT IN ('A', 'E', 'I', 'O', 'U', 'Y')) OR ( @pos = @first AND SUBSTRING(@st, @pos+2, 1) != 'I') 
				BEGIN
					SET @pri = CONCAT(@pri, 'K')SET @sec = CONCAT(@sec, 'K')SET @pos = @pos  + 2; -- nxt = ('K', 2)
				END
				ELSE IF @pos = @first AND SUBSTRING(@st, @pos+2, 1) = 'I' 
				BEGIN
					SET @pri = CONCAT(@pri, 'J')SET @sec = CONCAT(@sec, 'J')SET @pos = @pos  + 2; -- nxt = ('J', 2)
				END-- Parker's rule (with some further refinements) - e.g., 'hugh'
				ELSE IF (@pos > (@first + 1) AND SUBSTRING(@st, @pos-2, 1) IN ('B', 'H', 'D') )
				   OR (@pos > (@first + 2) AND SUBSTRING(@st, @pos-3, 1) IN ('B', 'H', 'D') )
				   OR (@pos > (@first + 3) AND SUBSTRING(@st, @pos-4, 1) IN ('B', 'H') ) 
				BEGIN
					SET @pos = @pos + 2; -- nxt = (None, 2)
				END
				ELSE IF @pos > (@first + 2) AND SUBSTRING(@st, @pos-1, 1) = 'U' AND SUBSTRING(@st, @pos-3, 1) IN ('C', 'G', 'L', 'R', 'T') --  e.g., 'laugh', 'McLaughlin', 'cough', 'gough', 'rough', 'tough'
				BEGIN
					SET @pri = CONCAT(@pri, 'F')SET @sec = CONCAT(@sec, 'F')SET @pos = @pos  + 2; -- nxt = ('F', 2)
				END
				ELSE IF @pos > @first AND SUBSTRING(@st, @pos-1, 1) != 'I' 
				BEGIN
					SET @pri = CONCAT(@pri, 'K')SET @sec = CONCAT(@sec, 'K')SET @pos = @pos  + 2; -- nxt = ('K', 2)
				END
				ELSE
					SET @pos = @pos + 1;
			END
			--END **mg removed
			ELSE IF SUBSTRING(@st, @pos+1, 1) = 'N' 
			BEGIN
				IF @pos = (@first +1) AND SUBSTRING(@st, @first, 1) IN ('A', 'E', 'I', 'O', 'U', 'Y') AND  @is_slavo_germanic=0 BEGIN
					SET @pri = CONCAT(@pri, 'KN')SET @sec = CONCAT(@sec, 'N')SET @pos = @pos  + 2; -- nxt = ('KN', 'N', 2)
				END
				ELSE IF SUBSTRING(@st, @pos+2, 2) != 'EY' AND SUBSTRING(@st, @pos+1, 1) != 'Y' AND @is_slavo_germanic=0 --  not e.g. 'cagney'
				BEGIN
					SET @pri = CONCAT(@pri, 'N')SET @sec = CONCAT(@sec, 'KN')SET @pos = @pos  + 2; -- nxt = ('N', 'KN', 2)
				END
				ELSE
				BEGIN
					SET @pri = CONCAT(@pri, 'KN')SET @sec = CONCAT(@sec, 'KN')SET @pos = @pos  + 2; -- nxt = ('KN', 2)
				END
			END
			--  'tagliaro'
			ELSE IF SUBSTRING(@st, @pos+1, 2) = 'LI' AND  @is_slavo_germanic=0 
			BEGIN
				SET @pri = CONCAT(@pri, 'KL')SET @sec = CONCAT(@sec, 'L')SET @pos = @pos  + 2; -- nxt = ('KL', 'L', 2)
			END
			--  -ges-,-gep-,-gel-, -gie- at beginning
			ELSE IF @pos = @first AND (SUBSTRING(@st, @pos+1, 1) = 'Y'
			   OR SUBSTRING(@st, @pos+1, 2) IN ('ES', 'EP', 'EB', 'EL', 'EY', 'IB', 'IL', 'IN', 'IE', 'EI', 'ER')) 
			   BEGIN
				SET @pri = CONCAT(@pri, 'K')SET @sec = CONCAT(@sec, 'J')SET @pos = @pos  + 2; -- nxt = ('K', 'J', 2)
			   END
			--  -ger-,  -gy-
			ELSE IF (SUBSTRING(@st, @pos+1, 2) = 'ER' OR SUBSTRING(@st, @pos+1, 1) = 'Y')
			   AND SUBSTRING(@st, @first, 6) NOT IN ('DANGER', 'RANGER', 'MANGER')
			   AND SUBSTRING(@st, @pos-1, 1) not IN ('E', 'I') AND SUBSTRING(@st, @pos-1, 3) NOT IN ('RGY', 'OGY') 
			   BEGIN
				SET @pri = CONCAT(@pri, 'K')SET @sec = CONCAT(@sec, 'J')SET @pos = @pos  + 2; -- nxt = ('K', 'J', 2)
			   END
			--  italian e.g, 'biaggi'
			ELSE IF SUBSTRING(@st, @pos+1, 1) IN ('E', 'I', 'Y') OR SUBSTRING(@st, @pos-1, 4) IN ('AGGI', 'OGGI') 
			BEGIN
				--  obvious germanic
				IF SUBSTRING(@st, @first, 4) IN ('VON ', 'VAN ') OR SUBSTRING(@st, @first, 3) = 'SCH'
				   OR SUBSTRING(@st, @pos+1, 2) = 'ET' 
				BEGIN
					SET @pri = CONCAT(@pri, 'K')SET @sec = CONCAT(@sec, 'K')SET @pos = @pos  + 2; -- nxt = ('K', 2)
				END
				ELSE IF SUBSTRING(@st, @pos+1, 4) = 'IER ' 
					BEGIN
						SET @pri = CONCAT(@pri, 'J')SET @sec = CONCAT(@sec, 'J')SET @pos = @pos  + 2; -- nxt = ('J', 2)
					END
					ELSE
					BEGIN
						SET @pri = CONCAT(@pri, 'J')SET @sec = CONCAT(@sec, 'K')SET @pos = @pos  + 2; -- nxt = ('J', 'K', 2)
					END
			END
			ELSE IF SUBSTRING(@st, @pos+1, 1) = 'G' 
			BEGIN
				SET @pri = CONCAT(@pri, 'K')SET @sec = CONCAT(@sec, 'K')SET @pos = @pos  + 2; -- nxt = ('K', 2)
			END
			ELSE
			BEGIN
				SET @pri = CONCAT(@pri, 'K')SET @sec = CONCAT(@sec, 'K')SET @pos = @pos  + 1; -- nxt = ('K', 1)
			END
		END
		IF @ch = 'H' 
		BEGIN
			--  only keep IF @first & before vowel OR btw. 2 ('A', 'E', 'I', 'O', 'U', 'Y')
			IF (@pos = @first OR SUBSTRING(@st, @pos-1, 1) IN ('A', 'E', 'I', 'O', 'U', 'Y'))
				AND SUBSTRING(@st, @pos+1, 1) IN ('A', 'E', 'I', 'O', 'U', 'Y') 
			BEGIN
				SET @pri = CONCAT(@pri, 'H')SET @sec = CONCAT(@sec, 'H')SET @pos = @pos  + 2; -- nxt = ('H', 2)
			END
			ELSE --  (also takes care of 'HH')\
			BEGIN
				SET @pos = @pos + 1; -- nxt = (None, 1)
			END
		END
		IF @ch = 'J' 
		BEGIN
			--  obvious spanish, 'jose', 'san jacinto'
			IF SUBSTRING(@st, @pos, 4) = 'JOSE' OR SUBSTRING(@st, @first, 4) = 'SAN ' 
			BEGIN
				IF (@pos = @first AND SUBSTRING(@st, @pos+4, 1) = ' ') OR SUBSTRING(@st, @first, 4) = 'SAN ' 
				BEGIN
					SET @pri = CONCAT(@pri, 'H')SET @sec = CONCAT(@sec, 'H'); -- nxt = ('H',)
				END
				ELSE
				BEGIN
					SET @pri = CONCAT(@pri, 'J')SET @sec = CONCAT(@sec, 'H'); -- nxt = ('J', 'H')
				END
			END
			ELSE IF @pos = @first AND SUBSTRING(@st, @pos, 4) != 'JOSE'
			BEGIN
				SET @pri = CONCAT(@pri, 'J')SET @sec = CONCAT(@sec, 'A'); -- nxt = ('J', 'A') --  Yankelovich/Jankelowicz
			END
			ELSE IF SUBSTRING(@st, @pos-1, 1) IN ('A', 'E', 'I', 'O', 'U', 'Y') AND @is_slavo_germanic=0  --  spanish pron. of e.g. 'bajador'
				   AND SUBSTRING(@st, @pos+1, 1) IN ('A', 'O') 
			BEGIN
				SET @pri = CONCAT(@pri, 'J')SET @sec = CONCAT(@sec, 'H'); -- nxt = ('J', 'H')
			END
			ELSE IF @pos = @Last 
			BEGIN
				SET @pri = CONCAT(@pri, 'J'); -- nxt = ('J', ' ')
			END
			ELSE IF SUBSTRING(@st, @pos+1, 1) not IN ('L', 'T', 'K', 'S', 'N', 'M', 'B', 'Z') AND SUBSTRING(@st, @pos-1, 1) not IN ('S', 'K', 'L') 
			BEGIN
				SET @pri = CONCAT(@pri, 'J')SET @sec = CONCAT(@sec, 'J'); -- nxt = ('J',)
			END
		
			IF SUBSTRING(@st, @pos+1, 1) = 'J' 
			BEGIN
				SET @pos = @pos + 2;
			END
			ELSE
				SET @pos = @pos + 1;
		END
		IF @ch = 'K' 
		BEGIN
			IF SUBSTRING(@st, @pos+1, 1) = 'K' 
			BEGIN
				SET @pri = CONCAT(@pri, 'K')SET @sec = CONCAT(@sec, 'K')SET @pos = @pos  + 2; -- nxt = ('K', 2)
			END
			ELSE
			BEGIN
				SET @pri = CONCAT(@pri, 'K')SET @sec = CONCAT(@sec, 'K')SET @pos = @pos  + 1; -- nxt = ('K', 1)
			END
		END
		IF @ch = 'L'
		 BEGIN
			IF SUBSTRING(@st, @pos+1, 1) = 'L'
		    BEGIN
				--  spanish e.g. 'cabrillo', 'gallegos'
				IF (@pos = (@Last - 2) AND SUBSTRING(@st, @pos-1, 4) IN ('ILLO', 'ILLA', 'ALLE'))
				   OR ((SUBSTRING(@st, @Last-1, 2) IN ('AS', 'OS') OR SUBSTRING(@st, @Last,1) IN ('A', 'O')) --*** cHECK
				   AND SUBSTRING(@st, @pos-1, 4) = 'ALLE') 
				BEGIN
					SET @pri = CONCAT(@pri, 'L')SET @pos = @pos  + 2; -- nxt = ('L', ' ', 2)
				END
				ELSE
				BEGIN
					SET @pri = CONCAT(@pri, 'L')SET @sec = CONCAT(@sec, 'L')SET @pos = @pos  + 2; -- nxt = ('L', 2)
				END
			END
			ELSE
			BEGIN
				SET @pri = CONCAT(@pri, 'L')SET @sec = CONCAT(@sec, 'L')SET @pos = @pos  + 1; -- nxt = ('L', 1)
			END
		END
		IF @ch = 'M' 
		BEGIN
			IF SUBSTRING(@st, @pos-1, 3) = 'UMB'
			   AND (@pos + 1 = @Last OR SUBSTRING(@st, @pos+2, 2) = 'ER')
			   OR SUBSTRING(@st, @pos+1, 1) = 'M' 
			BEGIN
				SET @pri = CONCAT(@pri, 'M')SET @sec = CONCAT(@sec, 'M')SET @pos = @pos  + 2; -- nxt = ('M', 2)
			END 
			ELSE
			BEGIN
				SET @pri = CONCAT(@pri, 'M')SET @sec = CONCAT(@sec, 'M')SET @pos = @pos  + 1; -- nxt = ('M', 1)
			END
		END
		IF @ch = 'N' 
		BEGIN
			IF SUBSTRING(@st, @pos+1, 1) = 'N' 
			BEGIN
				SET @pri = CONCAT(@pri, 'N')SET @sec = CONCAT(@sec, 'N')SET @pos = @pos  + 2; -- nxt = ('N', 2)
			END
			ELSE
			BEGIN
				SET @pri = CONCAT(@pri, 'N')SET @sec = CONCAT(@sec, 'N')SET @pos = @pos  + 1; -- nxt = ('N', 1)
			END
		END
		-- ELSE IF @ch = u'Ñ' BEGIN
			-- SET @pri = CONCAT(@pri, '5')SET @sec = CONCAT(@sec, '5')SET @pos = @pos  + 1; -- nxt = ('N', 1)
		IF @ch = 'P' 
		BEGIN
			IF SUBSTRING(@st, @pos+1, 1) = 'H' 
			BEGIN
				SET @pri = CONCAT(@pri, 'F')SET @sec = CONCAT(@sec, 'F')SET @pos = @pos  + 2; -- nxt = ('F', 2)
			END 
			ELSE IF SUBSTRING(@st, @pos+1, 1) IN ('P', 'B') 
			BEGIN --  also account for 'campbell', 'raspberry'
				SET @pri = CONCAT(@pri, 'P')SET @sec = CONCAT(@sec, 'P')SET @pos = @pos  + 2; -- nxt = ('P', 2)
			END
			ELSE
			BEGIN
				SET @pri = CONCAT(@pri, 'P')SET @sec = CONCAT(@sec, 'P')SET @pos = @pos  + 1; -- nxt = ('P', 1)
			END
		END
		IF @ch = 'Q' 
		BEGIN
			IF SUBSTRING(@st, @pos+1, 1) = 'Q' 
			BEGIN
				SET @pri = CONCAT(@pri, 'K')SET @sec = CONCAT(@sec, 'K')SET @pos = @pos  + 2; -- nxt = ('K', 2)
			END
			ELSE
			BEGIN
				SET @pri = CONCAT(@pri, 'K')SET @sec = CONCAT(@sec, 'K')SET @pos = @pos  + 1; -- nxt = ('K', 1)
			END
		END
		IF @ch = 'R' 
		BEGIN
			--  fren@ch e.g. 'rogier', but exclude 'hochmeier'
			IF @pos = @Last AND @is_slavo_germanic=0
			   AND SUBSTRING(@st, @pos-2, 2) = 'IE' AND SUBSTRING(@st, @pos-4, 2) NOT IN ('ME', 'MA')
			BEGIN
				SET @sec = CONCAT(@sec, 'R'); -- nxt = ('', 'R')
			END
			ELSE
			BEGIN
				SET @pri = CONCAT(@pri, 'R')SET @sec = CONCAT(@sec, 'R'); -- nxt = ('R',)
			END
			IF SUBSTRING(@st, @pos+1, 1) = 'R' 			
				SET @pos = @pos + 2;
			ELSE
				SET @pos = @pos + 1;
		END
		IF @ch = 'S' 
		BEGIN
			--  special cases 'island', 'isle', 'carlisle', 'carlysle'
			IF SUBSTRING(@st, @pos-1, 3) IN ('ISL', 'YSL') 
			    SET @pos = @pos + 1;
			--  special case 'sugar-'
			ELSE IF @pos = @first AND SUBSTRING(@st, @first, 5) = 'SUGAR' 
			BEGIN
				SET @pri = CONCAT(@pri, 'X')SET @sec = CONCAT(@sec, 'S')SET @pos = @pos  + 1; --  nxt =('X', 'S', 1)
			END
			ELSE IF SUBSTRING(@st, @pos, 2) = 'SH' 
			BEGIN
				--  germanic
				IF SUBSTRING(@st, @pos+1, 4) IN ('HEIM', 'HOEK', 'HOLM', 'HOLZ') 
				BEGIN
					SET @pri = CONCAT(@pri, 'S')SET @sec = CONCAT(@sec, 'S')SET @pos = @pos  + 2; -- nxt = ('S', 2)
				END
				ELSE
				BEGIN
					SET @pri = CONCAT(@pri, 'X')SET @sec = CONCAT(@sec, 'X')SET @pos = @pos  + 2; -- nxt = ('X', 2)
				END
			END
			--  italian & armenian
			ELSE IF SUBSTRING(@st, @pos, 3) IN ('SIO', 'SIA') OR SUBSTRING(@st, @pos, 4) = 'SIAN' 
			BEGIN
				IF @is_slavo_germanic=0
				BEGIN
					SET @pri = CONCAT(@pri, 'S')SET @sec = CONCAT(@sec, 'X')SET @pos = @pos  + 3; -- nxt = ('S', 'X', 3)
				END
				ELSE
				BEGIN
					SET @pri = CONCAT(@pri, 'S')SET @sec = CONCAT(@sec, 'S')SET @pos = @pos  + 3; -- nxt = ('S', 3)
				END
			END
			--  german & anglicisations, e.g. 'smith' mat@ch 'schmidt', 'snider' mat@ch 'schneider'
			--  also, -sz- IN slavic language altho IN hungarian it is pronounced 's'
			ELSE IF (@pos = @first AND SUBSTRING(@st, @pos+1, 1) IN ('M', 'N', 'L', 'W')) OR SUBSTRING(@st, @pos+1, 1) = 'Z'
			BEGIN
				SET @pri = CONCAT(@pri, 'S')SET @sec = CONCAT(@sec, 'X'); -- nxt = ('S', 'X')
				IF SUBSTRING(@st, @pos+1, 1) = 'Z' 
					SET @pos = @pos + 2;
				ELSE
					SET @pos = @pos + 1;
			END
			ELSE IF SUBSTRING(@st, @pos, 2) = 'SC' 
			BEGIN
				--  Schlesinger's rule
				IF SUBSTRING(@st, @pos+2, 1) = 'H' 
				BEGIN
					--  dut@ch origin, e.g. 'school', 'schooner'
					IF SUBSTRING(@st, @pos+3, 2) IN ('OO', 'ER', 'EN', 'UY', 'ED', 'EM') 
					BEGIN
						--  'schermerhorn', 'schenker'
						IF SUBSTRING(@st, @pos+3, 2) IN ('ER', 'EN') 
						BEGIN
							SET @pri = CONCAT(@pri, 'X')SET @sec = CONCAT(@sec, 'SK')SET @pos = @pos  + 3; -- nxt = ('X', 'SK', 3)
						END
						ELSE
						BEGIN
							SET @pri = CONCAT(@pri, 'SK')SET @sec = CONCAT(@sec, 'SK')SET @pos = @pos  + 3; -- nxt = ('SK', 3)
						END
					END
					ELSE IF @pos = @first AND SUBSTRING(@st, @first+3, 1) not IN ('A', 'E', 'I', 'O', 'U', 'Y') AND SUBSTRING(@st, @first+3, 1) != 'W' 
					BEGIN
							SET @pri = CONCAT(@pri, 'X')SET @sec = CONCAT(@sec, 'S')SET @pos = @pos  + 3; -- nxt = ('X', 'S', 3)
					END
					ELSE
					BEGIN
						SET @pri = CONCAT(@pri, 'X')SET @sec = CONCAT(@sec, 'X')SET @pos = @pos  + 3; -- nxt = ('X', 3)
					END
				END
				ELSE IF SUBSTRING(@st, @pos+2, 1) IN ('I', 'E', 'Y') 
				BEGIN
					SET @pri = CONCAT(@pri, 'S')SET @sec = CONCAT(@sec, 'S')SET @pos = @pos  + 3; -- nxt = ('S', 3)
				END
				ELSE
				BEGIN
					SET @pri = CONCAT(@pri, 'SK')SET @sec = CONCAT(@sec, 'SK')SET @pos = @pos  + 3; -- nxt = ('SK', 3)
				END
			END
			ELSE IF @pos = @Last AND SUBSTRING(@st, @pos-2, 2) IN ('AI', 'OI') --  fren@ch e.g. 'resnais', 'artois'
			BEGIN 
				SET @sec = CONCAT(@sec, 'S')SET @pos = @pos  + 1; -- nxt = ('', 'S')
			END
			ELSE
			BEGIN
				SET @pri = CONCAT(@pri, 'S')SET @sec = CONCAT(@sec, 'S'); -- nxt = ('S',)
				IF SUBSTRING(@st, @pos+1, 1) IN ('S', 'Z')
					SET @pos = @pos + 2;
				ELSE
					SET @pos = @pos + 1;				
			END
		END
		IF @ch = 'T' 
		BEGIN
			IF SUBSTRING(@st, @pos, 4) = 'TION' 
			BEGIN
				SET @pri = CONCAT(@pri, 'X')SET @sec = CONCAT(@sec, 'X')SET @pos = @pos  + 3; -- nxt = ('X', 3)
			END
			ELSE IF SUBSTRING(@st, @pos, 3) IN ('TIA', 'TCH') 
			BEGIN
				SET @pri = CONCAT(@pri, 'X')SET @sec = CONCAT(@sec, 'X')SET @pos = @pos  + 3; -- nxt = ('X', 3)
			END
			ELSE IF SUBSTRING(@st, @pos, 2) = 'TH' OR SUBSTRING(@st, @pos, 3) = 'TTH' 
			BEGIN
				IF SUBSTRING(@st, @pos+2, 2) IN ('OM', 'AM') OR SUBSTRING(@st, @first, 4) IN ('VON ', 'VAN ')
				   OR SUBSTRING(@st, @first, 3) = 'SCH' --  special case 'thomas', 'thames' OR germanic
				BEGIN
					SET @pri = CONCAT(@pri, 'T')SET @sec = CONCAT(@sec, 'T')SET @pos = @pos  + 2; -- nxt = ('T', 2)
				END
				ELSE
				BEGIN
					SET @pri = CONCAT(@pri, '0')SET @sec = CONCAT(@sec, 'T')SET @pos = @pos  + 2; -- nxt = ('0', 'T', 2)
				END
			END
			ELSE IF SUBSTRING(@st, @pos+1, 1) IN ('T', 'D') 
			BEGIN
				SET @pri = CONCAT(@pri, 'T')SET @sec = CONCAT(@sec, 'T')SET @pos = @pos  + 2; -- nxt = ('T', 2)
			END
			ELSE
			BEGIN
				SET @pri = CONCAT(@pri, 'T')SET @sec = CONCAT(@sec, 'T')SET @pos = @pos  + 1; -- nxt = ('T', 1)
			END
		END
		IF @ch = 'V' 
		BEGIN
			IF SUBSTRING(@st, @pos+1, 1) = 'V' 
			BEGIN
				SET @pri = CONCAT(@pri, 'F')SET @sec = CONCAT(@sec, 'F')SET @pos = @pos  + 2; -- nxt = ('F', 2)
			END
			ELSE
			BEGIN
				SET @pri = CONCAT(@pri, 'F')SET @sec = CONCAT(@sec, 'F')SET @pos = @pos  + 1; -- nxt = ('F', 1)
			END
		END
		IF @ch = 'W' 
		BEGIN
			--  can also be IN middle of word
			IF SUBSTRING(@st, @pos, 2) = 'WR' 
			BEGIN
				SET @pri = CONCAT(@pri, 'R')SET @sec = CONCAT(@sec, 'R')SET @pos = @pos  + 2; -- nxt = ('R', 2)
			END
			ELSE IF @pos = @first AND (SUBSTRING(@st, @pos+1, 1) IN ('A', 'E', 'I', 'O', 'U', 'Y')
				OR SUBSTRING(@st, @pos, 2) = 'WH') 
			BEGIN
				--  Wasserman should mat@ch Vasserman
				IF SUBSTRING(@st, @pos+1, 1) IN ('A', 'E', 'I', 'O', 'U', 'Y') 
				BEGIN
					SET @pri = CONCAT(@pri, 'A')SET @sec = CONCAT(@sec, 'F')SET @pos = @pos  + 1; -- nxt = ('A', 'F', 1)
				END
				ELSE
				BEGIN
					SET @pri = CONCAT(@pri, 'A')SET @sec = CONCAT(@sec, 'A')SET @pos = @pos  + 1; -- nxt = ('A', 1)
				END
			END
			--  Arnow should mat@ch Arnoff
			ELSE IF (@pos = @Last AND SUBSTRING(@st, @pos-1, 1) IN ('A', 'E', 'I', 'O', 'U', 'Y'))
			   OR SUBSTRING(@st, @pos-1, 5) IN ('EWSKI', 'EWSKY', 'OWSKI', 'OWSKY')
			   OR SUBSTRING(@st, @first, 3) = 'SCH' 
			 BEGIN
				SET @sec = CONCAT(@sec, 'F')SET @pos = @pos  + 1; -- nxt = ('', 'F', 1)
			 END
			--  polish e.g. 'filipowicz'
			ELSE IF SUBSTRING(@st, @pos, 4) IN ('WICZ', 'WITZ')
			BEGIN
				SET @pri = CONCAT(@pri, 'TS')SET @sec = CONCAT(@sec, 'FX')SET @pos = @pos  + 4; -- nxt = ('TS', 'FX', 4)
			END
			ELSE --  default is to skip it
				SET @pos = @pos + 1;
		END
		IF @ch = 'X' 
		BEGIN
			--  fren@ch e.g. breaux
			IF not(@pos = @Last AND (SUBSTRING(@st, @pos-3, 3) IN ('IAU', 'EAU')
			   OR SUBSTRING(@st, @pos-2, 2) IN ('AU', 'OU')))
			BEGIN
				SET @pri = CONCAT(@pri, 'KS')SET @sec = CONCAT(@sec, 'KS'); -- nxt = ('KS',)
			END
			IF SUBSTRING(@st, @pos+1, 1) IN ('C', 'X') 
				SET @pos = @pos + 2;
			ELSE
				SET @pos = @pos + 1;
		END
		IF @ch = 'Z' 
		BEGIN
			--  chinese pinyin e.g. 'zhao'
			IF SUBSTRING(@st, @pos+1, 1) = 'H' 
			BEGIN
				SET @pri = CONCAT(@pri, 'J')SET @sec = CONCAT(@sec, 'J')SET @pos = @pos  + 1; -- nxt = ('J', 2)
			END
			ELSE IF SUBSTRING(@st, @pos+1, 3) IN ('ZO', 'ZI', 'ZA')
			   OR (@is_slavo_germanic=1 AND @pos > @first AND SUBSTRING(@st, @pos-1, 1) != 'T')
			BEGIN
				SET @pri = CONCAT(@pri, 'S')SET @sec = CONCAT(@sec, 'TS'); -- nxt = ('S', 'TS')\
			END
			ELSE
			BEGIN
				SET @pri = CONCAT(@pri, 'S')SET @sec = CONCAT(@sec, 'S'); -- nxt = ('S',)
			END
			IF SUBSTRING(@st, @pos+1, 1) = 'Z' 
				SET @pos = @pos + 2;
			ELSE
				SET @pos = @pos + 1;
		END
		
		--SET @pos = @pos + 1; -- DEFAULT is to move to next char	
	
	END --CASE;
    IF @pos = @prevpos 
	BEGIN
       SET @pos = @pos +1;
       SET @pri = CONCAT(@pri,'<didnt incr>'); -- it might be better to throw an error here if you really must be accurate
    END
	 ---WHILE;
	IF @pri != @sec 
	   SET @pri = CONCAT(@pri, ';', @sec);
	RETURN (@pri);
  END
GO
