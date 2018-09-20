
/****** Object:  StoredProcedure [dbo].[Pr_PMTCT_GetCustomFields_Futures]    Script Date: 9/4/2018 11:42:18 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





ALTER procedure [dbo].[Pr_PMTCT_GetCustomFields_Futures]                                                                                                        
(                                                                                                        
 @FieldName varchar(50)=null ,                                                                                              
 @ModuleId int,                                                                                         
 @flag int,                                
 @isGridView int =null ,
 @SystemId int =0                                                                                                       
)                                                                                                        
as  
Begin
                                                                                                      
	declare @sql varchar(5000)                                                     
                                                                                        
	If @flag = 1  Begin
		Set @sql = 'select ''8888''+convert(varchar,c.ID)[ID],c.fieldname,c.fieldDesc,c.controlID, c.CategoryId CodeId, C.BindTable, dbo.GetLookupValues(CategoryId, BindTable,0)LookupValues,
				l.Name,L.referenceId,0[ModuleId],c.userID,u.UserName,0[Predefine],                                                                      
			c.DeleteFlag,CONVERT(VARCHAR, c.UpdateDate,103) AS [UpdateDate],                                                                      
			(select isnull(count(fieldid),0) from lnk_careendconditionalfields where confieldid = c.Id and ConPredefine =0)[ConditionalField]                                                                       
			from mst_customformfield c inner join mst_control l on l.controlid=c.controlid                                                                                                        
			inner join mst_user u on c.userid=u.userid and c.CareEnd = 1 and c.PatientRegistration IS NULL '
		If @FieldName <> '' Begin
			Set @sql = @sql + ' where c.FieldName like' + '''' + '%' + @FieldName + '%' + ''' and (c.Deleteflag IS NULL or c.Deleteflag=0)'
		End
		Set @sql = @sql + ' union   all                                                                                                      
				select ''9999''+convert(varchar,p.ID)[ID],p.PDFName[fieldname],''''[fieldDesc],p.controlID, p.CategoryId CodeId, p.BindTable,dbo.GetLookupValues(CategoryId, BindTable,0)LookupValues,l.Name,L.referenceId,p.ModuleId[ModuleId],p.userid,''''[UserName],1[Predefine],                                                                      
				0[DeleteFlag],CONVERT(VARCHAR, p.UpdateDate,103) AS [UpdateDate],                                                                      
				(select isnull(count(fieldid),0) from lnk_careendconditionalfields where confieldid = p.Id and ConPredefine =1)[ConditionalField]                                                                       
				from Mst_PreDefinedFields p  inner join mst_control l on l.controlid=p.controlid and p.PatientRegistration IS NULL'
		If @FieldName <> '' Begin
			Set @sql = @sql + ' where p.PDFName like' + '''' + '%' + @FieldName + '%' + ''' '
			--and (p.Deleteflag IS NULL or p.Deleteflag=0)                           
		End
		If @FieldName <> '' And @ModuleId = 0 Begin
			Set @sql = @sql + ' and p.Moduleid=' + convert(varchar, @ModuleId)
		End 
		Else If @ModuleId = 0 Begin
			Set @sql = @sql + ' and p.ModuleId =' + convert(varchar, @ModuleId)
		End
		Set @sql = @sql + ' order by [FieldName]'
	End 
	Else If @flag = 2 Begin
                                                                          
		Set @sql = 'select ''8888''+convert(varchar,c.ID)[ID],c.fieldname,c.fieldDesc,c.controlID, 
		c.CategoryId CodeId, C.BindTable,dbo.GetLookupValues(CategoryId, BindTable,0)LookupValues,l.Name,L.referenceId,0[ModuleId],c.userID,u.UserName,0[Predefine],                                                                      
				c.DeleteFlag,CONVERT(VARCHAR, c.UpdateDate,103) AS [UpdateDate],                                                                      
				(select isnull(count(fieldid),0) from lnk_PatientRegconditionalfields where confieldid = c.Id and ConPredefine =0)[ConditionalField],                        
				c.fieldname[Bindfieldname],''dtl_CustomField''[PDFTableName]                                                                       
				from mst_customformfield c   inner join mst_control l on l.controlid=c.controlid                                                                                                        
				inner join mst_user u on c.userid=u.userid and c.PatientRegistration = 1 where (c.Deleteflag IS NULL or c.Deleteflag=0)  '
		If @FieldName <> '' Begin
			Set @sql = @sql + ' and c.FieldName like' + '''' + '%' + @FieldName + '%' + ''''
		End
		Set @sql = @sql + ' union    all                                                                                                   
				select ''9999''+convert(varchar,p.ID)[ID],p.PDFName[fieldname],''''[fieldDesc],p.controlID, p.CategoryId CodeId, p.BindTable,dbo.GetLookupValues(CategoryId, BindTable,0)LookupValues,l.Name,L.referenceId,p.ModuleId[ModuleId],p.userid,''''[UserName],1[Predefine],                                                                      
				0[DeleteFlag],CONVERT(VARCHAR, p.UpdateDate,103) AS [UpdateDate],                                                                      
				(select isnull(count(fieldid),0) from lnk_PatientRegconditionalfields where confieldid = p.Id and ConPredefine =1)[ConditionalField],                                                                      
				p.bindfield[Bindfieldname], p.PDFTableName[PDFTableName]from Mst_PreDefinedFields p                                                                                                        
				inner join mst_control l on l.controlid=p.controlid and p.PatientRegistration = 1'
		If @FieldName <> '' Begin
			Set @sql = @sql + ' where p.PDFName like' + '''' + '%' + @FieldName + '%' + ''' '
		End
		Set @sql = @sql + ' order by [FieldName]'
	End 
	Else Begin
		Set @sql = 'select ''8888''+convert(varchar,c.ID)[ID],c.fieldname,c.fieldDesc,c.controlID, c.CategoryId CodeId, C.BindTable,dbo.GetLookupValues(CategoryId, BindTable,0)LookupValues,l.Name,L.referenceId,0[ModuleId],c.userID,u.UserName,0[Predefine],                                                                      
				c.DeleteFlag,CONVERT(VARCHAR, c.UpdateDate,103) AS [UpdateDate],                                                                      
				(select isnull(count(fieldid),0) from lnk_conditionalfields where confieldid = c.Id and ConPredefine =0)[ConditionalField]                                                                       
				 from mst_customformfield c inner join mst_control l on l.controlid=c.controlid                                  
				inner join mst_user u on c.userid=u.userid and (c.CareEnd = 0 or c.CareEnd is null) and c.PatientRegistration IS NULL and (c.Deleteflag IS NULL or c.Deleteflag=0) '
		If (@isGridView Is Null) Begin
			If @FieldName <> '' Begin
				Set @sql = @sql + ' where c.FieldName like' + '''' + '%' + @FieldName + '%' + ''' and (c.Deleteflag IS NULL or c.Deleteflag=0 or c.Deleteflag=1)'
			End
			Set @sql = @sql + ' union  all                                                                                                       
							select ''9999''+convert(varchar,p.ID)[ID],p.PDFName[fieldname],''''[fieldDesc],p.controlID, p.CategoryId CodeId, p.BindTable,dbo.GetLookupValues(CategoryId, BindTable,0)LookupValues,l.Name,L.referenceId,p.ModuleId[ModuleId],p.userid,''''[UserName],1[Predefine],                                            
							0[DeleteFlag],CONVERT(VARCHAR, p.UpdateDate,103) AS [UpdateDate],                                                                      
							(select isnull(count(fieldid),0) from lnk_conditionalfields where confieldid = p.Id and ConPredefine =1)[ConditionalField]                                                                       
							from Mst_PreDefinedFields p inner join mst_control l on l.controlid=p.controlid  and p.PatientRegistration IS NULL and (p.Deleteflag IS NULL or p.Deleteflag=0)'
			If @FieldName <> '' Begin
				Set @sql = @sql + ' and p.PDFName like' + '''' + '%' + @FieldName + '%' + ''''
			End
			If @FieldName <> '' And @ModuleId <> 0 Begin
				Set @sql = @sql + ' and p.Moduleid=' + convert(varchar, @ModuleId)
			End 
			Else If @ModuleId <> 0 Begin
				Set @sql = @sql + ' and p.ModuleId =' + convert(varchar, @ModuleId)
			End
			End 
			Else Begin
				Set @sql = @sql + ' where  (select isnull(count(fieldid),0) from lnk_conditionalfields where confieldid = c.Id and ConPredefine =0) =0  and  l.controlid not in(9,13,15,16,12,11) '
			End
			Set @sql = @sql + ' order by [FieldName]'
	End

		--Table 0
	 --Print (@sql);
	 Exec (@sql)

		 --Table 1
	Select	Id
				,Case
					When Predefined = 0 Then '8888' + convert(varchar, FieldId)
					When Predefined = 1 Then '9999' + convert(varchar, FieldId)
				End [FieldId]
				,BusRuleId
				,Value [Value]
				,Predefined
				,UserId
				,CreateDate
				,UpdateDate
				,Value1
		From Lnk_FieldsBusinessRule

	--Tablw 2
	Select 0 FieldID , '' FieldName, '' FieldValue, 0 Predefined, 0 CodeId,'' BindTable, 0 ModuleId Where 1 > 1

	--Table 3
	Select	ControlID
				,Name
				,DataType
				,DeleteFlag
				,UserId
				,CreateDate
				,UpdateDate
				,ReferenceId
				,LookupTable
		From mst_control
		Where (Name <> 'System auto generated');


	--Table 4
		Select	PaddedFieldId	As FieldId
			,	FieldName
			,	BusRuleId
			,	BusRuleName
			,	BusRuleReferenceId
			,	Value
			,	Value1
			,	Predefined
			,	DeleteFlag
	From FieldsBusinessRuleView As BRV
	--Table 5

	Select	Case ConPredefine
					When '1' Then '9999' + convert(varchar, ConfieldId)
					When '0' Then '8888' + convert(varchar, ConfieldId)
				End [ConfieldId]
				,Case Predefined
					When '1' Then '9999' + convert(varchar, FieldId)
					When '0' Then '8888' + convert(varchar, FieldId)
				End [FieldId]
				,[SectionId]
				,[Predefined]
				,[FieldLabel]
				,[UserId]
				,[CreateDate]
				,[UpdateDate]
				,[Seq]
				,[Conpredefine]
		From Lnk_Conditionalfields

	--Table 6
	Select ''  As  LnkFrmFieldID Where 1 > 1  
End
GO


