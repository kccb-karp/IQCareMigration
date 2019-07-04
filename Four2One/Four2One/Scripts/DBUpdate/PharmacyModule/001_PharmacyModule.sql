if not exists (Select * from mst_module where ModuleID = 50)
begin
set identity_insert mst_module on
insert into mst_module 
(ModuleID
, ModuleName
, DeleteFlag
, UserId
, CreateDate
, Status
, UpdateFlag
, Identifier
, PharmacyFlag
, CanEnroll
, ModuleFlag
, DisplayName)
VALUES
(50
, 'Pharmacy Module'
, 0
, 1
, GETDATE()
, 2
, 0
, NULL
, 0
, 0
, 1
, 'Pharmacy Module')

set identity_insert mst_module off


insert into lnk_FacilityModule (FacilityID, ModuleID, UserID, CreateDate)
values
((select top 1 FacilityID FROM mst_Facility Where DeleteFlag = 0)
, 50, 1, GETDATE());

end

update mst_module set CanEnroll = 1 where moduleid = 50
update mst_module set ModuleName = 'Pharmacy Module' WHERE ModuleID = 50

