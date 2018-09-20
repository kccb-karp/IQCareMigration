IF EXISTS (select name from sys.default_constraints
where name = 'DF_mst_Generic_DeleteFlag'
and OBJECT_NAME(parent_object_id) = 'mst_Generic_old') 
BEGIN
ALTER TABLE [dbo].[mst_Generic_old] DROP CONSTRAINT [DF_mst_Generic_DeleteFlag]
END



IF EXISTS (select name from sys.default_constraints
where name = 'DF_mst_Drug_DeleteFlag'
and OBJECT_NAME(parent_object_id) = 'mst_Drug_old') 
BEGIN
    ALTER TABLE dbo.mst_Drug_old DROP CONSTRAINT DF_mst_Drug_DeleteFlag
END

IF EXISTS (select name from sys.default_constraints
where name = 'DF_mst_DrugType_DeleteFlag'
and OBJECT_NAME(parent_object_id) = 'mst_DrugType_old') 
BEGIN
    ALTER TABLE dbo.mst_DrugType_old DROP CONSTRAINT DF_mst_DrugType_DeleteFlag
END;




IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Create_DefaultConstraints]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Create_DefaultConstraints]
GO
Set Nocount on
Go
Create PROCEDURE [dbo].[Create_DefaultConstraints]
AS
BEGIN
Declare @DeleteFlags Table(	
	tablename varchar(50),
	ColumnName varchar(10)
)

Insert Into @DeleteFlags
SELECT  t.name AS table_name, c.name AS column_name
FROM sys.tables AS t INNER JOIN sys.columns c ON t.OBJECT_ID = c.OBJECT_ID WHERE c.name LIKE 'DeleteFlag';

Declare @Query varchar(250)	,@tablename varchar(50)		,@update varchar(250);

While Exists(Select 1 From @DeleteFlags) Begin
	Select @Query = 'Alter table ['+tablename + '] ADD CONSTRAINT DF_'+replace(tablename,' ','')+'_DeleteFlag'+' DEFAULT 0 FOR DeleteFlag; ', @tablename = tablename From @DeleteFlags;
	Select @update = 'Update ['+@tablename +'] Set DeleteFlag = 0 Where DeleteFlag Is Null;'

	Exec (@update);
	If Not Exists (Select 1      from sys.all_columns c
      join sys.tables t on t.object_id = c.object_id
      join sys.schemas s on s.schema_id = t.schema_id
      join sys.default_constraints d on c.default_object_id = d.object_id
		where t.name = @tablename      And c.name = 'deleteflag')
      Begin
		--Print @Query
		Exec(@Query)
	 End
	
	Delete From @DeleteFlags where tablename = @tablename
	
End
End

GO
Execute Create_DefaultConstraints
Go
DROP PROCEDURE [dbo].[Create_DefaultConstraints]
Go