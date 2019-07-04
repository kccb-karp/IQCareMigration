with patientscreened as(select pas.Ptn_pk,pas.Visit_Id,v.VisitDate,pas.CreatedDate,v.VisitType,vt.VisitName from dtl_PatientAlcoholDepressionScreening pas
inner join ord_Visit v on v.Visit_Id=pas.Visit_Id
inner join mst_VisitType vt on vt.VisitTypeID=v.VisitType
),



PatientScreeningVisit  as( select  b.Id as PatientId,a.Ptn_pk,a.Visit_Id,c.Id as PatientMasterVisitId,c.VisitDate,a.CreatedDate   from
  patientscreened a
  inner join Patient b on a.Ptn_pk = b.ptn_pk
inner join PatientMasterVisit c on b.id = c.PatientId
and cast(a.visitdate as date) = cast(c.visitdate as date)
and c.VisitType = 0
  ),

 
  



LookupCage as (
select '1' as ItemTypeId ,(select ItemId from LookupItemView  where MasterName='DrinkAlcohol' and ItemName='Never') as ItemId,(select 'CageAidAlcohol') as ItemType
union
select '2' as ItemTypeId ,(select ItemId from LookupItemView  where MasterName='DrinkAlcohol' and ItemName='Monthly') as ItemId,(select 'CageAidAlcohol')  as itemType
union
select '3' as ItemTypeId , (select ItemId from LookupItemView  where MasterName='DrinkAlcohol' and ItemName='TwoTimesaMonth') as ItemId,(select 'CageAidAlcohol') as itemType
union 
select '4' as ItemTypeId ,(select ItemId from LookupItemView  where MasterName='DrinkAlcohol' and ItemName='TwoTimesaWeek') as ItemId,(select 'CageAidAlcohol') as itemType
union
select '5' as ItemTypeId  , (SELECT ItemId FROM LookupItemView WHERE MasterName='DrinkAlcohol' and ItemName='FourorMore') as ItemId,(select 'CageAidAlcohol') as itemType
union
select '1' as ItemTypeId ,(select  ItemId from LookupItemView  where MasterName='Smoke' and ItemName='NeverSmoked') as ItemId,(select 'CageAIDSmoke ') as ItemType
union
select '2' as ItemTypeId ,(select ItemId from LookupItemView  where MasterName='Smoke' and ItemName='FormerSmoker') as ItemId,(select 'CageAIDSmoke ')  as itemType
union
select '3' as ItemTypeId , (select ItemId from LookupItemView  where MasterName='Smoke' and ItemName='CurrentSmoker') as ItemId,(select 'CageAIDSmoke ') as itemType
union 
select '4' as ItemTypeId ,(select ItemId from LookupItemView  where MasterName='Smoke' and ItemName='LightSmoker') as ItemId,(select 'CageAIDSmoke ') as itemType
union
select '5' as ItemTypeId  , (SELECT ItemId FROM LookupItemView WHERE MasterName='Smoke' and ItemName='HeavySmoker') as ItemId,(select 'CageAIDSmoke' ) as itemType
union
select '6' as ItemTypeId,(SELECT ItemId FROM LookupItemView WHERE MasterName='Smoke' and ItemName='Smoker') as ItemId,(select 'CageAIDSmoke' ) as itemType
union

select '1' as ItemTypeId ,(select ItemId from LookupItemView  where MasterName='UseDrugs' and ItemName='Never') as ItemId,(select 'CageAIDDrugs ') as ItemType
union
select '2' as ItemTypeId ,(select ItemId from LookupItemView  where MasterName='UseDrugs' and ItemName='Monthly') as ItemId,(select 'CageAIDDrugs ')  as itemType
union
select '3' as ItemTypeId , (select ItemId from LookupItemView  where MasterName='UseDrugs' and ItemName='TwoTimesaMonth') as ItemId,(select 'CageAIDDrugs ') as itemType
union 
select '4' as ItemTypeId ,(select ItemId from LookupItemView  where MasterName='UseDrugs' and ItemName='TwoTimesaWeek') as ItemId,(select 'CageAIDDrugs ') as itemType
union
select '5' as ItemTypeId  , (SELECT ItemId FROM LookupItemView WHERE MasterName='UseDrugs' and ItemName='FourorMore') as ItemId,(select 'CageAIDDrugs ') as itemType

),

 PatientDepressionScreening as (
Select psv.PatientId,psv.PatientMasterVisitId, (select liv.MasterId  from LookupItemView liv where  liv.ItemName='DSQuestion1') as ScreeningTypeId,1 as ScreeningDone,psv.VisitDate as ScreeningDate,(select liv.ItemId from LookupItemView liv where  liv.ItemName='DSQuestion1') as ScreeningCategoryId,
CASE WHEN pas.IsFeelingDown=0 then (select ltv.ItemId from LookupItemView ltv where ltv.ItemName='No'  and ltv.MasterName='GeneralYesNo') 
 WHEN pas.IsFeelingDown=1 then (select ltv.ItemId from LookupItemView ltv where ltv.ItemName='Yes'  and ltv.MasterName='GeneralYesNo') end as ScreeningValueid
  ,Comment = null,Active=0,DeleteFlag=0,CreatedBy=1,CreateDate=psv.CreatedDate,psv.VisitDate
 from PatientScreeningVisit psv  inner join dtl_PatientAlcoholDepressionScreening pas
on  pas.Ptn_pk=psv.Ptn_pk and pas.Visit_Id=psv.Visit_Id 
where  pas.IsFeelingDown is not null
union
Select psv.PatientId,psv.PatientMasterVisitId, (select  liv.MasterId  from LookupItemView liv where liv.ItemName='DSQuestion2') as ScreeningTypeId,1 as ScreeningDone,psv.VisitDate as ScreeningDate,(select  liv.ItemId from LookupItemView liv where liv.ItemName='DSQuestion2'),
CASE WHEN pas.IsLittleInterest=0 then (select ltv.ItemId from LookupItemView ltv where ltv.ItemName='No'  and ltv.MasterName='GeneralYesNo') 
 WHEN pas.IsLittleInterest=1 then (select ltv.ItemId from LookupItemView ltv where ltv.ItemName='Yes'  and ltv.MasterName='GeneralYesNo') end as ScreeningValueid
  ,Comment = null,Active=0,DeleteFlag=0,CreatedBy=1,CreateDate=psv.CreatedDate,psv.VisitDate
 from PatientScreeningVisit psv inner join dtl_PatientAlcoholDepressionScreening pas
on pas.Ptn_pk=psv.Ptn_pk and pas.Visit_Id=psv.Visit_Id 
where pas.IsLittleInterest is not null
union
Select psv.PatientId,psv.PatientMasterVisitId, (select Id from  LookupMaster  where  Name= 'DepressionScreeningQuestions') as ScreeningTypeId,1 as ScreeningDone,psv.VisitDate as ScreeningDate, (select liv.ItemId from LookupItemView liv where liv.ItemName='PHQ9Question1') as ScreeningCategoryId,
CASE WHEN pas.PHQLittleInterest='0' then  (select ItemId from LookupItemView where MasterName='DepressionFrequency' and ItemName='NotatAll')
when pas.PHQLittleInterest='1' then (select ItemId from LookupItemView where MasterName='DepressionFrequency' and ItemName='SeveralDays')
when pas.PHQLittleInterest='2' then (select ItemId from LookupItemView where MasterName='DepressionFrequency' and ItemName='Morethanhalfthedays')
when pas.PHQLittleInterest='3' then (select ItemId from LookupItemView where MasterName='DepressionFrequency' and ItemName='NearlyEveryDay')
 end as ScreeningValueid
  ,Comment = null,Active=0,DeleteFlag=0,CreatedBy=1,CreateDate=psv.CreatedDate,psv.VisitDate
 from PatientScreeningVisit psv inner join dtl_PatientAlcoholDepressionScreening pas
on pas.Ptn_pk=psv.Ptn_pk and pas.Visit_Id=psv.Visit_Id 
where pas.PHQLittleInterest is not null
union
 Select psv.PatientId,psv.PatientMasterVisitId, (select Id from  LookupMaster  where  Name= 'DepressionScreeningQuestions') as ScreeningTypeId,1 as ScreeningDone,psv.VisitDate as ScreeningDate, (select liv.ItemId  from LookupItemView liv where liv.ItemName='PHQ9Questions2' )as ScreeningCategoryId,
CASE WHEN pas.PHQFeelingDown='0' then  (select ItemId from LookupItemView where MasterName='DepressionFrequency' and ItemName='NotatAll')
when pas.PHQFeelingDown='1' then (select ItemId from LookupItemView where MasterName='DepressionFrequency' and ItemName='SeveralDays')
when pas.PHQFeelingDown='2' then (select ItemId from LookupItemView where MasterName='DepressionFrequency' and ItemName='Morethanhalfthedays')
 WHEN pas.PHQFeelingDown='3' then (select ItemId from LookupItemView where MasterName='DepressionFrequency' and ItemName='NearlyEveryDay')
 end as ScreeningValueid
  ,Comment = null,Active=0,DeleteFlag=0,CreatedBy=1,CreateDate=psv.CreatedDate,psv.VisitDate
 from PatientScreeningVisit psv inner join dtl_PatientAlcoholDepressionScreening pas
on pas.Ptn_pk=psv.Ptn_pk and pas.Visit_Id=psv.Visit_Id 
where  pas.PHQFeelingDown is not null
union
 Select psv.PatientId,psv.PatientMasterVisitId, (select Id from  LookupMaster  where  Name= 'DepressionScreeningQuestions') as ScreeningTypeId,1 as ScreeningDone,psv.VisitDate as ScreeningDate, (select liv.ItemId from LookupItemView liv where liv.ItemName='PHQ9Questions3') as ScreeningCategoryId,
CASE WHEN pas.PHQTroubleSleep='0' then  (select ItemId from LookupItemView where MasterName='DepressionFrequency' and ItemName='NotatAll')
when pas.PHQTroubleSleep='1' then (select ItemId from LookupItemView where MasterName='DepressionFrequency' and ItemName='SeveralDays')
when pas.PHQTroubleSleep='2' then (select ItemId from LookupItemView where MasterName='DepressionFrequency' and ItemName='Morethanhalfthedays')
 WHEN pas.PHQTroubleSleep='3' then (select ItemId from LookupItemView where MasterName='DepressionFrequency' and ItemName='NearlyEveryDay')
 end as ScreeningValueid
  ,Comment = null,Active=0,DeleteFlag=0,CreatedBy=1,CreateDate=psv.CreatedDate,psv.VisitDate
 from PatientScreeningVisit psv inner join dtl_PatientAlcoholDepressionScreening pas
on pas.Ptn_pk=psv.Ptn_pk and pas.Visit_Id=psv.Visit_Id and pas.PHQTroubleSleep is not null
union

 Select psv.PatientId,psv.PatientMasterVisitId, (select Id from  LookupMaster  where  Name= 'DepressionScreeningQuestions') as ScreeningTypeId,1 as ScreeningDone,psv.VisitDate as ScreeningDate, (select liv.ItemId  from  LookupItemView liv where liv.ItemName='PHQ9Questions4')  as ScreeningCategoryId,
CASE WHEN pas.PHQTiredLittleEnergy='0' then  (select ItemId from LookupItemView where MasterName='DepressionFrequency' and ItemName='NotatAll')
when pas.PHQTiredLittleEnergy='1' then (select ItemId from LookupItemView where MasterName='DepressionFrequency' and ItemName='SeveralDays')
when pas.PHQTiredLittleEnergy='2' then (select ItemId from LookupItemView where MasterName='DepressionFrequency' and ItemName='Morethanhalfthedays')
 WHEN pas.PHQTiredLittleEnergy='3' then (select ItemId from LookupItemView where MasterName='DepressionFrequency' and ItemName='NearlyEveryDay')
 end as ScreeningValueid
  ,Comment = null,Active=0,DeleteFlag=0,CreatedBy=1,CreateDate=psv.CreatedDate,psv.VisitDate
 from PatientScreeningVisit psv inner join dtl_PatientAlcoholDepressionScreening pas on
pas.Ptn_pk=psv.Ptn_pk and pas.Visit_Id=psv.Visit_Id 
where pas.PHQTiredLittleEnergy is not null
 union
 
 Select psv.PatientId,psv.PatientMasterVisitId, (select Id from  LookupMaster  where  Name= 'DepressionScreeningQuestions') as ScreeningTypeId,1 as ScreeningDone,psv.VisitDate as ScreeningDate,
 (select liv.ItemId  from LookupItemView liv where liv.ItemName ='PHQ9Questions5')  as ScreeningCategoryId,
CASE WHEN pas.PHQAppetite='0' then  (select ItemId from LookupItemView where MasterName='DepressionFrequency' and ItemName='NotatAll')
when  pas.PHQAppetite='1' then (select ItemId from LookupItemView where MasterName='DepressionFrequency' and ItemName='SeveralDays')
when  pas.PHQAppetite='2' then (select ItemId from LookupItemView where MasterName='DepressionFrequency' and ItemName='Morethanhalfthedays')
 WHEN  pas.PHQAppetite='3' then (select ItemId from LookupItemView where MasterName='DepressionFrequency' and ItemName='NearlyEveryDay')
 end as ScreeningValueid
  ,Comment = null,Active=0,DeleteFlag=0,CreatedBy=1,CreateDate=psv.CreatedDate,psv.VisitDate
 from PatientScreeningVisit psv inner join dtl_PatientAlcoholDepressionScreening pas
on  pas.Ptn_pk=psv.Ptn_pk and pas.Visit_Id=psv.Visit_Id and pas.PHQAppetite is not null
 
  union

   Select psv.PatientId,psv.PatientMasterVisitId, (select Id from  LookupMaster  where  Name= 'DepressionScreeningQuestions') as ScreeningTypeId,1 as ScreeningDone,psv.VisitDate as ScreeningDate, (select liv.ItemId from LookupItemView liv where liv.ItemName='PHQ9Questions6') as ScreeningCategoryId,
CASE WHEN pas.PHQYourselfDown='0' then  (select ItemId from LookupItemView where MasterName='DepressionFrequency' and ItemName='NotatAll')
when  pas.PHQYourselfDown='1' then (select ItemId from LookupItemView where MasterName='DepressionFrequency' and ItemName='SeveralDays')
when  pas.PHQYourselfDown='2' then (select ItemId from LookupItemView where MasterName='DepressionFrequency' and ItemName='Morethanhalfthedays')
 WHEN  pas.PHQYourselfDown='3' then (select ItemId from LookupItemView where MasterName='DepressionFrequency' and ItemName='NearlyEveryDay')
 end as ScreeningValueid
  ,Comment = null,Active=0,DeleteFlag=0,CreatedBy=1,CreateDate=psv.CreatedDate,psv.VisitDate
 from PatientScreeningVisit psv inner join dtl_PatientAlcoholDepressionScreening pas
on  pas.Ptn_pk=psv.Ptn_pk and pas.Visit_Id=psv.Visit_Id and pas.PHQYourselfDown is not null
  union

    Select psv.PatientId,psv.PatientMasterVisitId, (select Id from  LookupMaster  where  Name= 'DepressionScreeningQuestions') as ScreeningTypeId,1 as ScreeningDone,psv.VisitDate as ScreeningDate,(select liv.ItemId  from LookupItemView liv where liv.ItemName='PHQ9Questions7') as ScreeningCategoryId,
CASE WHEN pas.PHQTroubleConcentrating='0' then  (select ItemId from LookupItemView where MasterName='DepressionFrequency' and ItemName='NotatAll')
when  pas.PHQTroubleConcentrating='1' then (select ItemId from LookupItemView where MasterName='DepressionFrequency' and ItemName='SeveralDays')
when  pas.PHQTroubleConcentrating='2' then (select ItemId from LookupItemView where MasterName='DepressionFrequency' and ItemName='Morethanhalfthedays')
 WHEN  pas.PHQTroubleConcentrating='3' then (select ItemId from LookupItemView where MasterName='DepressionFrequency' and ItemName='NearlyEveryDay')
 end as ScreeningValueid
  ,Comment = null,Active=0,DeleteFlag=0,CreatedBy=1,CreateDate=psv.CreatedDate,psv.VisitDate
 from PatientScreeningVisit psv inner join dtl_PatientAlcoholDepressionScreening pas
on  pas.Ptn_pk=psv.Ptn_pk and pas.Visit_Id=psv.Visit_Id 
where  pas.PHQTroubleConcentrating is not null
union

Select psv.PatientId,psv.PatientMasterVisitId, (select Id from  LookupMaster  where  Name= 'DepressionScreeningQuestions') as ScreeningTypeId,1 as ScreeningDone,psv.VisitDate as ScreeningDate,(select liv.ItemId from LookupItemView liv where liv.ItemName='PHQ9Questions8') as ScreeningCategoryId,
CASE WHEN pas.PHQMovingSlowly='0' then  (select ItemId from LookupItemView where MasterName='DepressionFrequency' and ItemName='NotatAll')
when  pas.PHQMovingSlowly='1' then (select ItemId from LookupItemView where MasterName='DepressionFrequency' and ItemName='SeveralDays')
when   pas.PHQMovingSlowly='2' then (select ItemId from LookupItemView where MasterName='DepressionFrequency' and ItemName='Morethanhalfthedays')
 WHEN   pas.PHQMovingSlowly='3' then (select ItemId from LookupItemView where MasterName='DepressionFrequency' and ItemName='NearlyEveryDay')
 end as ScreeningValueid
  ,Comment = null,Active=0,DeleteFlag=0,CreatedBy=1,CreateDate=psv.CreatedDate,psv.VisitDate
 from PatientScreeningVisit psv inner join dtl_PatientAlcoholDepressionScreening pas
 on pas.Ptn_pk=psv.Ptn_pk and pas.Visit_Id=psv.Visit_Id where  pas.PHQMovingSlowly is not null
union
Select psv.PatientId,psv.PatientMasterVisitId, (select Id from  LookupMaster  where  Name= 'DepressionScreeningQuestions') as ScreeningTypeId,1 as ScreeningDone,psv.VisitDate as ScreeningDate, (select liv.ItemId from LookupItemView liv where liv.ItemName='PHQ9Questions9' ) as ScreeningCategoryId,
CASE WHEN pas.PHQFidgetyRestless='0' then  (select ItemId from LookupItemView where MasterName='DepressionFrequency' and ItemName='NotatAll')
when pas.PHQFidgetyRestless='1' then (select ItemId from LookupItemView where MasterName='DepressionFrequency' and ItemName='SeveralDays')
when   pas.PHQFidgetyRestless='2' then (select ItemId from LookupItemView where MasterName='DepressionFrequency' and ItemName='Morethanhalfthedays')
 WHEN   pas.PHQFidgetyRestless='3' then (select ItemId from LookupItemView where MasterName='DepressionFrequency' and ItemName='NearlyEveryDay')
 end as ScreeningValueid
  ,Comment = null,Active=0,DeleteFlag=0,CreatedBy=1,CreateDate=psv.CreatedDate,psv.VisitDate
 from PatientScreeningVisit psv inner join dtl_PatientAlcoholDepressionScreening pas
on pas.Ptn_pk=psv.Ptn_pk and pas.Visit_Id=psv.Visit_Id and  pas.PHQFidgetyRestless is not null
union

Select psv.PatientId,psv.PatientMasterVisitId, (select Id from  LookupMaster  where  Name= 'DepressionScreeningQuestions') as ScreeningTypeId,1 as ScreeningDone,psv.VisitDate as ScreeningDate,
 (select liv.ItemId from LookupItemView liv where liv.ItemName='PHQ9Questions10') as ScreeningCategoryId,
CASE WHEN pas.PHQHurtingYourself='0' then  (select ItemId from LookupItemView where MasterName='DepressionFrequency' and ItemName='NotatAll')
when pas.PHQHurtingYourself='1' then (select ItemId from LookupItemView where MasterName='DepressionFrequency' and ItemName='SeveralDays')
when   pas.PHQHurtingYourself='2' then (select ItemId from LookupItemView where MasterName='DepressionFrequency' and ItemName='Morethanhalfthedays')
 WHEN   pas.PHQHurtingYourself='3' then (select ItemId from LookupItemView where MasterName='DepressionFrequency' and ItemName='NearlyEveryDay')
 end as ScreeningValueid
  ,Comment = null,Active=0,DeleteFlag=0,CreatedBy=1,CreateDate=psv.CreatedDate,psv.VisitDate
 from PatientScreeningVisit psv inner join dtl_PatientAlcoholDepressionScreening pas
 on pas.Ptn_pk=psv.Ptn_pk and pas.Visit_Id=psv.Visit_Id and  pas.PHQHurtingYourself is not null),

