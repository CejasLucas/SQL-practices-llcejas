-- ⚪ HAVING 
USE MaritimeSystemDB;

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
    sp.ship_id,
    COUNT(*) AS count_crew
FROM SHIPBOARD_STAFFING sp
GROUP BY sp.ship_id
HAVING COUNT(*) > 10;

-- 3. Puertos utilizados en más de 3 itinerarios.  
SELECT 
    ah.harbor_id,
    COUNT(DISTINCT vh.itinerary_id) AS count_itineraries
FROM VOYAGE_HISTORY vh
INNER JOIN ARRIVAL_HISTORY ah
    ON vh.voyage_id = ah.voyage_id
GROUP BY ah.harbor_id
HAVING COUNT(DISTINCT vh.itinerary_id) > 1;

-- 4. Itinerarios que visitaron puertos de más de 2 países distintos
SELECT 
    vh.itinerary_id,
    COUNT(DISTINCT h.country) AS count_countries
FROM VOYAGE_HISTORY vh
INNER JOIN ARRIVAL_HISTORY ah
    ON vh.voyage_id = ah.voyage_id
INNER JOIN HARBOR h
    ON ah.harbor_id = h.harbor_id
GROUP BY vh.itinerary_id
HAVING COUNT(DISTINCT h.country) > 2;

-- 5. Posiciones usadas más de 26 veces.  
SELECT 
    sp.position_id,
    p.type,
    COUNT(*) AS number_of_repetitions
FROM SHIPBOARD_STAFFING sp
INNER JOIN POSITION p ON sp.position_id = p.position_id
GROUP BY sp.position_id, p.type
HAVING COUNT(*) > 26;

-- 6. Tripulantes que trabajaron en más de 2 barco.  
SELECT 
    cws.crew_id,
    COUNT(*) AS number_of_ships
FROM SHIPBOARD_STAFFING cws
GROUP BY cws.crew_id
HAVING COUNT(*) > 2;

-- 7. Barcos con actividad superior a 10 años.  
SELECT 
    s.ship_id,
    s.nickname,
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

-- 9. Viajes con más de 31 días de duración.  
SELECT 
    itinerary_id,
    SUM(DATEDIFF(DAY, vh.actual_start_date, vh.actual_end_date)) AS duration_days
FROM VOYAGE_HISTORY vh
GROUP BY vh.itinerary_id
HAVING SUM(DATEDIFF(DAY, vh.actual_start_date, vh.actual_end_date)) > 31;

-- 10. Barcos con más de 2 viajes.
SELECT 
    vh.ship_id,
    COUNT(*) AS number_of_voyages
FROM VOYAGE_HISTORY vh
GROUP BY vh.ship_id
HAVING COUNT(*) > 2
ORDER BY vh.ship_id;
