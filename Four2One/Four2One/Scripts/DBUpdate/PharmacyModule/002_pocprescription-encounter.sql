if not exists(select * from LookupItem where [Name] = 'pocprescription-encounter')
begin
INSERT INTO LookupItem
([Name], DisplayName, DeleteFlag)
VALUES
('pocprescription-encounter','Prescription', 0);

INSERT INTO LookupMasterItem (LookupMasterId, LookupItemId, DisplayName, OrdRank)
VALUES
(108
, (SELECT Id FROM LookupItem WHERE [Name] = 'pocprescription-encounter')
, 'pocprescription-encounter'
, 8)
end