PatientGBVViolence as (

--GBV Violence
Select psv.PatientId,psv.PatientMasterVisitId, (select liv.MasterId  from LookupItemView liv where liv.ItemName='GBVQuestion1') as ScreeningTypeId,1 as ScreeningDone,psv.VisitDate as ScreeningDate,(select liv.ItemId  from LookupItemView liv where liv.ItemName='GBVQuestion1') as ScreeningCategoryId,
CASE WHEN pas.SGBQ1=0 then (select ltv.ItemId from LookupItemView ltv where ltv.ItemName='No'  and ltv.MasterName='GeneralYesNo') 
 WHEN pas.SGBQ1=1 then (select ltv.ItemId from LookupItemView ltv where ltv.ItemName='Yes'  and ltv.MasterName='GeneralYesNo') end as ScreeningValueid
  ,Comment = null,Active=0,DeleteFlag=0,CreatedBy=1,CreateDate=psv.CreatedDate,psv.VisitDate
 from PatientScreeningVisit psv inner join dtl_PatientAlcoholDepressionScreening pas
on pas.Ptn_pk=psv.Ptn_pk and pas.Visit_Id=psv.Visit_Id 
where pas.IsLittleInterest is not null
union
Select psv.PatientId,psv.PatientMasterVisitId, (select liv.ItemId  from LookupItemView liv where liv.ItemName='GbvPhysicallyHurt') as ScreeningTypeId,1 as ScreeningDone,psv.VisitDate as ScreeningDate, (select  ltt.ItemId from LookupItemView ltt where  ltt.ItemName='GBVAssessment' and ltt.MasterName='ScreeningCategory') as ScreeningCategoryId,
CASE WHEN pas.SGBQ1=0 then (select ltv.ItemId from LookupItemView ltv where ltv.ItemName='No'  and ltv.MasterName='GeneralYesNo') 
 WHEN pas.SGBQ1=1 then (select ltv.ItemId from LookupItemView ltv where ltv.ItemName='Yes'  and ltv.MasterName='GeneralYesNo') end as ScreeningValueid
  ,Comment = null,Active=0,DeleteFlag=0,CreatedBy=1,CreateDate=psv.CreatedDate,psv.VisitDate
 from PatientScreeningVisit psv inner join dtl_PatientAlcoholDepressionScreening pas
on  pas.Ptn_pk=psv.Ptn_pk and pas.Visit_Id=psv.Visit_Id 
where pas.SGBQ1 is not null


union

Select psv.PatientId,psv.PatientMasterVisitId, (select liv.MasterId from LookupItemView liv  where liv.ItemName='GBVQuestion2') as ScreeningTypeId,1 as ScreeningDone,psv.VisitDate as ScreeningDate,
(select liv.ItemId  from  LookupItemView liv  where liv.ItemName='GBVQuestion2') as ScreeningCategoryId,
CASE WHEN pas.SGBQ2=0 then (select ltv.ItemId from LookupItemView ltv where ltv.ItemName='No'  and ltv.MasterName='GeneralYesNo') 
 WHEN pas.SGBQ2=1 then (select ltv.ItemId from LookupItemView ltv where ltv.ItemName='Yes'  and ltv.MasterName='GeneralYesNo') end as ScreeningValueid
  ,Comment = null,Active=0,DeleteFlag=0,CreatedBy=1,CreateDate=psv.CreatedDate,psv.VisitDate
 from PatientScreeningVisit psv inner join dtl_PatientAlcoholDepressionScreening pas
on  pas.Ptn_pk=psv.Ptn_pk and pas.Visit_Id=psv.Visit_Id where pas.SGBQ2 is not null
union
Select psv.PatientId,psv.PatientMasterVisitId, (select liv.ItemId from LookupItemView liv where liv.ItemName='GbvRelationshipPhysicalAssault')  as ScreeningTypeId,1 as ScreeningDone,psv.VisitDate as ScreeningDate,(select ltt.ItemId from LookupItemView ltt where  ltt.ItemName='GBVAssessment' and ltt.MasterName='ScreeningCategory') as ScreeningCategoryId,
CASE WHEN pas.SGBQ2=0 then (select ltv.ItemId from LookupItemView ltv where ltv.ItemName='No'  and ltv.MasterName='GeneralYesNo') 
 WHEN pas.SGBQ2=1 then (select ltv.ItemId from LookupItemView ltv where ltv.ItemName='Yes'  and ltv.MasterName='GeneralYesNo') end as ScreeningValueid
  ,Comment = null,Active=0,DeleteFlag=0,CreatedBy=1,CreateDate=psv.CreatedDate,psv.VisitDate
 from PatientScreeningVisit psv inner join dtl_PatientAlcoholDepressionScreening pas on pas.Ptn_pk=psv.Ptn_pk and pas.Visit_Id=psv.Visit_Id and pas.SGBQ2 is not null
union

Select psv.PatientId,psv.PatientMasterVisitId, (select liv.MasterId from LookupItemView liv where liv.ItemName='GBVQuestion3') as ScreeningTypeId,1 as ScreeningDone,psv.VisitDate as ScreeningDate, (select liv.ItemId from LookupItemView liv where liv.ItemName='GBVQuestion3') as ScreeningCategoryId,
CASE WHEN pas.SGBQ3=0 then (select ltv.ItemId from LookupItemView ltv where ltv.ItemName='No'  and ltv.MasterName='GeneralYesNo') 
 WHEN pas.SGBQ3=1 then (select ltv.ItemId from LookupItemView ltv where ltv.ItemName='Yes'  and ltv.MasterName='GeneralYesNo') end as ScreeningValueid
  ,Comment = null,Active=0,DeleteFlag=0,CreatedBy=1,CreateDate=psv.CreatedDate,psv.VisitDate
 from PatientScreeningVisit psv inner join dtl_PatientAlcoholDepressionScreening pas
 on  pas.Ptn_pk=psv.Ptn_pk and pas.Visit_Id=psv.Visit_Id 
 where  pas.SGBQ3 is not null
union
Select psv.PatientId,psv.PatientMasterVisitId, (select  liv.ItemId from LookupItemView liv where liv.ItemName='GbvRelationshipVerbalAssault' )  as ScreeningTypeId,1 as ScreeningDone,psv.VisitDate as ScreeningDate,(select ltt.ItemId from LookupItemView ltt where  ltt.ItemName='GBVAssessment' and ltt.MasterName='ScreeningCategory') as ScreeningCategoryId,
CASE WHEN pas.SGBQ3=0 then (select ltv.ItemId from LookupItemView ltv where ltv.ItemName='No'  and ltv.MasterName='GeneralYesNo') 
 WHEN pas.SGBQ3=1 then (select ltv.ItemId from LookupItemView ltv where ltv.ItemName='Yes'  and ltv.MasterName='GeneralYesNo') end as ScreeningValueid
  ,Comment = null,Active=0,DeleteFlag=0,CreatedBy=1,CreateDate=psv.CreatedDate,psv.VisitDate
 from PatientScreeningVisit psv inner join dtl_PatientAlcoholDepressionScreening pas
on pas.Ptn_pk=psv.Ptn_pk and pas.Visit_Id=psv.Visit_Id 
where pas.SGBQ3 is not null
union


Select psv.PatientId,psv.PatientMasterVisitId, (select liv.MasterId  from LookupItemView liv where liv.ItemName='GBVQuestion4') as ScreeningTypeId,1 as ScreeningDone,psv.VisitDate as ScreeningDate,(select liv.ItemId from LookupItemView liv where liv.ItemName='GBVQuestion4') as ScreeningCategoryId,
CASE WHEN pas.SGBQ4=0 then (select ltv.ItemId from LookupItemView ltv where ltv.ItemName='No'  and ltv.MasterName='GeneralYesNo') 
 WHEN pas.SGBQ4=1 then (select ltv.ItemId from LookupItemView ltv where ltv.ItemName='Yes'  and ltv.MasterName='GeneralYesNo') end as ScreeningValueid
  ,Comment = null,Active=0,DeleteFlag=0,CreatedBy=1,CreateDate=psv.CreatedDate,psv.VisitDate
 from PatientScreeningVisit psv inner join  dtl_PatientAlcoholDepressionScreening pas
on pas.Ptn_pk=psv.Ptn_pk and pas.Visit_Id=psv.Visit_Id 
where pas.IsLittleInterest is not null

union

Select psv.PatientId,psv.PatientMasterVisitId, (select liv.ItemId  from LookupItemView liv where liv.ItemName ='GbvRelationshipUncomfSexAct')  as ScreeningTypeId
,1 as ScreeningDone,psv.VisitDate as ScreeningDate,(select ltt.ItemId  from LookupItemView ltt where  ltt.ItemName='GBVAssessment' and ltt.MasterName='ScreeningCategory') as ScreeningCategoryId,
CASE WHEN pas.SGBQ4=0 then (select ltv.ItemId from LookupItemView ltv where ltv.ItemName='No'  and ltv.MasterName='GeneralYesNo') 
 WHEN pas.SGBQ4=1 then (select ltv.ItemId from LookupItemView ltv where ltv.ItemName='Yes'  and ltv.MasterName='GeneralYesNo') end as ScreeningValueid
  ,Comment = null,Active=0,DeleteFlag=0,CreatedBy=1,CreateDate=psv.CreatedDate,psv.VisitDate
 from PatientScreeningVisit psv inner join dtl_PatientAlcoholDepressionScreening pas on 
 pas.Ptn_pk=psv.Ptn_pk and pas.Visit_Id=psv.Visit_Id 
 where pas.SGBQ4 is not null
union

Select psv.PatientId,psv.PatientMasterVisitId, (select liv.MasterId from LookupItemView liv  where liv.ItemName='GBVQuestion5' ) as ScreeningTypeId,1 as ScreeningDone,psv.VisitDate as ScreeningDate, (select liv.ItemId  from LookupItemView liv  where liv.ItemName='GBVQuestion5') as ScreeningCategoryId,
CASE WHEN pas.SGBQ5=0 then (select ltv.ItemId from LookupItemView ltv where ltv.ItemName='No'  and ltv.MasterName='GeneralYesNo') 
 WHEN pas.SGBQ5=1 then (select ltv.ItemId from LookupItemView ltv where ltv.ItemName='Yes'  and ltv.MasterName='GeneralYesNo') end as ScreeningValueid
  ,Comment = null,Active=0,DeleteFlag=0,CreatedBy=1,CreateDate=psv.CreatedDate,psv.VisitDate
 from PatientScreeningVisit psv
 inner join dtl_PatientAlcoholDepressionScreening pas on  pas.Ptn_pk=psv.Ptn_pk and pas.Visit_Id=psv.Visit_Id 
 where pas.IsLittleInterest is not null


union

Select psv.PatientId,psv.PatientMasterVisitId, (select liv.ItemId from LookupItemView liv where liv.ItemName='GbvNonRelationshipViolence' and liv.MasterName='GBVAssessment' )  as ScreeningTypeId,1 as ScreeningDone,psv.VisitDate as ScreeningDate, (select ltt.ItemId from LookupItemView ltt where ltt.ItemName='GBVAssessment' and ltt.MasterName='ScreeningCategory') as ScreeningCategoryId,
CASE WHEN pas.SGBQ5=0 then (select ltv.ItemId from LookupItemView ltv where ltv.ItemName='No'  and ltv.MasterName='GeneralYesNo') 
 WHEN pas.SGBQ5=1 then (select ltv.ItemId from LookupItemView ltv where ltv.ItemName='Yes'  and ltv.MasterName='GeneralYesNo') end as ScreeningValueid
  ,Comment = null,Active=0,DeleteFlag=0,CreatedBy=1,CreateDate=psv.CreatedDate,psv.VisitDate
 from PatientScreeningVisit psv
 inner join dtl_PatientAlcoholDepressionScreening pas on pas.Ptn_pk=psv.Ptn_pk and pas.Visit_Id=psv.Visit_Id 
 where pas.SGBQ5 is not null


),



