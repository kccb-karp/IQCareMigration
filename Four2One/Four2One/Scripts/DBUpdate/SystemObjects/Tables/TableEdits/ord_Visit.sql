If Exists(Select * from sys.columns where Name = N'AuditData' AND Object_ID = Object_ID(N'ord_Visit'))
BEGIN
	ALTER TABLE ord_Visit DROP COLUMN AuditData
END
GO

If NOT Exists(Select * from sys.columns where Name = N'AuditData' AND Object_ID = Object_ID(N'ord_visit'))
BEGIN
	ALTER TABLE ord_visit ADD AuditData XML
END
GO

If Not Exists (Select * From sys.columns Where Name = N'CreatedBy' And Object_ID = Object_id(N'Ord_Visit'))    
Begin
  Alter table dbo.Ord_Visit Add CreatedBy  int Null
End
Go
If Not Exists (Select * From sys.columns Where Name = N'old_signature_employee_id' And Object_ID = Object_id(N'Ord_Visit'))    
Begin
  Alter table dbo.Ord_Visit Add old_signature_employee_id  int Null
End
Go
Update dbo.ord_Visit Set old_signature_employee_id = Isnull(old_signature_employee_id,Signature) where old_signature_employee_id Is Null and Signature Is Not Null
Go

If Not Exists (Select * From sys.columns Where Name = N'ModuleId' And Object_ID = Object_id(N'ord_Visit'))    
Begin
  Alter table dbo.ord_Visit Add ModuleId  int Null
End
Go