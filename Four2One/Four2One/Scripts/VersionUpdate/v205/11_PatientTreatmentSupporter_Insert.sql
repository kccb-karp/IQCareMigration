
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id 
= OBJECT_ID(N'[dbo].[PatientTreatmentSupporter_Insert]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[PatientTreatmentSupporter_Insert]
GO

CREATE PROCEDURE [dbo].[PatientTreatmentSupporter_Insert] 
 -- Add the parameters for the stored procedure here
 @PersonId int, 
 @SupporterId int,
 @MobileContact varbinary(max),
 @CreatedBy int
AS
BEGIN
 -- SET NOCOUNT ON added to prevent extra result sets from
 -- interfering with SELECT statements.
 SET NOCOUNT ON;

 IF @MobileContact IS NULL
  SET @MobileContact = NULL;
 ELSE
  SET @MobileContact = ENCRYPTBYKEY(KEY_GUID('Key_CTC'),@MobileContact);

    -- Insert statements for procedure here
 INSERT INTO PatientTreatmentSupporter([PersonId]
 , [SupporterId]
 , ContactCategory
 , ContactRelationship
 , [MobileContact]
 , [DeleteFlag]
 , [CreatedBy]
 , [CreateDate])
 VALUES(@PersonId
 , @SupporterId
 , 0
 , 0
 , @MobileContact
 , 0
 , @CreatedBy
 , GETDATE());

 SELECT SCOPE_IDENTITY() Id;
END
GO