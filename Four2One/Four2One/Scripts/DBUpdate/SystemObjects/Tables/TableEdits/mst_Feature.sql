If Not Exists (Select * From sys.columns Where Name = N'CanLink' And Object_ID = Object_id(N'Mst_Feature'))    
Begin
  Alter table dbo.Mst_Feature Add CanLink  bit Default 0
End
Go

If Not Exists (Select * From sys.columns Where Name = N'FeatureTypeId' And Object_ID = Object_id(N'Mst_Feature'))    
Begin
  Alter table dbo.Mst_Feature Add FeatureTypeId  int Null
End
Go

If Not Exists (Select * From sys.columns Where Name = N'ReferenceId' And Object_ID = Object_id(N'Mst_Feature'))    
Begin
  Alter table dbo.Mst_Feature Add ReferenceId  varchar(50) Null
End
Go
Update mst_Feature Set CanLink = 1 Where ReferenceId In ('LABORATORY','PHARMACY','FOLLOWUP_EDUCATION','CONSUMABLES_ISSUANCE') And CanLink Is Null;
go
Alter table dbo.Mst_Feature Alter Column ReferenceId  varchar(50) Null
Go