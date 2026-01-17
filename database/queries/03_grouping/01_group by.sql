-- ⬛ GROUP BY
USE MaritimeLogisticsDB;

SELECT 
    name AS table_name, 
    create_date AS creation_date
FROM sys.tables 
ORDER BY name;


-- 1. Agrupar tripulantes por nacionalidad.  
SELECT 
    cw.nationality AS nationality,
    COUNT(*) AS crew_member_count
FROM CREW_MEMBER cw
GROUP BY cw.nationality 
ORDER BY nationality;


-- 2. Agrupar puertos por país.  
SELECT 
    h.country AS country,
    COUNT(*) AS harbor_count
FROM HARBOR h
GROUP BY h.country 
ORDER BY country;


-- 3. Agrupar barcos por ciudad de origen.  
SELECT 
    s.origin_city AS origin_city,
    COUNT(*) AS ship_count
FROM SHIP s
GROUP BY s.origin_city 
ORDER BY origin_city;


-- 4. Puertos por tipo.  
SELECT 
    h.port_type AS port_type,
    COUNT(*) AS port_count
FROM HARBOR h
GROUP BY h.port_type;


-- 5. Tripulantes por ciudad natal.  
SELECT 
    cw.home_city AS home_city,
    COUNT(*) AS crew_member_count
FROM CREW_MEMBER cw
GROUP BY cw.home_city
ORDER BY crew_member_count DESC;


-- 6. Barcos por nacionalidad.
SELECT 
    s.nationality AS ship_nationality,
    COUNT(*) AS ship_count
FROM SHIP s
GROUP BY s.nationality
ORDER BY ship_count DESC;


-- 7. Itinerarios por cantidad de puertos.
SELECT
    i.description AS itinerary_description,
    hi.itinerary_id AS itinerary_id,
    COUNT(*) AS harbor_count
FROM HARBORS_IN_ITINERARIES hi
INNER JOIN ITINERARY i 
    ON hi.itinerary_id = i.itinerary_id
GROUP BY hi.itinerary_id, i.description;


-- 8. Tripulantes por año de nacimiento.
SELECT 
    YEAR(cw.birth_date) AS birth_year,
    COUNT(*) AS crew_member_count
FROM CREW_MEMBER cw
GROUP BY YEAR(cw.birth_date)
ORDER BY birth_year;


-- 9. Barcos por año de inicio de actividad.
SELECT 
    YEAR(s.start_of_activity) AS activity_start_year,
    COUNT(*) AS ship_count
FROM SHIP s
GROUP BY YEAR(s.start_of_activity)
ORDER BY activity_start_year;


-- 10. Asignaciones por posición.
SELECT 
    p.type AS position_name,
    COUNT(*) AS assignment_count
FROM CREW_ASSIGNMENTS_TO_SHIPS cws
INNER JOIN POSITION p 
    ON cws.position_id = p.position_id
GROUP BY cws.position_id, p.type
ORDER BY assignment_count;
