
declare @table as varchar(max)
declare @runCursor as cursor
set @runCursor = cursor for
---------------------------------------------
SELECT  'DROP INDEX [' + ix.name + '] ON [' + OBJECT_NAME(ID) + ']; ' qry
FROM  sysindexes ix inner join sys.indexes i on ix.id = i.object_id
WHERE   ix.Name IS NOT null 
and (ix.Name like 'dta_%' or ix.Name like 'IX_%' or ix.Name like 'NC_%')
and i.is_unique = 0
and OBJECT_NAME(ID) NOT LIKE 'sys%'
---------------------------------------------
open @runCursor

fetch next from @runCursor into @table
while @@fetch_status=0
begin
	EXEC(@table)
fetch next from @runCursor into @table
end

close @runCursor
deallocate @runCursor