DECLARE @PersonID VARCHAR(10),
@PatientID VARCHAR(50),
@FirstName VARCHAR(100),
@LastName VARCHAR(100),
@MobileNumber VARCHAR(500)


Open symmetric key Key_CTC decryption by password='ttwbvXWpqb5WOLfLrBgisw=='
DECLARE @C as cursor
Set @C =  CURSOR FOR


select d.PersonId
, d.Id PatientID
, REPLACE(SUBSTRING(EmergContactName,0,CHARINDEX(' ',EmergContactName,0)),'''','') FirstName
, REPLACE(SUBSTRING(EmergContactName,CHARINDEX(' ',EmergContactName,0), LEN(EmergContactName)),'''','') LastName
, COALESCE(EmergContactPhone,'') PhoneNumber
from dtl_PatientContacts a LEFT JOIN mst_Decode b ON a.EmergContactRelation = b.ID AND b.CodeID = 8
LEFT JOIN mst_RelationshipType c ON a.EmergContactRelation = c.ID
INNER JOIN Patient d ON a.ptn_pk = d.ptn_pk
LEFT JOIN PatientTreatmentSupporter e ON d.PersonId = e.PersonId
WHERE e.PersonId IS NULL


OPEN @C

FETCH NEXT FROM @C INTO 
@PersonID,
@PatientID,
@FirstName,
@LastName,
@MobileNumber

WHILE @@FETCH_STATUS = 0
BEGIN


EXEC('
DECLARE @SupporterPersonID as INT;

INSERT INTO dbo.[Person]
			(FirstName
			, MidName
			, LastName
			, Sex
			, Active
			, DeleteFlag
			, CreateDate
			, CreatedBy
			, DateOfBirth
			, DobPrecision) 
		VALUES 
			(ENCRYPTBYKEY(KEY_GUID(''Key_CTC''),'''+@FirstName+''')
			, NULL
			, ENCRYPTBYKEY(KEY_GUID(''Key_CTC''),'''+@LastName+''')
			, 0
			, 1, 0, GETDATE(), 1
			, NULL
			, NULL);

SELECT @SupporterPersonID = IDENT_CURRENT(''Person'')

 INSERT INTO PatientTreatmentSupporter
			 ([PersonId]
			 , ContactCategory
			 , ContactRelationship
			 , [SupporterId]
			 , [MobileContact]
			 , [DeleteFlag]
			 , [CreatedBy]
			 , [CreateDate])
				 VALUES
			('+@PersonID+'
			, 0
			, 0
			, @SupporterPersonID
			, ENCRYPTBYKEY(KEY_GUID(''Key_CTC''),'''+@MobileNumber+''')
			,0
			,1
			,GETDATE());
			')

FETCH NEXT FROM @C INTO 
@PersonID,
@PatientID,
@FirstName,
@LastName,
@MobileNumber

END

CLOSE @C
DEALLOCATE @C

Close symmetric key Key_CTC