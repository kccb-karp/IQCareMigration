

/****** Object:  StoredProcedure [dbo].[pr_Admin_SelectFeature_Constella]    Script Date: 8/29/2018 8:00:57 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dbo].[pr_Admin_SelectFeature_Constella]       
@SystemId int,        
@FacilityId int        
AS              
        
BEGIN           
        
declare @SQL varchar(2000)        
declare @SID varchar(100)       
declare @MID varchar(200)        
declare @sqlcode varchar(max)        
set @SID = convert(varchar,@SystemId) +',0'        
       
      
      
select * into #vwModuleId FROM      
(      
  SELECT ModuleId FROM mst_Facility a inner join lnk_FacilityModule b on  a.facilityid=b.facilityid and a.facilityid=@FacilityId)AS A      
INSERT INTO #vwModuleId(ModuleId) values('0')     


set @SQL = 'select FeatureID, FeatureName, UserID         
from mst_feature where ModuleId in (Select moduleid from #vwModuleId) and    
ReportFlag=1 and AdminFlag=0 and DeleteFlag = 0 and SystemId in ('+@SID+')        
order by FeatureName    
        
SELECT a.FeatureID, a.FeatureName, a.UserID              
FROM mst_Feature a where  a.ModuleId in (Select moduleid from #vwModuleId) and    
a.ReportFlag=0 and a.Adminflag = 0 and a.DeleteFlag = 0 and    
a.Published is null and a.SystemId in ('+@SID+')        
union    
SELECT a.FeatureID, a.FeatureName, a.UserID              
FROM mst_Feature a where  a.ModuleId in (Select moduleid from #vwModuleId) and    
a.Countryid in (select Currency from mst_facility where facilityId = '+convert(varchar,@FacilityId)+') and    
a.ReportFlag=0 and a.Adminflag = 0 and a.DeleteFlag = 0 and    
a.Published =2 and a.SystemId in ('+@SID+')    
union    
SELECT a.FeatureID, a.FeatureName, a.UserID              
FROM mst_Feature a where  a.ModuleId in (Select moduleid from #vwModuleId) and    
a.ReportFlag=0 and a.Adminflag = 0 and a.DeleteFlag = 0 and a.SystemId in ('+@SID+') and a.RegistrationFormFlag =1    
order by a.FeatureName             

        
Select FeatureID, FeatureName, UserID            
From mst_Feature where  ModuleId in (Select moduleid from #vwModuleId ) and    
AdminFlag=1 and DeleteFlag = 0 and SystemId in ('+@SID+')        
order by FeatureName'        
       
exec(@SQL)            
END

GO


