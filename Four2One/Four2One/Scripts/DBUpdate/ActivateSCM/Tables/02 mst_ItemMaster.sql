If Not Exists (Select * From sys.columns Where Name = N'QtyUnitDisp' And Object_ID = Object_id(N'Mst_ItemMaster'))    
Begin
	ALTER TABLE Mst_ItemMaster
	ADD QtyUnitDisp int;
End
Go

If Not Exists (Select * From sys.columns Where Name = N'syrup' And Object_ID = Object_id(N'Mst_ItemMaster'))    
Begin
	ALTER TABLE Mst_ItemMaster
	ADD Syrup int;
End
Go

If Not Exists (Select * From sys.columns Where Name = N'MorDose' And Object_ID = Object_id(N'Mst_ItemMaster'))    
Begin
	ALTER TABLE Mst_ItemMaster
	ADD MorDose int;
End
Go

If Not Exists (Select * From sys.columns Where Name = N'MidDose' And Object_ID = Object_id(N'Mst_ItemMaster'))    
Begin
	ALTER TABLE Mst_ItemMaster
	ADD MidDose int;
End
Go

If Not Exists (Select * From sys.columns Where Name = N'EvenDose' And Object_ID = Object_id(N'Mst_ItemMaster'))    
Begin
	ALTER TABLE Mst_ItemMaster
	ADD EvenDose int;
End
Go

If Not Exists (Select * From sys.columns Where Name = N'NightDose' And Object_ID = Object_id(N'Mst_ItemMaster'))    
Begin
	ALTER TABLE Mst_ItemMaster
	ADD NightDose int;
End
Go

If Not Exists (Select * From sys.columns Where Name = N'Abbreviation' And Object_ID = Object_id(N'Mst_ItemMaster'))    
Begin
	ALTER TABLE Mst_ItemMaster
	ADD Abbreviation varchar(200);
End
Go