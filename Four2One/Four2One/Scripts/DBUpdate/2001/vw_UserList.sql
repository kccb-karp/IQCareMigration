ALTER VIEW [dbo].[vw_UserList]  
AS  
SELECT        U.UserID AS UserId
, U.UserName AS SystemUserName
, U.UserFirstName + ' ' + U.UserLastName AS Name
, E.FirstName + ' ' + E.LastName AS EmployeeName
, ISNULL(U.DeleteFlag, 0) AS UserDeleteFlag
, E.EmployeeID AS EmployeeId
, E.DesignationID AS DesignationId,  
                             (SELECT        TOP (1) Name  
                               FROM            dbo.mst_Designation AS D  
                               WHERE        (Id = E.DesignationID)) AS Designation
, ISNULL(E.DeleteFlag, 0) AS EmployeeDeleteFlag  
FROM            dbo.mst_User AS U LEFT OUTER JOIN  
                         dbo.mst_Employee AS E ON U.UserID = E.UserID  
WHERE U.DeleteFlag = 0 AND E.DeleteFlag = 0
						 
  