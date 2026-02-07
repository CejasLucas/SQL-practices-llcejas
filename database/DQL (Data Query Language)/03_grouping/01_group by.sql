-- ⬛ GROUP BY
USE MaritimeSystemDB;

SELECT name AS Tabla, create_date AS FechaCreacion 
FROM sys.tables ORDER BY name;


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
    s.city AS origin_city,
    COUNT(*) AS ship_count
FROM SHIP s
GROUP BY s.city 
ORDER BY origin_city;

-- 4. Puertos por tipo.  
SELECT 
    h.operation_type AS port_type,
    COUNT(*) AS port_count
FROM HARBOR h
GROUP BY h.operation_type;

-- 5. Tripulantes por ciudad natal.  
SELECT 
    cw.city AS home_city,
    COUNT(*) AS crew_member_count
FROM CREW_MEMBER cw
GROUP BY cw.city
ORDER BY crew_member_count DESC;

-- 6. Barcos por nacionalidad.
SELECT 
    s.country AS ship_nationality,
    COUNT(*) AS ship_count
FROM SHIP s
GROUP BY s.country
ORDER BY ship_count DESC;

-- 7. Itinerarios por cantidad de puertos.
SELECT
    vh.itinerary_id,
    COUNT(DISTINCT ah.harbor_id) AS harbor_count
FROM VOYAGE_HISTORY vh
INNER JOIN ARRIVAL_HISTORY ah 
    ON vh.voyage_id = ah.voyage_id
GROUP BY vh.itinerary_id;

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
FROM SHIPBOARD_STAFFING sp
INNER JOIN POSITION p 
    ON sp.position_id = p.position_id
GROUP BY sp.position_id, p.type
ORDER BY assignment_count;
