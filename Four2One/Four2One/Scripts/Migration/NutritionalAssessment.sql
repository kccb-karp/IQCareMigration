with nutrition as (select a.ptn_pk
, cast(b.visitdate as date) VisitDate
, CASE NutritionalProblem WHEN 939 THEN 'Normal'
WHEN 936 THEN 'Severe Acute Malnutrition'
WHEN 937 THEN 'Moderate Acute Malnutrition'
WHEN 941 THEN 'Overweight' ELSE NULL END AS Assessment
from dtl_patientCounseling a
inner join ord_visit b on a.visit_pk = b.visit_id
where a.NutritionalProblem > 0)

insert into PatientScreening

select distinct c.Id PatientId
, d.Id PatientMasterVisitId
, (select Id from LookupMaster where Name = 'NutritionStatus') ScreeningTypeId
, 1 ScreeningDone
, a.VisitDate ScreeningDate
, NULL ScreeningCategoryId
, CASE a.Assessment 
	WHEN 'Normal' 
	THEN (SELECT LookupItemId FROM LookupMasterItem WHERE DisplayName = 'Normal' 
	AND LookupMasterId = (select Id from LookupMaster where Name = 'NutritionStatus'))
	WHEN 'Moderate Acute Malnutrition' 
	THEN (SELECT LookupItemId FROM LookupMasterItem WHERE DisplayName = 'Moderate Acute Malnutrition' 
	AND LookupMasterId = (select Id from LookupMaster where Name = 'NutritionStatus'))
	WHEN 'Severe Acute Malnutrition' 
	THEN (SELECT LookupItemId FROM LookupMasterItem WHERE DisplayName = 'Severe Acute Malnutrition' 
	AND LookupMasterId = (select Id from LookupMaster where Name = 'NutritionStatus'))
	WHEN 'Overweight' 
	THEN (SELECT LookupItemId FROM LookupMasterItem WHERE DisplayName = 'Overweight/Obese' 
	AND LookupMasterId = (select Id from LookupMaster where Name = 'NutritionStatus'))
	ELSE NULL END AS ScreeningValueId
, NULL Comment
, 0 Active
, 0 DeleteFlag
, d.CreatedBy
, d.CreateDate
, NULL AuditData
, NULL VisitDate
 from nutrition a
inner join Patient c on a.Ptn_pk = c.ptn_pk
inner join PatientMasterVisit d on c.id = d.PatientId
	and cast(a.visitdate as date) = cast(d.visitdate as date)
	and d.VisitType = 0
left join PatientScreening e ON d.Id = e.PatientMasterVisitId 
	and e.ScreeningTypeId = (select Id from LookupMaster where Name = 'NutritionStatus')
where e.PatientMasterVisitId IS NULL
