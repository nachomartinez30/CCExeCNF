-- 0	B
-- 1	A
-- 2	AC
-- 3	ACEG
-- 4	AE
-- 5	ACDF
-- 6	ACD
-- 7	ACDE
-- 8	ACDEF
-- 9	ACE
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


UPDATE --A
UPM_MallaPuntos
SET SecuenciaID= 1
WHERE 
	A = 1
and B = 0
and C = 0
and D = 0
and E = 0
and F = 0
and G = 0
and H = 0;


UPDATE --AC
UPM_MallaPuntos
SET SecuenciaID= 2
WHERE 
	A = 1
and B = 0
and C = 0
and D = 0
and E = 0
and F = 0
and G = 0
and H = 0;



UPDATE --ACEG
UPM_MallaPuntos
SET SecuenciaID= 3
WHERE 
	A = 1
and B = 0
and C = 1
and D = 0
and E = 1
and F = 0
and G = 1
and H = 0;



UPDATE --AE
UPM_MallaPuntos
SET SecuenciaID= 4
WHERE 
	A = 1
and B = 0
and C = 0
and D = 0
and E = 1
and F = 0
and G = 0
and H = 0;



UPDATE --ACDF
UPM_MallaPuntos
SET SecuenciaID= 5
WHERE 
	A = 1
and B = 0
and C = 1
and D = 1
and E = 0
and F = 1
and G = 0
and H = 0;



UPDATE --ACD
UPM_MallaPuntos
SET SecuenciaID= 6
WHERE 
	A = 1
and B = 0
and C = 1
and D = 1
and E = 0
and F = 0
and G = 0
and H = 0;



UPDATE --ACDE
UPM_MallaPuntos
SET SecuenciaID= 7
WHERE 
	A = 1
and B = 0
and C = 0
and D = 0
and E = 0
and F = 0
and G = 0
and H = 0;



UPDATE --ACDEF
UPM_MallaPuntos
SET SecuenciaID= 8
WHERE 
	A = 1
and B = 0
and C = 1
and D = 1
and E = 1
and F = 1
and G = 0
and H = 0;



UPDATE	-- ACE
UPM_MallaPuntos
SET SecuenciaID= 9
WHERE 
	A = 1
and B = 0
and C = 1
and D = 0
and E = 1
and F = 0
and G = 0
and H = 0;



UPDATE -- ACH
UPM_MallaPuntos
SET SecuenciaID= 10
WHERE 
	A = 1
and B = 0
and C = 1
and D = 0
and E = 0
and F = 0
and G = 0
and H = 1;



UPDATE -- AH
UPM_MallaPuntos
SET SecuenciaID= 11
WHERE 
	A = 1
and B = 0
and C = 0
and D = 0
and E = 0
and F = 0
and G = 0
and H = 1;



UPDATE --AEH 
UPM_MallaPuntos
SET SecuenciaID= 12
WHERE 
	A = 1
and B = 0
and C = 0
and D = 0
and E = 1
and F = 0
and G = 0
and H = 1;



UPDATE --ACEH
UPM_MallaPuntos
SET SecuenciaID= 13
WHERE 
	A = 1
and B = 0
and C = 1
and D = 0
and E = 1
and F = 0
and G = 0
and H = 1;



UPDATE -- AEG
UPM_MallaPuntos
SET SecuenciaID= 14
WHERE 
	A = 1
and B = 0
and C = 0
and D = 0
and E = 1
and F = 0
and G = 1
and H = 0;



UPDATE -- AG
UPM_MallaPuntos
SET SecuenciaID= 15
WHERE 
	A = 1
and B = 0
and C = 0
and D = 0
and E = 0
and F = 0
and G = 1
and H = 0;



UPDATE -- ACG
UPM_MallaPuntos
SET SecuenciaID= 16
WHERE 
	A = 1
and B = 0
and C = 1
and D = 0
and E = 0
and F = 0
and G = 1
and H = 0;



UPDATE -- ACEFG*
UPM_MallaPuntos
SET SecuenciaID= 17
WHERE 
	A = 1
and B = 0
and C = 1
and D = 0
and E = 1
and F = 1
and G = 1
and H = 0;



UPDATE -- AF*
UPM_MallaPuntos
SET SecuenciaID= 18
WHERE 
	A = 1
and B = 0
and C = 0
and D = 0
and E = 0
and F = 1
and G = 0
and H = 0;



UPDATE -- AEF*
UPM_MallaPuntos
SET SecuenciaID= 19
WHERE 
	A = 1
and B = 0
and C = 0
and D = 0
and E = 1
and F = 1
and G = 0
and H = 0;

