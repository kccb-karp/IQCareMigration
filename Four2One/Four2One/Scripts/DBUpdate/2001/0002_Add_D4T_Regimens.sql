if not exists(select * from LookupItem  where  [Name] = 'AF3A')
BEGIN
	insert into LookupItem(Name,DisplayName,DeleteFlag)
	values('AF3A','d4T + 3TC + NVP',0);

	insert into LookupMasterItem (LookupMasterId, LookupItemId, DisplayName, OrdRank)
	values
	(39
	, (select Id FROM LookupItem WHERE Name = 'AF3A')
	, (select DisplayName FROM LookupItem WHERE Name = 'AF3A')
	, 15);
END

IF NOT EXISTS 
	(SELECT * FROM LookupItem WHERE [Name] = 'AF3B')
BEGIN
	insert into LookupItem(Name,DisplayName,DeleteFlag)
	values('AF3B','d4T + 3TC + EFV',0);

	insert into LookupMasterItem (LookupMasterId, LookupItemId, DisplayName, OrdRank)
	values
	(39
	, (select Id FROM LookupItem WHERE Name = 'AF3B')
	, (select DisplayName FROM LookupItem WHERE Name = 'AF3B')
	, 16);
END

IF NOT EXISTS 
	(SELECT * FROM LookupItem WHERE [Name] = 'CF3A')
BEGIN
	insert into LookupItem(Name,DisplayName,DeleteFlag)
	values('CF3A','d4T + 3TC + NVP',0);

	insert into LookupMasterItem (LookupMasterId, LookupItemId, DisplayName, OrdRank)
	values
	(42
	, (select Id FROM LookupItem WHERE Name = 'CF3A')
	, (select DisplayName FROM LookupItem WHERE Name = 'CF3A')
	, 15);
END

IF NOT EXISTS 
	(SELECT * FROM LookupItem WHERE [Name] = 'CF3B')
BEGIN
	insert into LookupItem(Name,DisplayName,DeleteFlag)
	values('CF3B','d4T + 3TC + EFV',0);

	insert into LookupMasterItem (LookupMasterId, LookupItemId, DisplayName, OrdRank)
	values
	(42
	, (select Id FROM LookupItem WHERE Name = 'CF3B')
	, (select DisplayName FROM LookupItem WHERE Name = 'CF3B')
	, 16);
END