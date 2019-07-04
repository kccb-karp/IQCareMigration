


/****** Object:  StoredProcedure [dbo].[pr_Admin_GetModuleName_Futures]    Script Date: 8/31/2018 11:33:39 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dbo].[pr_Admin_GetModuleName_Futures]        
         
         
AS        
BEGIN        
         
 SET NOCOUNT ON;        
        
    -- Insert statements for procedure here        
 SELECT moduleid, modulename,displayname,CanEnroll from mst_module where deleteflag = 0 and status=2   
  
SELECT moduleid, modulename,displayname,CanEnroll from mst_module where deleteflag = 0        
END

GO


