IF NOT EXISTS(select * from mst_Code where Name ='Form Category')
BEGIN
SET IDENTITY_INSERT mst_Code ON
DECLARE @CodeId  int=(Select MAX(CodeID) + 1 from mst_Code)

INSERT INTO mst_Code(CodeID,[Name],DeleteFlag,UserID,CreateDate)
values(@CodeId,'Form Category',0,1,GETDATE())

SET IDENTITY_INSERT mst_Code OFF
END