WITH AEs AS (
select 
 a.Ptn_Pk
, a.Visit_Id
, c.Name SE
, d.SymptomCategoryName
, cast(a.VisitDate as date) VisitDate
FROM ord_Visit a INNER JOIN 
dtl_PatientSymptoms b ON a.Visit_Id = b.Visit_pk
LEFT JOIN mst_Symptom c ON b.SymptomID = c.ID
LEFT JOIN mst_SymptomCategory d ON c.CategoryID = d.SymptomCategoryID
where 
d.SymptomCategoryName LIKE '%side%effect%'
and 
(a.DeleteFlag = 0 or a.DeleteFlag is null)
UNION
select a.Ptn_pk
, a.Visit_Pk
, b.Name 
, a.FieldName
, cast(c.VisitDate as date) VisitDate
FROM
dtl_Multiselect_line a
inner join mst_DeCode b on a.ValueID= b.Id
inner join ord_VIsit c on a.Visit_Pk = c.Visit_Id
where FieldName IN ('ShortTermEffects','LongTermEffects')
and (c.DeleteFlag = 0 or c.DeleteFlag is null))



, LookupItems AS 
(select ItemId, ItemName FROM LookupItemView 
where MasterName = 'adverseevents')

, CodedAEs AS (
Select a.Ptn_Pk
, a.Visit_Id
, a.VisitDate
, CASE a.SE 
	WHEN 'Anemia' THEN 'Anaemia/pancytopenia'
	WHEN 'Anaemia' THEN 'Anaemia/pancytopenia'
	WHEN 'Severe N&V' THEN 'Nausea/vomiting'
	WHEN 'Lipoatrophy/Lipodystrophy' THEN 'Fat changes/lipodystrophy/lipohypertrophy'
	WHEN 'Diarrhoea' THEN 'Diarrhoea'
	WHEN 'Insomnia' THEN 'Insomnia (lacking sleep at night)/sleep problems'
	WHEN 'Headache' THEN 'Headache'
	WHEN 'Rash' THEN 'Skin rash/hypersensitivity reaction'
	WHEN 'Suicide Attempt' THEN 'Suicide ideation (thoughts on ending the life)'
	WHEN 'Nausea' THEN 'Nausea/vomiting'
	WHEN 'Burning/Numb/Tingling' THEN 'Burning and tingling in limbs/ Paresthesia/painful neuropathy'
	WHEN 'Renal Insufficiency' THEN 'Renal failure/renal insufficiency'
	WHEN 'Abdominal pain' THEN 'Abdominal pain'
	WHEN 'Dizzy, anxiety, nightmare, depression' THEN 'Abnormal dreams or nightmares (Frightening or unpleasant dreams)'
	WHEN 'Renal Failure' THEN 'Renal failure/renal insufficiency'
	WHEN 'Fatigue' THEN 'Fatigue/tiredness/weakness'
	WHEN 'Fat changes' THEN 'Fat changes/lipodystrophy/lipohypertrophy'
	WHEN 'Nausea/Vomiting' THEN 'Nausea/vomiting'
	WHEN 'Lipoatrophy' THEN 'Fat changes/lipodystrophy/lipohypertrophy'
	WHEN 'Jaundice' THEN 'Jaundice'
	WHEN 'Peripheral Neuropathy' THEN 'Burning and tingling in limbs/ Paresthesia/painful neuropathy'
ELSE 'Other Specify' END AS SE
, a.SE OtherSpecify


FROM AEs a 

where a.SE NOT IN ('None','Not Documented','Cough'
,'Cryptococcal Meningitis'
,'Thrush - oral / vaginal'
,'Genital Ulcer Disease'
,'HIV Encephalopathy'
,'Kaposi''s Sarcoma'
,'Osephageal Candidiasis'
,'Pneumonia'
,'Ulcers - mouth or other'
,'Urethral Discharge'
,'Zoster'
,'Pneumo Cystis Pneumonia')
)


INSERT INTO AdverseEvent
SELECT c.Id PatientId 
, d.Id PatientMasterVisitId
, CASE WHEN a.SE = 'Other Specify' THEN a.OtherSpecify ELSE a.SE END AS EventName
, 'Not Documented' EventCause
, 518 Severity
, 'Other' [Action]
, 0
, d.CreatedBy
, d.CreateDate
, NULL AuditData
, b.ItemId AdverseEventId
FROM CodedAEs a
left join LookupItems b on a.SE = b.ItemName
inner join Patient c on a.Ptn_pk = c.ptn_pk
inner join PatientMasterVisit d on c.id = d.PatientId
and cast(a.visitdate as date) = cast(d.visitdate as date)
and d.VisitType = 0
LEFT JOIN AdverseEvent e ON d.Id = e.PatientMasterVisitId
WHERE e.Id IS NULL
