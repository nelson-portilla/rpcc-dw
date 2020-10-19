select 
distinct on (lab.id) 
lab.*, els.cedula, els.fechabx, els.asignado,
pac."Cedula" , pac."Edad" as edad, pac."FecNac" as fecnac, pac."Sexo" as sexo, pac."IdUnion" as pacidunion,
t."Loc" as loc,t."Mor" as mor,t."FecDiag" as fecdiag, t."Comp" as comp, t."Grado_diferenciacion" as gradodif, t."MetDiag" as metdiag,
d."Ciudad" as ciudad, d."Com" as barrio,
u."Ult" as ult, u."VM" as vm,
r."Recolector" as recolector
from annotations.st_lab lab
join public.ext_labpat_struc els on lab.id=els.id 
left join public."PACIENTES" 	pac on (pac."Cedula"=els.cedula or els.idunion=pac."IdUnion")
left join public."TUMORES" 		t	on t."IdUnion"=pac."IdUnion"
left join public."DIRECCIONES" 	d 	on d."IdUnion" =pac."IdUnion" 
left join public."ULTIMOCONTACTO" u on u."IdUnion" = pac."IdUnion"
left join public."RECOLECTORES" r 	on r."IdUnion" = pac."IdUnion"
--where lab.idunion =257128 and 
--pac."Cedula" is null and pac."IdUnion" is not null 
order by lab.id,u."Ult" desc