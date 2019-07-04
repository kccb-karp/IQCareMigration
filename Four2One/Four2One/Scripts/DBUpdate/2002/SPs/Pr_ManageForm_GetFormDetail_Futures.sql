

/****** Object:  StoredProcedure [dbo].[Pr_ManageForm_GetFormDetail_Futures]    Script Date: 8/30/2018 8:48:19 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[Pr_ManageForm_GetFormDetail_Futures] @FormStatus VARCHAR(50)

	,@TechArea VARCHAR(50)

	,@CountryId INT

AS

BEGIN

	DECLARE @MName VARCHAR(200);



	SET @MName = NULL;



	IF (@TechArea > 0)

	BEGIN

		SELECT @MName = ModuleName

		FROM mst_Module

		WHERE moduleid = @TechArea;

	END



	PRINT @MName;



	IF (

			@FormStatus = '3'

			OR @FormStatus = ''

			OR @FormStatus IS NULL

			)

	BEGIN

		WITH FeatureData (

			featurename

			,modulename

			)

		AS (

			SELECT featurename

				,modulename

			FROM mst_feature mf

			INNER JOIN mst_module mm ON mf.moduleid = mm.moduleid

			--WHERE mf.moduleid = CASE (@TechArea)

			--		WHEN 0

			--			THEN mf.moduleid

			--		ELSE @TechArea

			--		END

			

			UNION

			

			SELECT mf.featurename

				,md.modulename

			FROM mst_feature mf

			INNER JOIN lnk_SplFormModule lnk ON mf.featureid = lnk.featureid

			INNER JOIN mst_module md ON md.moduleid = lnk.moduleid

			)

		SELECT DISTINCT Mst_Feature.FeatureName [FormName]

		  ,Mst_User.UserName [UpdatedBy]

			,isnull(CONVERT(VARCHAR, Mst_Feature.updatedate, 103), CONVERT(VARCHAR, Mst_Feature.createdate, 103)) [LastUpdate]

			,Mst_Feature.Published [Published]

			,Mst_Feature.FeatureID [FormId]

			,Mst_Feature.Seq
			,(

				Stuff((

						SELECT ', ' + modulename

						FROM (

							SELECT featurename

								,modulename

							FROM FeatureData

							) tbl2

						WHERE tbl2.featurename = Mst_Feature.featurename

						FOR XML PATH('')

						), 1, 1, '')

				) [ServiceArea]

		FROM Mst_Feature

			,Mst_User

			,FeatureData

		WHERE Mst_Feature.UserId = Mst_User.UserId

			AND Mst_Feature.FeatureName = FeatureData.featurename

			AND (

				ISNULL(@MName, '00') = '00'

				OR FeatureData.modulename LIKE '%' + @MName + '%'

				)

			AND Mst_Feature.deleteflag = 0

			AND Mst_Feature.RegistrationFormFlag IS NULL

			AND Mst_Feature.FeatureId > 1000

			AND CountryId = @CountryId

			/*AND Mst_Feature.moduleid = CASE (@TechArea)

				WHEN 0

					THEN Mst_Feature.moduleid

				ELSE @TechArea

				END*/

			AND Mst_Feature.moduleid IN (

				SELECT moduleid

				FROM mst_module

				WHERE STATUS = 2

				)

			AND mst_feature.FeatureName NOT LIKE 'CareEnd%'

			----AND mst_feature.FeatureName NOT LIKE 'patient home%'

			AND mst_feature.FeatureName NOT LIKE 'facility home%'

		ORDER BY [Published]

			,Seq

			,[FormName]

	END

	ELSE IF (@FormStatus = '0')

	BEGIN

		WITH FeatureData (

			featurename

			,modulename

			)

		AS (

			SELECT featurename

				,modulename

			FROM mst_feature mf

			INNER JOIN mst_module mm ON mf.moduleid = mm.moduleid

			WHERE mf.moduleid = CASE (@TechArea)

					WHEN 0

						THEN mf.moduleid

					ELSE @TechArea

					END

			

			UNION

			

			SELECT mf.featurename

				,md.modulename

			FROM mst_feature mf

			INNER JOIN lnk_SplFormModule lnk ON mf.featureid = lnk.featureid

			INNER JOIN mst_module md ON md.moduleid = lnk.moduleid

			)

		SELECT DISTINCT Mst_Feature.FeatureName [FormName]

			
			,Mst_User.UserName [UpdatedBy]

			,isnull(CONVERT(VARCHAR, Mst_Feature.updatedate, 103), CONVERT(VARCHAR, Mst_Feature.createdate, 103)) [LastUpdate]

			,Mst_Feature.Published [Published]

			,Mst_Feature.FeatureID [FormId]

			,Mst_Feature.Seq
			,(

				Stuff((

						SELECT ', ' + modulename

						FROM (

							SELECT featurename

								,modulename

							FROM FeatureData

							) tbl2

						WHERE tbl2.featurename = Mst_Feature.featurename

						FOR XML PATH('')

						), 1, 1, '')

				) [ServiceArea]


		FROM Mst_Feature

			,Mst_User

			,FeatureData

		WHERE Mst_Feature.UserId = Mst_User.UserId

			AND Mst_Feature.FeatureName = FeatureData.featurename

			AND (

				ISNULL(@MName, '00') = '00'

				OR FeatureData.modulename LIKE '%' + @MName + '%'

				)

			AND (

				Mst_Feature.Published = 0

				OR Mst_Feature.Published IS NULL

				)

			AND Mst_Feature.deleteflag = 0

			AND Mst_Feature.FeatureId > 1000

			AND Mst_Feature.RegistrationFormFlag IS NULL

			AND CountryId = @CountryId

			--AND Mst_Feature.moduleid = CASE (@TechArea)

			--	WHEN 0

			--		THEN Mst_Feature.moduleid

			--	ELSE @TechArea

			--	END

			--and Mst_Feature.moduleid in (select moduleid from mst_module where status=2 and moduleid!=2)   

			AND Mst_Feature.moduleid IN (

				SELECT moduleid

				FROM mst_module

				WHERE STATUS = 2

					AND moduleid != 2

				)

			AND mst_feature.FeatureName NOT LIKE 'CareEnd%'

			----AND mst_feature.FeatureName NOT LIKE 'patient home%'

			AND mst_feature.FeatureName NOT LIKE 'facility home%'

		ORDER BY Seq

			,[FormName]

	END

	ELSE IF (@FormStatus = '1')

	BEGIN

		WITH FeatureData (

			featurename

			,modulename

			)

		AS (

			SELECT featurename

				,modulename

			FROM mst_feature mf

			INNER JOIN mst_module mm ON mf.moduleid = mm.moduleid

			--WHERE mf.moduleid = CASE (@TechArea)

			--		WHEN 0

			--			THEN mf.moduleid

			--		ELSE @TechArea

			--		END

			

			UNION

			

			SELECT mf.featurename

				,md.modulename

			FROM mst_feature mf

			INNER JOIN lnk_SplFormModule lnk ON mf.featureid = lnk.featureid

			INNER JOIN mst_module md ON md.moduleid = lnk.moduleid

			)

		SELECT DISTINCT Mst_Feature.FeatureName [FormName]

			

			,Mst_User.UserName [UpdatedBy]

			,isnull(CONVERT(VARCHAR, Mst_Feature.updatedate, 103), CONVERT(VARCHAR, Mst_Feature.createdate, 103)) [LastUpdate]

			,Mst_Feature.Published [Published]

			,Mst_Feature.FeatureID [FormId]

			,Mst_Feature.Seq

			,(

				Stuff((

						SELECT ', ' + modulename

						FROM (

							SELECT featurename

								,modulename

							FROM FeatureData

							) tbl2

						WHERE tbl2.featurename = Mst_Feature.featurename

						FOR XML PATH('')

						), 1, 1, '')

				) [ServiceArea]

		FROM Mst_Feature

			,Mst_User

			,FeatureData

		WHERE Mst_Feature.UserId = Mst_User.UserId

			AND Mst_Feature.FeatureName = FeatureData.featurename

			AND (

				ISNULL(@MName, '00') = '00'

				OR FeatureData.modulename LIKE '%' + @MName + '%'

				)

			AND Mst_Feature.Published = 2

			AND Mst_Feature.deleteflag = 0

			AND Mst_Feature.FeatureId > 1000

			AND CountryId = @CountryId

			AND Mst_Feature.RegistrationFormFlag IS NULL

			--AND Mst_Feature.moduleid = CASE (@TechArea)

			--	WHEN 0

			--		THEN Mst_Feature.moduleid

			--	ELSE @TechArea

			--	END

			--and Mst_Feature.moduleid in (select moduleid from mst_module where status=2 and moduleid!=2)   

			AND Mst_Feature.moduleid IN (

				SELECT moduleid

				FROM mst_module

				WHERE STATUS = 2

				)

			AND mst_feature.FeatureName NOT LIKE 'CareEnd%'

			----AND mst_feature.FeatureName NOT LIKE 'patient home%'

			AND mst_feature.FeatureName NOT LIKE 'facility home%'

		ORDER BY Seq

			,[FormName]

	END

	ELSE IF (@FormStatus = '2')

	BEGIN

		WITH FeatureData (

			featurename

			,modulename

			)

		AS (

			SELECT featurename

				,modulename

			FROM mst_feature mf

			INNER JOIN mst_module mm ON mf.moduleid = mm.moduleid

			--WHERE mf.moduleid = CASE (@TechArea)

			--		WHEN 0

			--			THEN mf.moduleid

			--		ELSE @TechArea

			--		END

			

			UNION

			

			SELECT mf.featurename

				,md.modulename

			FROM mst_feature mf

			INNER JOIN lnk_SplFormModule lnk ON mf.featureid = lnk.featureid

			INNER JOIN mst_module md ON md.moduleid = lnk.moduleid

			)

		SELECT DISTINCT Mst_Feature.FeatureName [FormName]

			

			,Mst_User.UserName [UpdatedBy]

			,isnull(CONVERT(VARCHAR, Mst_Feature.updatedate, 103), CONVERT(VARCHAR, Mst_Feature.createdate, 103)) [LastUpdate]

			,Mst_Feature.Published [Published]

			,Mst_Feature.FeatureID [FormId]

			,Mst_Feature.Seq
			,(

				Stuff((

						SELECT ', ' + modulename

						FROM (

							SELECT featurename

								,modulename

							FROM FeatureData

							) tbl2

						WHERE tbl2.featurename = Mst_Feature.featurename

						FOR XML PATH('')

						), 1, 1, '')

				) [ServiceArea]

		FROM Mst_Feature

			,Mst_User

			,FeatureData

		WHERE Mst_Feature.UserId = Mst_User.UserId

			AND Mst_Feature.FeatureName = FeatureData.featurename

			AND (

				ISNULL(@MName, '00') = '00'

				OR FeatureData.modulename LIKE '%' + @MName + '%'

				)

			AND Mst_Feature.Published = 1

			AND Mst_Feature.deleteflag = 0

			AND Mst_Feature.FeatureId > 1000

			AND CountryId = @CountryId

			AND Mst_Feature.RegistrationFormFlag IS NULL

			--AND Mst_Feature.moduleid = CASE (@TechArea)

			--	WHEN 0

			--		THEN Mst_Feature.moduleid

			--	ELSE @TechArea

			--	END

			--and Mst_Feature.moduleid in (select moduleid from mst_module where status=2 and moduleid!=2)   

			AND Mst_Feature.moduleid IN (

				SELECT moduleid

				FROM mst_module

				WHERE STATUS = 2

				)

			AND mst_feature.FeatureName NOT LIKE 'CareEnd%'

			----AND mst_feature.FeatureName NOT LIKE 'patient home%'

			AND mst_feature.FeatureName NOT LIKE 'facility home%'

		ORDER BY Seq

			,[FormName]

	END

END

GO


