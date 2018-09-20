If NOT Exists(Select * from sys.columns where Name = N'stage' AND Object_ID = Object_ID(N'mst_regimen'))
BEGIN
	ALTER TABLE mst_regimen ADD stage varchar(100) null
END
GO

If NOT Exists(Select * from sys.columns where Name = N'SrNo' AND Object_ID = Object_ID(N'mst_regimen'))
BEGIN
	ALTER TABLE mst_regimen ADD SrNo varchar(100) null
END


If NOT Exists(Select * from sys.columns where Name = N'UserId' AND Object_ID = Object_ID(N'mst_regimen'))
BEGIN
	ALTER TABLE mst_regimen ADD UserId Int null
END
GO

If NOT Exists(Select * from sys.columns where Name = N'CreateDate' AND Object_ID = Object_ID(N'mst_regimen'))
BEGIN
	ALTER TABLE mst_regimen ADD CreateDate DATE null
END
GO