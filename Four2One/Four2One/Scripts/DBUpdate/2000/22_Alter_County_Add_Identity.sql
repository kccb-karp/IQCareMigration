SET XACT_ABORT ON;
GO

IF NOT EXISTS(select a.name as TableName, b.name as IdentityColumn from sysobjects a inner join syscolumns b on a.id = b.id where columnproperty(a.id, b.name, 'isIdentity') = 1 and objectproperty(a.id, 'isTable') = 1 and a.name = 'County')
BEGIN TRANSACTION;
	-- Batch 0
	BEGIN TRY
		ALTER TABLE [dbo].[County] ADD id_temp int NULL;
	END TRY
	BEGIN CATCH
		PRINT 'Error Number: ' + str(error_number()) ;
	  PRINT 'Line Number: ' + str(error_line());
	  PRINT error_message();
		ROLLBACK TRANSACTION;
	END CATCH;
	GO

	-- Batch 1
	BEGIN TRY
		-- Rollback transaction if error occurred
		IF (XACT_STATE()) = -1
		BEGIN
			RAISERROR('The transaction is in an uncommittable state. Rolling back transaction.', 18, 3);
		END;

		-- Do not continue if the transaction was rolled back
		IF (XACT_STATE()) = 0
		BEGIN
			RAISERROR('The transaction was rolled back.', 18, 1);
		END;

		UPDATE [dbo].[County] SET id_temp=Id;

	END TRY
	BEGIN CATCH
	  PRINT 'Error Number: ' + str(error_number()) ;
	  PRINT 'Line Number: ' + str(error_line());
	  PRINT error_message();
	  IF (XACT_STATE()) <> 0
	  BEGIN
		PRINT 'Rolling Back Transaction...';
		ROLLBACK TRANSACTION;
	  END;
	END CATCH;
	GO

	-- Batch 2
	BEGIN TRY

		-- Rollback transaction if error occurred
		IF (XACT_STATE()) = -1
		BEGIN
			RAISERROR('The transaction is in an uncommittable state. Rolling back transaction.', 18, 3);
		END;

		-- Do not continue if the transaction was rolled back
		IF (XACT_STATE()) = 0
		BEGIN
			RAISERROR('The transaction was rolled back.', 18, 1);
		END;

		ALTER TABLE [dbo].[County] DROP CONSTRAINT [PK_County_Id];
		ALTER TABLE [dbo].[County] DROP COLUMN Id;

		ALTER TABLE [dbo].[County] ADD Id int IDENTITY(1, 1) NOT NULL;
		ALTER TABLE [dbo].[County] ADD CONSTRAINT PK_County_Id PRIMARY KEY CLUSTERED (Id);

		SET IDENTITY_INSERT [dbo].[County] ON;
		DELETE FROM [dbo].[County]
		OUTPUT deleted.id_temp AS Id, deleted.CountyId, deleted.CountyName, deleted.SubcountyId, deleted.Subcountyname, deleted.WardId, deleted.WardName
		INTO [dbo].[County] (Id, CountyId, CountyName, SubcountyId, Subcountyname, WardId, WardName);

		SET IDENTITY_INSERT [dbo].[County] OFF;

		ALTER TABLE [dbo].[County] DROP COLUMN id_temp;


		DECLARE @maxid int;
		SELECT @maxid=MAX(Id) FROM [dbo].[County];
		DBCC CHECKIDENT ("dbo.County", RESEED, @maxid)

		select * from [dbo].[County];

	END TRY
	BEGIN CATCH
	  PRINT 'Error Number: ' + str(error_number()) ;
	  PRINT 'Line Number: ' + str(error_line());
	  PRINT error_message();
	  IF (XACT_STATE()) <> 0
	  BEGIN
		PRINT 'Rolling Back Transaction...';
		ROLLBACK TRANSACTION;
	  END;
	END CATCH;
	GO

	-- Commit transaction
	IF XACT_STATE() = 1
	BEGIN
	  COMMIT TRANSACTION;
	  PRINT 'Transaction committed.';
	END;
