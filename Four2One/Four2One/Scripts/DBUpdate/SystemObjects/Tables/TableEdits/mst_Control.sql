If Not Exists (Select * From sys.columns Where Name = N'ReferenceId' And Object_ID = Object_id(N'Mst_Control'))    
Begin
  Alter table dbo.Mst_Control Add ReferenceId  varchar(36) Null 
End
Go
If Not Exists (Select * From sys.columns Where Name = N'LookupTable' And Object_ID = Object_id(N'Mst_Control'))    
Begin
  Alter table dbo.Mst_Control Add LookupTable  varchar(36) Null 
End
Go
Update mst_Control Set ReferenceId = Convert(varchar(36), newid()) Where ReferenceId Is Null
GO