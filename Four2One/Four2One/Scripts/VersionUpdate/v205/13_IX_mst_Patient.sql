if exists(select * from sys.sysindexes where name = 'IX_mst_Patient')
DROP INDEX [IX_mst_Patient] ON [dbo].[mst_Patient];