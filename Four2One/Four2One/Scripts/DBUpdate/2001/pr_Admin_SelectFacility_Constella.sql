  ALTER PROCEDURE [dbo].[pr_Admin_SelectFacility_Constella]                  
          
AS                  
        
begin          
        
   Select FacilityID  
  , PosID + ' - ' + FacilityName As DescriptiveName  
  , Image  
  , SystemId  
  , Preferred  
  , CountryID  
  , Isnull(AppGracePeriod,0) AppGracePeriod  
  , Currency  
  , SatelliteID  
  , PosID  
  , FacilityName  
  , Isnull(PaperLess,0) PaperLess  
  , Isnull(BackupDrive,'C:') BackupDrive  
  , BackupTime  
 From mst_Facility  
 Where (DeleteFlag = 0)  
 Order By PosID      
        
 Select Id  
  , AppVer  
  , DBVer  
  , RelDate  
  , VersionName  
 From AppAdmin       
        
end  
  