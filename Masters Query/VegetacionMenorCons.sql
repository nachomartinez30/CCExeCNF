SELECT
upm.UPMID,
upmMalla.Estado,
upmMalla.Municipio,

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
--infromacion vegetacion menor
vegetacionMenor.Consecutivo,
familia.Nombre AS Familia,
genero.Nombre AS Genero,
especie.Nombre AS Especie,
infraespecie.Nombre AS Infraespecie,
formaVida.Descripcion AS FormaVida,
vegetacionMenor.NombreComun,
condicionVM.Descripcion AS Condicion,
vegetacionMenor.Numero0110,
vegetacionMenor.Numero1125,
vegetacionMenor.Numero2650,
vegetacionMenor.Numero5175,
vegetacionMenor.Numero76100,
vegetacionMenor.Numero101125,
vegetacionMenor.Numero126150,
vegetacionMenor.Numero150,
vegetacionMenor.PorcentajeCobertura,
vigor.Descripcion AS Vigor


from 
TAXONOMIA_VegetacionMenor vegetacionMenor

LEFT JOIN SITIOS_Sitio sitio ON sitio.SitioID=vegetacionMenor.SitioID
LEFT JOIN UPM_UPM upm ON upm.UPMID=sitio.UPMID
LEFT JOIN UPM_MallaPuntos upmMalla ON upmMalla.UPMID=upm.UPMID

LEFT JOIN CAT_ClaveSerieV claveSerieV ON claveSerieV.ClaveSerieVID = sitio.ClaveSerieV
LEFT JOIN CAT_FaseSucecional faseSucecional on faseSucecional.FaseSucecionalID =sitio.FaseSucecional
LEFT JOIN CAT_TipoExposicion exposicionUPM ON exposicionUPM.ExposicionID =upm.ExposicionID
LEFT JOIN CAT_TipoFisiografia fisiografia ON fisiografia.FisiografiaID=upm.FisiografiaID

LEFT JOIN CAT_FamiliaEspecie familia ON vegetacionMenor.FamiliaID = familia.FamiliaID 
LEFT JOIN CAT_Genero genero ON vegetacionMenor.GeneroID = genero.GeneroID 
LEFT JOIN CAT_Especie especie ON vegetacionMenor.EspecieID = especie.EspecieID 
LEFT JOIN CAT_Infraespecie infraespecie ON vegetacionMenor.InfraespecieID = infraespecie.InfraespecieID 
LEFT JOIN CAT_TipoFormaVidaArbolado formaVida ON vegetacionMenor.FormaVidaID = formaVida.FormaVidaID
LEFT JOIN CAT_TipoVigorSotobosqueRepoblado vigor ON vigor.VigorID=vegetacionMenor.VigorID
LEFT JOIN CAT_CondicionVM condicionVM ON condicionVM.CondicionVMID=vegetacionMenor.CondicionID

GROUP BY
vegetacionMenor.UPMID,
vegetacionMenor.SitioID,
vegetacionMenor.VegetacionMenorID

ORDER BY
vegetacionMenor.UPMID