UPDATE BRIGADA_Brigadistas SET  PuestoID = 1 WHERE Nombre="David" AND ApellidoPaterno="Bautista" AND ApellidoMaterno="Paez" OR Nombre="Joaquín" AND ApellidoPaterno="García" AND ApellidoMaterno="Barrios"; 
UPDATE BRIGADA_Brigadistas    SET Nombre = ltrim(rtrim(Nombre)), ApellidoMaterno = ltrim(rtrim(ApellidoMaterno)), ApellidoPaterno = ltrim(rtrim(ApellidoPaterno)) ;
