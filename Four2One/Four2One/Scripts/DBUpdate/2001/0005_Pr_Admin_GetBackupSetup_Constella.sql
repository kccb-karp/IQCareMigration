
/****** Object:  StoredProcedure [dbo].[Pr_Admin_GetBackupSetup_Constella]    Script Date: 1/22/2019 5:28:21 PM ******/
DROP PROCEDURE [dbo].[Pr_Admin_GetBackupSetup_Constella]
GO

/****** Object:  StoredProcedure [dbo].[Pr_Admin_GetBackupSetup_Constella]    Script Date: 1/22/2019 5:28:21 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[Pr_Admin_GetBackupSetup_Constella]

as

begin
   select top 1 BackupDrive,BackupTime from mst_Facility where DeleteFlag = 0
end


GO


