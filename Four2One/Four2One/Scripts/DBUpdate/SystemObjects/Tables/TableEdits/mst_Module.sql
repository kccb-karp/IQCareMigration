if exists(select moduleid from (
select ModuleId, COUNT(ModuleId)n 
from mst_Module 
Group by ModuleID)a)
begin

delete from mst_module where ModuleID IN (
select moduleid from (
select ModuleId, COUNT(ModuleId)n 
from mst_Module 
Group by ModuleID)a
where n > 1)
end 


If Exists (Select * From sys.columns Where Name = N'DeleteFlag'  And Object_ID = Object_id(N'mst_module') And system_type_id=TYPE_ID('int'))    
Begin
	If Exists(SELECT * FROM sys.default_constraints WHERE  parent_object_id = OBJECT_ID('dbo.mst_module') And name='DF_mst_module_DeleteFlag') Begin 
		Alter table [mst_module] Drop CONSTRAINT DF_mst_module_DeleteFlag 

	End
End

Go
If Exists (Select * From sys.columns Where Name = N'DeleteFlag'  And Object_ID = Object_id(N'mst_module') And system_type_id=TYPE_ID('int'))    
Begin
	Alter table dbo.[mst_module] Alter Column [DeleteFlag] bit
End
Go

Alter table dbo.[mst_module] Alter Column [ModuleName] varchar(50) Not Null
Go

If Not Exists (Select * From sys.columns Where Name = N'CanEnroll' And Object_ID = Object_id(N'mst_module'))    
Begin
  Alter table dbo.mst_module Add CanEnroll bit Null
End
Go
Update mst_Module Set CanEnroll = Case When ModuleName In ('PM/SCM','Laboratory','Pharmacy','Records')  Then 0 Else 1 End Where CanEnroll Is Null
Go
If Not Exists (Select * From sys.columns Where Name = N'ModuleFlag' And Object_ID = Object_id(N'mst_module'))    
Begin
  Alter table dbo.mst_module Add ModuleFlag bit default 0 Not Null  
 End
 Go
Update mst_Module Set ModuleFlag = Case When ModuleName In ('PM/SCM','Laboratory','Pharmacy','Records')  Then 1 Else 0 End 
Go
If Not Exists (Select * From sys.columns Where Name = N'DisplayName' And Object_ID = Object_id(N'mst_module'))    
Begin
  Alter table dbo.mst_module Add DisplayName varchar(50) Null
End
Go
Update mst_Module Set DisplayName = ModuleName Where DisplayName Is Null
Go


IF Not Exists (SELECT * FROM sys.key_constraints WHERE type = 'PK' AND parent_object_id = OBJECT_ID('dbo.mst_module') AND Name = 'PK_mst_module')
   ALTER TABLE [dbo].[mst_module] ADD  CONSTRAINT [PK_mst_module] PRIMARY KEY CLUSTERED 
	(
	[ModuleId] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)

GO


If Exists (Select * From sys.columns Where Name = N'DeleteFlag'  And Object_ID = Object_id(N'mst_module') And system_type_id=TYPE_ID('int'))    Begin
	If Exists(SELECT * FROM sys.default_constraints WHERE  parent_object_id = OBJECT_ID('dbo.mst_module') And name='DF_mst_module_DeleteFlag') Begin 
		Alter table [mst_module] Drop CONSTRAINT DF_mst_module_DeleteFlag 

	End
End
Go
If Exists (Select * From sys.columns Where Name = N'DeleteFlag'  And Object_ID = Object_id(N'mst_module') And system_type_id=TYPE_ID('int'))    Begin
	Alter table dbo.[mst_module] Alter Column [DeleteFlag] bit
End
Go


;
With md
As
(
Select	*
	,	row_number() Over (Partition By ModuleName Order By DeleteFlag Asc)	RI
From mst_module
)
Update M Set
		ModuleName = M.ModuleName + '_Deleted'
From mst_module M
Inner Join md On md.ModuleId = m.ModuleID
Where RI > 1
And M.DeleteFlag = 1
Go
