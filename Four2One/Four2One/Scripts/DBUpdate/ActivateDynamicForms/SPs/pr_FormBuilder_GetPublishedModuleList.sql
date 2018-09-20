
/****** Object:  StoredProcedure [dbo].[pr_FormBuilder_GetPublishedModuleList_Constella]    Script Date: 8/30/2018 9:06:34 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[pr_FormBuilder_GetPublishedModuleList_Constella]

AS

BEGIN

	--0

	SELECT a.ModuleId

		,a.ModuleName
		,a.CanEnroll
		,a.DisplayName

	FROM mst_Module a

	WHERE a.DeleteFlag = 0

		AND (

			a.IsPlugIn = 0

			OR a.IsPlugIn IS NULL

			)

		AND a.STATUS = 2 AND ModuleID NOT IN(207,206)

	ORDER BY a.ModuleName



	--1 Pharmacy Module List

	SELECT 
		a.ModuleId

		,a.ModuleName
		,a.CanEnroll
		,a.DisplayName
	FROM mst_Module a

	WHERE a.DeleteFlag = 0

		AND a.STATUS = 2

		AND a.ModuleID NOT IN (

			SELECT ModuleID

			FROM mst_Feature

			WHERE FeatureName LIKE 'Pharmacy_%'

			

			UNION ALL

			

			SELECT sfm.ModuleId

			FROM mst_Feature mf

			INNER JOIN lnk_SplFormModule sfm ON mf.FeatureID = sfm.FeatureId

			WHERE FeatureName LIKE 'Pharmacy_%'

			)

	ORDER BY a.ModuleName

END




GO