patientCAGE as(
Select psv.PatientId,psv.PatientMasterVisitId, (select Id from  LookupMaster  where  Name='SmokingScreeningQuestions') as  ScreeningTypeId,1 as ScreeningDone,psv.VisitDate as ScreeningDate, (select liv.ItemId from LookupItemView liv 
where liv.ItemName='DrinkAlcohol' and liv.MasterName='SocialHistoryQuestions') 
 as ScreeningCategoryId,
lc.ItemId  as ScreeningValueid  
  ,Comment = null,Active=0,DeleteFlag=0,CreatedBy=1,CreateDate=psv.CreatedDate,psv.VisitDate
 from PatientScreeningVisit psv
 
 inner join dtl_PatientAlcoholDepressionScreening pas on pas.Ptn_pk=psv.Ptn_pk and pas.Visit_Id=psv.Visit_Id
 inner join LookupCage lc on  lc.ItemTypeId=pas.CageAIDAlcohol and lc.ItemType='CageAidAlcohol'  and  (pas.CageAIDAlcohol is not null or pas.CageAIDAlcohol > 0)

union

Select psv.PatientId,psv.PatientMasterVisitId, (select Id from  LookupMaster  where  Name='SmokingScreeningQuestions') as  ScreeningTypeId,1 as ScreeningDone,psv.VisitDate as ScreeningDate, (select liv.ItemId from LookupItemView liv 
where liv.ItemName='Smoke' and liv.MasterName='SocialHistoryQuestions') 
 as ScreeningCategoryId,
lc.ItemId  as ScreeningValueid  
  ,Comment = null,Active=0,DeleteFlag=0,CreatedBy=1,CreateDate=psv.CreatedDate,psv.VisitDate
 from PatientScreeningVisit psv
 
 inner join dtl_PatientAlcoholDepressionScreening pas on pas.Ptn_pk=psv.Ptn_pk and pas.Visit_Id=psv.Visit_Id
 inner join LookupCage lc on  lc.ItemTypeId=pas.CageAIDSmoke and lc.ItemType='CageAIDSmoke'  and  (pas.CageAIDSmoke is not null or pas.CageAIDSmoke > 0)





union


Select psv.PatientId,psv.PatientMasterVisitId, (select Id from  LookupMaster  where  Name='SmokingScreeningQuestions') as  ScreeningTypeId,1 as ScreeningDone,psv.VisitDate as ScreeningDate, (select liv.ItemId from LookupItemView liv 
where liv.ItemName='UseDrugs' and liv.MasterName='SocialHistoryQuestions') 
 as ScreeningCategoryId,
lc.ItemId  as ScreeningValueid  
  ,Comment = null,Active=0,DeleteFlag=0,CreatedBy=1,CreateDate=psv.CreatedDate,psv.VisitDate
 from PatientScreeningVisit psv
 
 inner join dtl_PatientAlcoholDepressionScreening pas on pas.Ptn_pk=psv.Ptn_pk and pas.Visit_Id=psv.Visit_Id
 inner join LookupCage lc on  lc.ItemTypeId=pas.CageAIDDrugs and lc.ItemType='CageAIDDrugs'  and  (pas.CageAIDDrugs is not null or pas.CageAIDDrugs > 0)


union

Select psv.PatientId,psv.PatientMasterVisitId, (select Id from  LookupMaster  where  Name='SmokingScreeningQuestions') as  ScreeningTypeId,1 as ScreeningDone,psv.VisitDate as ScreeningDate,(select liv.ItemId from LookupItemView liv where liv.ItemName='AlcoholScreeningQuestion1') as ScreeningCategoryId,
CASE WHEN pas.CageAIDQ1=0 then (select ltv.ItemId from LookupItemView ltv where ltv.ItemName='No'  and ltv.MasterName='GeneralYesNo') 
 WHEN  pas.CageAIDQ1=1 then (select ltv.ItemId from LookupItemView ltv where ltv.ItemName='Yes'  and ltv.MasterName='GeneralYesNo') end as ScreeningValueid
  ,Comment = null,Active=0,DeleteFlag=0,CreatedBy=1,CreateDate=psv.CreatedDate,psv.VisitDate
 from PatientScreeningVisit psv inner join dtl_PatientAlcoholDepressionScreening pas
on  pas.Ptn_pk=psv.Ptn_pk and pas.Visit_Id=psv.Visit_Id where  pas.CageAIDQ1 is not null

union




Select psv.PatientId,psv.PatientMasterVisitId, (select Id from  LookupMaster  where  Name='SmokingScreeningQuestions') as  ScreeningTypeId,1 as ScreeningDone,psv.VisitDate as ScreeningDate, (select liv.ItemId from LookupItemView liv where liv.ItemName='AlcoholScreeningQuestion2') as ScreeningCategoryId,
CASE WHEN pas.CageAIDQ2=0 then (select ltv.ItemId from LookupItemView ltv where ltv.ItemName='No'  and ltv.MasterName='GeneralYesNo') 
 WHEN  pas.CageAIDQ2=1 then (select ltv.ItemId from LookupItemView ltv where ltv.ItemName='Yes'  and ltv.MasterName='GeneralYesNo') end as ScreeningValueid
  ,Comment = null,Active=0,DeleteFlag=0,CreatedBy=1,CreateDate=psv.CreatedDate,psv.VisitDate
 from PatientScreeningVisit psv inner join dtl_PatientAlcoholDepressionScreening pas
 on  pas.Ptn_pk=psv.Ptn_pk and pas.Visit_Id=psv.Visit_Id 
 where  pas.CageAIDQ2 is not null

union

Select psv.PatientId,psv.PatientMasterVisitId, (select Id from  LookupMaster  where  Name='SmokingScreeningQuestions') as  ScreeningTypeId,1 as ScreeningDone,psv.VisitDate as ScreeningDate,
(select liv.ItemId from LookupItemView liv where liv.ItemName='AlcoholScreeningQuestion3')  as ScreeningCategoryId,
CASE WHEN pas.CageAIDQ3=0 then (select ltv.ItemId from LookupItemView ltv where ltv.ItemName='No'  and ltv.MasterName='GeneralYesNo') 
 WHEN  pas.CageAIDQ3=1 then (select ltv.ItemId from LookupItemView ltv where ltv.ItemName='Yes'  and ltv.MasterName='GeneralYesNo') end as ScreeningValueid
  ,Comment = null,Active=0,DeleteFlag=0,CreatedBy=1,CreateDate=psv.CreatedDate,psv.VisitDate
 from PatientScreeningVisit psv inner join dtl_PatientAlcoholDepressionScreening pas
on pas.Ptn_pk=psv.Ptn_pk and pas.Visit_Id=psv.Visit_Id where pas.CageAIDQ3 is not null
union

Select psv.PatientId,psv.PatientMasterVisitId, (select Id from  LookupMaster  where  Name='SmokingScreeningQuestions') as  ScreeningTypeId,1 as ScreeningDone,psv.VisitDate as ScreeningDate,
(select liv.ItemId  from LookupItemView liv where liv.ItemName='AlcoholScreeningQuestion4') as ScreeningCategoryId,
CASE WHEN pas.CageAIDQ4=0 then (select ltv.ItemId from LookupItemView ltv where ltv.ItemName='No'  and ltv.MasterName='GeneralYesNo') 
 WHEN  pas.CageAIDQ4=1 then (select ltv.ItemId from LookupItemView ltv where ltv.ItemName='Yes'  and ltv.MasterName='GeneralYesNo') end as ScreeningValueid
  ,Comment = null,Active=0,DeleteFlag=0,CreatedBy=1,CreateDate=psv.CreatedDate,psv.VisitDate
 from PatientScreeningVisit psv inner join dtl_PatientAlcoholDepressionScreening pas
on  pas.Ptn_pk=psv.Ptn_pk and pas.Visit_Id=psv.Visit_Id where
  pas.CageAIDQ4 is not null


),

