--Autor @ Oscar Ignacio Martinez Diaz
--si el resuñtado es 1, pertenece al modulo D
SELECT
EXISTS(
	SELECT 1 
	FROM  TAXONOMIA_Arbolado arbolado
	WHERE
	(
		arbolado.ProporcionCopaVivaID != 0 OR
		arbolado.ExposicionCopaID != 0 OR
		arbolado.PosicionCopaID != 0 OR
		arbolado.DensidadCopaID != 0 OR
		arbolado.MuerteRegresivaID != 0 OR
		arbolado.TransparenciaFollajeID != 0 
		) 
	AND
	(arbolado.UPMID = )
) AS arbolado