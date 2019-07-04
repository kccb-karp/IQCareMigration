
/****** Object:  StoredProcedure [dbo].[pr_Clinical_ValidateCustomForm_Futures]    Script Date: 8/28/2018 3:09:26 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/*
Updated By	- Bhupendra Singh
Reference	- Bug ID 522
*/
ALTER PROCEDURE [dbo].[pr_Clinical_ValidateCustomForm_Futures] @FormName VARCHAR(50)
 ,@VisitDate VARCHAR(12)
 ,@PatientID VARCHAR(50)
,@ModuleId Varchar(7)
AS
BEGIN
 -- SET NOCOUNT ON added to prevent extra result sets from                                                      
 -- interfering with SELECT statements.                                                      
 SET NOCOUNT ON;

 --01 Insert statements for procedure here                                
 DECLARE @VisitTypeID VARCHAR(10)

 SELECT @VisitTypeID = VisitTypeID
 FROM mst_visittype
 WHERE VisitName = @FormName

 IF (@VisitDate = '01-01-1900')
 BEGIN
  --01
  DECLARE @Count INT

  SELECT @Count = Count(*)
  FROM ord_visit
  WHERE Ptn_pk = @PatientID
   --AND VisitType = @VisitTypeID
   AND cast(VisitType AS BIGINT) = isNumeric(@VisitTypeID)
   AND (
    DeleteFlag IS NULL
    OR DeleteFlag = 0
    )

  --04
  SELECT @Count [Count]

  IF @Count = 1
  BEGIN
   SELECT Visit_Id
    ,LocationID
   FROM ord_visit
   WHERE Ptn_pk = @PatientID
    AND VisitType = @VisitTypeID
    AND (
     DeleteFlag IS NULL
     OR DeleteFlag = 0
     )
  END
 END
 ELSE
 BEGIN
  SELECT Count(*) [Visit]
  FROM ord_visit
  WHERE Ptn_pk = @PatientID
   AND VisitDate = @VisitDate
   --AND VisitType = @VisitTypeID
   AND cast(VisitType AS BIGINT) = isNumeric(@VisitTypeID)
   AND (
    DeleteFlag IS NULL
    OR DeleteFlag = 0
    )

  --02  
  --DECLARE @ModuleID VARCHAR(5)

  --SELECT @ModuleID = ModuleID
  --FROM mst_feature
  --WHERE FeatureName = @FormName
  -- AND (
  --  DeleteFlag IS NULL
  --  OR DeleteFlag = 0
  --  )

  SELECT StartDate
  FROM Lnk_PatientProgramStart
  WHERE Ptn_pk = @PatientID
   AND ModuleId = @ModuleID
   --select * from Lnk_PatientProgramStart where Ptn_Pk = 5110  AND ModuleId = 203
   --select moduleID from mst_Feature where FeatureName = 'Pharmacy1' AND (DeleteFlag IS NULL OR DeleteFlag = 0)
   --select * from mst_visittype where VisitName = 'Pharmacy1'
   --select count(*) from ord_Visit where Ptn_Pk = 5110 and VisitType = 100001 AND (DeleteFlag IS NULL OR DeleteFlag = 0) and VisitDate = '01-01-1900'
 END
END

GO


