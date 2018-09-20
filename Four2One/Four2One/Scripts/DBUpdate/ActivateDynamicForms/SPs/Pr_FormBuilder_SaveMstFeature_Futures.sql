

/****** Object:  StoredProcedure [dbo].[Pr_FormBuilder_SaveMstFeature_Futures]    Script Date: 8/30/2018 12:13:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER procedure [dbo].[Pr_FormBuilder_SaveMstFeature_Futures]                                      
@FeatureId int=null,                                      
@FeatureName varchar(50),
@FormDescription varchar(100) = null,
@ReferenceId varchar(50) =null,                                      
@ReportFlag int=null,                                      
@DeleteFlag int=null,                                      
@AdminFlag int=null,                                      
@OptionalFlag int=null,                                      
@SystemId int=null,                                      
@UserId int=null,                                      
@Published int=null,                                      
@CountryId int=null,                                      
@ModuleId int=null,                  
@MultiVisit int=null                                   
as                                             
Begin                                      
  Declare @iFeatureId as int                                    
  Declare @strOldFeatureName as varchar(50)                                  
  Declare @MaxFeatureId as int                          
  Declare @MaxVisitTypeId as int , @featureTypeId int                        
  Select Top 1 @featureTypeId = Id From mst_Decode Where Code='CLINICAL_FORM' And CodeID=(Select Top 1 CodeID From mst_Code where name='Feature Type' And DeleteFlag=0)      
  Select @FormDescription = Isnull(@FormDescription, @FeatureName);                   
If(@FeatureId=0) Begin                             
  Select @MaxFeatureId=max(FeatureId) from mst_feature                           
                          
  If(@MaxFeatureId>1000)  Begin                          
		Insert Into mst_Feature (
				FeatureName
			,	ReferenceId
			,	ReportFlag
			,	DeleteFlag
			,	AdminFlag
			,	SystemId
			,	UserID
			,	Published
			,	ModuleId
			,	CountryId
			,	CreateDate
			,	MultiVisit
			,	FeatureTypeId)
		Values (
				@FeatureName
			,	@ReferenceId
			,	@ReportFlag
			,	@DeleteFlag
			,	@AdminFlag
			,	@SystemId
			,	@UserId
			,	0
			,	@ModuleId
			,	@CountryId
			,	getdate()
			,	@MultiVisit
			,	@featureTypeId)                 
		 set @iFeatureId= scope_identity()                                       
    End                          
	Else Begin                          
		SET IDENTITY_INSERT [dbo].[mst_feature] ON                          
		Insert Into mst_Feature (
				FeatureID
			,	FeatureName
			,	ReferenceId
			,	ReportFlag
			,	DeleteFlag
			,	AdminFlag
			,	SystemId
			,	UserID
			,	Published
			,	ModuleId
			,	CountryId
			,	CreateDate
			,	MultiVisit
			,	FeatureTypeId)
		Values (
				1001
			,	@FeatureName
			,	@ReferenceId
			,	@ReportFlag
			,	@DeleteFlag
			,	@AdminFlag
			,	@SystemId
			,	@UserId
			,	0
			,	@ModuleId
			,	@CountryId
			,	getdate()
			,	@MultiVisit
			,	@featureTypeId)                           
		SET IDENTITY_INSERT [dbo].[mst_feature] OFF                     
		Set @iFeatureId= 1001                            
	End                          
                          
                          
  --entry in visit type too                                  
	Select @MaxVisitTypeId=max(VisitTypeId) From mst_visitType                          
	If(@MaxVisitTypeId>100)  Begin                          
		Insert Into mst_VisitType (
				VisitName
			,	FormDescription
			,	DeleteFlag
			,	UserID
			,	CreateDate
			,	SystemId
			,	FeatureId)
		Values (
				@FeatureName
			,	@FormDescription
			,	@DeleteFlag
			,	@UserId
			,	getdate()
			,	@SystemId
			,	@iFeatureId)                              
	End                          
	Else Begin                          
		SET IDENTITY_INSERT [dbo].[mst_VisitType] ON                          
		Insert Into mst_VisitType (
				VisitTypeID
			,	VisitName
			,	FormDescription
			,	DeleteFlag
			,	UserID
			,	CreateDate
			,	SystemId)
		Values (
				101
			,	@FeatureName
			,	@FormDescription
			,	@DeleteFlag
			,	@UserId
			,	getdate()
			,	@SystemId)                        
		SET IDENTITY_INSERT [dbo].[mst_VisitType] OFF                          
	End                          
            
 insert into lnk_groupFeatures (GroupId,FeatureId,FunctionId,createDate)                            
 values(1,@iFeatureId,1,getdate())                               
 insert into lnk_groupFeatures (GroupId,FeatureId,FunctionId,createDate)                            
 values(1,@iFeatureId,2,getdate())                            
 insert into lnk_groupFeatures (GroupId,FeatureId,FunctionId,createDate)             
 values(1,@iFeatureId,3,getdate())                            
 insert into lnk_groupFeatures (GroupId,FeatureId,FunctionId,createDate)                            
 values(1,@iFeatureId,4,getdate())                            
 insert into lnk_groupFeatures (GroupId,FeatureId,FunctionId,createDate)                            
 values(1,@iFeatureId,5,getdate())                            
 end                
else                                      
 begin                                      
 --store old feature name in variable to modify visit type according to old feature name                                  
 select @strOldFeatureName=FeatureName from mst_feature where  featureId=@FeatureId                                   
  if (@FeatureId = 126) Begin
	Update mst_Feature Set
		--	FeatureName = @FeatureName
			ReportFlag = @ReportFlag
		,	ReferenceId = isnull(ReferenceId, @ReferenceId)
		,	DeleteFlag = @DeleteFlag
		,	AdminFlag = @AdminFlag
		,	OptionalFlag = @OptionalFlag
		,	SystemId = 0
		,	UserID = @UserId
		,	ModuleId = @ModuleId
		,	UpdateDate = getdate()
		,	MultiVisit = @MultiVisit
	Where (FeatureID = @FeatureId)
  End
  else  Begin
	Update mst_Feature Set
		--	FeatureName = @FeatureName
			ReferenceId = isnull(ReferenceId, @ReferenceId)
		,	ReportFlag = @ReportFlag
		,	DeleteFlag = @DeleteFlag
		,	AdminFlag = @AdminFlag
		,	OptionalFlag = @OptionalFlag
		,	SystemId = @SystemId
		,	UserID = @UserId
		,	ModuleId = @ModuleId
		,	UpdateDate = getdate()
		,	MultiVisit = @MultiVisit
		,	FeatureTypeId = isnull(FeatureTypeId, @featureTypeId)
	Where (FeatureID = @FeatureId)
  End                     
--entry in visit type                                  
		Update mst_VisitType Set
				FormDescription = Isnull(@FormDescription,VisitName)
			,	UserID = @UserId
			,	UpdateDate = getdate()
			,	SystemId = @SystemId
			,	FeatureId = @FeatureId
		Where --(VisitName = @strOldFeatureName)And
		 (VisitTypeID > 100)
		And (FeatureId = @FeatureId)                        
 set @iFeatureId=@FeatureId                                    
 end                                      
select @iFeatureId   FeatuerId     
Return (@iFeatureId)                            
end



GO


