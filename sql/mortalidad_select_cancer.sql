select numero_identificacion, c_bas1 from extr_mortalidad as mort 
where exists (select 1 from dict_cie10cancer as cie where mort.c_bas1=cie.cie_10 )
group by numero_identificacion,c_bas1