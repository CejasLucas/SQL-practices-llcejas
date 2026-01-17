-- 🟪 WHERE ( IN ) 
USE MaritimeLogisticsDB;

SELECT name AS Tabla, create_date AS FechaCreacion 
FROM sys.tables ORDER BY name;


-- 1. Puertos en países (“España”, “Italia”, “Francia”).  
SELECT * FROM HARBOR h
WHERE h.country IN ('Spain', 'Italy', 'France')
ORDER BY h.country DESC;

-- 2. Tripulantes cuyo origen esté entre varias ciudades.  
SELECT * FROM CREW_MEMBER cw
WHERE cw.home_city IN ('Osaka', 'Frankfurt', 'Santos')
ORDER BY cw.home_city DESC;

-- 3. Barcos cuya nacionalidad esté en una lista.  
SELECT * FROM SHIP s
WHERE s.nationality IN ('Russia', 'Brazil', 'China')
ORDER BY s.nationality, s.start_of_activity;

-- 4. Puertos de varias regiones.  
SELECT * FROM HARBOR h
WHERE h.region IN ('AMBA', 'Dubai', 'Florida')
ORDER BY h.country;

-- 5. Itinerarios específicos según ID.  
SELECT * FROM ITINERARY i
WHERE i.itinerary_id IN (1, 9, 13, 17);

-- 6. Tripulantes con emails corporativos específicos.  
SELECT * FROM CREW_MEMBER cw
WHERE RIGHT(cw.email, 12) IN ('@outlook.com'); 

-- 7. Puertos en ciudades seleccionadas.  
SELECT * FROM HARBOR h
WHERE h.city IN ('Vancouver', 'Manila', 'Oslo')
ORDER BY h.country;

-- 8. Tripulantes con los apellidos de la siguiente lista.  
SELECT * FROM CREW_MEMBER cw
WHERE cw.last_name IN ('Lopez', 'Olsen', 'Khaled')
ORDER BY cw.last_name;

-- 9. Barcos cuyos nombres estén en una lista determinada.  
SELECT * FROM SHIP s
WHERE s.name_or_nickname IN ('Blue Horizon', 'San Rafael II', 'Helios I', 'Polar Princess')
ORDER BY s.nationality;

-- 10. Itinerarios de barcos por múltiples IDs. */
SELECT * FROM SHIPS_IN_ITINERARIES si
WHERE si.itinerary_id IN (4, 10, 17, 1)
ORDER BY si.itinerary_id;
