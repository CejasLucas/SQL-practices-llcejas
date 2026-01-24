-- 🟦 SELECT DISTINCT
USE MaritimeSystemDB;

SELECT name AS Tabla, create_date AS FechaCreacion 
FROM sys.tables ORDER BY name;



-- 1. Obtener las nacionalidades �nicas de los tripulantes.  
SELECT DISTINCT cw.nationality 
FROM CREW_MEMBER cw ORDER BY cw.nationality;

-- 2. Listar los pa�ses distintos donde existen puertos.  
SELECT DISTINCT h.country 
FROM HARBOR h ORDER BY h.country;

-- 3. Mostrar los nombres �nicos de ciudades donde hay puertos.  
SELECT DISTINCT h.city 
FROM HARBOR h ORDER BY h.city;

-- 4. Obtener los distintos tipos de posiciones en el sistema.  
SELECT DISTINCT p.type 
FROM POSITION p ORDER BY p.type;

-- 5. Listar los diferentes tipos de puertos registrados (DAY/NIGHT).  
SELECT DISTINCT h.operation_type 
FROM HARBOR h ORDER BY h.operation_type;

-- 6. Obtener las ciudades de origen �nicas de los barcos.  
SELECT DISTINCT s.city 
FROM SHIP s ORDER BY s.city;

-- 7. Listar las nacionalidades �nicas de los barcos.  
SELECT DISTINCT s.country 
FROM SHIP s ORDER BY s.country;

-- 8. Mostrar los correos electr�nicos �nicos registrados.  
SELECT DISTINCT cw.email 
FROM CREW_MEMBER cw ORDER BY cw.email;

-- 9. Obtener los diferentes a�os de inicio de actividad de los barcos.  
SELECT DISTINCT YEAR(s.start_of_activity) 
FROM SHIP s ORDER BY YEAR(s.start_of_activity);

-- 10. Listar las regiones �nicas de los puertos.  
SELECT DISTINCT region FROM HARBOR ORDER BY region;

-- 11. Mostrar los tipos de itinerarios que han sido asignados a barcos durante un viaje.  
SELECT DISTINCT vh.itinerary_id, i.description 
FROM VOYAGE_HISTORY vh 
INNER JOIN ITINERARY i 
    ON vh.itinerary_id = i.itinerary_id 
ORDER BY vh.itinerary_id;

-- 12. Obtener las diferentes ciudades natales de los tripulantes.  
SELECT DISTINCT cw.city 
FROM CREW_MEMBER cw ORDER BY cw.city;

-- 13. Listar los pa�ses donde existen puertos con itinerarios.  
SELECT DISTINCT h.country 
FROM ARRIVAL_HISTORY ah
JOIN HARBOR h ON ah.harbor_id = h.harbor_id
ORDER BY h.country;

-- 14. Mostrar las distintas fechas de inicio de viaje de itinerarios.  
SELECT DISTINCT vh.actual_start_date
FROM VOYAGE_HISTORY vh;

-- 15. Obtener diferentes combinaciones de pa�s�tipo de puerto.
SELECT DISTINCT 
    h.country, 
    h.latitude, 
    h.longitude, 
    h.operation_type
FROM HARBOR h ORDER BY h.operation_type;
