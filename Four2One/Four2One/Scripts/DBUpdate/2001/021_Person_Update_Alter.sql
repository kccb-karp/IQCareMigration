/****** Object:  StoredProcedure [dbo].[Person_Update]    Script Date: 2/4/2019 4:07:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[Person_Update]
 -- Add the parameters for the stored procedure here
 @FirstName varchar(100),
 @MidName varchar(100)= Null,
 @LastName varchar(100),
 @Sex int,
 @DateOfBirth datetime = NULL,
 --@NationalId varchar(100) = null,
 @Id int
AS
BEGIN
 -- SET NOCOUNT ON added to prevent extra result sets from
 -- interfering with SELECT statements.
 SET NOCOUNT ON;
 DECLARE @ptn_pk int, @Gender int, @Greencard_Sex varchar(10);

    -- Insert statements for procedure here
 UPDATE Person
 SET
  FirstName=ENCRYPTBYKEY(KEY_GUID('Key_CTC'),@FirstName),
  MidName=ENCRYPTBYKEY(KEY_GUID('Key_CTC'),@MidName),
  LastName=ENCRYPTBYKEY(KEY_GUID('Key_CTC'),@LastName),
  Sex=@Sex,
  DateOfBirth=@DateOfBirth
  --NationalId=ENCRYPTBYKEY(KEY_GUID('Key_CTC'),@NationalId)
 WHERE
   Id=@Id;

   IF EXISTS(SELECT * FROM Patient WHERE PersonId = @Id)
	BEGIN
		IF(@DateOfBirth is not null)
		BEGIN
			UPDATE [dbo].[Patient] SET DateOfBirth = @DateOfBirth WHERE PersonId=@Id;
		END;
	END;

   SET @Greencard_Sex = (select top 1 ItemName from LookupItemView where MasterName = 'Gender' and ItemId = @Sex);
   IF(@Greencard_Sex = 'Male')
		SET @Gender = 16
	ELSE
		SET @Gender = 17

	SET @ptn_pk = (select ptn_pk from Patient where PersonId = @Id);

	IF(@ptn_pk>0 AND @DateOfBirth is not null)
	BEGIN
		--Update bluecard with these details
	   UPDATE mst_Patient
	   SET
	   FirstName = ENCRYPTBYKEY(KEY_GUID('Key_CTC'),@FirstName),
	   MiddleName = ENCRYPTBYKEY(KEY_GUID('Key_CTC'),@MidName),
	   LastName = ENCRYPTBYKEY(KEY_GUID('Key_CTC'),@LastName),
	   DOB = @DateOfBirth,
	   Sex = @Gender
	   where Ptn_Pk = @ptn_pk;
	END
	
	IF(@ptn_pk>0)
	BEGIN
	--Update bluecard with these details
	   UPDATE mst_Patient
	   SET
	   FirstName = ENCRYPTBYKEY(KEY_GUID('Key_CTC'),@FirstName),
	   MiddleName = ENCRYPTBYKEY(KEY_GUID('Key_CTC'),@MidName),
	   LastName = ENCRYPTBYKEY(KEY_GUID('Key_CTC'),@LastName),
	   Sex = @Gender
	   where Ptn_Pk = @ptn_pk;
	END
END