SELECT 
upm.UPMID,
'A' as A,
CASE  when count(conteo_carbono.sitios) = 1 THEN NULL WHEN count(conteo_carbono.sitios)>2 and count(conteo_carbono.sitios)<=4 then 'C' END C,
count(conteo_carbono.sitios) as Conteo_sitiosC,
CASE arboladoD.modulo when 'D' then 'D' ELSE NULL END D,
CASE  when sueloEHojarasca.modulo= 'E' then 'Eh' WHEN sueloEPerfil.modulo = 'E' then 'Emp' END E,
CASE fotoHemis.modulo when 'F' then 'F' ELSE NULL END F,
CASE WHEN parametrosFQG.modulo ='G' THEN 'Gfq' when repobladoVmG.modulo ='G' THEN 'Grep' when arboladoG.modulo ='G' THEN "Garb" END G,
CASE WHEN mayorGregarios.modulo ='H' THEN 'Hgreg' when mayorIndividual.modulo ='H' THEN 'Hind' when vMenor.modulo ='H' THEN "Hmenor" END H

FROM
UPM_UPM upm

--modulo C
LEFT JOIN (
    SELECT Distinct 
    carbono.UPMID as conglomerado,
    carbono.sitioID as sitios
    FROM  CARBONO_LongitudComponente carbono

    Group by 
    carbono.UPMID,
    carbono.sitioID
    having count(carbono.sitioID) >= 4
    ) conteo_carbono on upm.UPMID = conteo_carbono.conglomerado
 --modulo D
 LEFT JOIN (
     SELECT 
     'D' as modulo,
     arbolado.UPMID as  cgl
     FROM  TAXONOMIA_Arbolado arbolado
     WHERE
     arbolado.ProporcionCopaVivaID != 0 OR
     arbolado.ExposicionCopaID != 0 OR
     arbolado.PosicionCopaID != 0 OR
     arbolado.DensidadCopaID != 0 OR
     arbolado.MuerteRegresivaID != 0 OR
     arbolado.TransparenciaFollajeID != 0 
 )arboladoD on arboladoD.cgl = upm.UPMID
 --modulo E
 LEFT JOIN
 (
    SELECT Distinct
    'E' as modulo,
    hojarasca.UPMID  as cgl
    FROM  SUELO_Hojarasca hojarasca
) sueloEHojarasca on sueloEHojarasca.cgl = upm.UPMID
 LEFT JOIN
 (
    SELECT Distinct
    'E' as modulo,
    perfil.UPMID  as cgl
    FROM  SUELO_MuestrasPerfil perfil
) sueloEPerfil on sueloEPerfil.cgl = upm.UPMID
--modulo F
LEFT JOIN
(
    SELECT 
    'F' as modulo,
    fotografiaHemisferica.UPMID  as cgl
    FROM  SITIOS_FotografiaHemisferica fotografiaHemisferica
)fotoHemis ON fotoHemis.cgl = upm.UPMID
--modulo G
LEFT JOIN
(
    SELECT Distinct
    'G' as modulo,
    parametrosFQ.UPMID  as cgl
    FROM  SITIOS_ParametrosFisicoQuimicos parametrosFQ
)  parametrosFQG on parametrosFQG.cgl = upm.UPMID
LEFT JOIN
(
    SELECT Distinct
    'G' as modulo,
    repobladoVm.UPMID  as cgl
    FROM  TAXONOMIA_RepobladoVM repobladoVm
)  repobladoVmG on repobladoVmG.cgl = upm.UPMID
LEFT JOIN
(
    SELECT Distinct
    'G' as modulo,
    arbolado.UPMID  as cgl
    FROM  TAXONOMIA_Arbolado arbolado
    WHERE
    arbolado.DiametroBasal IS NOT NULL
)  arboladoG on arboladoG.cgl = upm.UPMID
--modulo H
LEFT JOIN
(
    SELECT Distinct
    'H' as modulo,
    vegetacionMayorGregarios.UPMID  as cgl
    FROM  TAXONOMIA_VegetacionMayorGregarios vegetacionMayorGregarios
)  mayorGregarios on mayorGregarios.cgl = upm.UPMID
LEFT JOIN
(
    SELECT Distinct
    'H' as modulo,
    vegetacionMayorIndividual.UPMID  as cgl
    FROM  TAXONOMIA_VegetacionMayorIndividual vegetacionMayorIndividual
)  mayorIndividual on mayorIndividual.cgl = upm.UPMID
LEFT JOIN
(
    SELECT Distinct
    'H' as modulo,
    vegetacionMenor.UPMID  as cgl
    FROM  TAXONOMIA_VegetacionMenor vegetacionMenor
)  vMenor on vMenor.cgl = upm.UPMID
where
upm.UPMID = 48445

