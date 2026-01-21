-- 🟣 HAVING 
USE MaritimeLogisticsDB;

SELECT name AS Tabla, create_date AS FechaCreacion 
FROM sys.tables ORDER BY name;


-- 1. Nacionalidades con más de 5 tripulantes.  
SELECT 
    cw.nationality, 
    COUNT(*) AS count_crew
FROM CREW_MEMBER cw
GROUP BY cw.nationality
HAVING COUNT(*) > 5;


-- 2. Barcos con más de 10 asignaciones.  
SELECT 
    cws.ship_id,
    COUNT(*) AS count_crew
FROM CREW_ASSIGNMENTS_TO_SHIPS cws
GROUP BY cws.ship_id
HAVING COUNT(*) > 10;

-- 3. Puertos utilizados en más de 3 itinerarios.  
SELECT 
    hi.harbor_id,
    COUNT(*) as count_itineraries
FROM HARBORS_IN_ITINERARIES hi
GROUP BY hi.harbor_id
HAVING COUNT(*) > 3;

-- 4. Itinerarios con más de 2 puertos.  
SELECT 
    hi.itinerary_id,
    COUNT(*) as count_harbor
FROM HARBORS_IN_ITINERARIES hi
GROUP BY hi.itinerary_id
HAVING COUNT(*) > 2;

-- 5. Posiciones usadas más de 25 veces.  
SELECT 
    cws.position_id,
    p.type,
    COUNT(*) AS number_of_repetitions
FROM CREW_ASSIGNMENTS_TO_SHIPS cws
INNER JOIN POSITION p ON cws.position_id = p.position_id
GROUP BY cws.position_id, p.type
HAVING COUNT(*) > 25;

-- 6. Tripulantes que trabajaron en más de 2 barco.  
SELECT 
    cws.crew_id,
    COUNT(*) AS number_of_ships
FROM CREW_ASSIGNMENTS_TO_SHIPS cws
GROUP BY cws.crew_id
HAVING COUNT(*) > 2;

-- 7. Barcos con actividad superior a 10 años.  
SELECT 
    s.ship_id,
    s.name_or_nickname,
    DATEDIFF(YEAR, s.start_of_activity, GETDATE()) AS years_active
FROM SHIP s
WHERE DATEDIFF(YEAR, s.start_of_activity, GETDATE()) > 10;

-- 8. Puertos de países con más de 1 registro.  
SELECT 
    h.country,
    COUNT(*) AS number_of_harbors
FROM HARBOR h
GROUP BY h.country
HAVING COUNT(*) > 1;

-- 9. Itinerarios con más de 31 días de duración.  
SELECT 
    itinerary_id,
    SUM(DATEDIFF(DAY, voyage_start_date, voyage_end_date)) AS duration_days
FROM SHIPS_IN_ITINERARIES
GROUP BY itinerary_id
HAVING SUM(DATEDIFF(DAY, voyage_start_date, voyage_end_date)) > 31;

-- 10. Barcos con más de 2 viajes.
SELECT 
    si.ship_id,
    COUNT(*) AS number_of_voyages
FROM SHIPS_IN_ITINERARIES si
GROUP BY si.ship_id
HAVING COUNT(*) > 2
ORDER BY si.ship_id;
