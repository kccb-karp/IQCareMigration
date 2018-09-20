IF  EXISTS (SELECT * FROM sys.objects 
WHERE object_id = OBJECT_ID(N'[dbo].[pr_CreateLocalCache_AllMasters_constella]') 
AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[pr_CreateLocalCache_AllMasters_constella]
GO



CREATE PROCEDURE [dbo].[pr_CreateLocalCache_AllMasters_constella] 
AS
BEGIN
Set Nocount On;

Select	Id
	,	Name
	,	SRNO
	,	UpdateFlag
	,	Deleteflag
	,	SystemId
From mst_Provider
Order By SRNO --0                                                                                                                                                       
Select	Id
	,	Name
	,	SRNO
	,	UpdateFlag
	,	Deleteflag
	,	SystemId
From mst_District
Order By SRNO --1                                                                                                                                                    
Select	Id
	,	Name
	,	CategoryId
	,	SRNO
	,	UpdateFlag
	,	Deleteflag
	,	SystemId
	,	Code + ' = ' + Name	[DisplayName]
From mst_Reason
Order By SRNO
--2      
Select	Id
	,	Name
	,	SRNO
	,	UpdateFlag
	,	Deleteflag
	,	SystemID
From mst_Education
Order By SRNO
--3                                                                                                                                                       
Select	Id
	,	Name
	,	SRNO
	,	UpdateFlag
	,	Deleteflag
	,	SystemID
From mst_Designation
Order By SRNO
--4                                                                                                                      
--select Id,Name,SRNO,UpdateFlag,Deleteflag from Mst_Village                                                                                       
Select	EmployeeId
	,	EmployeeId						[Id]
	,	FirstName
	,	LastName
	,	(FirstName + ' ' + LastName)	As [Name]
	,	(FirstName + ' ' + LastName)	As [EmployeeName]
	,	DesignationId
	,	SRNO
	,	UpdateFlag
	,	DeleteFlag
From mst_Employee
Order By SRNO --5                                                                                                                                                      
Select	Id
	,	Name
	,	SRNO
	,	UpdateFlag
	,	Deleteflag
	,	SystemID
From mst_Occupation
Order By SRNO   --6                                                                                                                                                     
Select	Id
	,	Name
	,	SRNO
	,	UpdateFlag
	,	Deleteflag
	,	SystemID
From mst_Province
Order By SRNO
--7                                                                                                                 
Select	Id
	,	Name
	,	SRNO
	,	UpdateFlag
	,	Deleteflag
	,	SystemID
From Mst_Village
Order By SRNO  --8                                                                                                                                                 
Select	CodeId
	,	Name
	,	Deleteflag
From mst_Code --9                                                                                                                                                       
Select	Id
	,	Name
	,	SRNO
	,	UpdateFlag
	,	Deleteflag
	,	SystemID
From mst_HIVAIDSCareTypes
Order By SRNO
--10                                      
Select	Id
	,	Name
	,	SRNO
	,	UpdateFlag
	,	Deleteflag
	,	SystemID
From mst_ARTSponsor
Order By SRNO
--11                                 
Select	Id
	,	Name
	,	SectionId
	,	SRNO
	,	UpdateFlag
	,	Deleteflag
	,	SystemId
From mst_HivDisease
Order By SRNO
--12                                       
Select	AssessmentId
	,	AssessmentCategoryId
	,	AssessmentName
	,	UpdateFlag
	,	DeleteFlag
From mst_Assessment
--13                                                    
Select	Id
	,	Name
	,	CategoryId
	,	SRNO
	,	UpdateFlag
	,	Deleteflag
	,	SystemId
From mst_Symptom
Order By SRNO
--14                                                               
Select	D.ID
	,	D.Name
	,	D.CodeID
	,	D.SRNo
	,	D.UpdateFlag
	,	D.DeleteFlag
	,	D.SystemId
	,	D.Code
	,	D.Code + ' = ' + D.Name	As DisplayName
	,	D.ModuleId
	,	C.Name					ListName
From mst_Decode As D
Inner Join mst_Code C On C.CodeID = D.CodeID
Order By SRNo
--15                                                                
Select	FeatureId
	,	FeatureName
	,	ReportFlag
	,	DeleteFlag
	,	AdminFlag
	,	SystemID
From mst_feature --16                                                                                                               
Select	FunctionId
	,	FunctionName
	,	DeleteFlag
From mst_Function    --17                                                                                                                                                    
Select	Id
	,	Name
	,	SRNO
	,	UpdateFlag
	,	Deleteflag
	,	SystemID
From mst_hivdisclosure
Order By SRNO
--18                                                                                                       
Select	Id
	,	Name
	,	SRNO
	,	Deleteflag
	,	isnull(multiplier, '0')	[multiplier]
From mst_Frequency
Order By SRNO --19                                                                                                                                               
Select	StrengthId
	,	StrengthName
	,	DeleteFlag
From mst_Strength   --20                                                                                                                               
Select	Id
	,	Name
	,	SRNO
	,	UpdateFlag
	,	Deleteflag
From mst_FrequencyUnits
Order By SRNO
--21                                                                                   
Select	Drug_PK
	,	DrugId
	,	DrugName
	,	DeleteFlag
From mst_drug
--22                                                                                            
Select	GenericId
	,	GenericName
	,	GenericAbbrevation
From mst_generic  --23                                                                                                                                                     
Select	DrugTypeId
	,	DrugTypeName
	,	DeleteFlag
From mst_drugtype
--24    
Select	Id									LabTestId
	,	Name								LabName
	,	DepartmentId						LabDepartmentId
	,	0									LabTypeId
	,	row_number() Over (Order By Name)	[Sequence]
	,	DeleteFlag
From mst_LabTestMaster
--select LabTestId,LabName,LabDepartmentId,LabTypeId,Sequence,DeleteFlag from mst_Labtest   --25                                                                                                                                   
--select SubTestId,SubTestName,TestId,DeleteFlag from lnk_testParameter --26  
Select	Id				SubTestId
	,	ParameterName	SubTestName
	,	LabTestId		TestId
	,	DeleteFlag
From Mst_LabTestParameter
--select SubTestID,MinBoundaryValue,MaxBoundaryValue,MinNormalRange,MaxNormalRange,TextNormalRange,  
--DefaultUnit,UnitID,DeleteFlag from lnk_labvalue  --27  

Select	ParameterId	SubTestId
	,	MinBoundary	MinBoundaryValue
	,	MaxBoundary	MaxBoundaryValue
	,	MinNormalRange
	,	MaxNormalRange
	,	''			TextNormalRange
	,	DefaultUnit
	,	UnitId
	,	DeleteFlag
From dtl_LabTestParameterConfig

--select ResultId,ParameterId,Result from lnk_parameterresult
Select	Id		ResultId
	,	ParameterId
	,	Value	Result
From dtl_LabTestParameterResultOption

--28                                                                                                                                      
---Select ID, SatelliteID, Name, SRNO, DeleteFlag FROM mst_Satellite                                            
Select	Id
	,	Name
	,	SRNO
	,	UpdateFlag
	,	Deleteflag
	,	SystemID
From mst_LPTF
Order By SRNO
--29                                                                                            
Select	Id
	,	Name
	,	SRNO
	,	UpdateFlag
	,	Deleteflag
	,	SystemID
From mst_StoppedReason
Order By SRNO
--30                                                                            
Select	FacilityName
	,	FacilityID
	,	PosID
	,	DeleteFlag
	,	SatelliteID
	,	SystemID
	,	[FacilityAddress]
	,	[FacilityTel]
	,	[FacilityCell]
	,	[FacilityFax]
	,	[FacilityEmail]
	,	[FacilityURL]
	,	[FacilityFooter]
	,	isnull(FacilityTemplate, 0)	[FacilityTemplate]
	,	[FacilityLogo]
	,	[StrongPassFlag]
From mst_facility
--31                                                                               
Select	Id
	,	Name
	,	SRNO
	,	UpdateFlag
	,	Deleteflag
	,	SystemID
From mst_HivCareStatus
Order By SRNO
--32                                         
Select	Id
	,	Name
	,	SRNO
	,	UpdateFlag
	,	Deleteflag
	,	SystemID
From mst_RelationshipType
Order By SRNO
--33                                                                                        
Select	Id
	,	Name
	,	SRNO
	,	UpdateFlag
	,	Deleteflag
	,	SystemID
From mst_Ward
Order By SRNO
--34                                                                
Select	Id
	,	Name
	,	SRNO
	,	UpdateFlag
	,	Deleteflag
	,	SystemID
From mst_Division
Order By SRNO
--35                                                    
Select	Id
	,	Name
	,	SRNO
	,	UpdateFlag
	,	Deleteflag
	,	Code + ' = ' + Name	[DisplayName]
From mst_TBStatus
Order By SRNO
--36                                                                                                                 
Select	Id
	,	Name
	,	Code
	,	UpdateFlag
	,	Deleteflag
	,	Code + ' = ' + Name	[DisplayName]
From mst_ARVStatus
--37                                                                            
Select	Id
	,	Name
	,	SRNo
	,	UpdateFlag
	,	Deleteflag
	,	SystemID
From mst_CouncellingType
Order By SRNO --38                                                                                                        
Select	Id
	,	Name
	,	SRNo
	,	UpdateFlag
	,	Deleteflag
	,	SystemID
From mst_CouncellingTopic
Order By SRNO  --39                                                                                                   
Select	Id
	,	Name
	,	SRNO
	,	UpdateFlag
	,	Deleteflag
	,	SystemID
From mst_LostFollowreason
Order By SRNO
--40                                                                                           
Select	regimenID							[Id]
	,	RegimenCode + ' - ' + RegimenName	[Name]
	,	RegimenCode
	,	NULL Stage
	,	NULL SRNo
	,	DeleteFlag
From mst_regimen
Where regimenCode Is Not Null --41                                                                                   

--select a.SubTestId,a.SubTestName,a.TestId,a.DeleteFlag from lnk_TestParameter a,mst_Labtest b                                                                                
--where b.labTestId = a.TestId and a.DeleteFlag=0 --- 42   

Select	P.Id			SubTestId
	,	P.ParameterName	SubTestName
	,	P.LabTestId		TestId
	,	m.DeleteFlag
From Mst_LabTestParameter P
Inner Join mst_LabTestMaster M On M.Id = P.LabTestId
Where M.DeleteFlag = 0

Select	Id
	,	Name
	,	SRNo
	,	UpdateFlag
	,	DeleteFlag
	,	SystemID
From mst_ReferredFrom
Order By SRNO--- 43                                                                        

Select	Id
	,	Name
	,	SRNo
	,	UpdateFlag
	,	DeleteFlag
	,	SystemID
From mst_PatientLabPeriod
Order By SRNO --44                                                    

Select	Id
	,	Name
	,	CodeID
	,	SRNo
	,	UpdateFlag
	,	DeleteFlag
	,	SystemID
	,	Code
From Mst_pmtctDeCode
Where (deleteFlag = 0 Or deleteFlag Is Null)
Order By SRNO--45                                

Select	ModuleID
	,	ModuleName
	,	DeleteFlag
From mst_module
Where DeleteFlag = 0;--46                                                          

--47                                                          
Select	b.ID
	,	b.Name
	,	a.Predefined
	,	b.CodeID
	,	b.SRNo
	,	b.UpdateFlag
	,	b.DeleteFlag
	,	b.SystemID
	,	b.Code
From mst_modcode a
Inner Join mst_moddecode b On a.CodeId = b.CodeId
Where (b.deleteFlag = 0 Or b.deleteFlag Is Null)
	And (a.deleteFlag = 0 Or a.deleteFlag Is Null)

Select *
From Mst_ARVSideEffects
Where DeleteFlag = 0;--48                                                    

Select *
From Mst_ModCode
Where DeleteFlag = 0;--49                  

Select *
From Mst_DrugSchedule
Where DeleteFlag = 0;--50                                                    
Select *
From Mst_Store---51                                          
Select *
From Mst_Supplier -- 52                                         
Select *
From mst_Donor -- 53                                          
Select *
From Mst_Program -- 54                                       
Select *
From Mst_Batch --55                                    
Select *
From Mst_Country --56                                    
Select *
From Mst_Town--57                                
--58                             
Select	row_number() Over (Order By ID Asc)	As ID
	,	ID									[DiseaseID]
	,	Name
	,	Name1
	,	SRNO
	,	DeleteFlag
	,	SystemId
	,	DiseaseFlag
	,	ModuleId
	,	Name1
From dbo.VWDiseaseSymptom
Order By Name Asc

--59                          
Select	Case
			When Predefined = 0 Then convert(int, '8888' + convert(varchar, FieldId))
			When Predefined = 1 Then convert(int, '9999' + convert(varchar, FieldId))
		End																																											[FieldId]
	,	BlockId
	,	SubBlockId
	,	Id
	,	+'%' + convert(varchar, isnull(BlockId, 0)) + '%' + convert(varchar, isnull(SubBlockId, 0)) + '%' + convert(varchar, isnull(Id, 0)) + '%' + convert(varchar, Predefined)	[CodeId]
	,	BindField																																									[Name]
	,	isnull(DeleteFlag, 0)																																						[DeleteFlag]
From dbo.VW_ICDList

Select *
From mst_RegimenLine --60     
--Query builder reports - jnjung''e
Select	C.CategoryId
	,	C.CategoryName
	,	R.ReportId
	,	R.ReportName
	,	isnull(R.qryDescription, R.ReportName)	ReportDescription
From dbo.Mst_QueryBuilderCategory C
Inner Join dbo.mst_QueryBuilderReports R On R.CategoryId = C.CategoryId
Where isnull(R.DeleteFlag, 0) = 0
	And isnull(C.DeleteFlag, 0) = 0; --61    
--Select U.UserId,U.UserLastName, U.UserFirstName, (U.UserFirstName + ' ' +U.UserLastName) As Names, U.EmployeeID,U.DeleteFlag  from mst_User U -- 62
Select	UserId
	,	SystemUserName
	,	Name
	,	EmployeeName
	,	UserDeleteFlag
	,	EmployeeId
	,	DesignationId
	,	Designation
	,	EmployeeDeleteFlag
From vw_UserList
Order By Name -- 62
End

GO