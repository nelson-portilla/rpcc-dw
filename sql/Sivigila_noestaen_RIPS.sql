select ripsdef.*,who.nom_esp from (select 
tipo_documento,
numero_identificacion,
fecha_procedimiento,
dx,
nom_cie,
dx_ppal,
nom_dx_pal,
cod_bai,
cod_eapb,
primer_apellido,
segundo_apellido,
primer_nombre,
segundo_nombre,
edad,
sexo,
cod_departamento,
cod_municipio,
institucion,
ruta_archivo,
id_ext_rips,
substring(dx from 1 for 3) as cie10
from extr_rips_cleandate as rips  
where exists (select 1 from dict_cie10cancer as cie where rips.dx=cie.cie_10 )
and 
(rips.dx like 'C50%' or rips.dx like 'C53%') --and fecha_nacimiento::date>='01/01/2000'
and rips.fecha_procedimiento::date > '2017/01/01'
and
not exists (select 1 from extr_sivigila_adu as sivi where rips.numero_identificacion=sivi.numero_documento )
) as ripsdef
left join dic_who as who
on ripsdef.cie10=who.icd10
--621