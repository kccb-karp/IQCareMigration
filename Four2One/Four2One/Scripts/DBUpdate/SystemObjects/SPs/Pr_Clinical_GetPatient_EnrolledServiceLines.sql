IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pr_Clinical_GetPatient_EnrolledServiceLines]') 
AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Pr_Clinical_GetPatient_EnrolledServiceLines]
GO

CREATE PROCEDURE [dbo].[Pr_Clinical_GetPatient_EnrolledServiceLines] 
	@PatientId int, 
	@LocationId int 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    declare @FieldList varchar(2000)
	Declare @ColumnList xml;
	-- Get all the identifiers from mst_patient:: need to move to their own tables
	Select @FieldList = Substring((Select ',' + Convert(varchar(Max), FieldName) + ''
			From dbo.mst_patientidentifier
			Order By Id
			For xml Path (''))
		, 2, 2000);	

	Declare @Columns Table(name varchar(50));
	Declare @PatientValues Table(Columnname varchar(50), ColumnValue varchar(50));
	Insert Into @Columns
		Select C.f.value('.', 'varchar(50)') ColumnName
		From (Select Convert(xml, '<Fields><field>' +
				Replace(@FieldList, ',', '</field><field>') + '</field></Fields>') ColumnList) F
		Cross Apply
			F.ColumnList.nodes('/Fields/field') As C (f);
	
	-- Get the patient dataset
	Set @ColumnList = (Select *
		From dbo.mst_Patient
		Where Ptn_Pk = @PatientID
		For xml Path ('patient'))
	
	-- Retrieve the patient identifiers
		
	Insert Into @PatientValues (
		Columnname,
		ColumnValue)
	Select	Columname = P.c.value('local-name(.)', 'varchar(50)'),
			ColumnValue = Nullif(P.c.value('(.)', 'varchar(50)'),'')
	From @ColumnList.nodes('/patient/*') As P (c);

	-- match column names with service lines identifiers

	Select 
		M.ModuleId, 
		P.PatientId,
		P.LocationId,
		P.ModuleName, 
		DisplayName,
		P.StartDate As EnrollmentDate,
		P.CareStatus,
		ExitReason,
		M.FieldID,
		M.FieldName, 
		M.FieldLabel IdentifierName, 
		PV.ColumnValue IdentifierValue 
	From 
	(
		Select	PS.ModuleId
			,	PS.Ptn_pk		As PatientId
			,	F.FacilityID	As LocationId
			,	M.ModuleName
			,	M. DisplayName
			,	PS.StartDate
			--, (Select 1 From dtl_PatientCareEnded C Where C.Ptn_Pk=@PatientId And C.TrackingId = TC.TrackingId And C.CareEnded
			,	Case When TC.CareEnded = 1 Then 'Care Ended'
					 Else 'Active'
				End				As CareStatus
			, TC.ExitReasonName ExitReason
		From mst_module As M
		Inner Join Lnk_PatientProgramStart As PS On PS.ModuleId = M.ModuleId
		Inner Join lnk_FacilityModule As F On F.ModuleID = PS.ModuleId
		Left Outer Join(
			Select Tc.TrackingID
				, TC.Ptn_Pk
				, TC.LocationId
				, TC.ModuleId
				, TC.DateLastContact
				, C.CareEnded
				, C.PatientExitReason ExitReasonId
				, (Select Name From mst_Decode D Where CodeId=23  And D.Id = C.PatientExitReason) ExitReasonName
				, C.CareEndedDate
				,CareEndedId
			From dtl_PatientCareEnded C 
				Inner Join	dtl_PatientTrackingCare As TC On TC.TrackingID = C.TrackingId 
			Where C.Ptn_Pk = TC.Ptn_Pk 

		 ) TC On TC.Ptn_Pk = PS.Ptn_pk		And TC.LocationId = F.FacilityID		And TC.ModuleId = PS.ModuleId
		Where (PS.Ptn_pk = @PatientID)
			And (F.FacilityID = @LocationID)
	)P
	Inner Join
	(Select	M.ModuleID ModuleId,		
			PMI.FieldID FieldId,
			MPI.FieldName,
			MPI.Label As FieldLabel			
	From
		dbo.mst_module As M 
	Inner Join
		dbo.lnk_PatientModuleIdentifier As PMI On M.ModuleId = PMI.ModuleID
	Inner Join
		dbo.mst_PatientIdentifier As MPI On MPI.ID = PMI.FieldID		
		) M On M.ModuleID = P.ModuleId 
	Inner Join
	 @PatientValues PV On PV.Columnname = M.FieldName Where PV.ColumnValue Is Not Null;

END


GO