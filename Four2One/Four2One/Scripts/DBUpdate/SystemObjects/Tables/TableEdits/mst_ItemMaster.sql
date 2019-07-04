 IF NOT EXISTS(SELECT * FROM sys.columns 
          WHERE Name = N'ItemID'
          AND Object_ID = Object_ID(N'mst_ItemMaster'))
BEGIN
ALTER  table mst_ItemMaster ADD  ItemID int null
END