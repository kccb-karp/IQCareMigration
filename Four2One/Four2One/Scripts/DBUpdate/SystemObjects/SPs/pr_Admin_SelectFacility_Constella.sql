IF  EXISTS (SELECT * FROM sys.objects 
WHERE object_id = OBJECT_ID(N'[dbo].[pr_Admin_SelectFacility_Constella]') 
AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[pr_Admin_SelectFacility_Constella]
GO

CREATE PROCEDURE [dbo].[pr_Admin_SelectFacility_Constella]                
        
AS                
      
begin        
      
	  Select	FacilityID
		,	CountryID + '-' + PosID + '-' + SatelliteID + ' - ' + FacilityName	As DescriptiveName
		,	Image
		,	SystemId
		,	Preferred
		,	CountryID
		,	Isnull(AppGracePeriod,0) AppGracePeriod
		,	Currency
		,	SatelliteID
		,	PosID
		,	FacilityName
		,	Isnull(PaperLess,0) PaperLess
		,	Isnull(BackupDrive,'C:') BackupDrive
		,	BackupTime
	From mst_Facility
	Where (DeleteFlag = 0)
	Order By CountryID, PosID, SatelliteID    
      
	Select	Id
		,	AppVer
		,	DBVer
		,	RelDate
		,	VersionName
	From AppAdmin     
      
end

GO