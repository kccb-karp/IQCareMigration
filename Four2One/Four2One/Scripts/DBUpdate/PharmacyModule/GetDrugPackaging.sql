CREATE proc sp_PharmacyModule_GetDrugPackaging (@ClinicalDrugId varchar(10))  
AS  
BEGIN  
select Id
, CASE WHEN LiquidCapacity  > 0 THEN CAST(LiquidCapacity as varchar(100)) + 'ml bottles' ELSE
CAST(UnitPackSize as varchar(100)) + 's' END AS UnitPackSize

from DrugPackaging WHERE ClinicalDrugId = @ClinicalDrugId  
END  
  