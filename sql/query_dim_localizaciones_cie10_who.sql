select 
subcie10.loc,
subcie10.*,
who.icd10, 
who.nom_esp, 
who.nom_ingles
from dic_who as who right join (
select
loca.*,
cie.cie_10,
cie.loc,
substring(cie.cie_10 from 1 for 3) as subcie
from "Loc" as loca left join dict_cie10cancer as cie on loca."Localizacion"=cie.loc 
) as subcie10 on who.icd10=subcie
n=482
--select * from "Loc" as loc left join dict_cie10cancer as dic on loc."Localizacion"=dic.loc 