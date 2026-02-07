-- ⚫ SUM()
USE MaritimeSystemDB;

SELECT name AS Tabla, create_date AS FechaCreacion 
FROM sys.tables ORDER BY name;


-- 1. Sumar la cantidad total de días de viaje de cada barco.  
SELECT 
    vh.ship_id,
    COUNT(*) AS number_of_itineraries_per_ship,  
    SUM(DATEDIFF(DAY, vh.actual_start_date , vh.actual_end_date)) AS total_travel_days 
FROM VOYAGE_HISTORY vh
GROUP BY vh.ship_id 
ORDER BY vh.ship_id;

-- 2. Sumar los días totales que cada tripulante ha estado asignado a barcos.  
SELECT 
    sp.crew_id,
    COUNT(*) AS number_of_ship,
    SUM(DATEDIFF(DAY, sp.assignment_start_date , sp.assignment_end_date)) AS total_travel_days 
FROM SHIPBOARD_STAFFING sp 
WHERE sp.assignment_end_date IS NOT NULL
GROUP BY sp.crew_id;

-- 3. Sumar los días de asignaciones activas de todos los tripulantes.  
SELECT 
    sp.crew_id,
    COUNT(*) AS number_of_ship,
    SUM(DATEDIFF(DAY, sp.assignment_start_date , GETDATE())) AS total_travel_days 
FROM SHIPBOARD_STAFFING sp 
WHERE sp.assignment_end_date is NULL
GROUP BY sp.crew_id;

-- 4. Sumar la cantidad total de días de viajes finalizados en 2024.  
SELECT 
    SUM(DATEDIFF(DAY, vh.actual_start_date, vh.actual_end_date)) AS total_days_2024
FROM VOYAGE_HISTORY vh
WHERE YEAR(vh.actual_end_date) = 2024;

-- 5. Sumar la duración total de todos los itinerarios por barco.  
SELECT 
    vh.ship_id,
    SUM(DATEDIFF(DAY, vh.actual_start_date, vh.actual_end_date)) AS total_days
FROM VOYAGE_HISTORY vh
GROUP BY vh.ship_id;

-- 6. Sumar los días acumulados que los tripulantes han pasado en barcos de nacionalidad española.  
SELECT 
    sp.crew_id,
    SUM(
        DATEDIFF(
            DAY,
            sp.assignment_start_date,
            COALESCE(sp.assignment_end_date, GETDATE())
        )
    ) AS total_days_in_spanish_ships
FROM SHIPBOARD_STAFFING sp
JOIN SHIP s 
    ON sp.ship_id = s.ship_id
WHERE s.country = 'Spain'
GROUP BY sp.crew_id;

-- 7. Sumar la cantidad total de días que los barcos han pasado en puertos del tipo "NIGHT"
SELECT 
    vh.ship_id,
    SUM(DATEDIFF(DAY, vh.actual_start_date, vh.actual_end_date)) AS total_night_days
FROM VOYAGE_HISTORY vh
JOIN ARRIVAL_HISTORY ah ON vh.voyage_id = ah.voyage_id
JOIN HARBOR h ON ah.harbor_id = h.harbor_id
WHERE h.operation_type = 'NIGHT'
GROUP BY vh.ship_id;

-- 8. Sumar los días totales de viajes de barcos registrados en Sudáfrica
SELECT 
    vh.ship_id,
    SUM(DATEDIFF(DAY, vh.actual_start_date, vh.actual_end_date)) AS total_days_in_SouthAfrica
FROM VOYAGE_HISTORY vh
JOIN SHIP s ON vh.ship_id = s.ship_id
WHERE s.country = 'South Africa'
GROUP BY vh.ship_id;

-- 9. Sumar la duración total de todos los itinerarios de barcos que han participado en más de un itinerario
SELECT 
    vh.ship_id,
    SUM(DATEDIFF(DAY, vh.actual_start_date, vh.actual_end_date)) AS total_days_multiple_itineraries
FROM VOYAGE_HISTORY vh
GROUP BY vh.ship_id
HAVING COUNT(DISTINCT vh.itinerary_id) > 1;

-- 10. Sumar los días totales de asignaciones de tripulantes en una posición específica
DECLARE @Position NVARCHAR(50) = 'Captain';

SELECT 
    sp.crew_id,
    p.type AS position_type,
    SUM(DATEDIFF(DAY, sp.assignment_start_date, COALESCE(sp.assignment_end_date, GETDATE()))) AS total_days_in_position
FROM SHIPBOARD_STAFFING sp
JOIN POSITION p ON sp.position_id = p.position_id
WHERE p.type = @Position
GROUP BY sp.crew_id, p.type;
