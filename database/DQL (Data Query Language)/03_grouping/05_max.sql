-- ⚫ MAX()
USE MaritimeSystemDB;

SELECT name AS Tabla, create_date AS FechaCreacion 
FROM sys.tables 
ORDER BY name;

-- 1. Fecha más reciente de inicio de actividades de los barcos
SELECT 
    MAX(start_of_activity) AS latest_start_of_activity 
FROM SHIP;

-- 2. Fecha de nacimiento más reciente de un tripulante (más joven)
SELECT 
    MAX(birth_date) AS most_recent_birth_date 
FROM CREW_MEMBER;

-- 3. Fecha de fin de viaje más lejana
SELECT 
    MAX(actual_end_date) AS farthest_voyage_end_date 
FROM VOYAGE_HISTORY;

-- 4. Máximo número de puertos en un itinerario
SELECT
    MAX(ports_count) AS max_ports_in_itinerary
FROM (
    SELECT
        vh.itinerary_id,
        COUNT(DISTINCT ah.harbor_id) AS ports_count
    FROM VOYAGE_HISTORY vh
    INNER JOIN ARRIVAL_HISTORY ah
        ON vh.voyage_id = ah.voyage_id
    GROUP BY vh.itinerary_id
) AS itinerary_ports;

-- 5. Mayor duración de un viaje registrado (en días)
SELECT TOP 1 
    ship_id, 
    itinerary_id, 
    DATEDIFF(DAY, vh.actual_start_date, vh.actual_end_date) AS duration_days
FROM VOYAGE_HISTORY vh
ORDER BY duration_days DESC;

-- 6. Última fecha de inicio de asignación
SELECT 
    MAX(sp.assignment_start_date) AS last_assignment_date 
FROM SHIPBOARD_STAFFING sp;

-- 7. Puerto con nombre más “alto” alfabéticamente
SELECT TOP 1 *
FROM HARBOR h
ORDER BY h.name DESC;

-- 8. Barco con el nombre más largo
SELECT TOP 1 *
FROM SHIP s
ORDER BY LEN(s.nickname) DESC;

-- 9. Mayor número de tripulantes en un barco
SELECT TOP 1 
    sp.ship_id, 
    COUNT(*) AS number_of_crew
FROM SHIPBOARD_STAFFING sp
GROUP BY sp.ship_id
ORDER BY number_of_crew DESC;

-- 10. Itinerario con más barcos asignados
SELECT TOP 1 
    vh.itinerary_id, 
    COUNT(DISTINCT ship_id) AS number_of_ships
FROM VOYAGE_HISTORY vh
GROUP BY vh.itinerary_id
ORDER BY number_of_ships DESC;