patientcrafft AS (
Select psv.PatientId,psv.PatientMasterVisitId, (select liv.iD  from LookupMaster liv where  liv.Name='CRAFFTScoreQuestions') as ScreeningTypeId,1 as ScreeningDone,psv.VisitDate as ScreeningDate,(select liv.ItemId from LookupItemView liv where  liv.ItemName='CRAFFTScreeningQuestion1') as ScreeningCategoryId,
CASE WHEN pas.CrafftAlcohol=0 then (select ltv.ItemId from LookupItemView ltv where ltv.ItemName='No'  and ltv.MasterName='GeneralYesNo') 
 WHEN pas.CrafftAlcohol=1 then (select ltv.ItemId from LookupItemView ltv where ltv.ItemName='Yes'  and ltv.MasterName='GeneralYesNo') end as ScreeningValueid
  ,Comment = null,Active=0,DeleteFlag=0,CreatedBy=1,CreateDate=psv.CreatedDate,psv.VisitDate
 from PatientScreeningVisit psv  inner join dtl_PatientAlcoholDepressionScreening pas
on  pas.Ptn_pk=psv.Ptn_pk and pas.Visit_Id=psv.Visit_Id 
where  pas.CrafftAlcohol is not null

UNION


Select psv.PatientId,psv.PatientMasterVisitId, (select liv.iD  from LookupMaster liv where  liv.Name='CRAFFTScoreQuestions') as ScreeningTypeId,1 as ScreeningDone,psv.VisitDate as ScreeningDate,(select liv.ItemId from LookupItemView liv where  liv.ItemName='CRAFFTScreeningQuestion2') as ScreeningCategoryId,
CASE WHEN pas.CrafftSmoke=0 then (select ltv.ItemId from LookupItemView ltv where ltv.ItemName='No'  and ltv.MasterName='GeneralYesNo') 
 WHEN pas.CrafftSmoke=1 then (select ltv.ItemId from LookupItemView ltv where ltv.ItemName='Yes'  and ltv.MasterName='GeneralYesNo') end as ScreeningValueid
  ,Comment = null,Active=0,DeleteFlag=0,CreatedBy=1,CreateDate=psv.CreatedDate,psv.VisitDate
 from PatientScreeningVisit psv  inner join dtl_PatientAlcoholDepressionScreening pas
on  pas.Ptn_pk=psv.Ptn_pk and pas.Visit_Id=psv.Visit_Id 
where  pas.CrafftSmoke is not null

union

Select psv.PatientId,psv.PatientMasterVisitId, (select liv.iD  from LookupMaster liv where  liv.Name='CRAFFTScoreQuestions') as ScreeningTypeId,1 as ScreeningDone,psv.VisitDate as ScreeningDate,(select liv.ItemId from LookupItemView liv where  liv.ItemName='CRAFFTScreeningQuestion3') as ScreeningCategoryId,
CASE WHEN pas.CrafftAnythingHigh=0 then (select ltv.ItemId from LookupItemView ltv where ltv.ItemName='No'  and ltv.MasterName='GeneralYesNo') 
 WHEN pas.CrafftAnythingHigh=1 then (select ltv.ItemId from LookupItemView ltv where ltv.ItemName='Yes'  and ltv.MasterName='GeneralYesNo') end as ScreeningValueid
  ,Comment = null,Active=0,DeleteFlag=0,CreatedBy=1,CreateDate=psv.CreatedDate,psv.VisitDate
 from PatientScreeningVisit psv  inner join dtl_PatientAlcoholDepressionScreening pas
on  pas.Ptn_pk=psv.Ptn_pk and pas.Visit_Id=psv.Visit_Id 
where  pas.CrafftAnythingHigh is not null

union

Select psv.PatientId,psv.PatientMasterVisitId, (select liv.iD  from LookupMaster liv where  liv.Name='CRAFFTScoreQuestions') as ScreeningTypeId,1 as ScreeningDone,psv.VisitDate as ScreeningDate,(select liv.ItemId from LookupItemView liv where  liv.ItemName='CRAFFTScoreQuestion1') as ScreeningCategoryId,
CASE WHEN pas.CrafftC=0 then (select ltv.ItemId from LookupItemView ltv where ltv.ItemName='No'  and ltv.MasterName='GeneralYesNo') 
 WHEN pas.CrafftC=1 then (select ltv.ItemId from LookupItemView ltv where ltv.ItemName='Yes'  and ltv.MasterName='GeneralYesNo') end as ScreeningValueid
  ,Comment = null,Active=0,DeleteFlag=0,CreatedBy=1,CreateDate=psv.CreatedDate,psv.VisitDate
 from PatientScreeningVisit psv  inner join dtl_PatientAlcoholDepressionScreening pas
on  pas.Ptn_pk=psv.Ptn_pk and pas.Visit_Id=psv.Visit_Id 
where  pas.CrafftC is not null

union

Select psv.PatientId,psv.PatientMasterVisitId, (select liv.iD  from LookupMaster liv where  liv.Name='CRAFFTScoreQuestions') as ScreeningTypeId,1 as ScreeningDone,psv.VisitDate as ScreeningDate,(select liv.ItemId from LookupItemView liv where  liv.ItemName='CRAFFTScoreQuestion2') as ScreeningCategoryId,
CASE WHEN pas.CrafftR=0 then (select ltv.ItemId from LookupItemView ltv where ltv.ItemName='No'  and ltv.MasterName='GeneralYesNo') 
 WHEN pas.CrafftR=1 then (select ltv.ItemId from LookupItemView ltv where ltv.ItemName='Yes'  and ltv.MasterName='GeneralYesNo') end as ScreeningValueid
  ,Comment = null,Active=0,DeleteFlag=0,CreatedBy=1,CreateDate=psv.CreatedDate,psv.VisitDate
 from PatientScreeningVisit psv  inner join dtl_PatientAlcoholDepressionScreening pas
on  pas.Ptn_pk=psv.Ptn_pk and pas.Visit_Id=psv.Visit_Id 
where  pas.CrafftR is not null

union




Select psv.PatientId,psv.PatientMasterVisitId, (select liv.iD  from LookupMaster liv where  liv.Name='CRAFFTScoreQuestions') as ScreeningTypeId,1 as ScreeningDone,psv.VisitDate as ScreeningDate,(select liv.ItemId from LookupItemView liv where  liv.ItemName='CRAFFTScoreQuestion3') as ScreeningCategoryId,
CASE WHEN pas.CrafftA=0 then (select ltv.ItemId from LookupItemView ltv where ltv.ItemName='No'  and ltv.MasterName='GeneralYesNo') 
 WHEN pas.CrafftA=1 then (select ltv.ItemId from LookupItemView ltv where ltv.ItemName='Yes'  and ltv.MasterName='GeneralYesNo') end as ScreeningValueid
  ,Comment = null,Active=0,DeleteFlag=0,CreatedBy=1,CreateDate=psv.CreatedDate,psv.VisitDate
 from PatientScreeningVisit psv  inner join dtl_PatientAlcoholDepressionScreening pas
on  pas.Ptn_pk=psv.Ptn_pk and pas.Visit_Id=psv.Visit_Id 
where  pas.CrafftA is not null

union
Select psv.PatientId,psv.PatientMasterVisitId, (select liv.iD  from LookupMaster liv where  liv.Name='CRAFFTScoreQuestions') as ScreeningTypeId,1 as ScreeningDone,psv.VisitDate as ScreeningDate,(select liv.ItemId from LookupItemView liv where  liv.ItemName='CRAFFTScoreQuestion4') as ScreeningCategoryId,
CASE WHEN pas.CrafftF1=0 then (select ltv.ItemId from LookupItemView ltv where ltv.ItemName='No'  and ltv.MasterName='GeneralYesNo') 
 WHEN pas.CrafftF1=1 then (select ltv.ItemId from LookupItemView ltv where ltv.ItemName='Yes'  and ltv.MasterName='GeneralYesNo') end as ScreeningValueid
  ,Comment = null,Active=0,DeleteFlag=0,CreatedBy=1,CreateDate=psv.CreatedDate,psv.VisitDate
 from PatientScreeningVisit psv  inner join dtl_PatientAlcoholDepressionScreening pas
on  pas.Ptn_pk=psv.Ptn_pk and pas.Visit_Id=psv.Visit_Id 
where  pas.CrafftF1 is not null
union
Select psv.PatientId,psv.PatientMasterVisitId, (select liv.iD  from LookupMaster liv where  liv.Name='CRAFFTScoreQuestions') as ScreeningTypeId,1 as ScreeningDone,psv.VisitDate as ScreeningDate,(select liv.ItemId from LookupItemView liv where  liv.ItemName='CRAFFTScoreQuestion5') as ScreeningCategoryId,
CASE WHEN pas.CrafftF2=0 then (select ltv.ItemId from LookupItemView ltv where ltv.ItemName='No'  and ltv.MasterName='GeneralYesNo') 
 WHEN pas.CrafftF2=1 then (select ltv.ItemId from LookupItemView ltv where ltv.ItemName='Yes'  and ltv.MasterName='GeneralYesNo') end as ScreeningValueid
  ,Comment = null,Active=0,DeleteFlag=0,CreatedBy=1,CreateDate=psv.CreatedDate,psv.VisitDate
 from PatientScreeningVisit psv  inner join dtl_PatientAlcoholDepressionScreening pas
on  pas.Ptn_pk=psv.Ptn_pk and pas.Visit_Id=psv.Visit_Id 
where  pas.CrafftF2 is not null

union
Select psv.PatientId,psv.PatientMasterVisitId, (select liv.iD  from LookupMaster liv where  liv.Name='CRAFFTScoreQuestions') as ScreeningTypeId,1 as ScreeningDone,psv.VisitDate as ScreeningDate,(select liv.ItemId from LookupItemView liv where  liv.ItemName='CRAFFTScoreQuestion6') as ScreeningCategoryId,
CASE WHEN pas.CrafftT=0 then (select ltv.ItemId from LookupItemView ltv where ltv.ItemName='No'  and ltv.MasterName='GeneralYesNo') 
 WHEN pas.CrafftT=1 then (select ltv.ItemId from LookupItemView ltv where ltv.ItemName='Yes'  and ltv.MasterName='GeneralYesNo') end as ScreeningValueid
  ,Comment = null,Active=0,DeleteFlag=0,CreatedBy=1,CreateDate=psv.CreatedDate,psv.VisitDate
 from PatientScreeningVisit psv  inner join dtl_PatientAlcoholDepressionScreening pas
on  pas.Ptn_pk=psv.Ptn_pk and pas.Visit_Id=psv.Visit_Id 
where  pas.CrafftT is not null



),

PatientDisclosure as(Select psv.PatientId,psv.PatientMasterVisitId, (select liv.iD  from LookupMaster liv where  liv.Name='Disclosure') as ScreeningTypeId,1 as ScreeningDone,psv.VisitDate as ScreeningDate,
(select liv.ItemId from LookupItemView liv where  liv.ItemName='DisclosureQ1') as ScreeningCategoryId,
CASE WHEN pas.DisclosureHIVStatus=0 then (select ltv.ItemId from LookupItemView ltv where ltv.ItemName='No'  and ltv.MasterName='GeneralYesNo') 
 WHEN pas.DisclosureHIVStatus=1 then (select ltv.ItemId from LookupItemView ltv where ltv.ItemName='Yes'  and ltv.MasterName='GeneralYesNo') end as ScreeningValueid
  ,Comment = null,Active=0,DeleteFlag=0,CreatedBy=1,CreateDate=psv.CreatedDate,psv.VisitDate
 from PatientScreeningVisit psv  inner join dtl_PatientAlcoholDepressionScreening pas
on  pas.Ptn_pk=psv.Ptn_pk and pas.Visit_Id=psv.Visit_Id 
where  pas.DisclosureHIVStatus is not null
union
Select psv.PatientId,psv.PatientMasterVisitId, (select liv.iD  from LookupMaster liv where  liv.Name='Disclosure') as ScreeningTypeId,1 as ScreeningDone,psv.VisitDate as ScreeningDate,(select liv.ItemId from LookupItemView liv where  liv.ItemName='DisclosureQ2') as ScreeningCategoryId,
(select ltv.ItemId from LookupItemView ltv where ltv.ItemName=dc.[Name] and ltv.MasterName='DisclosedTo' )  
  as ScreeningValueid
  ,Comment = null,Active=0,DeleteFlag=0,CreatedBy=1,CreateDate=psv.CreatedDate,psv.VisitDate
 from PatientScreeningVisit psv  inner join dtl_PatientAlcoholDepressionScreening pas
 
on  pas.Ptn_pk=psv.Ptn_pk and pas.Visit_Id=psv.Visit_Id 
inner  join (select dc.CodeID,dc.[Name],dc.Id from mst_pmtctDeCode dc inner join mst_pmtctCode c on c.CodeID=dc.CodeID 
where c.[Name]='DisclosedHIVStatusTo')  
dc on dc.id=pas.DisclosureTo
where  pas.DisclosureTo is not null

),

PatientScreeningList as 
(
select * from
 PatientDepressionScreening  
union
 select * from PatientGBVViolence
 union
 select * from patientCAGE
 union
 select * from patientcrafft
 union
 select * from PatientDisclosure
 )


INSERT INTO PatientEncounter (PatientId,EncounterTypeId,PatientMasterVisitId,EncounterStartTime,EncounterEndTime,ServiceAreaId,DeleteFlag,CreatedBy,CreateDate,[Status])
select * from (select t.PatientId,(select ItemId from LookupItemView lm where lm.MasterName='EncounterType' and lm.ItemName='DepressionScreening') as EncounterTypeId,
t.PatientMasterVisitId as PatientMasterVisitId,v.VisitDate as EncounterStartTime,v.VisitDate as EncounterEndTime,203 as ServiceAreaId,0 as DeleteFlag,1 as CreatedBy,v.CreateDate,0 as [Status] from (
select distinct PatientId,PatientMasterVisitId from PatientDepressionScreening 
)t
 inner join PatientMasterVisit v on V.Id=t.PatientMasterVisitid
 union
 select t.PatientId,(select ItemId from LookupItemView lm where lm.MasterName='EncounterType' and lm.ItemName='GBVScreening') as EncounterTypeId,
t.PatientMasterVisitId as PatientMasterVisitId ,v.VisitDate as EncounterStartTime ,v.VisitDate as EncounterEndTime,203 as ServiceAreaId,0 as DeleteFlag,1 as CreatedBy,v.CreateDate,0  as [Status] from (
select distinct PatientId,PatientMasterVisitId from PatientGBVViolence 

 )t
 inner join PatientMasterVisit v on V.Id=t.PatientMasterVisitid
 union
  select t.PatientId,(select ItemId from LookupItemView lm where lm.MasterName='EncounterType' and lm.ItemName='AlcoholandDrugAbuseScreening') as EncounterTypeId,
t.PatientMasterVisitId as PatientMasterVisitId,v.VisitDate as EncounterStartTime ,v.VisitDate as EncounterEndTime ,203 as ServiceAreaId ,0 as DeleteFlag ,1 as CreatedBy ,v.CreateDate,0 as [Status] from (
select distinct PatientId,PatientMasterVisitId from patientCAGE
 
 )t
 inner join PatientMasterVisit v on V.Id=t.PatientMasterVisitid
 union
   select t.PatientId,(select ItemId from LookupItemView lm where lm.MasterName='EncounterType' and lm.ItemName='AlcoholandDrugAbuseScreening') as EncounterTypeId,
t.PatientMasterVisitId  as PatientMasterVisitId  ,v.VisitDate as EncounterStartTime ,v.VisitDate as EncounterEndTime ,203 as ServiceAreaId,0 as DeleteFlag,1 as CreatedBy ,v.CreateDate,0 as [Status] from (
select distinct PatientId,PatientMasterVisitId from patientcrafft

 )t
 inner join PatientMasterVisit v on V.Id=t.PatientMasterVisitid)vt 


GO
with patientscreened as(select pas.Ptn_pk,pas.Visit_Id,v.VisitDate,pas.CreatedDate,v.VisitType,vt.VisitName from dtl_PatientAlcoholDepressionScreening pas
inner join ord_Visit v on v.Visit_Id=pas.Visit_Id
inner join mst_VisitType vt on vt.VisitTypeID=v.VisitType
),



PatientScreeningVisit  as( select  b.Id as PatientId,a.Ptn_pk,a.Visit_Id,c.Id as PatientMasterVisitId,c.VisitDate,a.CreatedDate   from
  patientscreened a
  inner join Patient b on a.Ptn_pk = b.ptn_pk
inner join PatientMasterVisit c on b.id = c.PatientId
and cast(a.visitdate as date) = cast(c.visitdate as date)
and c.VisitType = 0
  ),

 
  



