If NOT Exists(Select * from sys.columns where Name = N'Abbreviation' AND Object_ID = Object_ID(N'mst_Drug'))
BEGIN
	ALTER TABLE mst_Drug ADD Abbreviation varchar(100) null
END
