
/****** Object:  StoredProcedure [dbo].[pr_Clinical_GetCustomFormFieldLabel_Constella]    Script Date: 9/4/2018 11:32:08 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dbo].[pr_Clinical_GetCustomFormFieldLabel_Constella] @FeatureId INT
	,@PatientId INT
	,@Password VARCHAR(40)=null
AS
BEGIN
	DECLARE @SymKey VARCHAR(400)
	DECLARE @FormVisitType INT
	DECLARE @VisitTypeId INT
	DECLARE @FeatureName VARCHAR(100)


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

	----Table 1     
	 Select Distinct FV.FeatureId
	, FV.FeatureName
	, FV.FormDescription
	, FV.FormId
	, FV.SectionId
	, FV.SectionName
	, FV.SectionInfo
	, FV.PaddedFieldId FieldId
	, FieldName = Case When FieldID = 71 And FV.Predefined = 1 Then 'PlaceHolder' + convert(varchar, FV.FieldOrder) + convert(varchar, FV.SectionId) Else FV.FieldName End 
	, FieldLabel
	, FV.Predefined
	, FV.PDFTableName
	, FV.ControlId
	, FV.ControlReferenceId ReferenceId
	, FV.BindTable As BindSource
	, FV.BindCategory
	, FV.CategoryId CodeId
	, FV.FieldOrder Seq
	, FV.SectionOrder SeqSection
	, FV.IsGridView
	, TS.TabId
	, MT.TabName
	, MT.seq TabSeq 
 From FormFieldsView FV  
 Inner Join lnk_FormTabSection TS On TS.FeatureID = FV.FeatureId And TS.SectionID = FV.SectionId
 Inner Join Mst_FormBuilderTab MT On TS.TabID = MT.TabID
 Where FV.FeatureId= @FeatureId
 And (FV.PatientRegistration Is Null Or FV.PatientRegistration = 0)    
 And (FV.FeatureDeleteFlag = 0 Or FV.FeatureDeleteFlag Is Null)  
 Order By SeqSection, Seq, TabSeq    Asc 
	                                     
	--SELECT *
	--FROM (
	--	SELECT tbl1.FeatureId
	--		,tbl2.FeatureName
			
	--		,tbl1.SectionId
	--		,tbl3.SectionName
	--		,CASE tbl1.Predefined
	--			WHEN 1
	--				THEN '9999' + convert(VARCHAR, tbl1.FieldId)
	--			WHEN 0
	--				THEN '8888' + convert(VARCHAR, Tbl1.FieldId)
	--			END [FieldId]
	--		,tbl4.BindField [FieldName]
	--		,replace(tbl1.FieldLabel, '''', '') [FieldLabel]
	--		,tbl1.Predefined
	--		,UPPER(tbl4.PDFTableName) [PDFTableName]
	--		,tbl4.ControlId
	--		,tbl4.BindTable [BindSource]
	--		,tbl4.CategoryId [CodeId]
	--		,tbl1.Seq
	--		,tbl3.Seq [SeqSection]
	--		,tbl3.IsGridView
	--		,tbl7.TabId
	--		,tbl8.TabName
	--		,tbl8.seq [tabSeq]
	--		,tbl1.AdditionalInformation
	--	FROM Lnk_forms tbl1
	--	INNER JOIN mst_feature tbl2 ON tbl1.FeatureId = tbl2.FeatureID
	--	INNER JOIN mst_section tbl3 ON tbl1.SectionId = tbl3.SectionID
	--	INNER JOIN Mst_PreDefinedFields tbl4 ON tbl1.FieldId = tbl4.Id
	--	LEFT OUTER JOIN mst_pmtctcode tbl5 ON (
	--			tbl4.CategoryId = tbl5.CodeId
	--			AND tbl4.BindTable = 'Mst_PMTCTDecode'
	--			)
	--	LEFT OUTER JOIN mst_code tbl6 ON (
	--			tbl4.CategoryId = tbl6.CodeId
	--			AND Tbl4.BindTable = 'Mst_DeCode'
	--			)
	--	INNER JOIN dbo.lnk_FormTabSection tbl7 ON tbl1.FeatureId = tbl7.FeatureId
	--		AND tbl1.SectionId = tbl7.SectionId
	--	INNER JOIN dbo.Mst_FormBuilderTab tbl8 ON tbl7.TabId = tbl8.TabId
	--	WHERE tbl1.predefined = 1
	--		AND tbl1.FeatureId = @FeatureId
	--		AND tbl1.FieldId <> 71
	--		AND (
	--			tbl4.PatientRegistration IS NULL
	--			OR tbl4.PatientRegistration = 0
	--			)
	--		AND (
	--			tbl2.Deleteflag = 0
	--			OR tbl2.Deleteflag IS NULL
	--			)
		
	--	UNION
		
	--	SELECT tbl1.FeatureId
	--		,tbl2.FeatureName
	--		,tbl1.SectionId
	--		,tbl3.SectionName
	--		,tbl1.FieldId
	--		,'PlaceHolder' + Convert(VARCHAR, tbl1.Seq) + Convert(VARCHAR, tbl1.SectionId) [FieldName]
	--		,replace(tbl1.FieldLabel, '''', '') [FieldLabel]
	--		,tbl1.Predefined
	--		,UPPER(tbl4.PDFTableName) [PDFTableName]
	--		,tbl4.ControlId
	--		,tbl4.BindTable [BindSource]
	--		,tbl4.CategoryId [CodeId]
	--		,tbl1.Seq
	--		,tbl3.Seq [SeqSection]
	--		,tbl3.IsGridView
	--		,tbl7.TabId
	--		,tbl8.TabName
	--		,tbl8.seq [tabSeq]
	--		,tbl1.AdditionalInformation
	--	FROM Lnk_forms tbl1
	--	INNER JOIN mst_feature tbl2 ON tbl1.FeatureId = tbl2.FeatureID
	--	INNER JOIN mst_section tbl3 ON tbl1.SectionId = tbl3.SectionID
	--	INNER JOIN Mst_PreDefinedFields tbl4 ON 71 = tbl4.Id
	--	LEFT OUTER JOIN mst_pmtctcode tbl5 ON (
	--			tbl4.CategoryId = tbl5.CodeId
	--			AND tbl4.BindTable = 'Mst_PMTCTDecode'
	--			)
	--	LEFT OUTER JOIN mst_code tbl6 ON (
	--			tbl4.CategoryId = tbl6.CodeId
	--			AND Tbl4.BindTable = 'Mst_DeCode'
	--			)
	--	INNER JOIN dbo.lnk_FormTabSection tbl7 ON tbl1.FeatureId = tbl7.FeatureId
	--		AND tbl1.SectionId = tbl7.SectionId
	--	INNER JOIN dbo.Mst_FormBuilderTab tbl8 ON tbl7.TabId = tbl8.TabId
	--	WHERE tbl1.predefined = 1
	--		AND tbl1.FeatureId = @FeatureId
	--		AND tbl1.FieldId = 71
	--		AND (
	--			tbl4.PatientRegistration IS NULL
	--			OR tbl4.PatientRegistration = 0
	--			) --and substring(convert(varchar,tbl1.fieldid),3,5) = '00000'                                                
	--		AND (
	--			tbl2.Deleteflag = 0
	--			OR tbl2.Deleteflag IS NULL
	--			)
		
	--	UNION
		
	--	SELECT tbl1.FeatureId
	--		,tbl2.FeatureName
	--		,tbl1.SectionId
	--		,tbl3.SectionName
	--		,CASE tbl1.Predefined
	--			WHEN 1
	--				THEN '9999' + convert(VARCHAR, tbl1.FieldId)
	--			WHEN 0
	--				THEN '8888' + convert(VARCHAR, Tbl1.FieldId)
	--			END [FieldId]
	--		,tbl4.FieldName [FieldName]
	--		,replace(tbl1.FieldLabel, '''', '') [FieldLabel]
	--		,tbl1.Predefined
	--		,'PDFTableName' = Upper(CASE 
	--				WHEN ControlId = 11
	--					THEN NULL
	--				WHEN ControlId = 12
	--					THEN NULL
	--				WHEN ControlId = 16
	--					THEN NULL
	--				ELSE 'dtl_CustomField'
	--				END)
	--		,tbl4.ControlId
	--		,tbl4.BindTable [BindSource]
	--		,tbl5.CodeID
	--		,tbl1.Seq
	--		,tbl3.Seq [SeqSection]
	--		,tbl3.IsGridView
	--		,tbl7.TabId
	--		,tbl8.TabName
	--		,tbl8.seq [tabSeq]
	--		,tbl1.AdditionalInformation
	--	FROM Lnk_forms tbl1
	--	INNER JOIN mst_feature tbl2 ON tbl1.FeatureId = tbl2.FeatureID
	--	INNER JOIN mst_section tbl3 ON tbl1.SectionId = tbl3.SectionID
	--	INNER JOIN mst_CustomformField tbl4 ON tbl1.FieldId = tbl4.Id
	--	LEFT OUTER JOIN mst_Modcode tbl5 ON (
	--			tbl4.CategoryId = tbl5.CodeId
	--			AND tbl4.BindTable = 'Mst_ModDecode'
	--			)
	--	INNER JOIN dbo.lnk_FormTabSection tbl7 ON tbl1.FeatureId = tbl7.FeatureId
	--		AND tbl1.SectionId = tbl7.SectionId
	--	INNER JOIN dbo.Mst_FormBuilderTab tbl8 ON tbl7.TabId = tbl8.TabId
	--	WHERE tbl1.Predefined = 0
	--		AND tbl1.FeatureId = @FeatureId
	--		AND (
	--			tbl3.IsGridView <> 1
	--			OR tbl3.IsGridView IS NULL
	--			)
	--		AND (
	--			tbl4.PatientRegistration IS NULL
	--			OR tbl4.PatientRegistration = 0
	--			)
	--		AND (
	--			tbl2.Deleteflag = 0
	--			OR tbl2.Deleteflag IS NULL
	--			)
		
	--	UNION
		
	--	SELECT tbl1.FeatureId
	--		,tbl2.FeatureName
	--		,tbl1.SectionId
	--		,tbl3.SectionName
	--		,CASE tbl1.Predefined
	--			WHEN 1
	--				THEN '9999' + convert(VARCHAR, tbl1.FieldId)
	--			WHEN 0
	--				THEN '8888' + convert(VARCHAR, Tbl1.FieldId)
	--			END [FieldId]
	--		,tbl4.FieldName [FieldName]
	--		,replace(tbl1.FieldLabel, '''', '') [FieldLabel]
	--		,tbl1.Predefined
	--		,'PDFTableName' = Upper(CASE 
	--				WHEN ControlId = 11
	--					THEN NULL
	--				WHEN ControlId = 12
	--					THEN NULL
	--				WHEN ControlId = 16
	--					THEN NULL
	--				ELSE 'DTL_CUSTOMFORM'
	--				END)
	--		,tbl4.ControlId
	--		,tbl4.BindTable [BindSource]
	--		,tbl5.CodeID
	--		,tbl1.Seq
	--		,tbl3.Seq [SeqSection]
	--		,tbl3.IsGridView
	--		,tbl7.TabId
	--		,tbl8.TabName
	--		,tbl8.seq [tabSeq]
	--		,tbl1.AdditionalInformation
	--	FROM Lnk_forms tbl1
	--	INNER JOIN mst_feature tbl2 ON tbl1.FeatureId = tbl2.FeatureID
	--	INNER JOIN mst_section tbl3 ON tbl1.SectionId = tbl3.SectionID
	--	INNER JOIN mst_CustomformField tbl4 ON tbl1.FieldId = tbl4.Id
	--	LEFT OUTER JOIN mst_Modcode tbl5 ON (
	--			tbl4.CategoryId = tbl5.CodeId
	--			AND tbl4.BindTable = 'Mst_ModDecode'
	--			)
	--	INNER JOIN dbo.lnk_FormTabSection tbl7 ON tbl1.FeatureId = tbl7.FeatureId
	--		AND tbl1.SectionId = tbl7.SectionId
	--	INNER JOIN dbo.Mst_FormBuilderTab tbl8 ON tbl7.TabId = tbl8.TabId
	--	WHERE tbl1.Predefined = 0
	--		AND tbl1.FeatureId = @FeatureId
	--		AND tbl3.IsGridView = 1
	--		AND (
	--			tbl4.PatientRegistration IS NULL
	--			OR tbl4.PatientRegistration = 0
	--			)
	--		AND (
	--			tbl2.Deleteflag = 0
	--			OR tbl2.Deleteflag IS NULL
	--			)
	--	) Z
	--ORDER BY Z.SeqSection
	--	,Z.Seq
	--	,Z.tabSeq ASC

	---Table 02 [for Business Rule]                                                                                                                                                       
	SELECT DISTINCT Y.FieldId
		,Y.FieldLabel
		,Y.Predefined
		,Y.BusRuleId
		,Y.FieldName
		,Mst_BusinessRule.NAME
		,Y.ControlId
		,ISNULL(Y.Value, 0) [Value]
		,ISNULL(Y.Value1, 0) [Value1]
		,Upper(Y.TableName) [TableName]
		,Y.TabId
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
			,Z.TabId
		FROM (
			SELECT CASE tbl1.Predefined
					WHEN 1
						THEN '9999' + convert(VARCHAR, tbl1.FieldId)
					WHEN 0
						THEN '8888' + convert(VARCHAR, Tbl1.FieldId)
					END [FieldId]
				,tbl1.FieldLabel
				,tbl1.Predefined
				,tbl2.BindField [FieldName]
				,tbl2.PDFTableName [TableName]
				,tbl2.ControlId
				,tbl3.TabId
			FROM lnk_forms tbl1
			INNER JOIN Mst_PreDefinedFields tbl2 ON tbl1.FieldId = tbl2.Id
			INNER JOIN dbo.lnk_FormTabSection tbl3 ON tbl1.FeatureId = tbl3.FeatureID
				AND tbl3.SectionID = tbl1.SectionID
			WHERE tbl1.FeatureId = @FeatureId
				AND tbl1.predefined = 1
			
			UNION
			
			SELECT CASE tbl1.Predefined
					WHEN 1
						THEN '9999' + convert(VARCHAR, tbl1.FieldId)
					WHEN 0
						THEN '8888' + convert(VARCHAR, Tbl1.FieldId)
					END [FieldId]
				,tbl1.FieldLabel
				,tbl1.Predefined
				,tbl2.FieldName [FieldName]
				,'dtl_CustomField' [TableName]
				,tbl2.ControlId
				,tbl3.TabId
			FROM lnk_forms tbl1
			INNER JOIN mst_CustomformField tbl2 ON tbl1.FieldId = tbl2.Id
			INNER JOIN dbo.lnk_FormTabSection tbl3 ON tbl1.FeatureId = tbl3.FeatureID
				AND tbl3.SectionID = tbl1.SectionID
			WHERE tbl1.FeatureId = @FeatureId
				AND tbl1.predefined = 0
			) Z
		INNER JOIN lnk_fieldsBusinessRule ON Z.FieldId = CASE lnk_fieldsBusinessRule.Predefined
				WHEN 1
					THEN '9999' + convert(VARCHAR, lnk_fieldsBusinessRule.FieldId)
				WHEN 0
					THEN '8888' + convert(VARCHAR, lnk_fieldsBusinessRule.FieldId)
				END
			AND Z.Predefined = lnk_fieldsBusinessRule.Predefined
		) Y
		,Mst_BusinessRule
	WHERE Y.BusRuleId = Mst_BusinessRule.ID
	
	UNION
	
	SELECT CASE b.Predefined
			WHEN 1
				THEN '9999' + convert(VARCHAR, a.ConditionalFieldId)
			WHEN 0
				THEN '8888' + convert(VARCHAR, a.ConditionalFieldId)
			END [FieldId]
		,a.ConditionalFieldLabel [FieldLabel]
		,a.ConditionalFieldPredefined [Predefined]
		,c.Id [BusRuleId]
		,a.ConditionalFieldName [FieldName]
		,c.NAME
		,a.ConditionalFieldControlId [ControlId]
		,b.Value
		,b.Value1
		,Upper(a.ConditionalFieldSavingTable) [TableName]
		,a.TabId
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
			,CASE tbl1.Predefined
				WHEN 1
					THEN '9999' + convert(VARCHAR, tbl1.FieldId)
				WHEN 0
					THEN '8888' + convert(VARCHAR, tbl1.FieldId)
				END [FieldId]
			,tbl4.BindField [FieldName]
			,replace(tbl1.FieldLabel, '''', '') [FieldLabel]
			,tbl1.Predefined
			,UPPER(tbl4.PDFTableName) [PDFTableName]
			,tbl4.ControlId
			,tbl4.BindTable [BindSource]
			,tbl4.CategoryId [CodeId]
			,tbl1.Seq
			,tbl7.TabId
			,tbl8.TabName
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
		INNER JOIN dbo.lnk_FormTabSection tbl7 ON tbl1.FeatureId = tbl7.FeatureId
			AND tbl1.SectionId = tbl7.SectionId
		INNER JOIN dbo.Mst_FormBuilderTab tbl8 ON tbl7.TabId = tbl8.TabId
		WHERE tbl1.predefined = 1
			AND tbl1.FeatureId = @FeatureId
			AND tbl4.ControlId NOT IN (
				9
				,16
				)
			AND tbl1.FieldId NOT IN (71)
			AND (
				tbl2.Deleteflag = 0
				OR tbl2.Deleteflag IS NULL
				)
		
		UNION
		
		SELECT tbl1.FeatureId
			,tbl2.FeatureName
			,tbl1.SectionId
			,tbl3.SectionName
			,CASE tbl1.Predefined
				WHEN 1
					THEN '9999' + convert(VARCHAR, tbl1.FieldId)
				WHEN 0
					THEN '8888' + convert(VARCHAR, tbl1.FieldId)
				END [FieldId]
			,tbl4.FieldName [FieldName]
			,replace(tbl1.FieldLabel, '''', '') [FieldLabel]
			,tbl1.Predefined
			,'PDFTableName' = Upper(CASE 
					WHEN ControlId = 11
						THEN NULL
					WHEN ControlId = 12
						THEN NULL
					ELSE 'dtl_CustomField'
					END)
			,tbl4.ControlId
			,tbl4.BindTable [BindSource]
			,tbl5.CodeID
			,tbl1.Seq
			,tbl7.TabId
			,tbl8.TabName
		FROM Lnk_forms tbl1
		INNER JOIN mst_feature tbl2 ON tbl1.FeatureId = tbl2.FeatureID
		INNER JOIN mst_section tbl3 ON tbl1.SectionId = tbl3.SectionID
		INNER JOIN mst_CustomformField tbl4 ON tbl1.FieldId = tbl4.Id
		LEFT OUTER JOIN mst_Modcode tbl5 ON (
				tbl4.CategoryId = tbl5.CodeId
				AND tbl4.BindTable = 'Mst_ModDecode'
				)
		INNER JOIN dbo.lnk_FormTabSection tbl7 ON tbl1.FeatureId = tbl7.FeatureId
			AND tbl1.SectionId = tbl7.SectionId
		INNER JOIN dbo.Mst_FormBuilderTab tbl8 ON tbl7.TabId = tbl8.TabId
		WHERE tbl1.Predefined = 0
			AND tbl1.FeatureId = @FeatureId
			AND tbl4.ControlId NOT IN (
				9
				,16
				)
			AND (
				tbl2.Deleteflag = 0
				OR tbl2.Deleteflag IS NULL
				)
		) Z
	ORDER BY Z.Seq ASC

	--- 04                                                                                                                                    
	SELECT drug_pk [DrugId]
		,DrugName
		,0 [Generic]
		,DrugTypeId
		,[Generic Abbrevation] [Abbr]
	FROM vw_Drug
	
	UNION
	
	SELECT GenericId [DrugId]
		,GenericName [DrugName]
		,GenericId [Generic]
		,drugTypeId
		,GenericAbbrevation [Abbr]
	FROM vw_Generic
	WHERE GenericId IS NOT NULL
	ORDER BY [DrugName]

	------------------------------------Updated on 09-Apr-12---------------------------------------------                 
	-- Select GenericId [DrugId],GenericName [DrugName],GenericId [Generic],drugTypeId,GenericAbbrevation[Abbr]                                                                                                         
	-- from vw_Generic where GenericId is not null order by [DrugName]                                           
	------------------------------------------------------------------------------                                                                                                   
	--- 05                                                                                           
	SELECT a.drug_pk [DrugId]
		,a.DrugName
		,b.genericid
		,b.GenericAbbrevation [Abbr]
	FROM mst_drug a
		,mst_Generic b
		,lnk_drugGeneric c
	WHERE a.deleteflag = 0
		AND dbo.fn_GetDrugTypeId_futures(a.drug_pk) = 37
		AND a.drug_pk = c.drug_pk
		AND b.GenericID = c.GenericID
	GROUP BY a.drug_pk
		,a.DrugName
		,b.GenericAbbrevation
		,b.genericid
	
	UNION
	
	SELECT GenericId [DrugId]
		,GenericName [DrugName]
		,GenericId [GenericId]
		,GenericAbbrevation [Abbr]
	FROM vw_Generic
	WHERE GenericId IS NOT NULL
	ORDER BY [DrugName]

	-- 06                     
	SELECT a.Id as LabTestId
		,a.Name as LabName
		,b.Id as SubTestId
		,b.ParameterName as  SubTestName
		, 1 LabTypeId
		, 'Additional Laboratory Test' LabTypeName
		,d.LabDepartmentId
		,d.LabDepartmentName
		,a.DeleteFlag
	FROM Mst_LabTestMaster a
		,mst_LabTestParameter b
		,Mst_LabType c
		,Mst_LabDepartment d
	WHERE a.Id = b.LabTestId
				AND a.DepartmentId = d.LabDepartmentId
	ORDER BY a.Id

	--07                                                                                                                                  
	--select c.DefaultUnit,d.codeid,c.id,c.unitID,d.Name as UnitName,a.LabTestId,a.LabName,b.SubTestId,b.SubTestName,c.MinBoundaryValue,                                                   
	--c.MaxBoundaryValue,c.MinNormalRange,c.MaxNormalRange    from                                                                                                                 
	--mst_labTest a right outer join lnk_testparameter b on a.LabTestId=b.TestId                                                                                                                                        
	--inner join Lnk_LabValue c on b.SubTestId=c.SubTestId                                                     
	--left outer join mst_Decode d on d.Id=c.UnitId                                                                                                                                         
	--where                                                                                                                        
	--(c.DefaultUnit=1 or c.defaultUnit is null) and (d.CodeId=30  or d.CodeId is null)                                                                                                                                        
	--and (c.deleteFlag=0 or c.deleteFlag is null)                                                                                                      
	SELECT Id [UnitId]
		,NAME [UnitName]
	FROM mst_decode
	WHERE codeid = 32
		AND deleteflag = 0

	--08                                                                                              
	SELECT DISTINCT '0' [Drug_pk]
		,d.GenericId
		,b.StrengthId
		,b.StrengthName
	FROM lnk_drugstrength a
		,mst_strength b
		,mst_Generic d
	WHERE a.strengthid = b.strengthid
		AND d.GenericID = a.GenericID
	
	UNION
	
	SELECT DISTINCT d.Drug_pk
		,'0' [GenericId]
		,c.StrengthId
		,c.StrengthName
	FROM lnk_DrugGeneric b
		,lnk_DrugStrength a
		,mst_Strength c
		,mst_Drug d
	WHERE d.Drug_pk = b.Drug_pk
		AND b.GenericID = a.GenericID
		AND a.StrengthId = c.StrengthId
	ORDER BY d.GenericId
		,b.StrengthId
		,b.StrengthName

	--09                                                                                    
	SELECT DISTINCT '0' [Drug_pk]
		,d.GenericId
		,a.FrequencyId
		,b.NAME [FrequencyName]
	FROM lnk_DrugFrequency a
		,mst_frequency b
		,mst_Generic d
	WHERE a.frequencyid = b.id
		AND d.GenericID = a.GenericID
	
	UNION
	
	SELECT DISTINCT d.Drug_pk
		,'0' [GenericId]
		,c.ID [FrequencyId]
		,c.NAME [FrequencyName]
	FROM lnk_DrugGeneric b
		,lnk_Drugfrequency a
		,mst_Frequency c
		,mst_Drug d
	WHERE d.Drug_pk = b.Drug_pk
		AND b.GenericID = a.GenericID
		AND a.FrequencyId = c.ID
	ORDER BY d.GenericId
		,a.FrequencyId

	----11                                 
	--select a.GenericId,a.GenericName,a.GenericAbbrevation,b.DrugTypeId                                             
	--from mst_generic a,lnk_drugtypegeneric b                                                                                                                                                          
	--where a.genericid = b.genericid and a.deleteflag = 0                                                     
	--10                                                                                                                                
	SELECT a.Drug_Pk
		,a.DrugName
		,0 [Generic]
		,dbo.fn_GetDrugTypeId_futures(a.Drug_Pk) [DrugTypeId]
		,dbo.fn_GetFixedDoseDrugAbbrevation(a.Drug_Pk) [Abbr]
	FROM mst_drug a
	WHERE a.deleteflag = 0

	--select * from mst_DrugType                                              
	--select * from mst_Drug                                              
	--select * from dbo.Lnk_DrugTypeGeneric                                              
	--11                                                                                                                                
	SELECT a.GenericId
		,a.GenericName [DrugName]
		,a.GenericId [Generic]
		,b.drugTypeId
		,a.GenericAbbrevation [Abbr]
	FROM mst_generic a
		,lnk_drugtypegeneric b
	WHERE a.genericid = b.genericid
		AND a.deleteflag = 0

	--12                                   
	--for OI Treatment Other Medications  - Frq to be displayed from custorm list                                                                                                                                                              
	SELECT Id [FrequencyId]
		,NAME [FrequencyName]
	FROM mst_FrequencyUnits
	WHERE deleteflag = 0

	--13                                                                                     
	SELECT DrugTypeID
		,DrugTypeName
	FROM mst_drugtype
	WHERE deleteflag = 0

	--14                                                                                                                  
	SELECT *
	FROM mst_feature
	WHERE FeatureId = @FeatureId

	--15                                                                                                            
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
			,VisitDate
		FROM Ord_Visit
		WHERE Ptn_pk = @PatientId
			AND VisitType = @VisitTypeId
			AND (
				DeleteFlag IS NULL
				OR DeleteFlag = 0
				)

		PRINT 'sanjay'
	END

	--16                                                                                                        
	SELECT a.drug_pk
		,a.drugname
		,d.drugtypeid
		,b.GenericAbbrevation
		,b.genericid
		,b.genericname
	FROM mst_drug a
		,mst_generic b
		,lnk_druggeneric c
		,lnk_DrugTypeGeneric d
	WHERE c.genericid = b.genericid
		AND c.drug_pk = a.drug_pk
		AND a.deleteflag = 0
		AND a.Drug_pk = c.Drug_pk
		AND c.GenericID = d.GenericID
	ORDER BY a.drugname

	---17 Conditional Fields                                                                                                    
	----select a.FeatureId,b.FeatureName,a.FieldSectionId,a.FieldSectionName,                                                                                                    
	----a.ConditionalFieldId [FieldId],a.ConditionalFieldBindField [FieldName],                                                             
	----a.ConditionalFieldLabel [FieldLabel], a.ConditionalFieldPredefined [Predefined],                                                                 
	----a.ConditionalFieldSavingTable [PDFTableName],a.ConditionalFieldControlId [ControlId],                                                                                                    
	----a.ConditionalFieldBindTable [BindSource],a.ConditionalFieldCategoryId [CodeId],                                                                                                    
	----a.ConditionalFieldSequence [Seq],a.FieldSectionSequence [SeqSection],ConditionalFieldSectionId,a.FieldId [ConFieldId],                                                                                      
	----a.FieldPredefined [ConFieldPredefined]                                                                                                    
	----from Vw_FieldConditionalField a inner join Mst_Feature b on a.FeatureId = b.FeatureId                                                                                           
	----and a.ConditionalFieldPredefined = 1 and b.FeatureId = @FeatureId and a.ConditionalFieldId is not null                                                       
	----and a.ConditionalFieldName is not null                                                                                      
	----union                                                                                          
	----select a.FeatureId,b.FeatureName,a.FieldSectionId,a.FieldSectionName,                                               
	----a.ConditionalFieldId [FieldId],a.ConditionalFieldName [FieldName],                                                                 
	----a.ConditionalFieldLabel [FieldLabel], a.ConditionalFieldPredefined [Predefined],                               
	----a.ConditionalFieldSavingTable [PDFTableName],a.ConditionalFieldControlId [ControlId],                                                                                                    
	----a.ConditionalFieldBindTable [BindSource],a.ConditionalFieldCategoryId [CodeId],                                                                                                    
	----a.ConditionalFieldSequence [Seq],a.FieldSectionSequence [SeqSection],ConditionalFieldSectionId,a.FieldId [ConFieldId],                                                                                                  
	----a.FieldPredefined [ConFieldPredefined]                                                                                                    
	----from Vw_FieldConditionalField a inner join Mst_Feature b on a.FeatureId = b.FeatureId         
	----and a.ConditionalFieldPredefined = 0 and b.FeatureId = @FeatureId and a.ConditionalFieldId is not null                                                                                           
	----and a.ConditionalFieldName is not null                                                                               
	----union                                                                              
	----select a.FeatureId,b.FeatureName,a.FieldSectionId,a.FieldSectionName,                                                                                                    
	----a.ConditionalFieldId [FieldId],'PlaceHolder' [FieldName],                                                                                                    
	----a.ConditionalFieldLabel [FieldLabel], a.ConditionalFieldPredefined [Predefined],                                                   
	----a.ConditionalFieldSavingTable [PDFTableName],'13' [ControlId],                                                          
	----a.ConditionalFieldBindTable [BindSource],a.ConditionalFieldCategoryId [CodeId],                     
	----a.ConditionalFieldSequence [Seq],a.FieldSectionSequence [SeqSection],ConditionalFieldSectionId,a.FieldId [ConFieldId],                                                                                          
	----a.FieldPredefined [ConFieldPredefined]                                     
	----from Vw_FieldConditionalField a inner join Mst_Feature b on a.FeatureId = b.FeatureId                           
	----and a.ConditionalFieldPredefined = 1 and b.FeatureId = @FeatureId and a.ConditionalFieldId is not null                                                                      
	----and a.ConditionalFieldId like '710000%' 
	SELECT a.FeatureId
		,b.FeatureName
		,a.FieldSectionId
		,a.FieldSectionName
		,CASE a.ConditionalFieldPredefined
			WHEN 1
				THEN '9999' + convert(VARCHAR, a.ConditionalFieldId)
			WHEN 0
				THEN '8888' + convert(VARCHAR, a.ConditionalFieldId)
			END [FieldId]
		,a.ConditionalFieldBindField [FieldName]
		,a.ConditionalFieldLabel [FieldLabel]
		--,a.AdditionalInformation [AdditionalInformation]
		,a.ConditionalFieldPredefined [Predefined]
		,Upper(a.ConditionalFieldSavingTable) [PDFTableName]
		,a.ConditionalFieldControlId [ControlId]
		,a.ConditionalFieldBindTable [BindSource]
		,a.ConditionalFieldCategoryId [CodeId]
		,a.ConditionalFieldSequence [Seq]
		,a.FieldSectionSequence [SeqSection]
		,ConditionalFieldSectionId
		,CASE a.FieldPredefined
			WHEN 1
				THEN '9999' + convert(VARCHAR, a.FieldId)
			WHEN 0
				THEN '8888' + convert(VARCHAR, a.FieldId)
			END [ConFieldId]
		,a.FieldPredefined [ConFieldPredefined]
		,a.TabId
		,CASE a.ConditionalFieldControlId
			WHEN 6
				THEN 'ctl00_IQCareContentPlaceHolder_TAB_' + convert(VARCHAR, a.TabId) + '_' + 'RADIO1-' + a.ConditionalFieldBindField + '-' + Upper(a.ConditionalFieldSavingTable) + '-' + CASE a.ConditionalFieldPredefined
						WHEN 1
							THEN '9999' + convert(VARCHAR, a.ConditionalFieldId)
						WHEN 0
							THEN '8888' + convert(VARCHAR, a.ConditionalFieldId)
						END + '-' + convert(VARCHAR, a.TabId)
			END [ConControlId]
		,a.TabName
		,dbo.GetLookupName(a.ConditionalFieldCategoryId,a.ConditionalFieldBindTable) BindCategory,
		(Select Top 1 ReferenceId From mst_control Where ControlID =a.ConditionalFieldControlId ) ReferenceId
	FROM Vw_FieldConditionalField a
	INNER JOIN Mst_Feature b ON a.FeatureId = b.FeatureId
		AND a.ConditionalFieldPredefined = 1
		AND b.FeatureId = @FeatureId
		AND a.ConditionalFieldId IS NOT NULL
		AND a.ConditionalFieldName IS NOT NULL
		AND a.ConditionalFieldControlId = 6
	
	UNION
	
	SELECT a.FeatureId
		,b.FeatureName
		,a.FieldSectionId
		,a.FieldSectionName
		,CASE a.ConditionalFieldPredefined
			WHEN 1
				THEN '9999' + convert(VARCHAR, a.ConditionalFieldId)
			WHEN 0
				THEN '8888' + convert(VARCHAR, a.ConditionalFieldId)
			END [FieldId]
		,a.ConditionalFieldName [FieldName]
		,a.ConditionalFieldLabel [FieldLabel]
		--,a.AdditionalInformation [AdditionalInformation]
		,a.ConditionalFieldPredefined [Predefined]
		,Upper(a.ConditionalFieldSavingTable) [PDFTableName]
		,a.ConditionalFieldControlId [ControlId]
		,a.ConditionalFieldBindTable [BindSource]
		,a.ConditionalFieldCategoryId [CodeId]
		,a.ConditionalFieldSequence [Seq]
		,a.FieldSectionSequence [SeqSection]
		,ConditionalFieldSectionId
		,CASE a.FieldPredefined
			WHEN 1
				THEN '9999' + convert(VARCHAR, a.FieldId)
			WHEN 0
				THEN '8888' + convert(VARCHAR, a.FieldId)
			END [ConFieldId]
		,a.FieldPredefined [ConFieldPredefined]
		,a.TabId
		,CASE a.ConditionalFieldControlId
			WHEN 6
				THEN 'ctl00_IQCareContentPlaceHolder_TAB_' + convert(VARCHAR, a.TabId) + '_' + 'RADIO1-' + a.ConditionalFieldName + '-' + Upper(a.ConditionalFieldSavingTable) + '-' + CASE a.ConditionalFieldPredefined
						WHEN 1
							THEN '9999' + convert(varchar, a.ConditionalFieldId)
						WHEN 0
							THEN '8888' + convert(VARCHAR, a.ConditionalFieldId)
						END + '-' + convert(VARCHAR, a.TabId)
			END [ConControlId]
		,a.TabName
		,dbo.GetLookupName(a.ConditionalFieldCategoryId,a.ConditionalFieldBindTable) BindCategory,
		(Select Top 1 ReferenceId From mst_control Where ControlID =a.ConditionalFieldControlId ) ReferenceId
	FROM Vw_FieldConditionalField a
	INNER JOIN Mst_Feature b ON a.FeatureId = b.FeatureId
		AND a.ConditionalFieldPredefined = 0
		AND b.FeatureId = @FeatureId
		AND a.ConditionalFieldId IS NOT NULL
		AND a.ConditionalFieldName IS NOT NULL
		AND a.ConditionalFieldControlId = 6
	
	UNION
	
	SELECT a.FeatureId
		,b.FeatureName
		,a.FieldSectionId
		,a.FieldSectionName
		,CASE a.ConditionalFieldPredefined
			WHEN 1
				THEN '9999' + convert(VARCHAR, a.ConditionalFieldId)
			WHEN 0
				THEN '8888' + convert(VARCHAR, a.ConditionalFieldId)
			END [FieldId]
		,a.ConditionalFieldBindField [FieldName]
		,a.ConditionalFieldLabel [FieldLabel]
		--,a.AdditionalInformation [AdditionalInformation]
		,a.ConditionalFieldPredefined [Predefined]
		,Upper(a.ConditionalFieldSavingTable) [PDFTableName]
		,a.ConditionalFieldControlId [ControlId]
		,a.ConditionalFieldBindTable [BindSource]
		,a.ConditionalFieldCategoryId [CodeId]
		,a.ConditionalFieldSequence [Seq]
		,a.FieldSectionSequence [SeqSection]
		,ConditionalFieldSectionId
		,CASE a.FieldPredefined
			WHEN 1
				THEN '9999' + convert(VARCHAR, a.FieldId)
			WHEN 0
				THEN '8888' + convert(VARCHAR, a.FieldId)
			END [ConFieldId]
		,a.FieldPredefined [ConFieldPredefined]
		,a.TabId
		,CASE a.ConditionalFieldControlId
			WHEN 1
				THEN 'ctl00_IQCareContentPlaceHolder_TAB_' + convert(VARCHAR, a.TabId) + '_' + 'TXT-' + a.ConditionalFieldBindField + '-' + Upper(a.ConditionalFieldSavingTable) + '-' + CASE a.ConditionalFieldPredefined
						WHEN 1
							THEN '9999' + convert(varchar, a.ConditionalFieldId)
						WHEN 0
							THEN '8888' + convert(VARCHAR, a.ConditionalFieldId)
						END + '-' + convert(VARCHAR, a.TabId)
			WHEN 2
				THEN 'ctl00_IQCareContentPlaceHolder_TAB_' + convert(VARCHAR, a.TabId) + '_' + 'TXT-' + a.ConditionalFieldBindField + '-' + Upper(a.ConditionalFieldSavingTable) + '-' + CASE a.ConditionalFieldPredefined
						WHEN 1
							THEN '9999' + convert(VARCHAR, a.ConditionalFieldId)
						WHEN 0
							THEN '8888' + convert(VARCHAR, a.ConditionalFieldId)
						END + '-' + convert(VARCHAR, a.TabId)
			WHEN 3
				THEN 'ctl00_IQCareContentPlaceHolder_TAB_' + convert(VARCHAR, a.TabId) + '_' + 'TXTNUM-' + a.ConditionalFieldBindField + '-' + Upper(a.ConditionalFieldSavingTable) + '-' + CASE a.ConditionalFieldPredefined
						WHEN 1
							THEN '9999' + convert(VARCHAR, a.ConditionalFieldId)
						WHEN 0
							THEN '8888' + convert(VARCHAR, a.ConditionalFieldId)
						END + '-' + convert(VARCHAR, a.TabId)
			WHEN 4
				THEN 'ctl00_IQCareContentPlaceHolder_TAB_' + convert(VARCHAR, a.TabId) + '_' + 'SELECTLIST-' + a.ConditionalFieldBindField + '-' + Upper(a.ConditionalFieldSavingTable) + '-' + CASE a.ConditionalFieldPredefined
						WHEN 1
							THEN '9999' + convert(VARCHAR, a.ConditionalFieldId)
						WHEN 0
							THEN '8888' + convert(VARCHAR, a.ConditionalFieldId)
						END + '-' + convert(VARCHAR, a.TabId)
			WHEN 5
				THEN 'ctl00_IQCareContentPlaceHolder_TAB_' + convert(VARCHAR, a.TabId) + '_' + 'TXTDT-' + a.ConditionalFieldBindField + '-' + Upper(a.ConditionalFieldSavingTable) + '-' + CASE a.ConditionalFieldPredefined
						WHEN 1
							THEN '9999' + convert(VARCHAR, a.ConditionalFieldId)
						WHEN 0
							THEN '8888' + convert(VARCHAR, a.ConditionalFieldId)
						END + '-' + convert(VARCHAR, a.TabId)
			WHEN 6
				THEN 'ctl00_IQCareContentPlaceHolder_TAB_' + convert(VARCHAR, a.TabId) + '_' + 'RADIO2-' + a.ConditionalFieldBindField + '-' + Upper(a.ConditionalFieldSavingTable) + '-' + CASE a.ConditionalFieldPredefined
						WHEN 1
							THEN '9999' + convert(VARCHAR, a.ConditionalFieldId)
						WHEN 0
							THEN '8888' + convert(VARCHAR, a.ConditionalFieldId)
						END + '-' + convert(VARCHAR, a.TabId)
			WHEN 7
				THEN 'ctl00_IQCareContentPlaceHolder_TAB_' + convert(VARCHAR, a.TabId) + '_' + 'Chk-' + a.ConditionalFieldBindField + '-' + Upper(a.ConditionalFieldSavingTable) + '-' + CASE a.ConditionalFieldPredefined
						WHEN 1
							THEN '9999' + convert(VARCHAR, a.ConditionalFieldId)
						WHEN 0
							THEN '8888' + convert(VARCHAR, a.ConditionalFieldId)
						END + '-' + convert(VARCHAR, a.TabId)
			WHEN 8
				THEN 'ctl00_IQCareContentPlaceHolder_TAB_' + convert(VARCHAR, a.TabId) + '_' + 'TXTMulti-' + a.ConditionalFieldBindField + '-' + Upper(a.ConditionalFieldSavingTable) + '-' + CASE a.ConditionalFieldPredefined
						WHEN 1
							THEN '9999' + convert(VARCHAR, a.ConditionalFieldId)
						WHEN 0
							THEN '8888' + convert(VARCHAR, a.ConditionalFieldId)
						END + '-' + convert(VARCHAR, a.TabId)
			WHEN 9
				THEN 'ctl00_IQCareContentPlaceHolder_TAB_' + convert(VARCHAR, a.TabId) + '_' + 'Pnl_-' + Upper(a.ConditionalFieldSavingTable) + '-' + CASE a.ConditionalFieldPredefined
						WHEN 1
							THEN '9999' + convert(VARCHAR, a.ConditionalFieldId)
						WHEN 0
							THEN '8888' + convert(VARCHAR, a.ConditionalFieldId)
						END
			END [ConControlId]
		,a.TabName
		,dbo.GetLookupName(a.ConditionalFieldCategoryId,a.ConditionalFieldBindTable) BindCategory,
		(Select Top 1 ReferenceId From mst_control Where ControlID =a.ConditionalFieldControlId ) ReferenceId
	FROM Vw_FieldConditionalField a
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
		,CASE a.ConditionalFieldPredefined
			WHEN 1
				THEN '9999' + convert(VARCHAR, a.ConditionalFieldId)
			WHEN 0
				THEN '8888' + convert(VARCHAR, a.ConditionalFieldId)
			END [FieldId]
		,a.ConditionalFieldName [FieldName]
		,a.ConditionalFieldLabel [FieldLabel]
		--,a.AdditionalInformation [AdditionalInformation]
		,a.ConditionalFieldPredefined [Predefined]
		,Upper(a.ConditionalFieldSavingTable) [PDFTableName]
		,a.ConditionalFieldControlId [ControlId]
		,a.ConditionalFieldBindTable [BindSource]
		,a.ConditionalFieldCategoryId [CodeId]
		,a.ConditionalFieldSequence [Seq]
		,a.FieldSectionSequence [SeqSection]
		,ConditionalFieldSectionId
		,CASE a.FieldPredefined
			WHEN 1
				THEN '9999' + convert(VARCHAR, a.FieldId)
			WHEN 0
				THEN '8888' + convert(VARCHAR, a.FieldId)
			END [ConFieldId]
		,a.FieldPredefined [ConFieldPredefined]
		,a.TabId
		,CASE a.ConditionalFieldControlId
			WHEN 1
				THEN 'ctl00_IQCareContentPlaceHolder_TAB_' + convert(VARCHAR, a.TabId) + '_' + 'TXT-' + a.ConditionalFieldName + '-' + Upper(a.ConditionalFieldSavingTable) + '-' + CASE a.ConditionalFieldPredefined
						WHEN 1
							THEN '9999' + convert(VARCHAR, a.ConditionalFieldId)
						WHEN 0
							THEN '8888' + convert(VARCHAR, a.ConditionalFieldId)
						END + '-' + convert(VARCHAR, a.TabId)
			WHEN 2
				THEN 'ctl00_IQCareContentPlaceHolder_TAB_' + convert(VARCHAR, a.TabId) + '_' + 'TXT-' + a.ConditionalFieldName + '-' + Upper(a.ConditionalFieldSavingTable) + '-' + CASE a.ConditionalFieldPredefined
						WHEN 1
							THEN '9999' + convert(VARCHAR, a.ConditionalFieldId)
						WHEN 0
							THEN '8888' + convert(VARCHAR, a.ConditionalFieldId)
						END + '-' + convert(VARCHAR, a.TabId)
			WHEN 3
				THEN 'ctl00_IQCareContentPlaceHolder_TAB_' + convert(VARCHAR, a.TabId) + '_' + 'TXTNUM-' + a.ConditionalFieldName + '-' + Upper(a.ConditionalFieldSavingTable) + '-' + CASE a.ConditionalFieldPredefined
						WHEN 1
							THEN '9999' + convert(VARCHAR, a.ConditionalFieldId)
						WHEN 0
							THEN '8888' + convert(VARCHAR, a.ConditionalFieldId)
						END + '-' + convert(VARCHAR, a.TabId)
			WHEN 4
				THEN 'ctl00_IQCareContentPlaceHolder_TAB_' + convert(VARCHAR, a.TabId) + '_' + 'SELECTLIST-' + a.ConditionalFieldName + '-' + Upper(a.ConditionalFieldSavingTable) + '-' + CASE a.ConditionalFieldPredefined
						WHEN 1
							THEN '9999' + convert(VARCHAR, a.ConditionalFieldId)
						WHEN 0
							THEN '8888' + convert(VARCHAR, a.ConditionalFieldId)
						END + '-' + convert(VARCHAR, a.TabId)
			WHEN 5
				THEN 'ctl00_IQCareContentPlaceHolder_TAB_' + convert(VARCHAR, a.TabId) + '_' + 'TXTDT-' + a.ConditionalFieldName + '-' + Upper(a.ConditionalFieldSavingTable) + '-' + CASE a.ConditionalFieldPredefined
						WHEN 1
							THEN '9999' + convert(VARCHAR, a.ConditionalFieldId)
						WHEN 0
							THEN '8888' + convert(VARCHAR, a.ConditionalFieldId)
						END + '-' + convert(VARCHAR, a.TabId)
			WHEN 6
				THEN 'ctl00_IQCareContentPlaceHolder_TAB_' + convert(VARCHAR, a.TabId) + '_' + 'RADIO2-' + a.ConditionalFieldName + '-' + Upper(a.ConditionalFieldSavingTable) + '-' + CASE a.ConditionalFieldPredefined
						WHEN 1
							THEN '9999' + convert(VARCHAR, a.ConditionalFieldId)
						WHEN 0
							THEN '8888' + convert(VARCHAR, a.ConditionalFieldId)
						END + '-' + convert(VARCHAR, a.TabId)
			WHEN 7
				THEN 'ctl00_IQCareContentPlaceHolder_TAB_' + convert(VARCHAR, a.TabId) + '_' + 'Chk-' + a.ConditionalFieldName + '-' + Upper(a.ConditionalFieldSavingTable) + '-' + CASE a.ConditionalFieldPredefined
						WHEN 1
							THEN '9999' + convert(VARCHAR, a.ConditionalFieldId)
						WHEN 0
							THEN '8888' + convert(VARCHAR, a.ConditionalFieldId)
						END + '-' + convert(VARCHAR, a.TabId)
			WHEN 8
				THEN 'ctl00_IQCareContentPlaceHolder_TAB_' + convert(VARCHAR, a.TabId) + '_' + 'TXTMulti-' + a.ConditionalFieldName + '-' + Upper(a.ConditionalFieldSavingTable) + '-' + CASE a.ConditionalFieldPredefined
						WHEN 1
							THEN '9999' + convert(VARCHAR, a.ConditionalFieldId)
						WHEN 0
							THEN '8888' + convert(VARCHAR, a.ConditionalFieldId)
						END + '-' + convert(VARCHAR, a.TabId)
			WHEN 9
				THEN 'ctl00_IQCareContentPlaceHolder_TAB_' + convert(VARCHAR, a.TabId) + '_' + 'Pnl_-' + Upper(a.ConditionalFieldSavingTable) + '-' + CASE a.ConditionalFieldPredefined
						WHEN 1
							THEN '9999' + convert(VARCHAR, a.ConditionalFieldId)
						WHEN 0
							THEN '8888' + convert(VARCHAR, a.ConditionalFieldId)
						END
			END [ConControlId]
		,a.TabName
		,dbo.GetLookupName(a.ConditionalFieldCategoryId,a.ConditionalFieldBindTable) BindCategory,
		(Select Top 1 ReferenceId From mst_control Where ControlID =a.ConditionalFieldControlId ) ReferenceId
	FROM Vw_FieldConditionalField a
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
		,a.ConditionalFieldId [FieldId]
		,'PlaceHolder' [FieldName]
		,a.ConditionalFieldLabel [FieldLabel]
		--,a.AdditionalInformation [AdditionalInformation]
		,a.ConditionalFieldPredefined [Predefined]
		,Upper(a.ConditionalFieldSavingTable) [PDFTableName]
		,'13' [ControlId]
		,a.ConditionalFieldBindTable [BindSource]
		,a.ConditionalFieldCategoryId [CodeId]
		,a.ConditionalFieldSequence [Seq]
		,a.FieldSectionSequence [SeqSection]
		,ConditionalFieldSectionId
		,a.FieldId [ConFieldId]
		,a.FieldPredefined [ConFieldPredefined]
		,a.TabId
		,CASE a.ConditionalFieldControlId
			WHEN 4
				THEN 'ctl00_IQCareContentPlaceHolder_TAB_' + convert(VARCHAR, a.TabId) + '_' + 'SELECTLIST-' + 'PlaceHolder' + '-' + Upper(a.ConditionalFieldSavingTable) + '-' + CASE a.ConditionalFieldPredefined
						WHEN 1
							THEN '9999' + convert(VARCHAR, a.ConditionalFieldId)
						WHEN 0
							THEN '8888' + convert(VARCHAR, a.ConditionalFieldId)
						END + '-' + convert(VARCHAR, a.TabId)
			END [ConControlId]
		,a.TabName
		,dbo.GetLookupName(a.ConditionalFieldCategoryId,a.ConditionalFieldBindTable) BindCategory,
		(Select Top 1 ReferenceId From mst_control Where ControlID =a.ConditionalFieldControlId ) ReferenceId
	FROM Vw_FieldConditionalField a
	INNER JOIN Mst_Feature b ON a.FeatureId = b.FeatureId
		AND a.ConditionalFieldPredefined = 1
		AND b.FeatureId = @FeatureId
		AND a.ConditionalFieldId IS NOT NULL
		AND a.ConditionalFieldId LIKE '710000%'

	--18                                                                                   
	SELECT a.StartDate
	FROM dbo.lnk_PatientProgramStart a
	INNER JOIN Mst_Feature b ON a.ModuleId = b.ModuleId
	WHERE b.FeatureId = @FeatureId
		AND a.Ptn_Pk = @PatientId

	--19                                                                     
	--19                                                                     
	DECLARE @sql NVARCHAR(max)

	IF EXISTS (
			SELECT *
			FROM sys.columns
			WHERE NAME = 'visit_pk'
				AND OBJECT_ID = OBJECT_ID('DTL_FBCUSTOMFIELD_' + REPLACE(@FeatureName, ' ', '_') + '')
			)
	BEGIN
		SET @sql = '



Begin 



 if exists(select * from sysobjects where name=''DTL_FBCUSTOMFIELD_' + REPLACE(@FeatureName, ' ', '_') + ''')



 Begin                                                       



	select  * from [DTL_FBCUSTOMFIELD_' + REPLACE(@FeatureName, ' ', '_') + '] a inner join ord_visit b on a.visit_pk=b.Visit_Id where b.ptn_pk=' + convert(VARCHAR, @PatientId) + ' order by 

	b.visitdate desc



 End



 else



 Begin



	Select 0



 End 



End'
	END
	ELSE
	BEGIN
		SET @sql = '



Begin



	if exists(select * from sysobjects where name=''DTL_FBCUSTOMFIELD_' + REPLACE(@FeatureName, ' ', '_') + ''')



	Begin



	select  * from [DTL_FBCUSTOMFIELD_' + REPLACE(@FeatureName, ' ', '_') + '] a inner join dtl_patientCareended b on a.CareEndedId=b.CareEndedID where b.ptn_pk=' + convert(VARCHAR, @PatientId) + ' 

	order by b.CareEndedDate desc



	End



	else



	Begin



	Select 0



	End



End'
	END

	EXECUTE sp_executesql @sql

	--print  @sql                              
	--20    
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
					AND FeatureID = @FeatureId
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
							AND FeatureID = @FeatureId
						)
					AND Ptn_Pk = @PatientId
				) X
			)

	--21                                          
	SELECT '0' [Drug_pk]
		,'0' [GenericId]
		,c.ID [FrequencyId]
		,c.NAME [FrequencyName]
	FROM mst_Frequency c
	WHERE (
			c.deleteflag = 0
			OR c.deleteflag IS NULL
			)
	ORDER BY c.Id

	--22                              
	SELECT A.Ptn_pk
		,A.Visit_pk
		,A.LocationId
		,CASE 
			WHEN A.Predefined = 0
				THEN Convert(INT, '8888' + Convert(VARCHAR, A.FieldId))
			WHEN A.Predefined = 1
				THEN Convert(INT, '9999' + Convert(VARCHAR, A.FieldId))
			END [FieldId]
		,A.BlockId
		,A.SubBlockId
		,A.ICDCodeId [Id]
		,+ '%' + Convert(VARCHAR, ISNULL(A.BlockId, 0)) + '%' + Convert(VARCHAR, ISNULL(A.SubBlockId, 0)) + '%' + Convert(VARCHAR, ISNULL(A.ICDCodeId, 0)) + '%' + Convert(VARCHAR, A.Predefined) [CodeId]
		,CASE 
			WHEN A.BlockId > 0
				THEN B.Code + ' ' + B.NAME
			WHEN A.SubBlockId > 0
				THEN C.Code + ' ' + C.NAME
			WHEN A.ICDCodeId > 0
				THEN D.Code + ' ' + D.NAME
			END [Name]
	FROM dtl_ICD10Field A
	LEFT OUTER JOIN dbo.Mst_ICDCodeBlocks B ON A.BlockId = B.BlockId
	LEFT OUTER JOIN dbo.Mst_ICDCodeSubBlock C ON A.SubBlockId = C.SubBlockId
	LEFT OUTER JOIN dbo.mst_ICDCodes D ON A.ICDCodeId = D.Id
	WHERE A.Ptn_pk = @PatientId

	--23            
	SELECT tbl1.TabId
		,tbl2.TabName
		,tbl2.seq
		,ISNULL(tbl2.signature, 0) [signature]
	FROM dbo.lnk_FormTabSection tbl1
	INNER JOIN dbo.Mst_FormBuilderTab tbl2 ON tbl1.TabId = tbl2.TabId
		AND tbl1.FeatureID = @FeatureId
	GROUP BY tbl1.TabId
		,tbl2.TabName
		,tbl2.seq
		,tbl2.signature
	ORDER BY seq

	----24            
	--Select tbl1.TabId, tbl2.TabName, tbl1.SectionId, tbl3.SectionName from dbo.lnk_FormTabSection tbl1 inner join dbo.Mst_FormBuilderTab tbl2            
	--on tbl1.TabId=tbl2.TabId inner join mst_section tbl3  on tbl1.SectionID=tbl3.SectionId and tbl1.FeatureID=@FeatureId            
	SELECT FeatureID
		,FeatureName
		,Published
		,SystemId
		,ModuleId
		,DeleteFlag
	FROM mst_Feature
	WHERE FeatureID > 1000
		AND DeleteFlag = 0


END

GO


