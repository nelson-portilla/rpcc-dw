--select * from "TUMORES" as tum,
select paci."IdUnion", paci.numero_registro, paci.fecha_def, tum."FecDiag", tum."Loc", loc."CIE-0 DESCRIPCION", tum."Mor", 
tum."Comp", tum."MetDiag", morf."NombreMorfologia", loc.sistema,
comp."NombreComportamiento", met."NombreMetDiag"--,fte."Fuente_txt"
from "TUMORES" as tum,"Mor" as morf,"Comp" as comp, "MetDiag" as met, "Loc" as loc,--"FUENTES" as fue, "Fuente" as fte,
(select pac."Cedula","Ape1","Ape2","ApeC","Nom1","Nom2","Sexo","FecNac","IdUnion",mor.numero_registro,mor.fecha_def 
from "PACIENTES" as pac, extr_mortalidad as mor
where mor.numero_identificacion="Cedula"::text
and pac."NoReg" is not null) as paci
where paci."IdUnion"=tum."IdUnion"
--and tum."IdUnion"=fue."IdUnion"
--and paci."IdUnion"=fue."IdUnion"
and tum."Loc"=loc."Localizacion"
and tum."Mor"=morf."CodigoMorfologia"
and tum."Comp"=comp."CodigoComportamiento"
and tum."MetDiag"=met."CodigoMetDiag"
--and ulti."VM"=vm.id
--and fue."Id"::text=fte."Fuente"

select pac."Cedula","Ape1","Ape2","ApeC","Nom1","Nom2","Sexo","FecNac","IdUnion" 
from "PACIENTES" as pac, extr_sivigila_inf as mor
where mor.numero_identificacion="Cedula"::text
--and pac."NoReg" is not null


