If Not Exists (Select * From sys.columns Where Name = N'Email' And Object_ID = Object_id(N'Mst_User'))    
Begin
	ALTER TABLE Mst_User
	ADD Email varchar(50);
End
Go


If Not Exists (Select * From sys.columns Where Name = N'Designation' And Object_ID = Object_id(N'Mst_User'))    
Begin
	ALTER TABLE Mst_User
	ADD	Designation int;
End
Go