LookupCage as (
select '1' as ItemTypeId ,(select ItemId from LookupItemView  where MasterName='DrinkAlcohol' and ItemName='Never') as ItemId,(select 'CageAidAlcohol') as ItemType
union
select '2' as ItemTypeId ,(select ItemId from LookupItemView  where MasterName='DrinkAlcohol' and ItemName='Monthly') as ItemId,(select 'CageAidAlcohol')  as itemType
union
select '3' as ItemTypeId , (select ItemId from LookupItemView  where MasterName='DrinkAlcohol' and ItemName='TwoTimesaMonth') as ItemId,(select 'CageAidAlcohol') as itemType
union 
select '4' as ItemTypeId ,(select ItemId from LookupItemView  where MasterName='DrinkAlcohol' and ItemName='TwoTimesaWeek') as ItemId,(select 'CageAidAlcohol') as itemType
union
select '5' as ItemTypeId  , (SELECT ItemId FROM LookupItemView WHERE MasterName='DrinkAlcohol' and ItemName='FourorMore') as ItemId,(select 'CageAidAlcohol') as itemType
union
select '1' as ItemTypeId ,(select  ItemId from LookupItemView  where MasterName='Smoke' and ItemName='NeverSmoked') as ItemId,(select 'CageAIDSmoke ') as ItemType
union
select '2' as ItemTypeId ,(select ItemId from LookupItemView  where MasterName='Smoke' and ItemName='FormerSmoker') as ItemId,(select 'CageAIDSmoke ')  as itemType
union
select '3' as ItemTypeId , (select ItemId from LookupItemView  where MasterName='Smoke' and ItemName='CurrentSmoker') as ItemId,(select 'CageAIDSmoke ') as itemType
union 
select '4' as ItemTypeId ,(select ItemId from LookupItemView  where MasterName='Smoke' and ItemName='LightSmoker') as ItemId,(select 'CageAIDSmoke ') as itemType
union
select '5' as ItemTypeId  , (SELECT ItemId FROM LookupItemView WHERE MasterName='Smoke' and ItemName='HeavySmoker') as ItemId,(select 'CageAIDSmoke' ) as itemType
union
select '6' as ItemTypeId,(SELECT ItemId FROM LookupItemView WHERE MasterName='Smoke' and ItemName='Smoker') as ItemId,(select 'CageAIDSmoke' ) as itemType
union

select '1' as ItemTypeId ,(select ItemId from LookupItemView  where MasterName='UseDrugs' and ItemName='Never') as ItemId,(select 'CageAIDDrugs ') as ItemType
union
select '2' as ItemTypeId ,(select ItemId from LookupItemView  where MasterName='UseDrugs' and ItemName='Monthly') as ItemId,(select 'CageAIDDrugs ')  as itemType
union
select '3' as ItemTypeId , (select ItemId from LookupItemView  where MasterName='UseDrugs' and ItemName='TwoTimesaMonth') as ItemId,(select 'CageAIDDrugs ') as itemType
union 
select '4' as ItemTypeId ,(select ItemId from LookupItemView  where MasterName='UseDrugs' and ItemName='TwoTimesaWeek') as ItemId,(select 'CageAIDDrugs ') as itemType
union
select '5' as ItemTypeId  , (SELECT ItemId FROM LookupItemView WHERE MasterName='UseDrugs' and ItemName='FourorMore') as ItemId,(select 'CageAIDDrugs ') as itemType

),

 PatientDepressionScreening as (
Select psv.PatientId,psv.PatientMasterVisitId, (select liv.MasterId  from LookupItemView liv where  liv.ItemName='DSQuestion1') as ScreeningTypeId,1 as ScreeningDone,psv.VisitDate as ScreeningDate,(select liv.ItemId from LookupItemView liv where  liv.ItemName='DSQuestion1') as ScreeningCategoryId,
CASE WHEN pas.IsFeelingDown=0 then (select ltv.ItemId from LookupItemView ltv where ltv.ItemName='No'  and ltv.MasterName='GeneralYesNo') 
 WHEN pas.IsFeelingDown=1 then (select ltv.ItemId from LookupItemView ltv where ltv.ItemName='Yes'  and ltv.MasterName='GeneralYesNo') end as ScreeningValueid
  ,Comment = null,Active=0,DeleteFlag=0,CreatedBy=1,CreateDate=psv.CreatedDate,psv.VisitDate
 from PatientScreeningVisit psv  inner join dtl_PatientAlcoholDepressionScreening pas
on  pas.Ptn_pk=psv.Ptn_pk and pas.Visit_Id=psv.Visit_Id 
where  pas.IsFeelingDown is not null
union
Select psv.PatientId,psv.PatientMasterVisitId, (select  liv.MasterId  from LookupItemView liv where liv.ItemName='DSQuestion2') as ScreeningTypeId,1 as ScreeningDone,psv.VisitDate as ScreeningDate,(select  liv.ItemId from LookupItemView liv where liv.ItemName='DSQuestion2'),
CASE WHEN pas.IsLittleInterest=0 then (select ltv.ItemId from LookupItemView ltv where ltv.ItemName='No'  and ltv.MasterName='GeneralYesNo') 
 WHEN pas.IsLittleInterest=1 then (select ltv.ItemId from LookupItemView ltv where ltv.ItemName='Yes'  and ltv.MasterName='GeneralYesNo') end as ScreeningValueid
  ,Comment = null,Active=0,DeleteFlag=0,CreatedBy=1,CreateDate=psv.CreatedDate,psv.VisitDate
 from PatientScreeningVisit psv inner join dtl_PatientAlcoholDepressionScreening pas
on pas.Ptn_pk=psv.Ptn_pk and pas.Visit_Id=psv.Visit_Id 
where pas.IsLittleInterest is not null
union
Select psv.PatientId,psv.PatientMasterVisitId, (select Id from  LookupMaster  where  Name= 'DepressionScreeningQuestions') as ScreeningTypeId,1 as ScreeningDone,psv.VisitDate as ScreeningDate, (select liv.ItemId from LookupItemView liv where liv.ItemName='PHQ9Question1') as ScreeningCategoryId,
CASE WHEN pas.PHQLittleInterest='0' then  (select ItemId from LookupItemView where MasterName='DepressionFrequency' and ItemName='NotatAll')
when pas.PHQLittleInterest='1' then (select ItemId from LookupItemView where MasterName='DepressionFrequency' and ItemName='SeveralDays')
when pas.PHQLittleInterest='2' then (select ItemId from LookupItemView where MasterName='DepressionFrequency' and ItemName='Morethanhalfthedays')
when pas.PHQLittleInterest='3' then (select ItemId from LookupItemView where MasterName='DepressionFrequency' and ItemName='NearlyEveryDay')
 end as ScreeningValueid
  ,Comment = null,Active=0,DeleteFlag=0,CreatedBy=1,CreateDate=psv.CreatedDate,psv.VisitDate
 from PatientScreeningVisit psv inner join dtl_PatientAlcoholDepressionScreening pas
on pas.Ptn_pk=psv.Ptn_pk and pas.Visit_Id=psv.Visit_Id 
where pas.PHQLittleInterest is not null
union
 Select psv.PatientId,psv.PatientMasterVisitId, (select Id from  LookupMaster  where  Name= 'DepressionScreeningQuestions') as ScreeningTypeId,1 as ScreeningDone,psv.VisitDate as ScreeningDate, (select liv.ItemId  from LookupItemView liv where liv.ItemName='PHQ9Questions2' )as ScreeningCategoryId,
CASE WHEN pas.PHQFeelingDown='0' then  (select ItemId from LookupItemView where MasterName='DepressionFrequency' and ItemName='NotatAll')
when pas.PHQFeelingDown='1' then (select ItemId from LookupItemView where MasterName='DepressionFrequency' and ItemName='SeveralDays')
when pas.PHQFeelingDown='2' then (select ItemId from LookupItemView where MasterName='DepressionFrequency' and ItemName='Morethanhalfthedays')
 WHEN pas.PHQFeelingDown='3' then (select ItemId from LookupItemView where MasterName='DepressionFrequency' and ItemName='NearlyEveryDay')
 end as ScreeningValueid
  ,Comment = null,Active=0,DeleteFlag=0,CreatedBy=1,CreateDate=psv.CreatedDate,psv.VisitDate
 from PatientScreeningVisit psv inner join dtl_PatientAlcoholDepressionScreening pas
on pas.Ptn_pk=psv.Ptn_pk and pas.Visit_Id=psv.Visit_Id 
where  pas.PHQFeelingDown is not null
union
 Select psv.PatientId,psv.PatientMasterVisitId, (select Id from  LookupMaster  where  Name= 'DepressionScreeningQuestions') as ScreeningTypeId,1 as ScreeningDone,psv.VisitDate as ScreeningDate, (select liv.ItemId from LookupItemView liv where liv.ItemName='PHQ9Questions3') as ScreeningCategoryId,
CASE WHEN pas.PHQTroubleSleep='0' then  (select ItemId from LookupItemView where MasterName='DepressionFrequency' and ItemName='NotatAll')
when pas.PHQTroubleSleep='1' then (select ItemId from LookupItemView where MasterName='DepressionFrequency' and ItemName='SeveralDays')
when pas.PHQTroubleSleep='2' then (select ItemId from LookupItemView where MasterName='DepressionFrequency' and ItemName='Morethanhalfthedays')
 WHEN pas.PHQTroubleSleep='3' then (select ItemId from LookupItemView where MasterName='DepressionFrequency' and ItemName='NearlyEveryDay')
 end as ScreeningValueid
  ,Comment = null,Active=0,DeleteFlag=0,CreatedBy=1,CreateDate=psv.CreatedDate,psv.VisitDate
 from PatientScreeningVisit psv inner join dtl_PatientAlcoholDepressionScreening pas
on pas.Ptn_pk=psv.Ptn_pk and pas.Visit_Id=psv.Visit_Id and pas.PHQTroubleSleep is not null
union

 Select psv.PatientId,psv.PatientMasterVisitId, (select Id from  LookupMaster  where  Name= 'DepressionScreeningQuestions') as ScreeningTypeId,1 as ScreeningDone,psv.VisitDate as ScreeningDate, (select liv.ItemId  from  LookupItemView liv where liv.ItemName='PHQ9Questions4')  as ScreeningCategoryId,
CASE WHEN pas.PHQTiredLittleEnergy='0' then  (select ItemId from LookupItemView where MasterName='DepressionFrequency' and ItemName='NotatAll')
when pas.PHQTiredLittleEnergy='1' then (select ItemId from LookupItemView where MasterName='DepressionFrequency' and ItemName='SeveralDays')
when pas.PHQTiredLittleEnergy='2' then (select ItemId from LookupItemView where MasterName='DepressionFrequency' and ItemName='Morethanhalfthedays')
 WHEN pas.PHQTiredLittleEnergy='3' then (select ItemId from LookupItemView where MasterName='DepressionFrequency' and ItemName='NearlyEveryDay')
 end as ScreeningValueid
  ,Comment = null,Active=0,DeleteFlag=0,CreatedBy=1,CreateDate=psv.CreatedDate,psv.VisitDate
 from PatientScreeningVisit psv inner join dtl_PatientAlcoholDepressionScreening pas on
pas.Ptn_pk=psv.Ptn_pk and pas.Visit_Id=psv.Visit_Id 
where pas.PHQTiredLittleEnergy is not null
 union
 
 Select psv.PatientId,psv.PatientMasterVisitId, (select Id from  LookupMaster  where  Name= 'DepressionScreeningQuestions') as ScreeningTypeId,1 as ScreeningDone,psv.VisitDate as ScreeningDate,
 (select liv.ItemId  from LookupItemView liv where liv.ItemName ='PHQ9Questions5')  as ScreeningCategoryId,
CASE WHEN pas.PHQAppetite='0' then  (select ItemId from LookupItemView where MasterName='DepressionFrequency' and ItemName='NotatAll')
when  pas.PHQAppetite='1' then (select ItemId from LookupItemView where MasterName='DepressionFrequency' and ItemName='SeveralDays')
when  pas.PHQAppetite='2' then (select ItemId from LookupItemView where MasterName='DepressionFrequency' and ItemName='Morethanhalfthedays')
 WHEN  pas.PHQAppetite='3' then (select ItemId from LookupItemView where MasterName='DepressionFrequency' and ItemName='NearlyEveryDay')
 end as ScreeningValueid
  ,Comment = null,Active=0,DeleteFlag=0,CreatedBy=1,CreateDate=psv.CreatedDate,psv.VisitDate
 from PatientScreeningVisit psv inner join dtl_PatientAlcoholDepressionScreening pas
on  pas.Ptn_pk=psv.Ptn_pk and pas.Visit_Id=psv.Visit_Id and pas.PHQAppetite is not null
 
  union

   Select psv.PatientId,psv.PatientMasterVisitId, (select Id from  LookupMaster  where  Name= 'DepressionScreeningQuestions') as ScreeningTypeId,1 as ScreeningDone,psv.VisitDate as ScreeningDate, (select liv.ItemId from LookupItemView liv where liv.ItemName='PHQ9Questions6') as ScreeningCategoryId,
CASE WHEN pas.PHQYourselfDown='0' then  (select ItemId from LookupItemView where MasterName='DepressionFrequency' and ItemName='NotatAll')
when  pas.PHQYourselfDown='1' then (select ItemId from LookupItemView where MasterName='DepressionFrequency' and ItemName='SeveralDays')
when  pas.PHQYourselfDown='2' then (select ItemId from LookupItemView where MasterName='DepressionFrequency' and ItemName='Morethanhalfthedays')
 WHEN  pas.PHQYourselfDown='3' then (select ItemId from LookupItemView where MasterName='DepressionFrequency' and ItemName='NearlyEveryDay')
 end as ScreeningValueid
  ,Comment = null,Active=0,DeleteFlag=0,CreatedBy=1,CreateDate=psv.CreatedDate,psv.VisitDate
 from PatientScreeningVisit psv inner join dtl_PatientAlcoholDepressionScreening pas
on  pas.Ptn_pk=psv.Ptn_pk and pas.Visit_Id=psv.Visit_Id and pas.PHQYourselfDown is not null
  union

    Select psv.PatientId,psv.PatientMasterVisitId, (select Id from  LookupMaster  where  Name= 'DepressionScreeningQuestions') as ScreeningTypeId,1 as ScreeningDone,psv.VisitDate as ScreeningDate,(select liv.ItemId  from LookupItemView liv where liv.ItemName='PHQ9Questions7') as ScreeningCategoryId,
CASE WHEN pas.PHQTroubleConcentrating='0' then  (select ItemId from LookupItemView where MasterName='DepressionFrequency' and ItemName='NotatAll')
when  pas.PHQTroubleConcentrating='1' then (select ItemId from LookupItemView where MasterName='DepressionFrequency' and ItemName='SeveralDays')
when  pas.PHQTroubleConcentrating='2' then (select ItemId from LookupItemView where MasterName='DepressionFrequency' and ItemName='Morethanhalfthedays')
 WHEN  pas.PHQTroubleConcentrating='3' then (select ItemId from LookupItemView where MasterName='DepressionFrequency' and ItemName='NearlyEveryDay')
 end as ScreeningValueid
  ,Comment = null,Active=0,DeleteFlag=0,CreatedBy=1,CreateDate=psv.CreatedDate,psv.VisitDate
 from PatientScreeningVisit psv inner join dtl_PatientAlcoholDepressionScreening pas
on  pas.Ptn_pk=psv.Ptn_pk and pas.Visit_Id=psv.Visit_Id 
where  pas.PHQTroubleConcentrating is not null
union

Select psv.PatientId,psv.PatientMasterVisitId, (select Id from  LookupMaster  where  Name= 'DepressionScreeningQuestions') as ScreeningTypeId,1 as ScreeningDone,psv.VisitDate as ScreeningDate,(select liv.ItemId from LookupItemView liv where liv.ItemName='PHQ9Questions8') as ScreeningCategoryId,
CASE WHEN pas.PHQMovingSlowly='0' then  (select ItemId from LookupItemView where MasterName='DepressionFrequency' and ItemName='NotatAll')
when  pas.PHQMovingSlowly='1' then (select ItemId from LookupItemView where MasterName='DepressionFrequency' and ItemName='SeveralDays')
when   pas.PHQMovingSlowly='2' then (select ItemId from LookupItemView where MasterName='DepressionFrequency' and ItemName='Morethanhalfthedays')
 WHEN   pas.PHQMovingSlowly='3' then (select ItemId from LookupItemView where MasterName='DepressionFrequency' and ItemName='NearlyEveryDay')
 end as ScreeningValueid
  ,Comment = null,Active=0,DeleteFlag=0,CreatedBy=1,CreateDate=psv.CreatedDate,psv.VisitDate
 from PatientScreeningVisit psv inner join dtl_PatientAlcoholDepressionScreening pas
 on pas.Ptn_pk=psv.Ptn_pk and pas.Visit_Id=psv.Visit_Id where  pas.PHQMovingSlowly is not null
union
Select psv.PatientId,psv.PatientMasterVisitId, (select Id from  LookupMaster  where  Name= 'DepressionScreeningQuestions') as ScreeningTypeId,1 as ScreeningDone,psv.VisitDate as ScreeningDate, (select liv.ItemId from LookupItemView liv where liv.ItemName='PHQ9Questions9' ) as ScreeningCategoryId,
CASE WHEN pas.PHQFidgetyRestless='0' then  (select ItemId from LookupItemView where MasterName='DepressionFrequency' and ItemName='NotatAll')
when pas.PHQFidgetyRestless='1' then (select ItemId from LookupItemView where MasterName='DepressionFrequency' and ItemName='SeveralDays')
when   pas.PHQFidgetyRestless='2' then (select ItemId from LookupItemView where MasterName='DepressionFrequency' and ItemName='Morethanhalfthedays')
 WHEN   pas.PHQFidgetyRestless='3' then (select ItemId from LookupItemView where MasterName='DepressionFrequency' and ItemName='NearlyEveryDay')
 end as ScreeningValueid
  ,Comment = null,Active=0,DeleteFlag=0,CreatedBy=1,CreateDate=psv.CreatedDate,psv.VisitDate
 from PatientScreeningVisit psv inner join dtl_PatientAlcoholDepressionScreening pas
on pas.Ptn_pk=psv.Ptn_pk and pas.Visit_Id=psv.Visit_Id and  pas.PHQFidgetyRestless is not null
union

Select psv.PatientId,psv.PatientMasterVisitId, (select Id from  LookupMaster  where  Name= 'DepressionScreeningQuestions') as ScreeningTypeId,1 as ScreeningDone,psv.VisitDate as ScreeningDate,
 (select liv.ItemId from LookupItemView liv where liv.ItemName='PHQ9Questions10') as ScreeningCategoryId,
CASE WHEN pas.PHQHurtingYourself='0' then  (select ItemId from LookupItemView where MasterName='DepressionFrequency' and ItemName='NotatAll')
when pas.PHQHurtingYourself='1' then (select ItemId from LookupItemView where MasterName='DepressionFrequency' and ItemName='SeveralDays')
when   pas.PHQHurtingYourself='2' then (select ItemId from LookupItemView where MasterName='DepressionFrequency' and ItemName='Morethanhalfthedays')
 WHEN   pas.PHQHurtingYourself='3' then (select ItemId from LookupItemView where MasterName='DepressionFrequency' and ItemName='NearlyEveryDay')
 end as ScreeningValueid
  ,Comment = null,Active=0,DeleteFlag=0,CreatedBy=1,CreateDate=psv.CreatedDate,psv.VisitDate
 from PatientScreeningVisit psv inner join dtl_PatientAlcoholDepressionScreening pas
 on pas.Ptn_pk=psv.Ptn_pk and pas.Visit_Id=psv.Visit_Id and  pas.PHQHurtingYourself is not null),

