if not exists(select * from LookupItem where [Name] = 'careend-encounter')
begin
INSERT INTO LookupItem
([Name], DisplayName, DeleteFlag)
VALUES
('careend-encounter','Care End', 0);

INSERT INTO LookupMasterItem (LookupMasterId, LookupItemId, DisplayName, OrdRank)
VALUES
(108
, (SELECT Id FROM LookupItem WHERE [Name] = 'careend-encounter')
, 'careend-encounter'
, 8)
end