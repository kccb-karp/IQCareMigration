If Not Exists (Select * From sys.columns Where Name = N'MovedToFamilyTestingTable' And Object_ID = Object_id(N'dtl_FamilyInfo'))    
Begin
  Alter table dbo.dtl_FamilyInfo Add MovedToFamilyTestingTable  bit not null Constraint DF_dtl_FamilyInfo_MovedToFamilyTestingTable Default 0
End
Go
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SET XACT_ABORT ON;

	exec pr_OpenDecryptedSession;
    -- Insert statements for procedure here
	DECLARE @Ptn_pk int, @RFirstName varbinary(max), @RLastName varbinary(max), @Sex int, @AgeYear int, @AgeMonth int, @RelationshipDate datetime, @RelationshipType int, @HivStatus int, @HivCareStatus int, @RegistrationNo int, @FileNo int, @ReferenceId int, @UserId int, @DeleteFlag int, @CreateDate datetime, @UpdateDate datetime, @message varchar(100), @DOB datetime, @StartDate datetime, @PersonId int, @PatientId int, @RelationshipTypeId int, @BaselineResult int, @HivStatusString varchar(20), @PatientMasterVisitId int, @VisitType int, @MovedToFamilyTestingTable bit, @FamilyInfoId int;

	DECLARE @i INT = 1;
	DECLARE @count INT;
	--Create Temporary Tables for storing data 
	CREATE TABLE #Tdtl_FamilyInfo 
	(
		Id INT IDENTITY(1,1), Ptn_pk int, RFirstName varbinary(max), RLastName varbinary(max), Sex int, AgeYear int, AgeMonth int, 
		RelationshipDate datetime, RelationshipType int, HivStatus int, HivCareStatus int, RegistrationNo varchar, FileNo varchar, 
		ReferenceId int, UserId int, DeleteFlag int, CreateDate datetime, UpdateDate datetime, StartDate datetime, MovedToFamilyTestingTable bit, FamilyInfoId int
	 ); 
	 --Insert data to temporary table #Tdtl_FamilyInfo 
	INSERT INTO #Tdtl_FamilyInfo(Ptn_pk, RFirstName, RLastName, Sex, AgeYear, AgeMonth, 
		RelationshipDate, RelationshipType, HivStatus, HivCareStatus, RegistrationNo, FileNo, 
		ReferenceId, UserId, DeleteFlag, CreateDate, UpdateDate, StartDate, MovedToFamilyTestingTable, FamilyInfoId) 
	
		SELECT dbo.dtl_FamilyInfo.Ptn_pk, RFirstName, RLastName, Sex, AgeYear, AgeMonth, RelationshipDate, RelationshipType, HivStatus, HivCareStatus, RegistrationNo, FileNo, ReferenceId, dbo.dtl_FamilyInfo.UserId, DeleteFlag, dbo.dtl_FamilyInfo.CreateDate, dbo.dtl_FamilyInfo.UpdateDate, dbo.Lnk_PatientProgramStart.StartDate, [dbo].[dtl_FamilyInfo].[MovedToFamilyTestingTable], dbo.dtl_FamilyInfo.Id
		FROM    dbo.dtl_FamilyInfo INNER JOIN dbo.Lnk_PatientProgramStart ON dbo.dtl_FamilyInfo.Ptn_pk = dbo.Lnk_PatientProgramStart.Ptn_pk
		WHERE dbo.Lnk_PatientProgramStart.ModuleId = 203 ;

	SELECT @count = COUNT(Id) FROM #Tdtl_FamilyInfo 
	WHILE (@i <= @count)
		BEGIN
			SELECT @ptn_pk = Ptn_pk, @RFirstName = RFirstName, @RLastName = RLastName, @Sex = Sex, @AgeYear = AgeYear, @AgeMonth = AgeMonth, 
					@RelationshipDate = RelationshipDate, @RelationshipType = RelationshipType, @HivStatus = HivStatus, @HivCareStatus = HivCareStatus, 
					@RegistrationNo = RegistrationNo, @FileNo = FileNo, @ReferenceId = ReferenceId, @UserId = UserId, @DeleteFlag = DeleteFlag, @CreateDate = CreateDate, 
					@UpdateDate = UpdateDate, @StartDate = StartDate, @MovedToFamilyTestingTable = MovedToFamilyTestingTable, @FamilyInfoId = FamilyInfoId FROM #Tdtl_FamilyInfo WHERE Id = @i;

			BEGIN TRY
				BEGIN TRANSACTION
					PRINT ' '  
					SELECT @message = '----- Family Testing: ' + CAST(@ptn_pk as varchar(50));
					PRINT @message;

					IF @Sex IS NOT NULL
						BEGIN
							IF ((select top 1  Name from mst_Decode where id = @Sex) = 'Male' OR (select top 1 Name from mst_Decode where id = @Sex) = 'Female')
								BEGIN
									SET @Sex = (SELECT TOP 1 ItemId FROM LookupItemView WHERE MasterName like '%gender%' and ItemName like + (select top 1  Name from mst_Decode where id = @Sex) + '%');
								END
							ELSE
								SET @Sex = (select top 1  ItemId from LookupItemView where MasterName = 'Unknown' and ItemName = 'Unknown');
						END
					ELSE
						SET @Sex = (select top 1  ItemId from LookupItemView where MasterName = 'Unknown' and ItemName = 'Unknown');

					DECLARE @SexName varchar(50);

					SET @SexName = (select top 1  ItemName from LookupItemView where ItemId = @Sex);

					BEGIN
						SET @DOB = DATEADD(year, -@AgeYear, @StartDate);
						SET @DOB = DATEADD(month, -@AgeMonth, @DOB);
					END;

					IF @CreateDate IS NULL
						BEGIN
							SET @CreateDate = @StartDate;
						END

					SET @PatientId = (select Id from Patient where ptn_pk = @Ptn_pk);

					IF @RelationshipType IS NOT NULL
						BEGIN
							DECLARE @RelationTypeName varchar(20);

							SET @RelationTypeName = (select top 1  Name from [dbo].[mst_RelationshipType] where id = @RelationshipType);
							SET @RelationshipTypeId = CASE
								WHEN @RelationTypeName = 'Parent' and @SexName = 'Male' THEN (select top 1  ItemId from LookupItemView where MasterName = 'Relationship' and ItemName = 'Father')
								WHEN @RelationTypeName = 'Parent' and @SexName = 'Female' THEN (select top 1  ItemId from LookupItemView where MasterName = 'Relationship' and ItemName = 'Mother')
								WHEN @RelationTypeName = 'Aunt/Uncle' THEN (select top 1  ItemId from LookupItemView where MasterName = 'Relationship' and ItemName = 'Other')
								WHEN @RelationTypeName = 'Brother/Sister' THEN (select top 1  ItemId from LookupItemView where MasterName = 'Relationship' and ItemName = 'Sibling')
								WHEN @RelationTypeName = 'Child' THEN (select top 1  ItemId from LookupItemView where MasterName = 'Relationship' and ItemName = 'Child')
								WHEN @RelationTypeName = 'Cousin' THEN (select top 1  ItemId from LookupItemView where MasterName = 'Relationship' and ItemName = 'Other')
								WHEN @RelationTypeName = 'GrandChild' THEN (select top 1  ItemId from LookupItemView where MasterName = 'Relationship' and ItemName = 'Other')
								WHEN @RelationTypeName = 'GrandParent' THEN (select top 1  ItemId from LookupItemView where MasterName = 'Relationship' and ItemName = 'Other')
								WHEN @RelationTypeName = 'Niece/Nephew' THEN (select top 1  ItemId from LookupItemView where MasterName = 'Relationship' and ItemName = 'Other')
								WHEN @RelationTypeName = 'Not Family' THEN (select top 1  ItemId from LookupItemView where MasterName = 'Relationship' and ItemName = 'Other')
								WHEN @RelationTypeName = 'Other' THEN (select top 1  ItemId from LookupItemView where MasterName = 'Relationship' and ItemName = 'Other')
								WHEN @RelationTypeName = 'Spouse/Partner' THEN (select top 1  ItemId from LookupItemView where MasterName = 'Relationship' and ItemName = 'Partner')
								ELSE (select top 1  ItemId from LookupItemView where MasterName = 'Relationship' and ItemName = 'Other')
							END
						END
					ELSE
						SET @RelationshipTypeId = (select top 1  ItemId from LookupItemView where MasterName = 'Relationship' and ItemName = 'Other');

					SET @HivStatusString = (SELECT TOP 1 Name FROM mst_Decode WHERE CodeID=10 AND ID=@HivStatus);

					SET @BaselineResult = CASE @HivStatusString  
							WHEN 'Positive' THEN (SELECT TOP 1 ItemId FROM LookupItemView WHERE MasterName ='BaseLineHivStatus' AND ItemName like '%Tested Positive%') 
							WHEN 'Negative' THEN (SELECT TOP 1 ItemId FROM LookupItemView WHERE MasterName ='BaseLineHivStatus' AND ItemName like '%Tested Negative%')   
							WHEN 'Unknown' THEN (SELECT TOP 1 ItemId FROM LookupItemView WHERE MasterName ='BaseLineHivStatus' AND ItemName = 'Never Tested')
							ELSE (SELECT TOP 1 ItemId FROM LookupItemView WHERE MasterName ='BaseLineHivStatus' AND ItemName = 'Never Tested')
						END

					SET @BaselineResult = CASE WHEN @BaselineResult IS NULL THEN (select TOP 1 ItemId from LookupItemView where MasterName = 'Unknown' and ItemName = 'Unknown') ELSE @BaselineResult END;

					SET @VisitType = (SELECT TOP 1 ItemId FROM LookupItemView WHERE MasterName ='VisitType' AND ItemName='Enrollment');

					SET @PatientMasterVisitId = (SELECT TOP 1 Id FROM PatientMasterVisit where VisitType = @VisitType and PatientId = @PatientId);


					IF @MovedToFamilyTestingTable = 1
						BEGIN
							SET @PersonId = (SELECT TOP 1 PersonId FROM PersonRelationship WHERE FamilyInfoId = @FamilyInfoId);

							SELECT @message = '----- Update Family Testing: ' + CAST(@PersonId as varchar(50));
							PRINT @message;

							SELECT @message = '----- Relationship Name: ' + CAST(@RelationTypeName as varchar(50));
							PRINT @message;

							SELECT @message = '----- Relationship Type: ' + CAST(@RelationshipTypeId as varchar(50));
							PRINT @message;

							SELECT @message = '----- PersonId: ' + CAST(@PersonId as varchar(50));
							PRINT @message;

							SELECT @message = '----- PatientId: ' + CAST(@PatientId as varchar(50));
							PRINT @message;

							SELECT @message = '----- BaselineResult: ' + CAST(@BaselineResult as varchar(50));
							PRINT @message;

							UPDATE Person SET FirstName = @RFirstName, LastName = @RLastName, Sex = @Sex, DateOfBirth = @DOB WHERE Id = @PersonId;

							UPDATE PersonRelationship SET RelationshipTypeId = @RelationshipTypeId, BaselineResult = @BaselineResult WHERE PersonId = @PersonId AND PatientId = @PatientId;
						END
					ELSE
						BEGIN
							SELECT @message = '----- adding new relationship';
							PRINT @message;

							DECLARE @r INT = 1;
							DECLARE @countr INT;

							CREATE TABLE #Tperson(
								Id INT IDENTITY(1,1), PersonId int
							);
							INSERT INTO #Tperson(PersonId)
							select T.PersonId from (SELECT TOP (100) PERCENT dbo.PersonRelationship.PersonId, dbo.PersonRelationship.RelationshipTypeId, dbo.PersonRelationship.PatientId, dbo.PersonRelationship.ID, dbo.dtl_FamilyInfo.Id AS FamilyInfoId, dbo.Patient.ptn_pk
							FROM  dbo.dtl_FamilyInfo INNER JOIN dbo.Patient ON dbo.dtl_FamilyInfo.Ptn_pk = dbo.Patient.ptn_pk RIGHT OUTER JOIN dbo.PersonRelationship ON dbo.Patient.Id = dbo.PersonRelationship.PatientId
							GROUP BY dbo.PersonRelationship.PersonId, dbo.PersonRelationship.RelationshipTypeId, dbo.Patient.Id, dbo.PersonRelationship.PatientId, dbo.PersonRelationship.ID, dbo.dtl_FamilyInfo.Id, dbo.Patient.ptn_pk
							HAVING        (dbo.PersonRelationship.PatientId IS NOT NULL)
							ORDER BY dbo.PersonRelationship.PatientId) as T
							where T.ptn_pk=@Ptn_pk and T.FamilyInfoId=@FamilyInfoId and T.PatientId=@PatientId;

							SELECT @countr = COUNT(Id) FROM #Tperson

							SELECT @message = '----- new guy: ' + CAST(@countr as varchar(50));
							PRINT @message;

							WHILE (@r <= @countr)
							BEGIN
								SELECT @message = '----- am in: ' + CAST(@r as varchar(50));
								PRINT @message;

								SELECT @PersonId = PersonId FROM #Tperson WHERE Id = @r;

								DECLARE @FamilyInfoId_ISNULL int;
								SELECT @FamilyInfoId_ISNULL = FamilyInfoId FROM PersonRelationship WHERE PersonId = @PersonId;

								IF EXISTS(SELECT ID FROM PersonRelationship WHERE PersonId = @PersonId) AND  @FamilyInfoId_ISNULL IS NULL
								BEGIN
									SELECT @message = '----- old personrelationship updated: ';
									PRINT @message;

									UPDATE PersonRelationship SET RelationshipTypeId = @RelationshipTypeId, BaselineResult = @BaselineResult, FamilyInfoId = @FamilyInfoId WHERE PersonId = @PersonId AND PatientId = @PatientId;								
								END
								SELECT @r = @r + 1
							END
							DROP TABLE #Tperson
							IF @r = 1
								BEGIN
									INSERT INTO Person(FirstName, MidName, LastName, Sex, DateOfBirth, DobPrecision, Active, DeleteFlag, CreateDate, CreatedBy)
									VALUES(@RFirstName, NULL, @RLastName, @Sex, @DOB, 1, 1, 0, @CreateDate, @UserId);

									SELECT @PersonId = SCOPE_IDENTITY();
									SELECT @message = 'Created Person Id: ' + CAST(@PersonId as varchar(50));
									PRINT @message;

									INSERT INTO [dbo].[PersonRelationship](PersonId, PatientId, RelationshipTypeId, BaselineResult, BaselineDate, DeleteFlag, CreatedBy, CreateDate, FamilyInfoId)
									VALUES(@PersonId, @PatientId, @RelationshipTypeId, @BaselineResult, @CreateDate, 0, @UserId, @CreateDate, @FamilyInfoId);

									SELECT @message = 'Created PersonRelationship Id: ' + CAST(SCOPE_IDENTITY() as varchar(50));
									PRINT @message;
								END
						
							IF  EXISTS(select plr.Id,plr.FamilyInfoId,dfi.Id as FamilyInfo,dfi.ReferenceId,dfi.DeleteFlag  from dtl_FamilyInfo dfi left join PersonRelationship plr on plr.FamilyInfoId=dfi.Id
							where dfi.ReferenceId is null and (dfi.DeleteFlag =0 or dfi.DeleteFlag is null)  and dfi.Id=@FamilyInfoId
							and plr.FamilyInfoId is null
							 
							)
							 BEGIN
							 INSERT INTO Person(FirstName, MidName, LastName, Sex, DateOfBirth, DobPrecision, Active, DeleteFlag, CreateDate, CreatedBy)
									VALUES(@RFirstName, NULL, @RLastName, @Sex, @DOB, 1, 1, 0, @CreateDate, @UserId);

									SELECT @PersonId = SCOPE_IDENTITY();
									SELECT @message = 'Created Person Id: ' + CAST(@PersonId as varchar(50));
									PRINT @message;

									INSERT INTO [dbo].[PersonRelationship](PersonId, PatientId, RelationshipTypeId, BaselineResult, BaselineDate, DeleteFlag, CreatedBy, CreateDate, FamilyInfoId)
									VALUES(@PersonId, @PatientId, @RelationshipTypeId, @BaselineResult, @CreateDate, 0, @UserId, @CreateDate, @FamilyInfoId);

									SELECT @message = 'Created PersonRelationship Id: ' + CAST(SCOPE_IDENTITY() as varchar(50));
									PRINT @message;
							END
							UPDATE dtl_FamilyInfo SET MovedToFamilyTestingTable = 1 WHERE Ptn_pk = @Ptn_pk AND Id = @FamilyInfoId;
						END
					--INSERT INTO HIVTesting(PersonId, PatientMasterVisitId, TestingDate, TestingResult, ReferredToCare, CCCNumber, EnrollmentId, DeleteFlag, CreatedBy, CreateDate, AuditData)
					--VALUES(@PersonId, @PatientMasterVisitId, NULL, 0, 0, NULL, 0, 0, @UserId, @CreateDate, NULL);

					--SELECT @message = 'Created HIVTesting Id: ' + CAST(SCOPE_IDENTITY() as varchar(50));
					--PRINT @message;

				COMMIT TRANSACTION

			END TRY
			BEGIN CATCH
			  ROLLBACK TRANSACTION
			END CATCH

			SELECT @i = @i + 1
		END
	--Now Drop Temporary Tables
	 DROP TABLE #Tdtl_FamilyInfo
	 UPDATE PersonRelationship SET FamilyInfoId = 0 WHERE FamilyInfoId IS NULL;
END