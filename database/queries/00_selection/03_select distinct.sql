-- 🟦 SELECT DISTINCT
USE MaritimeLogisticsDB;

SELECT name AS Tabla, create_date AS FechaCreacion 
FROM sys.tables ORDER BY name;



-- 1. Obtener las nacionalidades �nicas de los tripulantes.  
SELECT DISTINCT nationality FROM CREW_MEMBER ORDER BY nationality;

-- 2. Listar los pa�ses distintos donde existen puertos.  
SELECT DISTINCT country FROM HARBOR ORDER BY country;

-- 3. Mostrar los nombres �nicos de ciudades donde hay puertos.  
SELECT DISTINCT city FROM HARBOR ORDER BY city;

-- 4. Obtener los distintos tipos de posiciones en el sistema.  
SELECT DISTINCT position_type FROM POSITION ORDER BY position_type;

-- 5. Listar los diferentes tipos de puertos registrados (DAY/NIGHT).  
SELECT DISTINCT port_type FROM HARBOR ORDER BY port_type;

-- 6. Obtener las ciudades de origen �nicas de los barcos.  
SELECT DISTINCT origin_city FROM SHIP ORDER BY origin_city;

-- 7. Listar las nacionalidades �nicas de los barcos.  
SELECT DISTINCT nationality FROM SHIP ORDER BY nationality;

-- 8. Mostrar los correos electr�nicos �nicos registrados.  
SELECT DISTINCT email FROM CREW_MEMBER ORDER BY email;

-- 9. Obtener los diferentes a�os de inicio de actividad de los barcos.  
SELECT DISTINCT start_of_activity FROM SHIP ORDER BY start_of_activity;

-- 10. Listar las regiones �nicas de los puertos.  
SELECT DISTINCT region FROM HARBOR ORDER BY region;

-- 11. Mostrar los tipos de itinerarios que han sido asignados a barcos.  
SELECT DISTINCT si.ship_id, i.description FROM SHIPS_IN_ITINERARIES si 
JOIN ITINERARY i ON si.itinerary_id = i.itinerary_id ORDER BY si.ship_id;

-- 12. Obtener las diferentes ciudades natales de los tripulantes.  
SELECT DISTINCT nationality FROM CREW_MEMBER ORDER BY nationality;

-- 13. Listar los pa�ses donde existen puertos con itinerarios.  
SELECT DISTINCT country FROM HARBORS_IN_ITINERARIES hi
JOIN HARBOR h ON hi.harbor_id = h.harbor_id
ORDER BY country;

-- 14. Mostrar las distintas fechas de inicio de viaje de itinerarios.  
SELECT DISTINCT voyage_start_date FROM SHIPS_IN_ITINERARIES ;

-- 15. Obtener diferentes combinaciones de pa�s�tipo de puerto.
SELECT DISTINCT country, port_type FROM HARBOR ORDER BY port_type;
