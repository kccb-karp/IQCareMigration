delete from lnk_FacilityModule
where ModuleID in (select ModuleID from mst_module where ModuleName in ('Pharmacy Dispense'
, 'PM/SCM'
, 'PM/SCM With Same point dispense'))