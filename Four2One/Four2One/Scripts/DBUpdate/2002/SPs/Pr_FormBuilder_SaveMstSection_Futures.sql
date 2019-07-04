
/****** Object:  StoredProcedure [dbo].[Pr_FormBuilder_SaveMstSection_Futures]    Script Date: 8/30/2018 12:40:20 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER proc [dbo].[Pr_FormBuilder_SaveMstSection_Futures]        
@SectionId int,        
@SectionName varchar(50),        
@Seq int,        
@CustomFlag int,        
@DeleteFlag int,        
@UserId int,        
@FeatureId int,  
@IsGridView int=0    ,
@SectionInfo varchar(255) = null     
as        
begin        
Declare @iSectionId as int        
if exists(select * from mst_section where sectionId=@SectionId)          
 begin          
 --select 'a'        
	Update mst_section Set
		SectionName = @SectionName, SectionInfo = @SectionInfo, Seq = @Seq, CustomFlag = @CustomFlag, DeleteFlag = @DeleteFlag,
		UserId = @UserId, FeatureId = @FeatureId, UpdateDate = getdate(), IsGridView = @IsGridView
	Where SectionId = @SectionId      
        
  set @iSectionId=@SectionId        
 end          
else          
begin          
 --select 'B'        
Insert Into mst_Section (
	SectionName
	,SectionInfo
	,Seq
	,CustomFlag
	,DeleteFlag
	,UserId
	,CreateDate
	,FeatureId
	,IsGridView)
Values (
	@SectionName
	,@SectionInfo
	,@Seq
	,@CustomFlag
	,@DeleteFlag
	,@UserId
	,getdate()
	,@FeatureId
	,@IsGridView)         
         
  set @iSectionId= scope_identity();          
 end           
 select @iSectionId        
end

GO


