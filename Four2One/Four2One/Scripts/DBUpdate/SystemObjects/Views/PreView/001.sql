IF  EXISTS (SELECT * FROM sys.objects 
WHERE object_id = OBJECT_ID(N'[dbo].[GetLookupName]') 
AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[GetLookupName]
GO


Create FUNCTION [dbo].[GetLookupName]
(
	@CodeID int,
	@TableName varchar(30)
)
RETURNS varchar(max)
AS
BEGIN
	Declare @ResultVar as varchar(max)
	Select @ResultVar =  
	Case @TableName
		When 'mst_DeCode'			Then	(Select Top 1 Name From mst_Code Where CodeID = @CodeId)
		When 'Mst_PMTCTDeCode'		Then	(Select Top 1 Name From mst_pmtctCode Where CodeID = @CodeId) 
		When 'Mst_ModDeCode'		Then	(Select Top 1 Name From mst_ModCode Where CodeID = @CodeId) 
		When 'Mst_BlueDecode'		Then	(Select Top 1 Name From mst_BlueCode Where CodeID = @CodeId)  
		 
	End
	Return @ResultVar

End
GO


IF  EXISTS (SELECT * FROM sys.objects 
WHERE object_id = OBJECT_ID(N'[dbo].[GetLookupValues]') 
AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[GetLookupValues]
GO

CREATE FUNCTION [dbo].[GetLookupValues]
(
	@CodeID int,
	@TableName varchar(30),
	@SystemId int = 1
)
RETURNS varchar(max)
AS
BEGIN
	Declare @ResultVar as varchar(max)
	Select @ResultVar =  
	Case @TableName
		When 'mst_DeCode'		Then	Stuff( (  Select ';'+ Name From dbo.mst_DeCode t2 Where t2.CodeID=@CodeID And t2.DeleteFlag= 0 order by  t2.SRNo For XML Path('')  ),1,1,'') 
		When 'Mst_PMTCTDeCode'  Then	Stuff( (  Select ';'+ Name From dbo.Mst_PMTCTDeCode t2 Where t2.CodeID=@CodeID And t2.DeleteFlag= 0 order by  t2.SRNo  For XML Path('')  ),1,1,'') 
		When 'Mst_YesNo'		Then    Stuff( (  Select ';'+  Name From dbo.Mst_YesNo t2 Where t2.DeleteFlag= 0 For XML Path('')  ),1,1,'') 
		When 'Mst_ModDeCode'	Then    Stuff( (  Select ';'+ Name From dbo.Mst_ModDeCode t2 Where t2.CodeID=@CodeID And t2.DeleteFlag= 0 order by t2.SRNo  For XML Path('')  ),1,1,'') 
		When 'Mst_BlueDecode'	Then	Stuff( (  Select ';'+ Name From dbo.Mst_BlueDecode t2 Where t2.CodeID=@CodeID And t2.DeleteFlag= 0 order by  t2.SRNo  For XML Path('')  ),1,1,'') 		
		When 'Mst_Employee'	Then	Stuff( (  Select ';'+ t2.FirstName + ' '+ t2.LastName From dbo.mst_Employee t2 Where t2.DeleteFlag= 0 order by  t2.SRNo  For XML Path('')  ),1,1,'') 
		when 'Mst_ARVSideEffects'Then	Stuff( (  Select ';'+ t2.Name From dbo.Mst_ARVSideEffects t2  Where t2.DeleteFlag= 0 order by  t2.SRNo For XML Path('')  ),1,1,'') 
		when 'mst_LostFollowReason'Then	Stuff( (  Select ';'+ t2.Name From dbo.mst_LostFollowReason t2  Where t2.DeleteFlag= 0 order by  t2.SRNo For XML Path('')  ),1,1,'') 
		when 'Mst_HIVDisease'Then	Stuff( (  Select ';'+ t2.Name From dbo.Mst_HIVDisease t2  Where t2.DeleteFlag= 0 order by  t2.SRNo For XML Path('')  ),1,1,'') 
		when 'Mst_Education'Then	Stuff( (  Select ';'+ t2.Name From dbo.Mst_Education t2  Where t2.DeleteFlag= 0 order by  t2.SRNo For XML Path('')  ),1,1,'') 
		when 'Mst_LPTF'Then	Stuff( (  Select ';'+ t2.Name From dbo.Mst_LPTF t2  Where t2.DeleteFlag= 0 order by  t2.SRNo For XML Path('')  ),1,1,'') 
		when 'mst_Symptom'Then	Stuff( (  Select ';'+ t2.Name From dbo.mst_Symptom t2  Where t2.DeleteFlag= 0 order by  t2.SRNo For XML Path('')  ),1,1,'') 
		when 'mst_Reason'Then	Stuff( (  Select ';'+ t2.Name From dbo.mst_Reason t2  Where t2.DeleteFlag= 0 order by  t2.SRNo For XML Path('')  ),1,1,'') 
	End
	Return @ResultVar
End
GO