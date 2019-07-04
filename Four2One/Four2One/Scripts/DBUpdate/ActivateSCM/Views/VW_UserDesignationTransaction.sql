IF EXISTS (Select * from sys.views where name = N'VW_UserDesignationTransaction')
DROP VIEW [dbo].VW_UserDesignationTransaction
GO

CREATE VIEW [dbo].[VW_UserDesignationTransaction]
AS
SELECT dbo.mst_User.UserID
	,LTRIM(RTRIM(dbo.mst_User.UserLastName)) + ' ' + LTRIM(RTRIM(dbo.mst_User.UserFirstName)) AS UserName
	,dbo.mst_User.Email
	,LTRIM(RTRIM(dbo.mst_Designation.NAME)) AS Designation
	,dbo.mst_User.DeleteFlag 
FROM dbo.mst_Designation
INNER JOIN dbo.mst_User ON dbo.mst_Designation.Id = dbo.mst_User.Designation

GO