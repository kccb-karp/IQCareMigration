


with ARTReadinessAssessment as(select pas.Ptn_pk,pas.Visit_Id,v.VisitDate,pas.CreatedDate,v.VisitType,vt.VisitName from dtl_PatientARTReadinessAssessment pas
inner join ord_Visit v on v.Visit_Id=pas.Visit_Id
inner join mst_VisitType vt on vt.VisitTypeID=v.VisitType
),



PatientARTReadinessAssessment  as( select  b.Id as PatientId,a.Ptn_pk,a.Visit_Id,c.Id as PatientMasterVisitId,c.VisitDate,a.CreatedDate   from
  ARTReadinessAssessment a
  inner join Patient b on a.Ptn_pk = b.ptn_pk
inner join PatientMasterVisit c on b.id = c.PatientId
and cast(a.visitdate as date) = cast(c.visitdate as date)
and c.VisitType = 0
  )


   INSERT INTO PatientPsychosocialCriteria(PatientId,PatientMasterVisitId,BenefitART,Alcohol,Depression,Disclosure,AdministerART,effectsART,dependents,AdherenceBarriers,AccurateLocator,StartART,CreatedBy,CreateDate)
 select par.PatientId,par.PatientMasterVisitId,para.PsychosocialQ1,para.PsychosocialQ2,para.PsychosocialQ3,para.PsychosocialQ4,para.PsychosocialQ5,para.PsychosocialQ6,para.PsychosocialQ7,para.PsychosocialQ8,para.PsychosocialQ9,para.PsychosocialQ10,'1',para.CreatedDate from PatientARTReadinessAssessment  par
 inner join dtl_PatientARTReadinessAssessment para on para.Visit_Id=par.Visit_Id and para.Ptn_pk=par.Ptn_pk
WHERE NOT EXISTS(select * from PatientPsychosocialCriteria  psc
inner join PatientARTReadinessAssessment part on part.PatientId=psc.PatientId and part.PatientMasterVisitId=psc.PatientMasterVisitId
inner join dtl_PatientARTReadinessAssessment para on para.Visit_Id=part.Visit_Id and para.Ptn_pk=part.Ptn_pk
where para.PsychosocialQ1=psc.BenefitART and para.PsychosocialQ2=psc.Alcohol and para.PsychosocialQ3=psc.Depression and para.PsychosocialQ4=psc.Disclosure and para.PsychosocialQ5=psc.AdministerART and para.PsychosocialQ6=psc.effectsART and para.PsychosocialQ7=psc.dependents and para.PsychosocialQ8=psc.AdherenceBarriers and para.PsychosocialQ9=psc.AccurateLocator and para.PsychosocialQ10=psc.StartART
  )
  




 GO


  with ARTReadinessAssessment as(select pas.Ptn_pk,pas.Visit_Id,v.VisitDate,pas.CreatedDate,v.VisitType,vt.VisitName from dtl_PatientARTReadinessAssessment pas
inner join ord_Visit v on v.Visit_Id=pas.Visit_Id
inner join mst_VisitType vt on vt.VisitTypeID=v.VisitType
),



PatientARTReadinessAssessment  as( select  b.Id as PatientId,a.Ptn_pk,a.Visit_Id,c.Id as PatientMasterVisitId,c.VisitDate,a.CreatedDate   from
  ARTReadinessAssessment a
  inner join Patient b on a.Ptn_pk = b.ptn_pk
inner join PatientMasterVisit c on b.id = c.PatientId
and cast(a.visitdate as date) = cast(c.visitdate as date)
and c.VisitType = 0
  )

  --select * from PatientSupportSystemCriteria
  INSERT INTO PatientSupportSystemCriteria (PatientId,PatientMasterVisitId,TakingART,TSIdentified,supportGroup,EnrollSMSReminder,OtherSupportSystems,CreateDate,CreatedBy,DeleteFlag)
  select par.PatientId,par.PatientMasterVisitId,para.SupportQ1,para.SupportQ2,para.SupportQ3,para.SupportQ4,para.SupportQ5,para.CreatedDate,'1','0'  from PatientARTReadinessAssessment  par
 inner join dtl_PatientARTReadinessAssessment para on para.Visit_Id=par.Visit_Id and para.Ptn_pk=par.Ptn_pk
WHERE NOT EXISTS(select * from PatientSupportSystemCriteria  psc
inner join PatientARTReadinessAssessment part on part.PatientId=psc.PatientId and part.PatientMasterVisitId=psc.PatientMasterVisitId
inner join dtl_PatientARTReadinessAssessment para on para.Visit_Id=part.Visit_Id and para.Ptn_pk=part.Ptn_pk
where para.SupportQ1=psc.TakingART and para.SupportQ2=psc.TSIdentified and para.SupportQ3=psc.supportGroup and para.SupportQ4=psc.EnrollSMSReminder and para.SupportQ5=psc.OtherSupportSystems)