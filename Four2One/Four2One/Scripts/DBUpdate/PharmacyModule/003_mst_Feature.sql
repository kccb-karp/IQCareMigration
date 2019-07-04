declare @maxVal INT
select @maxVal = ISNULL(max(FeatureID),0)+1 from mst_Feature
dbcc checkident('mst_Feature', RESEED, @maxVal);

INSERT INTO [dbo].[mst_Feature]
           ([FeatureName]
           ,[ReportFlag]
           ,[DeleteFlag]
           ,[AdminFlag]
           ,[UserID]
           ,[CreateDate]
           ,[UpdateDate]
           ,[OptionalFlag]
           ,[SystemId]
           ,[Published]
           ,[CountryId]
           ,[ModuleId]
           )
     VALUES
           ('Pharmacy Module'
           ,0
           ,0
           ,0
           ,1
           ,getdate()
           ,null
           ,null
           ,0
           ,2
           ,161
           ,(select moduleid from mst_module where ModuleName = 'Pharmacy Module')
           );