PatientGBVViolence as (

--GBV Violence
Select psv.PatientId,psv.PatientMasterVisitId, (select liv.MasterId  from LookupItemView liv where liv.ItemName='GBVQuestion1') as ScreeningTypeId,1 as ScreeningDone,psv.VisitDate as ScreeningDate,(select liv.ItemId  from LookupItemView liv where liv.ItemName='GBVQuestion1') as ScreeningCategoryId,
CASE WHEN pas.SGBQ1=0 then (select ltv.ItemId from LookupItemView ltv where ltv.ItemName='No'  and ltv.MasterName='GeneralYesNo') 
 WHEN pas.SGBQ1=1 then (select ltv.ItemId from LookupItemView ltv where ltv.ItemName='Yes'  and ltv.MasterName='GeneralYesNo') end as ScreeningValueid
  ,Comment = null,Active=0,DeleteFlag=0,CreatedBy=1,CreateDate=psv.CreatedDate,psv.VisitDate
 from PatientScreeningVisit psv inner join dtl_PatientAlcoholDepressionScreening pas
on pas.Ptn_pk=psv.Ptn_pk and pas.Visit_Id=psv.Visit_Id 
where pas.IsLittleInterest is not null
union
Select psv.PatientId,psv.PatientMasterVisitId, (select liv.ItemId  from LookupItemView liv where liv.ItemName='GbvPhysicallyHurt') as ScreeningTypeId,1 as ScreeningDone,psv.VisitDate as ScreeningDate, (select  ltt.ItemId from LookupItemView ltt where  ltt.ItemName='GBVAssessment' and ltt.MasterName='ScreeningCategory') as ScreeningCategoryId,
CASE WHEN pas.SGBQ1=0 then (select ltv.ItemId from LookupItemView ltv where ltv.ItemName='No'  and ltv.MasterName='GeneralYesNo') 
 WHEN pas.SGBQ1=1 then (select ltv.ItemId from LookupItemView ltv where ltv.ItemName='Yes'  and ltv.MasterName='GeneralYesNo') end as ScreeningValueid
  ,Comment = null,Active=0,DeleteFlag=0,CreatedBy=1,CreateDate=psv.CreatedDate,psv.VisitDate
 from PatientScreeningVisit psv inner join dtl_PatientAlcoholDepressionScreening pas
on  pas.Ptn_pk=psv.Ptn_pk and pas.Visit_Id=psv.Visit_Id 
where pas.SGBQ1 is not null


union

Select psv.PatientId,psv.PatientMasterVisitId, (select liv.MasterId from LookupItemView liv  where liv.ItemName='GBVQuestion2') as ScreeningTypeId,1 as ScreeningDone,psv.VisitDate as ScreeningDate,
(select liv.ItemId  from  LookupItemView liv  where liv.ItemName='GBVQuestion2') as ScreeningCategoryId,
CASE WHEN pas.SGBQ2=0 then (select ltv.ItemId from LookupItemView ltv where ltv.ItemName='No'  and ltv.MasterName='GeneralYesNo') 
 WHEN pas.SGBQ2=1 then (select ltv.ItemId from LookupItemView ltv where ltv.ItemName='Yes'  and ltv.MasterName='GeneralYesNo') end as ScreeningValueid
  ,Comment = null,Active=0,DeleteFlag=0,CreatedBy=1,CreateDate=psv.CreatedDate,psv.VisitDate
 from PatientScreeningVisit psv inner join dtl_PatientAlcoholDepressionScreening pas
on  pas.Ptn_pk=psv.Ptn_pk and pas.Visit_Id=psv.Visit_Id where pas.SGBQ2 is not null
union
Select psv.PatientId,psv.PatientMasterVisitId, (select liv.ItemId from LookupItemView liv where liv.ItemName='GbvRelationshipPhysicalAssault')  as ScreeningTypeId,1 as ScreeningDone,psv.VisitDate as ScreeningDate,(select ltt.ItemId from LookupItemView ltt where  ltt.ItemName='GBVAssessment' and ltt.MasterName='ScreeningCategory') as ScreeningCategoryId,
CASE WHEN pas.SGBQ2=0 then (select ltv.ItemId from LookupItemView ltv where ltv.ItemName='No'  and ltv.MasterName='GeneralYesNo') 
 WHEN pas.SGBQ2=1 then (select ltv.ItemId from LookupItemView ltv where ltv.ItemName='Yes'  and ltv.MasterName='GeneralYesNo') end as ScreeningValueid
  ,Comment = null,Active=0,DeleteFlag=0,CreatedBy=1,CreateDate=psv.CreatedDate,psv.VisitDate
 from PatientScreeningVisit psv inner join dtl_PatientAlcoholDepressionScreening pas on pas.Ptn_pk=psv.Ptn_pk and pas.Visit_Id=psv.Visit_Id and pas.SGBQ2 is not null
union

Select psv.PatientId,psv.PatientMasterVisitId, (select liv.MasterId from LookupItemView liv where liv.ItemName='GBVQuestion3') as ScreeningTypeId,1 as ScreeningDone,psv.VisitDate as ScreeningDate, (select liv.ItemId from LookupItemView liv where liv.ItemName='GBVQuestion3') as ScreeningCategoryId,
CASE WHEN pas.SGBQ3=0 then (select ltv.ItemId from LookupItemView ltv where ltv.ItemName='No'  and ltv.MasterName='GeneralYesNo') 
 WHEN pas.SGBQ3=1 then (select ltv.ItemId from LookupItemView ltv where ltv.ItemName='Yes'  and ltv.MasterName='GeneralYesNo') end as ScreeningValueid
  ,Comment = null,Active=0,DeleteFlag=0,CreatedBy=1,CreateDate=psv.CreatedDate,psv.VisitDate
 from PatientScreeningVisit psv inner join dtl_PatientAlcoholDepressionScreening pas
 on  pas.Ptn_pk=psv.Ptn_pk and pas.Visit_Id=psv.Visit_Id 
 where  pas.SGBQ3 is not null
union
Select psv.PatientId,psv.PatientMasterVisitId, (select  liv.ItemId from LookupItemView liv where liv.ItemName='GbvRelationshipVerbalAssault' )  as ScreeningTypeId,1 as ScreeningDone,psv.VisitDate as ScreeningDate,(select ltt.ItemId from LookupItemView ltt where  ltt.ItemName='GBVAssessment' and ltt.MasterName='ScreeningCategory') as ScreeningCategoryId,
CASE WHEN pas.SGBQ3=0 then (select ltv.ItemId from LookupItemView ltv where ltv.ItemName='No'  and ltv.MasterName='GeneralYesNo') 
 WHEN pas.SGBQ3=1 then (select ltv.ItemId from LookupItemView ltv where ltv.ItemName='Yes'  and ltv.MasterName='GeneralYesNo') end as ScreeningValueid
  ,Comment = null,Active=0,DeleteFlag=0,CreatedBy=1,CreateDate=psv.CreatedDate,psv.VisitDate
 from PatientScreeningVisit psv inner join dtl_PatientAlcoholDepressionScreening pas
on pas.Ptn_pk=psv.Ptn_pk and pas.Visit_Id=psv.Visit_Id 
where pas.SGBQ3 is not null
union


Select psv.PatientId,psv.PatientMasterVisitId, (select liv.MasterId  from LookupItemView liv where liv.ItemName='GBVQuestion4') as ScreeningTypeId,1 as ScreeningDone,psv.VisitDate as ScreeningDate,(select liv.ItemId from LookupItemView liv where liv.ItemName='GBVQuestion4') as ScreeningCategoryId,
CASE WHEN pas.SGBQ4=0 then (select ltv.ItemId from LookupItemView ltv where ltv.ItemName='No'  and ltv.MasterName='GeneralYesNo') 
 WHEN pas.SGBQ4=1 then (select ltv.ItemId from LookupItemView ltv where ltv.ItemName='Yes'  and ltv.MasterName='GeneralYesNo') end as ScreeningValueid
  ,Comment = null,Active=0,DeleteFlag=0,CreatedBy=1,CreateDate=psv.CreatedDate,psv.VisitDate
 from PatientScreeningVisit psv inner join  dtl_PatientAlcoholDepressionScreening pas
on pas.Ptn_pk=psv.Ptn_pk and pas.Visit_Id=psv.Visit_Id 
where pas.IsLittleInterest is not null

union

Select psv.PatientId,psv.PatientMasterVisitId, (select liv.ItemId  from LookupItemView liv where liv.ItemName ='GbvRelationshipUncomfSexAct')  as ScreeningTypeId
,1 as ScreeningDone,psv.VisitDate as ScreeningDate,(select ltt.ItemId  from LookupItemView ltt where  ltt.ItemName='GBVAssessment' and ltt.MasterName='ScreeningCategory') as ScreeningCategoryId,
CASE WHEN pas.SGBQ4=0 then (select ltv.ItemId from LookupItemView ltv where ltv.ItemName='No'  and ltv.MasterName='GeneralYesNo') 
 WHEN pas.SGBQ4=1 then (select ltv.ItemId from LookupItemView ltv where ltv.ItemName='Yes'  and ltv.MasterName='GeneralYesNo') end as ScreeningValueid
  ,Comment = null,Active=0,DeleteFlag=0,CreatedBy=1,CreateDate=psv.CreatedDate,psv.VisitDate
 from PatientScreeningVisit psv inner join dtl_PatientAlcoholDepressionScreening pas on 
 pas.Ptn_pk=psv.Ptn_pk and pas.Visit_Id=psv.Visit_Id 
 where pas.SGBQ4 is not null
union

Select psv.PatientId,psv.PatientMasterVisitId, (select liv.MasterId from LookupItemView liv  where liv.ItemName='GBVQuestion5' ) as ScreeningTypeId,1 as ScreeningDone,psv.VisitDate as ScreeningDate, (select liv.ItemId  from LookupItemView liv  where liv.ItemName='GBVQuestion5') as ScreeningCategoryId,
CASE WHEN pas.SGBQ5=0 then (select ltv.ItemId from LookupItemView ltv where ltv.ItemName='No'  and ltv.MasterName='GeneralYesNo') 
 WHEN pas.SGBQ5=1 then (select ltv.ItemId from LookupItemView ltv where ltv.ItemName='Yes'  and ltv.MasterName='GeneralYesNo') end as ScreeningValueid
  ,Comment = null,Active=0,DeleteFlag=0,CreatedBy=1,CreateDate=psv.CreatedDate,psv.VisitDate
 from PatientScreeningVisit psv
 inner join dtl_PatientAlcoholDepressionScreening pas on  pas.Ptn_pk=psv.Ptn_pk and pas.Visit_Id=psv.Visit_Id 
 where pas.IsLittleInterest is not null


union

Select psv.PatientId,psv.PatientMasterVisitId, (select liv.ItemId from LookupItemView liv where liv.ItemName='GbvNonRelationshipViolence' and liv.MasterName='GBVAssessment' )  as ScreeningTypeId,1 as ScreeningDone,psv.VisitDate as ScreeningDate, (select ltt.ItemId from LookupItemView ltt where ltt.ItemName='GBVAssessment' and ltt.MasterName='ScreeningCategory') as ScreeningCategoryId,
CASE WHEN pas.SGBQ5=0 then (select ltv.ItemId from LookupItemView ltv where ltv.ItemName='No'  and ltv.MasterName='GeneralYesNo') 
 WHEN pas.SGBQ5=1 then (select ltv.ItemId from LookupItemView ltv where ltv.ItemName='Yes'  and ltv.MasterName='GeneralYesNo') end as ScreeningValueid
  ,Comment = null,Active=0,DeleteFlag=0,CreatedBy=1,CreateDate=psv.CreatedDate,psv.VisitDate
 from PatientScreeningVisit psv
 inner join dtl_PatientAlcoholDepressionScreening pas on pas.Ptn_pk=psv.Ptn_pk and pas.Visit_Id=psv.Visit_Id 
 where pas.SGBQ5 is not null


),



