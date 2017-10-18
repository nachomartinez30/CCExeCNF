--Autor @ Oscar Ignacio Martinez Diaz
--debe haber por lo menos un 1 como resultado de la consulta para ser modulo H
SELECT
EXISTS(
	SELECT 1 
	FROM  TAXONOMIA_VegetacionMayorGregarios vegetacionMayorGregarios 
	WHERE
	vegetacionMayorGregarios.UPMID= 
) AS vegetacionMayorGregarios,
EXISTS(
	SELECT 1 
	FROM  TAXONOMIA_VegetacionMayorIndividual vegetacionMayorIndividual 
	WHERE
	vegetacionMayorIndividual.UPMID= 
) AS vegetacionMayorIndividual ,
EXISTS(
	SELECT 1 
	FROM  TAXONOMIA_VegetacionMenor vegetacionMenor 
	WHERE
	vegetacionMenor.UPMID= 
) AS vegetacionMenor 
