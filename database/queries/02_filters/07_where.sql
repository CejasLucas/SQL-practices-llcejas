-- 🟪 WHERE ( AND / OR / NOT )
USE MaritimeLogisticsDB;

SELECT name AS Tabla, create_date AS FechaCreacion 
FROM sys.tables ORDER BY name;


-- 1. Tripulantes españoles **y** argentinos.  

-- 2. Puertos en Italia **o** Francia.  

-- 3. Barcos cuya ciudad origen no sea “Roma”.  

-- 4. Tripulantes de España y nacidos después de 1990.  

-- 5. Puertos de tipo NIGHT o DAY.  

-- 6. Itinerarios que no sean mediterráneos.  

-- 7. Barcos italianos y actividad posterior a 2015.  

-- 8. Tripulantes cuya ciudad sea Madrid o Barcelona.  

-- 9. Puertos cuyo nombre contenga “Port” y país Francia.  

-- 10. Tripulantes no nacidos antes de 1980.  

-- 11. Barcos en ciudades españolas o portuguesas.  

-- 12. Puertos que no estén en regiones del norte.  

-- 13. Itinerarios con puertos españoles o italianos.  

-- 14. Tripulantes jóvenes y contratados recientemente.  

-- 15. Barcos cuyo nombre no comience con “A”.