patientCAGE as(
Select psv.PatientId,psv.PatientMasterVisitId, (select Id from  LookupMaster  where  Name='SmokingScreeningQuestions') as  ScreeningTypeId,1 as ScreeningDone,psv.VisitDate as ScreeningDate, (select liv.ItemId from LookupItemView liv 
where liv.ItemName='DrinkAlcohol' and liv.MasterName='SocialHistoryQuestions') 
 as ScreeningCategoryId,
lc.ItemId  as ScreeningValueid  
  ,Comment = null,Active=0,DeleteFlag=0,CreatedBy=1,CreateDate=psv.CreatedDate,psv.VisitDate
 from PatientScreeningVisit psv
 
 inner join dtl_PatientAlcoholDepressionScreening pas on pas.Ptn_pk=psv.Ptn_pk and pas.Visit_Id=psv.Visit_Id
 inner join LookupCage lc on  lc.ItemTypeId=pas.CageAIDAlcohol and lc.ItemType='CageAidAlcohol'  and  (pas.CageAIDAlcohol is not null or pas.CageAIDAlcohol > 0)

union

Select psv.PatientId,psv.PatientMasterVisitId, (select Id from  LookupMaster  where  Name='SmokingScreeningQuestions') as  ScreeningTypeId,1 as ScreeningDone,psv.VisitDate as ScreeningDate, (select liv.ItemId from LookupItemView liv 
where liv.ItemName='Smoke' and liv.MasterName='SocialHistoryQuestions') 
 as ScreeningCategoryId,
lc.ItemId  as ScreeningValueid  
  ,Comment = null,Active=0,DeleteFlag=0,CreatedBy=1,CreateDate=psv.CreatedDate,psv.VisitDate
 from PatientScreeningVisit psv
 
 inner join dtl_PatientAlcoholDepressionScreening pas on pas.Ptn_pk=psv.Ptn_pk and pas.Visit_Id=psv.Visit_Id
 inner join LookupCage lc on  lc.ItemTypeId=pas.CageAIDSmoke and lc.ItemType='CageAIDSmoke'  and  (pas.CageAIDSmoke is not null or pas.CageAIDSmoke > 0)





union


Select psv.PatientId,psv.PatientMasterVisitId, (select Id from  LookupMaster  where  Name='SmokingScreeningQuestions') as  ScreeningTypeId,1 as ScreeningDone,psv.VisitDate as ScreeningDate, (select liv.ItemId from LookupItemView liv 
where liv.ItemName='UseDrugs' and liv.MasterName='SocialHistoryQuestions') 
 as ScreeningCategoryId,
lc.ItemId  as ScreeningValueid  
  ,Comment = null,Active=0,DeleteFlag=0,CreatedBy=1,CreateDate=psv.CreatedDate,psv.VisitDate
 from PatientScreeningVisit psv
 
 inner join dtl_PatientAlcoholDepressionScreening pas on pas.Ptn_pk=psv.Ptn_pk and pas.Visit_Id=psv.Visit_Id
 inner join LookupCage lc on  lc.ItemTypeId=pas.CageAIDDrugs and lc.ItemType='CageAIDDrugs'  and  (pas.CageAIDDrugs is not null or pas.CageAIDDrugs > 0)


union

Select psv.PatientId,psv.PatientMasterVisitId, (select Id from  LookupMaster  where  Name='SmokingScreeningQuestions') as  ScreeningTypeId,1 as ScreeningDone,psv.VisitDate as ScreeningDate,(select liv.ItemId from LookupItemView liv where liv.ItemName='AlcoholScreeningQuestion1') as ScreeningCategoryId,
CASE WHEN pas.CageAIDQ1=0 then (select ltv.ItemId from LookupItemView ltv where ltv.ItemName='No'  and ltv.MasterName='GeneralYesNo') 
 WHEN  pas.CageAIDQ1=1 then (select ltv.ItemId from LookupItemView ltv where ltv.ItemName='Yes'  and ltv.MasterName='GeneralYesNo') end as ScreeningValueid
  ,Comment = null,Active=0,DeleteFlag=0,CreatedBy=1,CreateDate=psv.CreatedDate,psv.VisitDate
 from PatientScreeningVisit psv inner join dtl_PatientAlcoholDepressionScreening pas
on  pas.Ptn_pk=psv.Ptn_pk and pas.Visit_Id=psv.Visit_Id where  pas.CageAIDQ1 is not null

union




Select psv.PatientId,psv.PatientMasterVisitId, (select Id from  LookupMaster  where  Name='SmokingScreeningQuestions') as  ScreeningTypeId,1 as ScreeningDone,psv.VisitDate as ScreeningDate, (select liv.ItemId from LookupItemView liv where liv.ItemName='AlcoholScreeningQuestion2') as ScreeningCategoryId,
CASE WHEN pas.CageAIDQ2=0 then (select ltv.ItemId from LookupItemView ltv where ltv.ItemName='No'  and ltv.MasterName='GeneralYesNo') 
 WHEN  pas.CageAIDQ2=1 then (select ltv.ItemId from LookupItemView ltv where ltv.ItemName='Yes'  and ltv.MasterName='GeneralYesNo') end as ScreeningValueid
  ,Comment = null,Active=0,DeleteFlag=0,CreatedBy=1,CreateDate=psv.CreatedDate,psv.VisitDate
 from PatientScreeningVisit psv inner join dtl_PatientAlcoholDepressionScreening pas
 on  pas.Ptn_pk=psv.Ptn_pk and pas.Visit_Id=psv.Visit_Id 
 where  pas.CageAIDQ2 is not null

union

Select psv.PatientId,psv.PatientMasterVisitId, (select Id from  LookupMaster  where  Name='SmokingScreeningQuestions') as  ScreeningTypeId,1 as ScreeningDone,psv.VisitDate as ScreeningDate,
(select liv.ItemId from LookupItemView liv where liv.ItemName='AlcoholScreeningQuestion3')  as ScreeningCategoryId,
CASE WHEN pas.CageAIDQ3=0 then (select ltv.ItemId from LookupItemView ltv where ltv.ItemName='No'  and ltv.MasterName='GeneralYesNo') 
 WHEN  pas.CageAIDQ3=1 then (select ltv.ItemId from LookupItemView ltv where ltv.ItemName='Yes'  and ltv.MasterName='GeneralYesNo') end as ScreeningValueid
  ,Comment = null,Active=0,DeleteFlag=0,CreatedBy=1,CreateDate=psv.CreatedDate,psv.VisitDate
 from PatientScreeningVisit psv inner join dtl_PatientAlcoholDepressionScreening pas
on pas.Ptn_pk=psv.Ptn_pk and pas.Visit_Id=psv.Visit_Id where pas.CageAIDQ3 is not null
union

Select psv.PatientId,psv.PatientMasterVisitId, (select Id from  LookupMaster  where  Name='SmokingScreeningQuestions') as  ScreeningTypeId,1 as ScreeningDone,psv.VisitDate as ScreeningDate,
(select liv.ItemId  from LookupItemView liv where liv.ItemName='AlcoholScreeningQuestion4') as ScreeningCategoryId,
CASE WHEN pas.CageAIDQ4=0 then (select ltv.ItemId from LookupItemView ltv where ltv.ItemName='No'  and ltv.MasterName='GeneralYesNo') 
 WHEN  pas.CageAIDQ4=1 then (select ltv.ItemId from LookupItemView ltv where ltv.ItemName='Yes'  and ltv.MasterName='GeneralYesNo') end as ScreeningValueid
  ,Comment = null,Active=0,DeleteFlag=0,CreatedBy=1,CreateDate=psv.CreatedDate,psv.VisitDate
 from PatientScreeningVisit psv inner join dtl_PatientAlcoholDepressionScreening pas
on  pas.Ptn_pk=psv.Ptn_pk and pas.Visit_Id=psv.Visit_Id where
  pas.CageAIDQ4 is not null


),

patientcrafft AS (
Select psv.PatientId,psv.PatientMasterVisitId, (select liv.iD  from LookupMaster liv where  liv.Name='CRAFFTScoreQuestions') as ScreeningTypeId,1 as ScreeningDone,psv.VisitDate as ScreeningDate,(select liv.ItemId from LookupItemView liv where  liv.ItemName='CRAFFTScreeningQuestion1') as ScreeningCategoryId,
CASE WHEN pas.CrafftAlcohol=0 then (select ltv.ItemId from LookupItemView ltv where ltv.ItemName='No'  and ltv.MasterName='GeneralYesNo') 
 WHEN pas.CrafftAlcohol=1 then (select ltv.ItemId from LookupItemView ltv where ltv.ItemName='Yes'  and ltv.MasterName='GeneralYesNo') end as ScreeningValueid
  ,Comment = null,Active=0,DeleteFlag=0,CreatedBy=1,CreateDate=psv.CreatedDate,psv.VisitDate
 from PatientScreeningVisit psv  inner join dtl_PatientAlcoholDepressionScreening pas
on  pas.Ptn_pk=psv.Ptn_pk and pas.Visit_Id=psv.Visit_Id 
where  pas.CrafftAlcohol is not null

UNION


Select psv.PatientId,psv.PatientMasterVisitId, (select liv.iD  from LookupMaster liv where  liv.Name='CRAFFTScoreQuestions') as ScreeningTypeId,1 as ScreeningDone,psv.VisitDate as ScreeningDate,(select liv.ItemId from LookupItemView liv where  liv.ItemName='CRAFFTScreeningQuestion2') as ScreeningCategoryId,
CASE WHEN pas.CrafftSmoke=0 then (select ltv.ItemId from LookupItemView ltv where ltv.ItemName='No'  and ltv.MasterName='GeneralYesNo') 
 WHEN pas.CrafftSmoke=1 then (select ltv.ItemId from LookupItemView ltv where ltv.ItemName='Yes'  and ltv.MasterName='GeneralYesNo') end as ScreeningValueid
  ,Comment = null,Active=0,DeleteFlag=0,CreatedBy=1,CreateDate=psv.CreatedDate,psv.VisitDate
 from PatientScreeningVisit psv  inner join dtl_PatientAlcoholDepressionScreening pas
on  pas.Ptn_pk=psv.Ptn_pk and pas.Visit_Id=psv.Visit_Id 
where  pas.CrafftSmoke is not null

union

Select psv.PatientId,psv.PatientMasterVisitId, (select liv.iD  from LookupMaster liv where  liv.Name='CRAFFTScoreQuestions') as ScreeningTypeId,1 as ScreeningDone,psv.VisitDate as ScreeningDate,(select liv.ItemId from LookupItemView liv where  liv.ItemName='CRAFFTScreeningQuestion3') as ScreeningCategoryId,
CASE WHEN pas.CrafftAnythingHigh=0 then (select ltv.ItemId from LookupItemView ltv where ltv.ItemName='No'  and ltv.MasterName='GeneralYesNo') 
 WHEN pas.CrafftAnythingHigh=1 then (select ltv.ItemId from LookupItemView ltv where ltv.ItemName='Yes'  and ltv.MasterName='GeneralYesNo') end as ScreeningValueid
  ,Comment = null,Active=0,DeleteFlag=0,CreatedBy=1,CreateDate=psv.CreatedDate,psv.VisitDate
 from PatientScreeningVisit psv  inner join dtl_PatientAlcoholDepressionScreening pas
on  pas.Ptn_pk=psv.Ptn_pk and pas.Visit_Id=psv.Visit_Id 
where  pas.CrafftAnythingHigh is not null

union

Select psv.PatientId,psv.PatientMasterVisitId, (select liv.iD  from LookupMaster liv where  liv.Name='CRAFFTScoreQuestions') as ScreeningTypeId,1 as ScreeningDone,psv.VisitDate as ScreeningDate,(select liv.ItemId from LookupItemView liv where  liv.ItemName='CRAFFTScoreQuestion1') as ScreeningCategoryId,
CASE WHEN pas.CrafftC=0 then (select ltv.ItemId from LookupItemView ltv where ltv.ItemName='No'  and ltv.MasterName='GeneralYesNo') 
 WHEN pas.CrafftC=1 then (select ltv.ItemId from LookupItemView ltv where ltv.ItemName='Yes'  and ltv.MasterName='GeneralYesNo') end as ScreeningValueid
  ,Comment = null,Active=0,DeleteFlag=0,CreatedBy=1,CreateDate=psv.CreatedDate,psv.VisitDate
 from PatientScreeningVisit psv  inner join dtl_PatientAlcoholDepressionScreening pas
on  pas.Ptn_pk=psv.Ptn_pk and pas.Visit_Id=psv.Visit_Id 
where  pas.CrafftC is not null

union

Select psv.PatientId,psv.PatientMasterVisitId, (select liv.iD  from LookupMaster liv where  liv.Name='CRAFFTScoreQuestions') as ScreeningTypeId,1 as ScreeningDone,psv.VisitDate as ScreeningDate,(select liv.ItemId from LookupItemView liv where  liv.ItemName='CRAFFTScoreQuestion2') as ScreeningCategoryId,
CASE WHEN pas.CrafftR=0 then (select ltv.ItemId from LookupItemView ltv where ltv.ItemName='No'  and ltv.MasterName='GeneralYesNo') 
 WHEN pas.CrafftR=1 then (select ltv.ItemId from LookupItemView ltv where ltv.ItemName='Yes'  and ltv.MasterName='GeneralYesNo') end as ScreeningValueid
  ,Comment = null,Active=0,DeleteFlag=0,CreatedBy=1,CreateDate=psv.CreatedDate,psv.VisitDate
 from PatientScreeningVisit psv  inner join dtl_PatientAlcoholDepressionScreening pas
on  pas.Ptn_pk=psv.Ptn_pk and pas.Visit_Id=psv.Visit_Id 
where  pas.CrafftR is not null

union




Select psv.PatientId,psv.PatientMasterVisitId, (select liv.iD  from LookupMaster liv where  liv.Name='CRAFFTScoreQuestions') as ScreeningTypeId,1 as ScreeningDone,psv.VisitDate as ScreeningDate,(select liv.ItemId from LookupItemView liv where  liv.ItemName='CRAFFTScoreQuestion3') as ScreeningCategoryId,
CASE WHEN pas.CrafftA=0 then (select ltv.ItemId from LookupItemView ltv where ltv.ItemName='No'  and ltv.MasterName='GeneralYesNo') 
 WHEN pas.CrafftA=1 then (select ltv.ItemId from LookupItemView ltv where ltv.ItemName='Yes'  and ltv.MasterName='GeneralYesNo') end as ScreeningValueid
  ,Comment = null,Active=0,DeleteFlag=0,CreatedBy=1,CreateDate=psv.CreatedDate,psv.VisitDate
 from PatientScreeningVisit psv  inner join dtl_PatientAlcoholDepressionScreening pas
on  pas.Ptn_pk=psv.Ptn_pk and pas.Visit_Id=psv.Visit_Id 
where  pas.CrafftA is not null

union
Select psv.PatientId,psv.PatientMasterVisitId, (select liv.iD  from LookupMaster liv where  liv.Name='CRAFFTScoreQuestions') as ScreeningTypeId,1 as ScreeningDone,psv.VisitDate as ScreeningDate,(select liv.ItemId from LookupItemView liv where  liv.ItemName='CRAFFTScoreQuestion4') as ScreeningCategoryId,
CASE WHEN pas.CrafftF1=0 then (select ltv.ItemId from LookupItemView ltv where ltv.ItemName='No'  and ltv.MasterName='GeneralYesNo') 
 WHEN pas.CrafftF1=1 then (select ltv.ItemId from LookupItemView ltv where ltv.ItemName='Yes'  and ltv.MasterName='GeneralYesNo') end as ScreeningValueid
  ,Comment = null,Active=0,DeleteFlag=0,CreatedBy=1,CreateDate=psv.CreatedDate,psv.VisitDate
 from PatientScreeningVisit psv  inner join dtl_PatientAlcoholDepressionScreening pas
on  pas.Ptn_pk=psv.Ptn_pk and pas.Visit_Id=psv.Visit_Id 
where  pas.CrafftF1 is not null
union
Select psv.PatientId,psv.PatientMasterVisitId, (select liv.iD  from LookupMaster liv where  liv.Name='CRAFFTScoreQuestions') as ScreeningTypeId,1 as ScreeningDone,psv.VisitDate as ScreeningDate,(select liv.ItemId from LookupItemView liv where  liv.ItemName='CRAFFTScoreQuestion5') as ScreeningCategoryId,
CASE WHEN pas.CrafftF2=0 then (select ltv.ItemId from LookupItemView ltv where ltv.ItemName='No'  and ltv.MasterName='GeneralYesNo') 
 WHEN pas.CrafftF2=1 then (select ltv.ItemId from LookupItemView ltv where ltv.ItemName='Yes'  and ltv.MasterName='GeneralYesNo') end as ScreeningValueid
  ,Comment = null,Active=0,DeleteFlag=0,CreatedBy=1,CreateDate=psv.CreatedDate,psv.VisitDate
 from PatientScreeningVisit psv  inner join dtl_PatientAlcoholDepressionScreening pas
on  pas.Ptn_pk=psv.Ptn_pk and pas.Visit_Id=psv.Visit_Id 
where  pas.CrafftF2 is not null

union
Select psv.PatientId,psv.PatientMasterVisitId, (select liv.iD  from LookupMaster liv where  liv.Name='CRAFFTScoreQuestions') as ScreeningTypeId,1 as ScreeningDone,psv.VisitDate as ScreeningDate,(select liv.ItemId from LookupItemView liv where  liv.ItemName='CRAFFTScoreQuestion6') as ScreeningCategoryId,
CASE WHEN pas.CrafftT=0 then (select ltv.ItemId from LookupItemView ltv where ltv.ItemName='No'  and ltv.MasterName='GeneralYesNo') 
 WHEN pas.CrafftT=1 then (select ltv.ItemId from LookupItemView ltv where ltv.ItemName='Yes'  and ltv.MasterName='GeneralYesNo') end as ScreeningValueid
  ,Comment = null,Active=0,DeleteFlag=0,CreatedBy=1,CreateDate=psv.CreatedDate,psv.VisitDate
 from PatientScreeningVisit psv  inner join dtl_PatientAlcoholDepressionScreening pas
on  pas.Ptn_pk=psv.Ptn_pk and pas.Visit_Id=psv.Visit_Id 
where  pas.CrafftT is not null



),

