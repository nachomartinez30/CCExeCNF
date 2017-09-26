-- 0	B
-- 1	A
-- 2	AC
-- 3	ACEG
-- 4	AE
-- 5	ACDF
-- 6	ACD
-- 7	ACDE
-- 8	ACDEF
-- 10	ACH
-- 11	AH
-- 12	AEH
-- 13	ACEH
-- 14	AEG
-- 15	AG
-- 16	ACG

-- 17	ACEFG*
-- 18	AF*
-- 19	AEF*
-- 20	ACE*

UPDATE 
UPM_MallaPuntos
SET SecuenciaID= 1
WHERE 
	A = 'true'
and B = 'false'
and C = 'false'
and D = 'false'
and E = 'false'
and F = 'false'
and G = 'false'
and H = 'false';

UPDATE 
UPM_MallaPuntos
SET SecuenciaID= 2
WHERE 
	A = 'true'
and B = 'false'
and C = 'true'
and D = 'false'
and E = 'false'
and F = 'false'
and G = 'false'
and H = 'false';

UPDATE 
UPM_MallaPuntos
SET SecuenciaID= 3
WHERE 
	A = 'true'
and B = 'false'
and C = 'true'
and D = 'false'
and E = 'true'
and F = 'false'
and G = 'true'
and H = 'false';

UPDATE 
UPM_MallaPuntos
SET SecuenciaID= 4
WHERE 
	A = 'true'
and B = 'false'
and C = 'false'
and D = 'false'
and E = 'true'
and F = 'false'
and G = 'false'
and H = 'false';

UPDATE 
UPM_MallaPuntos
SET SecuenciaID= 5
WHERE 
	A = 'true'
and B = 'false'
and C = 'true'
and D = 'true'
and E = 'false'
and F = 'true'
and G = 'false'
and H = 'false';

UPDATE 
UPM_MallaPuntos
SET SecuenciaID= 6
WHERE 
	A = 'true'
and B = 'false'
and C = 'true'
and D = 'true'
and E = 'false'
and F = 'false'
and G = 'false'
and H = 'false';

UPDATE 
UPM_MallaPuntos
SET SecuenciaID= 7
WHERE 
	A = 'true'
and B = 'false'
and C = 'true'
and D = 'true'
and E = 'true'
and F = 'false'
and G = 'false'
and H = 'false';

UPDATE 
UPM_MallaPuntos
SET SecuenciaID= 8
WHERE 
	A = 'true'
and B = 'false'
and C = 'true'
and D = 'true'
and E = 'true'
and F = 'true'
and G = 'false'
and H = 'false';

UPDATE 
UPM_MallaPuntos
SET SecuenciaID= 9
WHERE 
	A = 'true'
and B = 'false'
and C = 'true'
and D = 'false'
and E = 'false'
and F = 'false'
and G = 'false'
and H = 'true';

UPDATE 
UPM_MallaPuntos
SET SecuenciaID= 10
WHERE 
	A = 'true'
and B = 'false'
and C = 'false'
and D = 'false'
and E = 'false'
and F = 'false'
and G = 'false'
and H = 'true';

UPDATE 
UPM_MallaPuntos
SET SecuenciaID= 11
WHERE 
	A = 'true'
and B = 'false'
and C = 'false'
and D = 'false'
and E = 'true'
and F = 'false'
and G = 'false'
and H = 'true';

UPDATE 
UPM_MallaPuntos
SET SecuenciaID= 12
WHERE 
	A = 'true'
and B = 'false'
and C = 'true'
and D = 'false'
and E = 'true'
and F = 'false'
and G = 'false'
and H = 'true';

UPDATE 
UPM_MallaPuntos
SET SecuenciaID= 13
WHERE 
	A = 'false'
and B = 'false'
and C = 'false'
and D = 'false'
and E = 'false'
and F = 'false'
and G = 'false'
and H = 'false';

