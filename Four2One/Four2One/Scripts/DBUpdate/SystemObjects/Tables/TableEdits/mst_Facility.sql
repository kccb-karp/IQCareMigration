If Not Exists (Select * From sys.columns Where Name = N'Integrated' 
And Object_ID = Object_id(N'mst_Facility'))    
Begin
  Alter Table mst_Facility ADD [Integrated] INT NULL
End
Go

UPDATE mst_Facility set [Integrated] = 0
GO