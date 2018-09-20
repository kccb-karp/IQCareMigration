
/****** Object:  StoredProcedure [dbo].[pr_Clinical_GetPatientRegistrationCustomFormFieldLabel_Constella]    Script Date: 8/31/2018 8:15:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/*
Requested By	-	Bug ID 1220
Updated By		-	Bhupendra Singh
Description		-	Add filter condition for table 1, patient registration should be 1
Updated Date	-	01 June 2016
DB Version		-	IQCare 3.8.1 
*/


ALTER PROCEDURE [dbo].[pr_Clinical_GetPatientRegistrationCustomFormFieldLabel_Constella] @FeatureId INT
	,@PatientId INT
	,@Password VARCHAR(40)=null
AS
BEGIN
	DECLARE @SymKey VARCHAR(400)
	DECLARE @FormVisitType INT
	DECLARE @VisitTypeId INT
	DECLARE @FeatureName VARCHAR(100)

	--SET @SymKey = 'Open symmetric key Key_CTC decryption by password=' + @password + ''

	--EXEC (@SymKey)

	--Table 0                                                                                                                                                                  
	SELECT dbo.fn_PatientIdentificationNumber_Constella(a.ptn_pk, '', 1) [PatientIdentification]
		,(convert(VARCHAR(50), decryptbykey(a.firstname)) + ' ' + ISNULL(convert(VARCHAR(50), decryptbykey(a.MiddleName)), '') + ' ' + convert(VARCHAR(50), decryptbykey(a.lastName))) NAME
		,a.PatientClinicID
		,a.DOB
		,a.LocationID
	FROM mst_patient a
		,ord_visit b
	WHERE a.ptn_pk = b.ptn_pk
		AND b.Visittype = 12
		AND a.ptn_pk = @patientid

	---Table 1                                                
	SELECT *
	FROM (
		SELECT tbl1.FeatureId
			,tbl2.FeatureName
			,tbl1.SectionId
			,tbl3.SectionName
			,tbl3.SectionInfo
			,tbl1.FieldId
			,tbl4.BindField [FieldName]
			,replace(tbl1.FieldLabel, '''', '') [FieldLabel]
			,tbl1.Predefined
			,tbl4.PDFTableName
			,tbl4.ControlId
			,tbl4.ModuleId
			,tbl4.BindTable [BindSource]
			,tbl4.CategoryId [CodeId]
			,tbl1.Seq
			,tbl3.Seq [SeqSection]
			,	Convert(bit,Isnull(tbl3.IsGridView,0)) IsGridView
		FROM Lnk_forms tbl1
		INNER JOIN mst_feature tbl2 ON tbl1.FeatureId = tbl2.FeatureID
		INNER JOIN mst_section tbl3 ON tbl1.SectionId = tbl3.SectionID
		INNER JOIN Mst_PreDefinedFields tbl4 ON tbl1.FieldId = tbl4.Id
		LEFT OUTER JOIN mst_pmtctcode tbl5 ON (
				tbl4.CategoryId = tbl5.CodeId
				AND tbl4.BindTable = 'Mst_PMTCTDecode'
				)
		LEFT OUTER JOIN mst_code tbl6 ON (
				tbl4.CategoryId = tbl6.CodeId
				AND Tbl4.BindTable = 'Mst_DeCode'
				)
		WHERE tbl1.predefined = 1
			AND tbl1.FeatureId = @FeatureId
			AND tbl4.PatientRegistration = 1
		UNION
		
		SELECT tbl1.FeatureId
			,tbl2.FeatureName
			,tbl1.SectionId
			,tbl3.SectionName
			,tbl3.SectionInfo
			,tbl1.FieldId
			,'PlaceHolder' [FieldName]
			,replace(tbl1.FieldLabel, '''', '') [FieldLabel]
			,tbl1.Predefined
			,tbl4.PDFTableName
			,tbl4.ControlId
			,tbl4.ModuleId
			,tbl4.BindTable [BindSource]
			,tbl4.CategoryId [CodeId]
			,tbl1.Seq
			,tbl3.Seq [SeqSection]
			,Convert(bit,Isnull(tbl3.IsGridView,0)) IsGridView
		FROM Lnk_forms tbl1
		INNER JOIN mst_feature tbl2 ON tbl1.FeatureId = tbl2.FeatureID
		INNER JOIN mst_section tbl3 ON tbl1.SectionId = tbl3.SectionID
		INNER JOIN Mst_PreDefinedFields tbl4 ON 71 = tbl4.Id
		LEFT OUTER JOIN mst_pmtctcode tbl5 ON (
				tbl4.CategoryId = tbl5.CodeId
				AND tbl4.BindTable = 'Mst_PMTCTDecode'
				)
		LEFT OUTER JOIN mst_code tbl6 ON (
				tbl4.CategoryId = tbl6.CodeId
				AND Tbl4.BindTable = 'Mst_DeCode'
				)
		WHERE tbl1.predefined = 1
			AND substring(convert(VARCHAR, tbl1.fieldid), 3, 5) = '00000'
			AND tbl1.FeatureId = @FeatureId
			AND tbl4.PatientRegistration = 1
		UNION
		
		SELECT tbl1.FeatureId
			,tbl2.FeatureName
			,tbl1.SectionId
			,tbl3.SectionName
			,tbl3.SectionInfo
			,tbl1.FieldId
			,tbl4.FieldName [FieldName]
			,replace(tbl1.FieldLabel, '''', '') [FieldLabel]
			,tbl1.Predefined
			,'PDFTableName' = CASE 
				WHEN ControlId = 11
					THEN NULL
				WHEN ControlId = 12
					THEN NULL
				ELSE 'dtl_CustomField'
				END
			,tbl4.ControlId
			,0 [ModuleId]
			,tbl4.BindTable [BindSource]
			,tbl5.CodeID
			,tbl1.Seq
			,tbl3.Seq [SeqSection]
			,	Convert(bit,Isnull(tbl3.IsGridView,0)) IsGridView
		FROM Lnk_forms tbl1
		INNER JOIN mst_feature tbl2 ON tbl1.FeatureId = tbl2.FeatureID
		INNER JOIN mst_section tbl3 ON tbl1.SectionId = tbl3.SectionID
		INNER JOIN mst_CustomformField tbl4 ON tbl1.FieldId = tbl4.Id
		LEFT OUTER JOIN mst_Modcode tbl5 ON (
				tbl4.CategoryId = tbl5.CodeId
				AND tbl4.BindTable = 'Mst_ModDecode'
				)
		WHERE tbl1.Predefined = 0
			AND tbl1.FeatureId = @FeatureId
		) Z
	ORDER BY Z.SeqSection
		,Z.Seq ASC

	---Table 02 [for Business Rule]                                                                                                                           
	SELECT DISTINCT Y.FieldId
		,Y.FieldLabel
		,Y.Predefined
		,Y.BusRuleId
		,Y.FieldName
		,Mst_BusinessRule.NAME
		,Y.ControlId
		,Y.Value
		,Y.Value1
		,Y.TableName
	FROM (
		SELECT Z.FieldId
			,Z.FieldLabel
			,Z.Predefined
			,Z.FieldName
			,lnk_fieldsBusinessRule.BusRuleId
			,lnk_fieldsBusinessRule.Value
			,lnk_fieldsBusinessRule.Value1
			,Z.ControlId
			,Z.TableName
		FROM (
			SELECT tbl1.FieldId
				,tbl1.FieldLabel
				,tbl1.Predefined
				,tbl2.BindField [FieldName]
				,tbl2.PDFTableName [TableName]
				,tbl2.ControlId
			FROM lnk_forms tbl1
			INNER JOIN Mst_PreDefinedFields tbl2 ON tbl1.FieldId = tbl2.Id
			WHERE tbl1.FeatureId = @FeatureId
				AND tbl1.predefined = 1
			
			UNION
			
			SELECT tbl1.FieldId
				,tbl1.FieldLabel
				,tbl1.Predefined
				,tbl2.FieldName [FieldName]
				,'dtl_customfield' [TableName]
				,tbl2.ControlId
			FROM lnk_forms tbl1
			INNER JOIN mst_CustomformField tbl2 ON tbl1.FieldId = tbl2.Id
			WHERE FeatureId = @FeatureId
				AND tbl1.predefined = 0
			) Z
		INNER JOIN lnk_fieldsBusinessRule ON Z.FieldId = lnk_fieldsBusinessRule.FieldId
			AND Z.Predefined = lnk_fieldsBusinessRule.Predefined
		) Y
		,Mst_BusinessRule
	WHERE Y.BusRuleId = Mst_BusinessRule.ID
	
	UNION
	
	SELECT a.ConditionalFieldId [FieldId]
		,a.ConditionalFieldLabel [FieldLabel]
		,a.ConditionalFieldPredefined [Predefined]
		,c.Id [BusRuleId]
		,a.ConditionalFieldName [FieldName]
		,c.NAME
		,a.ConditionalFieldControlId [ControlId]
		,b.Value
		,b.Value1
		,a.ConditionalFieldSavingTable [TableName]
	FROM Vw_FieldConditionalField a
	INNER JOIN lnk_FieldsBusinessRule b ON (
			a.ConditionalFieldId = b.FieldId
			AND a.ConditionalFieldPredefined = b.Predefined
			)
	INNER JOIN Mst_BusinessRule c ON b.BusRuleId = c.id
	WHERE a.FeatureId = @FeatureId
	ORDER BY BusRuleId

	---Table 03 for all Controls Except MultiSelect                                                 
	SELECT *
	FROM (
		SELECT tbl1.FeatureId
			,tbl2.FeatureName
			,tbl1.SectionId
			,tbl3.SectionName
			,tbl1.FieldId
			,tbl4.BindField [FieldName]
			,replace(tbl1.FieldLabel, '''', '') [FieldLabel]
			,tbl1.Predefined
			,lower(tbl4.PDFTableName) [PDFTableName]
			,tbl4.ControlId
			,tbl4.ModuleId
			,tbl4.BindTable [BindSource]
			,tbl4.CategoryId [CodeId]
			,tbl1.Seq
		FROM Lnk_forms tbl1
		INNER JOIN mst_feature tbl2 ON tbl1.FeatureId = tbl2.FeatureID
		INNER JOIN mst_section tbl3 ON tbl1.SectionId = tbl3.SectionID
		INNER JOIN Mst_PreDefinedFields tbl4 ON tbl1.FieldId = tbl4.Id
		LEFT OUTER JOIN mst_pmtctcode tbl5 ON (
				tbl4.CategoryId = tbl5.CodeId
				AND tbl4.BindTable = 'Mst_PMTCTDecode'
				)
		LEFT OUTER JOIN mst_code tbl6 ON (
				tbl4.CategoryId = tbl6.CodeId
				AND Tbl4.BindTable = 'Mst_DeCode'
				)
		WHERE tbl1.predefined = 1
			AND tbl1.FeatureId = @FeatureId
			AND tbl4.ControlId NOT IN (9)
		
		UNION
		
		SELECT tbl1.FeatureId
			,tbl2.FeatureName
			,tbl1.SectionId
			,tbl3.SectionName
			,tbl1.FieldId
			,tbl4.FieldName [FieldName]
			,replace(tbl1.FieldLabel, '''', '') [FieldLabel]
			,tbl1.Predefined
			,'PDFTableName' = CASE 
				WHEN ControlId = 11
					THEN NULL
				WHEN ControlId = 12
					THEN NULL
				ELSE 'dtl_customfield'
				END
			,tbl4.ControlId
			,0 'ModuleId'
			,tbl4.BindTable [BindSource]
			,tbl5.CodeID
			,tbl1.Seq
		FROM Lnk_forms tbl1
		INNER JOIN mst_feature tbl2 ON tbl1.FeatureId = tbl2.FeatureID
		INNER JOIN mst_section tbl3 ON tbl1.SectionId = tbl3.SectionID
		INNER JOIN mst_CustomformField tbl4 ON tbl1.FieldId = tbl4.Id
		LEFT OUTER JOIN mst_Modcode tbl5 ON (
				tbl4.CategoryId = tbl5.CodeId
				AND tbl4.BindTable = 'Mst_ModDecode'
				)
		WHERE tbl1.Predefined = 0
			AND tbl1.FeatureId = @FeatureId
			AND tbl4.ControlId NOT IN (9)
		
		UNION
		
		SELECT a.FeatureId
			,b.FeatureName
			,a.FieldSectionId
			,a.FieldSectionName
			,a.ConditionalFieldId [FieldId]
			,a.ConditionalFieldName [FieldName]
			,a.ConditionalFieldLabel [FieldLabel]
			,a.ConditionalFieldPredefined [Predefined]
			,lower(a.ConditionalFieldSavingTable) [PDFTableName]
			,a.ConditionalFieldControlId [ControlId]
			,a.ModuleId
			,a.ConditionalFieldBindTable [BindSource]
			,a.ConditionalFieldCategoryId [CodeId]
			,a.ConditionalFieldSequence [Seq]
		FROM VW_RegistrationConditionalField a
		INNER JOIN Mst_Feature b ON a.FeatureId = b.FeatureId
			AND b.FeatureId = @FeatureId
			AND a.ConditionalFieldSavingTable IS NOT NULL
			--union      
			--select tbl.FeatureId, 'Patient Registration'[FeatureName], tbl.FieldSectionId[SectionId], tbl.FieldSectionName[SectionName],            
			--tbl1.Id, tbl1.BindField[FieldName], tbl.FieldLabel, tbl.FieldPredefined[Predefined],  lower(tbl1.PDFTableName)[PDFTableName],            
			--tbl1.ControlId, tbl1.ModuleId, tbl1.BindTable[BindSource],             
			--0[CodeId], 0[Seq]            
			--from VW_RegistrationConditionalField tbl inner join Mst_PreDefinedFields tbl1 on tbl.FieldId=tbl1.Id            
			--and tbl.FeatureId=@FeatureId             
		) Z
	ORDER BY Z.Seq ASC

	--Table 04                                                                                                  
	SELECT *
	FROM mst_feature
	WHERE FeatureId = @FeatureId

	--Table 05                                                                                           
	SELECT @FormVisitType = MultiVisit
		,@FeatureName = FeatureName
	FROM mst_feature
	WHERE FeatureId = @FeatureId

	SELECT @VisitTypeId = VisitTypeId
	FROM mst_Visittype
	WHERE (
			deleteflag = 0
			OR deleteflag IS NULL
			)
		AND visitname = @FeatureName

	IF (@FormVisitType = 1)
	BEGIN
		SELECT '0' [Visit_Id]
	END
	ELSE
	BEGIN
		SELECT Visit_Id
		FROM Ord_Visit
		WHERE Ptn_pk = @PatientId
			AND VisitType = @VisitTypeId
			AND (
				DeleteFlag IS NULL
				OR DeleteFlag = 0
				)
	END

	---Table 06 Conditional Fields                            
	SELECT a.FeatureId
		,b.FeatureName
		,a.FieldSectionId
		,a.FieldSectionName
		,'8' + Convert(VARCHAR, a.ConditionalFieldId) [FieldId]
		,a.ConditionalFieldBindField [FieldName]
		,a.ConditionalFieldLabel [FieldLabel]
		,a.ConditionalFieldPredefined [Predefined]
		,a.ConditionalFieldSavingTable [PDFTableName]
		,a.ConditionalFieldControlId [ControlId]
		,a.ConditionalFieldBindTable [BindSource]
		,a.ConditionalFieldCategoryId [CodeId]
		,a.ConditionalFieldSequence [Seq]
		,a.FieldSectionSequence [SeqSection]
		,ConditionalFieldSectionId
		,a.FieldId [ConFieldId]
		,a.FieldPredefined [ConFieldPredefined]
		,a.ModuleId
		,a.ConditionalFieldId
	FROM VW_RegistrationConditionalField a
	INNER JOIN Mst_Feature b ON a.FeatureId = b.FeatureId
		AND a.ConditionalFieldPredefined = 1
		AND b.FeatureId = @FeatureId
		AND a.ConditionalFieldId IS NOT NULL
		AND a.ConditionalFieldName IS NOT NULL
	
	UNION
	
	SELECT a.FeatureId
		,b.FeatureName
		,a.FieldSectionId
		,a.FieldSectionName
		,'9' + Convert(VARCHAR, a.ConditionalFieldId) [FieldId]
		,a.ConditionalFieldName [FieldName]
		,a.ConditionalFieldLabel [FieldLabel]
		,a.ConditionalFieldPredefined [Predefined]
		,a.ConditionalFieldSavingTable [PDFTableName]
		,a.ConditionalFieldControlId [ControlId]
		,a.ConditionalFieldBindTable [BindSource]
		,a.ConditionalFieldCategoryId [CodeId]
		,a.ConditionalFieldSequence [Seq]
		,a.FieldSectionSequence [SeqSection]
		,ConditionalFieldSectionId
		,a.FieldId [ConFieldId]
		,a.FieldPredefined [ConFieldPredefined]
		,a.ModuleId
		,a.ConditionalFieldId
	FROM VW_RegistrationConditionalField a
	INNER JOIN Mst_Feature b ON a.FeatureId = b.FeatureId
		AND a.ConditionalFieldPredefined = 0
		AND b.FeatureId = @FeatureId
		AND a.ConditionalFieldId IS NOT NULL
		AND a.ConditionalFieldName IS NOT NULL
	
	UNION
	
	SELECT a.FeatureId
		,b.FeatureName
		,a.FieldSectionId
		,a.FieldSectionName
		,'8' + Convert(VARCHAR, a.ConditionalFieldId) [FieldId]
		,'PlaceHolder' [FieldName]
		,a.ConditionalFieldLabel [FieldLabel]
		,a.ConditionalFieldPredefined [Predefined]
		,a.ConditionalFieldSavingTable [PDFTableName]
		,'13' [ControlId]
		,a.ConditionalFieldBindTable [BindSource]
		,a.ConditionalFieldCategoryId [CodeId]
		,a.ConditionalFieldSequence [Seq]
		,a.FieldSectionSequence [SeqSection]
		,ConditionalFieldSectionId
		,a.FieldId [ConFieldId]
		,a.FieldPredefined [ConFieldPredefined]
		,a.ModuleId
		,a.ConditionalFieldId
	FROM VW_RegistrationConditionalField a
	INNER JOIN Mst_Feature b ON a.FeatureId = b.FeatureId
		AND a.ConditionalFieldPredefined = 1
		AND b.FeatureId = @FeatureId
		AND a.ConditionalFieldId IS NOT NULL
		AND a.ConditionalFieldId LIKE '710000%'

	--Table 07                                                                 
	SELECT a.StartDate
	FROM dbo.lnk_PatientProgramStart a
	INNER JOIN Mst_Feature b ON a.ModuleId = b.ModuleId
	WHERE b.FeatureId = @FeatureId
		AND a.Ptn_Pk = @PatientId

	--Table 08                                          
	DECLARE @sql NVARCHAR(max)

	SET @sql = 'if exists(select * from sysobjects where name=''DTL_FBCUSTOMFIELD_' + REPLACE(@FeatureName, ' ', '_') + ''')                                                   

				Begin                                                  

					select  * from [DTL_FBCUSTOMFIELD_' + REPLACE(@FeatureName, ' ', '_') + '] a inner join ord_visit b on a.visit_pk=b.Visit_Id                                                           

					where b.ptn_pk=' + convert(VARCHAR, @PatientId) + ' order by b.visitdate desc                                                   

				end                                              

				else                                               

					Begin                                              

						Select 0                                              

					End'

	EXECUTE sp_executesql @sql

	--print  @sql                            
	--Table 09                                   
	SELECT Z.Visit_ID [VisitID]
		,z.VisitDate
	FROM (
		SELECT visit_id
			,VisitDate
		FROM ord_Visit
		WHERE Visittype = (
				SELECT VisitTypeID
				FROM mst_visittype
				WHERE (
						deleteflag = 0
						OR deleteflag IS NULL
						)
					AND VisitTypeID <> 0
					AND convert(BINARY (50), VisitName) = convert(BINARY (50), (
							SELECT FeatureName
							FROM mst_feature
							WHERE FeatureID = @FeatureId
							))
				)
			AND Ptn_Pk = @PatientId
		) Z
	WHERE Z.visitdate = (
			SELECT X.Visitdate
			FROM (
				SELECT DISTINCT max(visitdate) [visitdate]
				FROM ord_Visit
				WHERE (
						deleteflag = 0
						OR deleteflag IS NULL
						)
					AND Visittype = (
						SELECT VisitTypeID
						FROM mst_visittype
						WHERE (
								deleteflag = 0
								OR deleteflag IS NULL
								)
							AND VisitTypeID <> 0
							AND VisitTypeID <> 0
							AND convert(BINARY (50), VisitName) = convert(BINARY (50), (
									SELECT FeatureName
									FROM mst_feature
									WHERE FeatureID = @FeatureId
									))
						)
					AND Ptn_Pk = @PatientId
				) X
			)

	--CLOSE symmetric KEY Key_CTC

	SELECT FeatureID
		,FeatureName
		,DeleteFlag
		,Published
	FROM mst_feature
	WHERE FeatureID = @FeatureId
		AND Published = 2
END

GO


