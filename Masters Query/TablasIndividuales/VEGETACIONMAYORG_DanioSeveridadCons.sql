SELECT
danioSeveridad.SitioID,
danioSeveridad.UPMID,
danioSeveridad.DanioSeveridadID,
danioSeveridad.VegetacionMayorID,
danioSeveridad.NumeroDanio,
agenteDanio.Agente,
severidadZA.Descripcion


FROM
VEGETACIONMAYORG_DanioSeveridad danioSeveridad

JOIN SITIOS_Sitio sitio ON sitio.SitioID=danioSeveridad.SitioID and danioSeveridad.UPMID=sitio.UPMID

LEFT JOIN CAT_AgenteDanio agenteDanio ON agenteDanio.AgenteDanioID = danioSeveridad.AgenteDanioID
LEFT JOIN CAT_SeveridadZA severidadZA ON severidadZA.SeveridadID = danioSeveridad.SeveridadID
