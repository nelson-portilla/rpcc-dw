select numero_identificacion, count(numero_identificacion) from extr_mortalidad
group by numero_identificacion,(numero_identificacion)
order by count(numero_identificacion) desc