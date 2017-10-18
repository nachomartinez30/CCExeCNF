--Autor @ Oscar Ignacio Martinez Diaz
--debe haber por lo menos un 1 como resultado de la consulta para ser modulo F
SELECT

EXISTS(
	SELECT 1 
	FROM  SITIOS_FotografiaHemisferica fotografiaHemisferica
	WHERE
	fotografiaHemisferica.UPMID= 
) AS fotografiaHemisferica
