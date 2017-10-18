--Autor @ Oscar Ignacio Martinez Diaz
--debe haber por lo menos un 1 como resultado de la consulta para ser modulo E
SELECT

EXISTS(
	SELECT 1 
	FROM  SUELO_Hojarasca hojarasca  
	WHERE
	hojarasca.UPMID= 
) AS Hojarasca,

EXISTS(
	SELECT 1 
	FROM  SUELO_MuestrasPerfil muestrasPerfil  
	WHERE
	muestrasPerfil.UPMID= 
) AS MuestrasPerfil

