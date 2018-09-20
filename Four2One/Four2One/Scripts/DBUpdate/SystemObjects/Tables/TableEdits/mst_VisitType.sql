/* mst_VisitType */

If Not Exists (Select * From sys.columns Where Name = N'Custom' And Object_ID = Object_id(N'Mst_VisitType'))    
Begin
  Alter table dbo.Mst_VisitType Add Custom  bit  default 1
End
Go
Update Mst_VisitType Set Custom =0 Where Custom Is Null
Go
 Alter table dbo.Mst_VisitType Alter Column Custom  bit  not null
 Go
If Not Exists (Select * From sys.columns Where Name = N'CategoryId' And Object_ID = Object_id(N'Mst_VisitType'))    
Begin
  Alter table dbo.Mst_VisitType Add CategoryId  int  null
End
Go
If Not Exists (Select * From sys.columns Where Name = N'FormDescription' And Object_ID = Object_id(N'Mst_VisitType'))    
Begin
  Alter table dbo.Mst_VisitType Add FormDescription varchar(100) Null
End
Go
Update Mst_VisitType Set FormDescription = VisitName Where FormDescription Is Null
Go