PatientDisclosure as(Select psv.PatientId,psv.PatientMasterVisitId, (select liv.iD  from LookupMaster liv where  liv.Name='Disclosure') as ScreeningTypeId,1 as ScreeningDone,psv.VisitDate as ScreeningDate,
(select liv.ItemId from LookupItemView liv where  liv.ItemName='DisclosureQ1') as ScreeningCategoryId,
CASE WHEN pas.DisclosureHIVStatus=0 then (select ltv.ItemId from LookupItemView ltv where ltv.ItemName='No'  and ltv.MasterName='GeneralYesNo') 
 WHEN pas.DisclosureHIVStatus=1 then (select ltv.ItemId from LookupItemView ltv where ltv.ItemName='Yes'  and ltv.MasterName='GeneralYesNo') end as ScreeningValueid
  ,Comment = null,Active=0,DeleteFlag=0,CreatedBy=1,CreateDate=psv.CreatedDate,psv.VisitDate
 from PatientScreeningVisit psv  inner join dtl_PatientAlcoholDepressionScreening pas
on  pas.Ptn_pk=psv.Ptn_pk and pas.Visit_Id=psv.Visit_Id 
where  pas.DisclosureHIVStatus is not null
union
Select psv.PatientId,psv.PatientMasterVisitId, (select liv.iD  from LookupMaster liv where  liv.Name='Disclosure') as ScreeningTypeId,1 as ScreeningDone,psv.VisitDate as ScreeningDate,(select liv.ItemId from LookupItemView liv where  liv.ItemName='DisclosureQ2') as ScreeningCategoryId,
(select ltv.ItemId from LookupItemView ltv where ltv.ItemName=dc.[Name] and ltv.MasterName='DisclosedTo' )  
  as ScreeningValueid
  ,Comment = null,Active=0,DeleteFlag=0,CreatedBy=1,CreateDate=psv.CreatedDate,psv.VisitDate
 from PatientScreeningVisit psv  inner join dtl_PatientAlcoholDepressionScreening pas
 
on  pas.Ptn_pk=psv.Ptn_pk and pas.Visit_Id=psv.Visit_Id 
inner  join (select dc.CodeID,dc.[Name],dc.Id from mst_pmtctDeCode dc inner join mst_pmtctCode c on c.CodeID=dc.CodeID 
where c.[Name]='DisclosedHIVStatusTo')  
dc on dc.id=pas.DisclosureTo
where  pas.DisclosureTo is not null

),

PatientScreeningList as 
(
select * from
 PatientDepressionScreening  
union
 select * from PatientGBVViolence
 union
 select * from patientCAGE
 union
 select * from patientcrafft
 union
 select * from PatientDisclosure
 )

--select * from PatientScreeningList
  
 INSERT INTO PatientScreening(PatientId,PatientMasterVisitId,ScreeningTypeId,ScreeningDone,ScreeningDate,ScreeningCategoryId,ScreeningValueId,Comment,Active,DeleteFlag,CreatedBy,CreateDate,VisitDate)
  select ps.PatientId,ps.PatientMasterVisitId,ps.ScreeningTypeId,ps.ScreeningDone,ps.ScreeningDate,ps.ScreeningCategoryId,ps.ScreeningValueid,ps.Comment,ps.Active,ps.DeleteFlag,ps.CreatedBy,ps.CreateDate,ps.VisitDate from PatientScreeningList ps
  WHERE NOT EXISTS(Select * from PatientScreening pst where pst.PatientId=ps.PatientId 
  and pst.PatientMasterVisitId=ps.PatientMasterVisitId
  and pst.ScreeningTypeId=ps.ScreeningTypeId
  and pst.ScreeningDone	=ps.ScreeningDone
  and pst.ScreeningDate=ps.ScreeningDate
  and pst.ScreeningCategoryId=ps.ScreeningCategoryId
  and pst.ScreeningValueId=ps.ScreeningValueid
  and pst.VisitDate=ps.VisitDate)

  GO


  with patientscreened as(select pas.Ptn_pk,pas.Visit_Id,v.VisitDate,pas.CreatedDate,v.VisitType,vt.VisitName from dtl_PatientAlcoholDepressionScreening pas
inner join ord_Visit v on v.Visit_Id=pas.Visit_Id
inner join mst_VisitType vt on vt.VisitTypeID=v.VisitType
),



PatientScreeningVisit  as( select  b.Id as PatientId,a.Ptn_pk,a.Visit_Id,c.Id as PatientMasterVisitId,c.VisitDate,a.CreatedDate   from
  patientscreened a
  inner join Patient b on a.Ptn_pk = b.ptn_pk
inner join PatientMasterVisit c on b.id = c.PatientId
and cast(a.visitdate as date) = cast(c.visitdate as date)
and c.VisitType = 0
  ),

 

 patientnotes as(


---DepressionTOtal
Select psv.PatientId,psv.PatientMasterVisitId,(select ModuleID from mst_module where ModuleName='CCC Patient Card MoH 257') as ServiceArea,
Cast(pas.PHQTotal as varchar(max)) as ClinicalNotes,DeleteFlag=0,CreatedBy=1,CreateDate=psv.CreatedDate,ModifyFlag=0,AuditData=Null,
(select liv.ItemId  from LookupItemView liv where liv.ItemName='DepressionTotal' and liv.MasterName='DepressionScreeningNotes')  as NotesCategoryId,Active=0
 from PatientScreeningVisit psv inner join dtl_PatientAlcoholDepressionScreening pas
on  pas.Ptn_pk=psv.Ptn_pk and pas.Visit_Id=psv.Visit_Id 
where  pas.PHQTotal is not null

union

Select psv.PatientId,psv.PatientMasterVisitId,(select ModuleID from mst_module where ModuleName='CCC Patient Card MoH 257') as ServiceArea,
Cast(pas.PHQDepressionSeverity as varchar(max)) as ClinicalNotes,DeleteFlag=0,CreatedBy=1,CreateDate=psv.CreatedDate,ModifyFlag=0,AuditData=Null,
(select liv.ItemId  from LookupItemView liv where liv.ItemName='DepressionSeverity' and liv.MasterName='DepressionScreeningNotes') as NotesCategoryId ,Active=0
 from PatientScreeningVisit psv inner join dtl_PatientAlcoholDepressionScreening pas
on pas.Ptn_pk=psv.Ptn_pk and pas.Visit_Id=psv.Visit_Id and pas.PHQDepressionSeverity is not null

union

Select psv.PatientId,psv.PatientMasterVisitId,(select ModuleID from mst_module where ModuleName='CCC Patient Card MoH 257') as ServiceArea,
cast(pas.PHQDepressionSeverity as varchar(max))  as ClinicalNotes,DeleteFlag=0,CreatedBy=1,CreateDate=psv.CreatedDate,ModifyFlag=0,AuditData=Null,
(select liv.ItemId from LookupItemView liv where liv.ItemName='ReccommendedManagement' and liv.MasterName='DepressionScreeningNotes' ) as NotesCategoryId
 ,Active=0 
 from PatientScreeningVisit psv inner join dtl_PatientAlcoholDepressionScreening pas
on  pas.Ptn_pk=psv.Ptn_pk and pas.Visit_Id=psv.Visit_Id 
where  pas.PHQRecommended is not null

union




Select psv.PatientId,psv.PatientMasterVisitId,(select ModuleID from mst_module where ModuleName='CCC Patient Card MoH 257') as ServiceArea,
cast(pas.CAGEAIDScore as varchar(max))  as ClinicalNotes ,DeleteFlag=0,CreatedBy=1,CreateDate=psv.CreatedDate,ModifyFlag=0,AuditData=Null,
(select  liv.ItemId from LookupItemView liv where liv.ItemName='AlcoholScore' and liv.MasterName='AlcoholScreeningNotes') as NotesCategoryId
,Active=0
 from PatientScreeningVisit psv inner join dtl_PatientAlcoholDepressionScreening pas
 on pas.Ptn_pk=psv.Ptn_pk and pas.Visit_Id=psv.Visit_Id and pas.CAGEAIDScore is not null

union
Select psv.PatientId,psv.PatientMasterVisitId,(select ModuleID from mst_module where ModuleName='CCC Patient Card MoH 257') as ServiceArea,
cast(pas.CrafftScore  as varchar(max)) as ClinicalNotes,DeleteFlag=0,CreatedBy=1,CreateDate=psv.CreatedDate,ModifyFlag=0,AuditData=Null,
(select  liv.ItemId from LookupItemView liv where liv.ItemName='AlcoholScore' and liv.MasterName='AlcoholScreeningNotes') as NotesCategoryId
,Active=0
 from PatientScreeningVisit psv inner join dtl_PatientAlcoholDepressionScreening pas
 on pas.Ptn_pk=psv.Ptn_pk and pas.Visit_Id=psv.Visit_Id and pas.CrafftScore is not null
 union


Select psv.PatientId,psv.PatientMasterVisitId,(select ModuleID from mst_module where ModuleName='CCC Patient Card MoH 257') as ServiceArea,
cast(pas.CAGEAIDRisk as varchar(max)) as ClinicalNotes ,DeleteFlag=0,CreatedBy=1,CreateDate=psv.CreatedDate,ModifyFlag=0,AuditData=Null,
(select liv.ItemId from LookupItemView liv where liv.ItemName='AlcoholRiskLevel' and liv.MasterName='AlcoholScreeningNotes' ) as NotesCategoryId,Active=0
 from PatientScreeningVisit psv inner join dtl_PatientAlcoholDepressionScreening pas
on pas.Ptn_pk=psv.Ptn_pk and pas.Visit_Id=psv.Visit_Id where (pas.CAGEAIDRisk is not null)

union

Select psv.PatientId,psv.PatientMasterVisitId,(select ModuleID from mst_module where ModuleName='CCC Patient Card MoH 257') as ServiceArea,
cast(pas.CrafftRisk as varchar(max)) as ClinicalNotes,DeleteFlag=0,CreatedBy=1,CreateDate=psv.CreatedDate,ModifyFlag=0,AuditData=Null,
(select liv.ItemId from LookupItemView liv where liv.ItemName='AlcoholRiskLevel' and liv.MasterName='AlcoholScreeningNotes' ) as NotesCategoryId,Active=0
 from PatientScreeningVisit psv inner join dtl_PatientAlcoholDepressionScreening pas
on pas.Ptn_pk=psv.Ptn_pk and pas.Visit_Id=psv.Visit_Id where (pas.CrafftRisk is not null)

union

Select psv.PatientId,psv.PatientMasterVisitId,(select ModuleID from mst_module where ModuleName='CCC Patient Card MoH 257') as ServiceArea,
cast(pas.Notes as varchar(max)) as ClinicalNotes,DeleteFlag=0,CreatedBy=1,CreateDate=psv.CreatedDate,ModifyFlag=0,AuditData=Null,
(select liv.ItemId from LookupItemView liv where liv.ItemName='SocialNotes' and liv.MasterName='SocialHistory')  as NotesCategoryId,Active=0
 from PatientScreeningVisit psv inner join dtl_PatientAlcoholDepressionScreening pas
on pas.Ptn_pk=psv.Ptn_pk and pas.Visit_Id=psv.Visit_Id and (pas.Notes is not null and len(pas.Notes) > 0)





)



 INSERT INTO PatientClinicalNotes(PatientId,PatientMasterVisitId,ServiceAreaId,ClinicalNotes,DeleteFlag,CreatedBy,CreateDate,ModifyFlag,NotesCategoryId,Active)
 select pns.PatientId,pns.PatientMasterVisitId,pns.ServiceArea,pns.ClinicalNotes,pns.DeleteFlag,pns.CreatedBy,pns.CreateDate,pns.ModifyFlag,pns.NotesCategoryId,pns.Active from patientnotes pns
 WHERE NOT EXISTS(select * from PatientClinicalNotes pcs where pcs.PatientId=pns.PatientId and pcs.PatientMasterVisitId=pns.PatientMasterVisitId and pcs.ServiceAreaId=pns.ServiceArea 
 and pcs.ClinicalNotes=pns.ClinicalNotes and pcs.DeleteFlag=pns.DeleteFlag and pns.CreatedBy=pcs.CreatedBy and pns.ModifyFlag=pcs.ModifyFlag and pns.NotesCategoryId=pcs.NotesCategoryId
 and pns.Active=pcs.Active)




