if not exists(select * from mst_User where UserId = 4210)
begin
set identity_insert mst_User ON
Insert into mst_User (UserId, UserFirstName, UserLastName, UserName
, Password, DeleteFlag, OperatorID, CreateDate)
values
(4210, 'Four', 'TwoOne', 'four2One', 'Zu7BrcApEvdWiVLpjGpuhw==', 0, 1, GETDATE());
set identity_insert mst_User OFF
END