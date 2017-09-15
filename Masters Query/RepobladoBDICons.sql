Select

upm.UPMID,
upmMala.Estado,
upmMala.Municipio,

--_____________________________________________________________________________________________________________________________________________________________________________________________
upm.Predio,
upm.Paraje,
upm.FechaInicio,
upm.FechaFin,
upm.Altitud,
upm.PendienteRepresentativa,
exposicionUPM.Descripcion AS Exposicion,
fisiografia.TipoFisiografia AS Fisiografia,
-- _____________________________________________________________________________________________________________________________________________________________________________________________
sitio.Sitio,
sitio.GradosLongitud || '°'||sitio.MinutosLongitud || '´'||sitio.SegundosLongitud||'´´' as CoordenadasLongitud,
sitio.GradosLatitud || '°'||sitio.MinutosLatitud || '´'||sitio.SegundosLatitud||'´´' as CoordenadasLatitud,
-1 * ((-1 * sitio.GradosLongitud) + (sitio.MinutosLongitud / 60.0) +  (sitio.SegundosLongitud / 3600.0)) AS X,
sitio.GradosLatitud + (sitio.MinutosLatitud / 60.0) +  (sitio.SegundosLatitud / 3600.0) AS Y,
sitio.ErrorPresicion,
sitio.Datum,
claveSerieV.TipoVegetacion,
faseSucecional.Clave  AS FaseSucecional,
CASE sitio.ArbolFuera WHEN 1 THEN 'SI' WHEN 0 THEN 'NO' END ArbolFuera,
sitio.CondicionEcotono,
--_____________________________________________________________________________________________________________________________________________________________________________________________
repoblado.Consecutivo,
familiaRepoblado.Nombre AS Familia,
generoRepoblado.Nombre AS Genero,
especieRepoblado.Nombre AS Especie,
infraespecieRepoblado.Nombre AS Infraespecie,
repoblado.EsColecta,
repoblado.NombreComun,
repoblado.Frecuencia025150,
repoblado.Edad025150,
repoblado.Frecuencia151275,
repoblado.Edad151275,
repoblado.Frecuencia275,
repoblado.Edad275,
vigorRepoblado.Descripcion AS Vigor,
danioRepoblado.Agente AS Danio,
repoblado.PorcentajeDanio,
repoblado.ClaveColecta

FROM 
TAXONOMIA_Repoblado repoblado

 JOIN SITIOS_Sitio sitio ON sitio.SitioID=repoblado.SitioID AND sitio.UPMID=repoblado.UPMID
 JOIN UPM_UPM upm ON upm.UPMID=sitio.UPMID
 JOIN UPM_MallaPuntos upmMala ON upmMala.UPMID=upm.UPMID

LEFT JOIN CAT_ClaveSerieV claveSerieV ON claveSerieV.ClaveSerieVID = sitio.ClaveSerieV
LEFT JOIN CAT_FaseSucecional faseSucecional ON faseSucecional.FaseSucecionalID =sitio.FaseSucecional
LEFT JOIN CAT_TipoExposicion exposicionUPM ON exposicionUPM.ExposicionID =upm.ExposicionID
LEFT JOIN CAT_TipoFisiografia fisiografia ON fisiografia.FisiografiaID=upm.FisiografiaID

LEFT JOIN CAT_FamiliaEspecie familiaRepoblado ON repoblado.FamiliaID = familiaRepoblado.FamiliaID 
LEFT JOIN CAT_Genero generoRepoblado ON repoblado.GeneroID = generoRepoblado.GeneroID 
LEFT JOIN CAT_Especie especieRepoblado ON repoblado.EspecieID = especieRepoblado.EspecieID 
LEFT JOIN CAT_Infraespecie infraespecieRepoblado ON repoblado.InfraespecieID = infraespecieRepoblado.InfraespecieID 

LEFT JOIN CAT_TipoVigorSotobosqueRepoblado vigorRepoblado ON vigorRepoblado.VigorID=repoblado.VigorID
LEFT JOIN CAT_AgenteDanio danioRepoblado ON danioRepoblado.AgenteDanioID=repoblado.DanioID

GROUP BY
repoblado.UPMID,
repoblado.SitioID,
repoblado.RepobladoID

ORDER BY
repoblado.UPMID