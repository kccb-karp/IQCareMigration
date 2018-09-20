If Not Exists (Select * From sys.columns Where Name = N'RegimenLineID' And Object_ID = Object_id(N'mst_regimen'))    
Begin
	ALTER TABLE mst_regimen
	ADD RegimenLineID int;
End
Go

If Not Exists (Select * From sys.columns Where Name = N'Purpose' And Object_ID = Object_id(N'mst_regimen'))    
Begin
	ALTER TABLE mst_regimen
	ADD Purpose nvarchar(50);
End
Go

ALTER TABLE mst_regimen
ALTER COLUMN RegimenName varchar(255);
GO