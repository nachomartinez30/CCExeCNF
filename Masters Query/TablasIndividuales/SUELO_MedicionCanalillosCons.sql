SELECT
medicionCanalillos.UPMID,
medicionCanalillos.SitioID,
medicionCanalillos.MedicionCanalillosID,
-- _____________________________________________________________________________________________________________________________________________________________________________________________
sitio.Sitio,
upmMala.Estado,
upmMala.Municipio,
-- _____________________________________________________________________________________________________________________________________________________________________________________________
medicionCanalillos.NumeroCanalillos,
medicionCanalillos.ProfundidadPromedio,
medicionCanalillos.Longitud,
medicionCanalillos.Volumen


FROM
SUELO_MedicionCanalillos medicionCanalillos

JOIN SITIOS_Sitio sitio ON sitio.SitioID=medicionCanalillos.SitioID
JOIN UPM_MallaPuntos upmMala ON upmMala.UPMID=medicionCanalillos.UPMID

GROUP BY
medicionCanalillos.UPMID,
medicionCanalillos.SitioID,
medicionCanalillos.MedicionCanalillosID
ORDER BY
medicionCanalillos.UPMID