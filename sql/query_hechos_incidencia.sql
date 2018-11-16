select distinct(pac."IdUnion") from "PACIENTES" as pac,"TUMORES" as tum, "DIRECCIONES" as dir, "RECOLECTORES" as rec, "ULTIMOCONTACTO" as ult
where pac."IdUnion"=tum."IdUnion" and pac."IdUnion"=dir."IdUnion" and pac."IdUnion"=rec."IdUnion" and pac."IdUnion"=ult."IdUnion"
--and pac."NoReg" is not null
--order by pac."IdUnion",ult."Ult" desc ,dir."Com",dir."Ciudad" asc
limit 20

--PARA OBTENER TUMORES
select * from "PACIENTES" as pac,"TUMORES" as tum,"Mor" as mor, "MetDiag" as met,"Est" as est,"Comp" as comp 
where pac."IdUnion"=tum."IdUnion" 
and tum."Mor"=mor."CodigoMorfologia"
and tum."MetDiag"=met."CodigoMetDiag"
and tum."Estad2"=est."CodigoEstado"
and tum."Comp"=comp."CodigoComportamiento"
and pac."NoReg" is not null
order by pac."IdUnion",tum."Loc" asc
limit 20

--Para obtener Direcciones
select pac."IdUnion",dir.* from "PACIENTES" as pac,"DIRECCIONES" as dir
where pac."IdUnion"=dir."IdUnion"
and pac."NoReg" is not null
order by pac."IdUnion",dir."Com"
limit 20

--para recolectores
select pac."IdUnion", rec.*, fr.nombrefuente from "PACIENTES" as pac,"RECOLECTORES" as rec, "FuenteRecoleccion" as fr
where pac."IdUnion"=rec."IdUnion"
and rec."Fuente"=fr.id
and pac."NoReg" is not null
order by pac."IdUnion",rec."Fecha" desc --,dir."Com",dir."Ciudad" asc
limit 20

--para ultimo contacto
select pac."IdUnion", ult.* from "PACIENTES" as pac, "ULTIMOCONTACTO" as ult
where pac."IdUnion"=ult."IdUnion"
and pac."NoReg" is not null
and ult."VM" is not null
and ult."Ult" is not null
and pac."IdUnion"=21
order by pac."IdUnion",ult."Ult" desc --,dir."Com",dir."Ciudad" asc
limit 20


--PARA VER TUMORES MULTIPLES
select pac."IdUnion",pac."NoReg",tum."Id",tum."Loc",tum."Mor",tum."NoTum" from "PACIENTES" as pac,"TUMORES" as tum 
where pac."IdUnion"=tum."IdUnion" 
--and tum."NoTum">1
--and tum."NoTum"<>9
and pac."IdUnion"=245748
order by pac."IdUnion",tum."Loc" asc
limit 20
--and pac."IdUnion"=245748
--and pac."IdUnion"=171675

select pac."IdUnion", rec.*, fr.nombrefuente from "PACIENTES" as pac join "RECOLECTORES" as rec
on pac."IdUnion"=rec."IdUnion"
and pac."NoReg" is not null
--and pac."IdUnion"=22
left join "FuenteRecoleccion" as fr
on rec."Fuente"=fr.id
order by pac."IdUnion",rec."Fecha" desc

