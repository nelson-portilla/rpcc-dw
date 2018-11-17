--TIPO DE RESDENCIA MARCADA DIF A 9 PERO LA CIUDAD NO REGISTRA
select dir.* from "PACIENTES" as pac,"DIRECCIONES" as dir
where pac."IdUnion"=dir."IdUnion"
and pac."NoReg" is not null
and dir."PrimerDir"=true
and dir."TipoResidencia" is not null
and dir."TipoResidencia" <>9
and dir."Ciudad" is null
order by dir."TipoResidencia" desc


--RESIDENCIA NO MARCADA COMO PRIMER DIRECCION Y TIENE NUMERO DE REGISTRO
-- N = 313
(select pac."IdUnion" from "PACIENTES" as pac,"DIRECCIONES" as dir
where pac."IdUnion"=dir."IdUnion"
and pac."NoReg" is not null
and dir."PrimerDir"=false
order by "IdUnion") 
except
(select pac."IdUnion" from "PACIENTES" as pac,"DIRECCIONES" as dir
where pac."IdUnion"=dir."IdUnion"
and pac."NoReg" is not null
and dir."PrimerDir"=true
order by "IdUnion")



select pac."IdUnion", dir."TipoResidencia",dir."PrimerDir" from "PACIENTES" as pac,"DIRECCIONES" as dir
where pac."IdUnion"=dir."IdUnion"
--and pac."NoReg" is not null
--and pac."IdUnion"=25346
and pac."IdUnion"=949


