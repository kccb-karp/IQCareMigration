If Not Exists (Select * From sys.columns Where Name = N'SectionInfo' And Object_ID = Object_id(N'Mst_Section'))    
Begin
  Alter table dbo.Mst_Section Add SectionInfo  varchar(255) Null 
End
Go