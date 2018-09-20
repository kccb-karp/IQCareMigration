Insert into [County] ([Id], [CountyId], [CountyName], [SubcountyId], [Subcountyname], [WardId], [WardName]) 
Select 1425, 48, 'NOT DOCUMENTED', 286, 'NOT DOCUMENTED', 1425, 'NOT DOCUMENTED'
go



SET IDENTITY_INSERT [dbo].[FacilityList] ON 
Go
Insert Into FacilityList(Id, MFLCode,Name)
 Select 8779 ,99999 , 'Not Documented'
 Go

SET IDENTITY_INSERT [dbo].[FacilityList] Off 
Go