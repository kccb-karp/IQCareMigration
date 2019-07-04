IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_getPharmacyDrugList]') AND type in (N'P', N'PC'))
BEGIN
DROP PROCEDURE [dbo].sp_getPharmacyDrugList 
END

GO

CREATE PROCEDURE [dbo].[sp_getPharmacyDrugList]  
 @pmscm int = null,@tp varchar(10)=null   
AS  
BEGIN  
Set Nocount On;  
 DECLARE @drugTypeId int =0;  
 
 IF(@tp IN('ART','PMTCT','PEP','PREP','HBV','Hepatitis B'))  
  BEGIN  
    SET @drugTypeId=37  
  END  
  
 
 IF EXISTS(SELECT b.ModuleName 
 FROM lnk_facilityModule a 
 inner join mst_module b on a.ModuleID = b.ModuleID 
 WHERE b.ModuleName IN('PM/SCM','PM/SCM With Same point dispense'))  
  BEGIN   
    SET @pmscm=1;  
  END  
 ELSE  
   BEGIN SET @pmscm =0;  END  
   
 IF(@pmscm = 1)  
 BEGIN  
  
  IF(@drugTypeId=37)  
    BEGIN  
    SELECT  
     D.Drug_pk  
     ,CASE WHEN D.abbreviation IS NULL THEN D.DrugName  
     ELSE   
      CONCAT(D.DrugName,' (', D.abbreviation, ')')  
     END drugName       
      ,CONCAT(D.Drug_pk, '~',D.abbreviation, '~', D.DrugName)val   
    FROM Dtl_StockTransaction AS ST  
    INNER JOIN Mst_Store AS S  
     ON S.Id = ST.StoreId  
      AND S.DispensingStore = 1  
    RIGHT OUTER JOIN Mst_Drug AS D  
     ON D.Drug_pk = ST.ItemId  
    INNER JOIN lnk_DrugGeneric l  
     ON D.Drug_pk = l.Drug_pk  
    WHERE D.DeleteFlag = 0  
    AND ST.ExpiryDate > getdate()  
    GROUP BY D.Drug_pk  
      ,D.DrugName  
      ,D.abbreviation  
    HAVING SUM(ST.Quantity) > 0  
  
   END  
  ELSE  
   BEGIN   
   SELECT  
     D.Drug_pk  
     ,CASE WHEN D.abbreviation IS NULL THEN D.DrugName  
     ELSE   
      CONCAT(D.DrugName,' (', D.abbreviation, ')')  
     END drugName       
       ,CONCAT(D.Drug_pk, '~',D.abbreviation, '~', D.DrugName)val   
    FROM Dtl_StockTransaction AS ST  
    INNER JOIN Mst_Store AS S  
     ON S.Id = ST.StoreId  
      AND S.DispensingStore = 1  
    RIGHT OUTER JOIN Mst_Drug AS D  
     ON D.Drug_pk = ST.ItemId  
    INNER JOIN lnk_DrugGeneric l  
     ON D.Drug_pk = l.Drug_pk  
    WHERE D.DeleteFlag = 0 AND D.Drug_pk IN(SELECT x.Drug_pk FROM lnk_DrugGeneric x WHERE x.GenericID IN(SELECT k.GenericId FROM lnk_DrugTypeGeneric k WHERE k.DrugTypeId<>37))  
    AND ST.ExpiryDate > getdate()   
    GROUP BY D.Drug_pk  
      ,D.DrugName  
      ,D.abbreviation  
    HAVING SUM(ST.Quantity) > 0     
   END  
  
 END  
 ELSE  
  BEGIN  
  
   IF(@drugTypeId=37)  
   BEGIN  
    Select D.Drug_pk,   
     CASE WHEN D.abbreviation IS NULL THEN D.DrugName  
     ELSE   
      CONCAT(D.DrugName,' (', D.abbreviation, ')')  
     END drugName,       
     CONCAT(D.Drug_pk, '~',D.abbreviation, '~', D.DrugName)val   
    From Dtl_StockTransaction As ST Inner Join Mst_Store As S On S.Id = ST.StoreId And S.DispensingStore = 1  
    Right Outer Join Mst_Drug As D On D.Drug_pk = ST.ItemId   
        INNER JOIN lnk_DrugGeneric l  
      ON D.Drug_pk = l.Drug_pk  
     WHERE D.DeleteFlag = 0  
    Group By D.Drug_pk, D.DrugName, D.abbreviation  
   END  
   ELSE  
   BEGIN  
      Select D.Drug_pk, D.DrugName,CONCAT(D.Drug_pk, '~',D.abbreviation, '~', D.DrugName)val     
    From Dtl_StockTransaction As ST Inner Join Mst_Store As S On S.Id = ST.StoreId And S.DispensingStore = 1  
    Right Outer Join Mst_Drug As D On D.Drug_pk = ST.ItemId   
        INNER JOIN lnk_DrugGeneric l  
      ON D.Drug_pk = l.Drug_pk  
     INNER JOIN lnk_DrugTypeGeneric g  
      ON l.GenericID = g.GenericId  
     WHERE D.DeleteFlag = 0 
      AND g.DrugTypeId <> 37   
    Group By D.Drug_pk, D.DrugName, D.abbreviation  
   END  
  END  
  
End  