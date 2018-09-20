If Not Exists (Select * From sys.columns Where Name = N'ReferenceId' And Object_ID = Object_id(N'Mst_BusinessRule'))    
Begin
  Alter table dbo.Mst_BusinessRule Add ReferenceId  varchar(50) Null
End
Go