UPDATE 
UPM_MallaPuntos
SET SecuenciaID= 14
WHERE 
	A = 'true'
and B = 'false'
and C = 'false'
and D = 'false'
and E = 'true'
and F = 'false'
and G = 'true'
and H = 'false';


UPDATE 
UPM_MallaPuntos
SET SecuenciaID= 15
WHERE 
	A = 'true'
and B = 'false'
and C = 'false'
and D = 'false'
and E = 'false'
and F = 'false'
and G = 'true'
and H = 'false';

UPDATE 
UPM_MallaPuntos
SET SecuenciaID= 16
WHERE 
	A = 'true'
and B = 'false'
and C = 'true'
and D = 'false'
and E = 'false'
and F = 'false'
and G = 'true'
and H = 'false';



UPDATE 
UPM_MallaPuntos
SET SecuenciaID= 17
WHERE 
	A = 'true'
and B = 'false'
and C = 'true'
and D = 'false'
and E = 'true'
and F = 'true'
and G = 'true'
and H = 'false';


UPDATE 
UPM_MallaPuntos
SET SecuenciaID= 18
WHERE 
	A = 'true'
and B = 'false'
and C = 'false'
and D = 'false'
and E = 'false'
and F = 'true'
and G = 'false'
and H = 'false';


UPDATE 
UPM_MallaPuntos
SET SecuenciaID= 19
WHERE 
	A = 'true'
and B = 'false'
and C = 'false'
and D = 'false'
and E = 'true'
and F = 'true'
and G = 'false'
and H = 'false';


UPDATE 
UPM_MallaPuntos
SET SecuenciaID= 20
WHERE 
	A = 'true'
and B = 'false'
and C = 'true'
and D = 'false'
and E = 'true'
and F = 'false'
and G = 'false'
and H = 'false';




--_________________________________________________


UPDATE 
UPM_MallaPuntos
SET A= 1
WHERE A= 'true';
UPDATE 
UPM_MallaPuntos
SET A= 0
WHERE A= 'false';

UPDATE 
UPM_MallaPuntos
SET B= 1
WHERE B= 'true';
UPDATE 
UPM_MallaPuntos
SET B= 0
WHERE B= 'false';

UPDATE 
UPM_MallaPuntos
SET C= 1
WHERE C= 'true';
UPDATE 
UPM_MallaPuntos
SET C= 0
WHERE C= 'false';

UPDATE 
UPM_MallaPuntos
SET D= 1
WHERE D= 'true';
UPDATE 
UPM_MallaPuntos
SET D= 0
WHERE D= 'false';

UPDATE 
UPM_MallaPuntos
SET E= 1
WHERE E= 'true';
UPDATE 
UPM_MallaPuntos
SET E= 0
WHERE E= 'false';

UPDATE 
UPM_MallaPuntos
SET F= 1
WHERE F= 'true';
UPDATE 
UPM_MallaPuntos
SET F= 0
WHERE F= 'false';

UPDATE 
UPM_MallaPuntos
SET G= 1
WHERE G= 'true';
UPDATE 
UPM_MallaPuntos
SET G= 0
WHERE G= 'false';

UPDATE 
UPM_MallaPuntos
SET H= 1
WHERE H= 'true';
UPDATE 
UPM_MallaPuntos
SET H= 0
WHERE H= 'false';


--provedoores por region

UPDATE 
UPM_MallaPuntos
SET ProveedorID= 1--DIAAPROY
WHERE Region= 'CENTRO-SUR';

UPDATE 
UPM_MallaPuntos
SET ProveedorID= 2 --INYDES
WHERE Region= 'NOROESTE'
OR (Region= 'NORTE-NORESTE')
OR (Region= 'CENTRO-NORTE-OCCIDENTE');

UPDATE 
UPM_MallaPuntos
SET ProveedorID= 3 --AMAREF
WHERE Region= 'SURESTE';

