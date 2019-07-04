

/****** Object:  StoredProcedure [dbo].[Pr_FormBuilder_SaveLnkForm_Futures]    Script Date: 8/30/2018 12:46:24 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER proc [dbo].[Pr_FormBuilder_SaveLnkForm_Futures]              
@Id int,              
@FeatureId int,              
@SectionId int,              
@FieldId int,              
@FieldLabel varchar(100),             
@Seq int,             
@UserId int,              
@Predefined int              
as              
begin        
--declare @tempfield int           
if(charindex('8888',@FieldId) >0)           
begin           
set @FieldId = replace(@FieldId,'8888','')          
end          
else if(charindex('9999',@FieldId) >0)           
begin           
set @FieldId = replace(@FieldId,'9999','')          
end 
              
if exists(select * from lnk_forms where Id=@Id)                
 begin              
  update lnk_forms set FeatureId=@FeatureId,SectionId=@SectionId,FieldId=@FieldId,FieldLabel=@FieldLabel,              
  Seq=@Seq,UserId=@UserId,Predefined=@Predefined,UpdateDate=getdate()              
  where id=@Id              
 end              
else              
 begin              
  insert into lnk_forms (FeatureId,SectionId,FieldId,FieldLabel,Seq,UserId,Predefined,CreateDate)              
  values(@FeatureId,@SectionId,@FieldId,@FieldLabel,@Seq,@UserId,@Predefined,getdate())              
 end              
end

GO


