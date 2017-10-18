--Autor @ Oscar Ignacio Martinez Diaz
--si el resultado > 2 pertenece al modulo C
SELECT 
count(conteo_carbono.conteo_sitios) as Resultado
FROM
UPM_UPM upm
JOIN (
	SELECT Distinct
	carbono.UPMID,
	carbono.SitioID as conteo_sitios
	FROM  CARBONO_LongitudComponente carbono
	WHERE
	carbono.UPMID=
	GROUP BY carbono.SitioID
) conteo_carbono on upm.UPMID = conteo_carbono.UPMID
