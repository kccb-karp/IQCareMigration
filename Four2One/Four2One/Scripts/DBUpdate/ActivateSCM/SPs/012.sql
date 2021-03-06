IF  EXISTS (SELECT * FROM sys.objects WHERE object_id 
= OBJECT_ID(N'[dbo].[pr_SCM_GetSelectedDrugDetails]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].pr_SCM_GetSelectedDrugDetails
GO


/****** Object:  StoredProcedure [dbo].[pr_SCM_GetSelectedDrugDetails]    Script Date: 8/14/2018 4:28:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[pr_SCM_GetSelectedDrugDetails]
  @Drug_id int
, @StoreID int
as
select top 1 a.Drug_Pk,a.DrugName, isnull(c.Name,'') [BatchNo], c.Id [BatchId], isnull(d.Name,'') [DispensingUnit],                

isnull(d.Id,0) [DispensingId], 

isnull(dbo.fn_GetSellingPrice_Futures(a.Drug_Pk,c.Id,c.ExpiryDate,@StoreId),0.00) [SellingPrice],

a.SellingUnitPrice[ConfigSellingPrice],

isnull(c.ExpiryDate,'') [ExpiryDate] ,                

dbo.fn_GetItemStock_Futures(a.Drug_Pk,c.Id,c.ExpiryDate,@StoreId) [AvailQty],

isnull(a.DispensingUnitPrice,0) [CostPrice],         

1 [Funded],                

isnull(a.DispensingMargin,0) [DispensingMargin], t.StrengthId,           

(convert(varchar,a.Drug_Pk)+'-'+convert(varchar,c.Id)+'-'+convert(varchar(11),isnull(c.ExpiryDate,''),113)) [DisplayItemId],           

dbo.fn_GetDrugTypeId_futures(a.Drug_Pk) [DrugTypeId],isnull(dbo.fn_Drug_Abbrev_Constella(a.Drug_Pk),'') [GenericAbb],

(convert(varchar,c.Name)+' ('+convert(varchar,dbo.fn_GetItemStock_Futures(a.Drug_Pk,c.Id,c.ExpiryDate,@StoreId)) +')') [BatchQty],

a.ItemInstructions, a.QtyUnitDisp,a.syrup, dbo.fn_GetFixedDoseDrugAbbrevation(a.Drug_Pk) as GenericAbbrevation,

a.MorDose, a.MidDose,a.EvenDose,a.NightDose                  

from dbo.Mst_Drug a             

Inner Join dbo.Lnk_DrugStrength s on s.DrugId = a.Drug_Pk              

Inner Join dbo.Mst_Strength t on t.StrengthId = s.StrengthId                   

Left Outer Join dbo.Mst_Batch c on a.Drug_pk = c.ItemID                  

Left Outer Join dbo.Mst_DispensingUnit d on a.DispensingUnit = d.Id

where a.Drug_pk=@Drug_id
