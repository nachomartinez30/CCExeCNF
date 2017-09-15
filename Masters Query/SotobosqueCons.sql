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
--informacion de Sotobosque
sotobosque.Consecutivo,
familiaSotobosque.Nombre AS Familia,
generoSotobosque.Nombre AS Genero,
especieSotobosque.Nombre AS Especie,
infraespecieSotobosque.Nombre AS Infraespecie,
sotobosque.EsColecta,
sotobosque.NombreComun,
sotobosque.Frecuencia025150,
sotobosque.Cobertura025150,
sotobosque.Frecuencia151275,
sotobosque.Cobertura151275,
sotobosque.Frecuencia275,
sotobosque.Cobertura275,
vigorSotobosque.Descripcion AS Vigor,
danioSotobosque.Agente AS Danio,
sotobosque.PorcentajeDanio,
sotobosque.ClaveColecta


FROM 
TAXONOMIA_Sotobosque sotobosque

--Sotobosque
 JOIN SITIOS_Sitio sitio ON sitio.SitioID=sotobosque.SitioID AND sitio.UPMID=sotobosque.UPMID
 JOIN UPM_UPM upm ON upm.UPMID=sitio.UPMID
 JOIN UPM_MallaPuntos upmMala ON upmMala.UPMID=upm.UPMID

LEFT JOIN CAT_ClaveSerieV claveSerieV ON claveSerieV.ClaveSerieVID = sitio.ClaveSerieV
LEFT JOIN CAT_FaseSucecional faseSucecional ON faseSucecional.FaseSucecionalID =sitio.FaseSucecional
LEFT JOIN CAT_TipoExposicion exposicionUPM ON exposicionUPM.ExposicionID =upm.ExposicionID
LEFT JOIN CAT_TipoFisiografia fisiografia ON fisiografia.FisiografiaID=upm.FisiografiaID

LEFT JOIN CAT_FamiliaEspecie familiaSotobosque ON sotobosque.FamiliaID = familiaSotobosque.FamiliaID 
LEFT JOIN CAT_Genero generoSotobosque ON sotobosque.GeneroID = generoSotobosque.GeneroID 
LEFT JOIN CAT_Especie especieSotobosque ON sotobosque.EspecieID = especieSotobosque.EspecieID 
LEFT JOIN CAT_Infraespecie infraespecieSotobosque ON sotobosque.InfraespecieID = infraespecieSotobosque.InfraespecieID 

LEFT JOIN CAT_TipoVigorSotobosqueRepoblado vigorSotobosque ON vigorSotobosque.VigorID=sotobosque.VigorID
LEFT JOIN CAT_AgenteDanio danioSotobosque ON danioSotobosque.AgenteDanioID=sotobosque.DanioID


GROUP BY
sotobosque.UPMID,
sotobosque.SitioID,
sotobosque.SotobosqueID

ORDER BY
sotobosque.UPMID
