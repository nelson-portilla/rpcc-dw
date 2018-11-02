select mortdef.*,who.nom_esp from (select 
numero_registro,
codigo_medico,
departamento_def,
municipio_def,
sitio_def,
institucion,
primer_apellido,
segunfo_apellido,
nombre,
tipo_documento,
numero_identificacion,
seguridad_social,
municipio_residencia,
barrio,
direccion,
area_residencia,
tipo_certificado_def,
c_dir1,
c_ant1,
c_ant2,
c_ant3,
c_pat1,
c_bas1,
substring(c_bas1 from 1 for 3) as cie10,
ultima_ocupacion,
nombre_aseguradora,
tipo_def,
fecha_def,
sexo,
fecha_nacimiento,
edad_fallecimiento,
dic.nombre_institucion
from extr_mortalidad as mort left join dict_institucion as dic 
on dic.cod_institucion=mort.institucion
where exists (select 1 from dict_cie10cancer as cie where mort.c_bas1=cie.cie_10 )
and 
(c_bas1 like 'C50%' or c_bas1 like 'C53%') --and fecha_nacimiento::date>='01/01/2000'
and
not exists (select 1 from extr_sivigila_adu as sivi where mort.numero_identificacion=sivi.numero_documento )
) as mortdef
left join dic_who as who
on mortdef.cie10=who.icd10
--621