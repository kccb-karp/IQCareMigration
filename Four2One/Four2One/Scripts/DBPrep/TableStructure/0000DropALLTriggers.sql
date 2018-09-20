declare @table as varchar(100)
declare @runCursor as cursor
set @runCursor = cursor for
---------------------------------------------
select t.name tableName
from  sys.triggers t
---------------------------------------------
open @runCursor

fetch next from @runCursor into @table
while @@fetch_status=0
begin
	EXEC('DROP TRIGGER dbo.['+@table+']; ')
fetch next from @runCursor into @table
end

close @runCursor
deallocate @runCursor