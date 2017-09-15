SELECT
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
repobladovm.Consecutivo,
familiaRepoblado.Nombre AS Familia,
generoRepoblado.Nombre AS Genero,
especieRepoblado.Nombre AS Especie,
infraespecieRepoblado.Nombre AS Infraespecie,
repobladovm.NombreComun,
repobladovm.EsColecta,
repobladovm.Frecuencia50,
repobladovm.PorcentajeCobertura50,
repobladovm.Frecuencia51200,
repobladovm.PorcentajeCobertura51200,
repobladovm.Frecuencia200,
repobladovm.PorcentajeCobertura200,
agenteDanio1.Agente1, 
agenteDanio1.Severidad1, 
agenteDanio2.Agente2, 
agenteDanio2.Severidad2,
vigorRepoblado.Descripcion,
repobladovm.ClaveColecta

FROM
TAXONOMIA_RepobladoVM repobladovm

 JOIN SITIOS_Sitio sitio ON sitio.SitioID=repobladovm.SitioID AND sitio.UPMID=repobladovm.UPMID
 JOIN UPM_UPM upm ON upm.UPMID=sitio.UPMID
 JOIN UPM_MallaPuntos upmMala ON upmMala.UPMID=upm.UPMID

LEFT JOIN CAT_ClaveSerieV claveSerieV ON claveSerieV.ClaveSerieVID = sitio.ClaveSerieV
LEFT JOIN CAT_FaseSucecional faseSucecional ON faseSucecional.FaseSucecionalID =sitio.FaseSucecional
LEFT JOIN CAT_TipoExposicion exposicionUPM ON exposicionUPM.ExposicionID =upm.ExposicionID
LEFT JOIN CAT_TipoFisiografia fisiografia ON fisiografia.FisiografiaID=upm.FisiografiaID


LEFT JOIN CAT_FamiliaEspecie familiaRepoblado ON repobladovm.FamiliaID = familiaRepoblado.FamiliaID 
LEFT JOIN CAT_Genero generoRepoblado ON repobladovm.GeneroID = generoRepoblado.GeneroID 
LEFT JOIN CAT_Especie especieRepoblado ON repobladovm.EspecieID = especieRepoblado.EspecieID 
LEFT JOIN CAT_Infraespecie infraespecieRepoblado ON repobladovm.InfraespecieID = infraespecieRepoblado.InfraespecieID 

LEFT JOIN CAT_TipoVigorSotobosqueRepoblado vigorRepoblado ON vigorRepoblado.VigorID=repobladovm.VigorID



LEFT JOIN (SELECT ad.RepobladoVMID, 
                  ca.Clave AS Agente1, 
                  cp.Clave AS severidad1 
                  FROM REPOBLADO_AgenteDanio ad 
                  LEFT JOIN CAT_AgenteDanio ca 
                  ON ad.AgenteDanioID = ca.AgenteDanioID 
                  LEFT JOIN CAT_PorcentajeArbolado cp 
                  ON ad.SeveridadID = cp.PorcentajeArboladoID 
                  WHERE ad.NumeroDanio = 1) agenteDanio1 ON repobladovm.RepobladoVMID = agenteDanio1.RepobladoVMID 
LEFT JOIN (SELECT ad.RepobladoVMID, 
                  ca.Clave AS Agente2, 
                  cp.Clave AS severidad2 
                  FROM REPOBLADO_AgenteDanio ad 
                  LEFT JOIN CAT_AgenteDanio ca 
                  ON ad.AgenteDanioID = ca.AgenteDanioID 
                  LEFT JOIN CAT_PorcentajeArbolado cp 
                  ON ad.SeveridadID = cp.PorcentajeArboladoID 
                  WHERE ad.NumeroDanio = 2) agenteDanio2 ON repobladovm.RepobladoVMID = agenteDanio2.RepobladoVMID
--WHERE