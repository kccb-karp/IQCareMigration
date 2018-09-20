IF NOT EXISTS(select * from mst_Decode where Name ='Enrollment')
BEGIN
SET IDENTITY_INSERT mst_Decode ON
DECLARE @Id  int=(Select MAX(ID) + 1 from mst_Decode)
INSERT INTO mst_Decode(ID,[Name],CodeID,SRNo,DeleteFlag,UserID,CreateDate)
values(@Id,'Enrollment',(Select CodeID from mst_Code where Name ='Form Category' and  DeleteFlag =0)
,1,0,1,GetDate())
SET IDENTITY_INSERT mst_Decode OFF

END
go

IF NOT EXISTS(select * from mst_Decode where Name ='Consultation')
BEGIN
SET IDENTITY_INSERT mst_Decode ON
DECLARE @Id int=(Select MAX(ID) + 1 from mst_Decode)
INSERT INTO mst_Decode(ID,[Name],CodeID,SRNo,DeleteFlag,UserID,CreateDate)
values(@Id,'Consultation',(Select CodeID from mst_Code where Name ='Form Category' and  DeleteFlag =0)
,2,0,1,GetDate())
SET IDENTITY_INSERT mst_Decode OFF
END
go

IF NOT EXISTS(select * from mst_Decode where Name ='Care Termination')
BEGIN
SET IDENTITY_INSERT mst_Decode ON
DECLARE @Id int=(Select MAX(ID) + 1 from mst_Decode)
INSERT INTO mst_Decode(ID,[Name],CodeID,SRNo,DeleteFlag,UserID,CreateDate)
values(@Id,'Care Termination',(Select CodeID from mst_Code where Name ='Form Category' and  DeleteFlag =0)
,3,0,1,GetDate())
SET IDENTITY_INSERT mst_Decode OFF
END


go

IF NOT EXISTS(select * from mst_Decode where Name ='Registration')
BEGIN
SET IDENTITY_INSERT mst_Decode ON
DECLARE @Id int=(Select MAX(ID) + 1 from mst_Decode)
INSERT INTO mst_Decode(ID,[Name],CodeID,SRNo,DeleteFlag,UserID,CreateDate)
values(@Id,'Registration',(Select CodeID from mst_Code where Name ='Form Category' and  DeleteFlag =0)
,4,0,1,GetDate())
SET IDENTITY_INSERT mst_Decode OFF

END