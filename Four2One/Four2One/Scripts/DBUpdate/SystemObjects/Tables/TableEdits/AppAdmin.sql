If Not Exists (Select * From sys.columns Where Name = N'VersionName' 
And Object_ID = Object_id(N'AppAdmin'))    
Begin
  Alter Table AppAdmin ADD VersionName VARCHAR(100) NULL
End
Go