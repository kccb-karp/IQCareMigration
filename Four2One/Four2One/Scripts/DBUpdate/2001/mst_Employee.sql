truncate table mst_Employee;
insert into mst_Employee(FirstName, LastName, DesignationID, UserID, DeleteFlag, CreateDate)
select UserFirstName, UserLastName, (select ID from mst_Designation
where Name = 'Other') DesignationId 
, a.UserID
, 0
, getdate()
from mst_User a left join mst_employee b on a.UserID = b.UserID where a.DeleteFlag = 0
and b.EmployeeID is null
