
select pac."Cedula","Ape1","Ape2","ApeC","Nom1","Nom2","Sexo","FecNac","IdUnion",mor.numero_registro,mor.fecha_def 
from "PACIENTES" as pac, mort_no_sivigila as mor
where mor.numero_identificacion="Cedula"::text
and pac."NoReg" is not null