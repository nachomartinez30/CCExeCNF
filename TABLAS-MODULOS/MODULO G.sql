--Autor @ Oscar Ignacio Martinez Diaz
--debe haber por lo menos un 1 como resultado de la consulta
SELECT
EXISTS(
	SELECT 1 
	FROM  SITIOS_ParametrosFisicoQuimicos parametrosFQ
	WHERE
	parametrosFQ.UPMID= 
) AS parametrosFQs,
EXISTS(
	SELECT 1 
	FROM  TAXONOMIA_RepobladoVM repobladoVm
	WHERE
	repobladoVm.UPMID=
) AS repoblado,
EXISTS(
	SELECT 1 
	FROM  TAXONOMIA_Arbolado arbolado
	WHERE
	arbolado.DiametroBasal IS NOT NULL
	AND
	arbolado.UPMID=
) AS arbolado
