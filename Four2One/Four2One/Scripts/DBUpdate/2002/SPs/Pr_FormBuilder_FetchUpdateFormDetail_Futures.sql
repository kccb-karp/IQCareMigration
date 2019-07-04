

/****** Object:  StoredProcedure [dbo].[Pr_FormBuilder_FetchUpdateFormDetail_Futures]    Script Date: 8/30/2018 9:56:45 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER proc [dbo].[Pr_FormBuilder_FetchUpdateFormDetail_Futures] 

@iFeatureId int  

as  





begin 

Declare @VisitType int  

--0  



Select	F.FeatureID
		,	F.FeatureName
		,	V.VisitName FormName
		,	V.FormDescription
		,	V.VisitTypeID FormId
		,	V.Custom
		,	V.CategoryId
		,	F.ReportFlag
		,	F.DeleteFlag
		,	F.AdminFlag
		,	F.UserID
		,	F.CreateDate
		,	F.UpdateDate
		,	F.OptionalFlag
		,	F.SystemId
		,	F.Published
		,	F.CountryId
		,	F.ModuleId
		,	F.MultiVisit
		,	F.Seq
		,	F.RegistrationFormFlag
		,	F.ReferenceId
		,	F.CanLink
	From mst_Feature As F
	Inner Join mst_VisitType As V On V.FeatureId = F.FeatureID
	Where (F.FeatureID = @iFeatureId)
		And (F.DeleteFlag = 0)     
	




--1  

select * from mst_section where featureid=@iFeatureId  and deleteFlag=0   order by seq  



--select * from lnk_forms where featureid=@iFeatureId  order by sectionId,seq 





--2  



select Id, FeatureId, SectionId, Case when Predefined=0 then '8888'+CONVERT(Varchar, FieldId) When Predefined=1 then '9999'+CONVERT(Varchar, FieldId)End[FieldId],  

FieldLabel, UserId, CreateDate, UpdateDate, Predefined, Seq, AdditionalInformation from lnk_forms where featureid=@iFeatureId  order by sectionId,seq  





--3   



select distinct mst.TabID,mst.TabName,mst.FeatureID,mst.Deleteflag,mst.UserId,mst.Createdate,mst.Updatedate,mst.Seq, ISNULL(mst.Signature, 0)[Signature]



 from  Mst_FormBuilderTab mst join Lnk_FormTabSection lnk on mst.Tabid=lnk.tabid  where mst.FeatureID=@iFeatureId   and mst.DeleteFlag=0   order by mst.seq 



--select * from  Mst_FormBuilderTab where FeatureID=@iFeatureId   and DeleteFlag=0   order by seq   



--select * from  Lnk_FormTabSection where FeatureID=@iFeatureId  



--4    





select distinct TABID, SectionID, FeatureID, UserID from  Lnk_FormTabSection where FeatureID=@iFeatureId  





--5     



Select @VisitType=VisitTypeID from mst_visittype where FeatureId=@iFeatureId  





if exists(select * from ord_Visit where VisitType=@VisitType)  





  Begin  



   Select '1'[Signature] 



        End   



else   Begin Select '0'[Signature] End  



--6  

select m.FeatureId[ServiceAreaName],l.BusRuleId,l.Value,l.Value1,l.SetType from mst_feature m    



 inner join lnk_featureBusinessRule l on l.featureid=m.featureid 



 where l.featureid=@iFeatureId  







 ----7





SELECT top 1 Ver.[Id],Ver.[FeatureId],Ver.[VersionName],Ver.[VersionDate],Ver.[UserId],Ver.[CreateDate],Case WHEN Ver.[Updatedate] IS NULL THEN  Ver.[CreateDate] ELSE Ver.[Updatedate] END [Updatedate],Usr.UserName,Ver.PaperVersion 

FROM Mst_FeatureVersion Ver

JOIN MST_User Usr on Ver.UserId=Usr.UserId

where FeatureId=@iFeatureId



order by Ver.[Id] desc



end











GO


