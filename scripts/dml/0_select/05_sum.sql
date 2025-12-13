SELECT name AS Tabla, create_date AS FechaCreacion FROM sys.tables ORDER BY name;

-- Verficar la conexión
USE MaritimeLogisticsDB; 
GO 

-- 1. Sumar la cantidad total de días de viaje de cada barco.  
SELECT 
    ship_id,
    COUNT(*) AS number_of_itineraries_per_ship,  
    SUM(DATEDIFF(DAY, voyage_start_date , voyage_end_date)) AS total_travel_days 
FROM SHIPS_IN_ITINERARIES GROUP BY ship_id ORDER BY ship_id;


-- 2. Sumar los días totales que cada tripulante ha estado asignado a barcos.
SELECT 
    crew_id,
    COUNT(*) AS number_of_ship,
    SUM(DATEDIFF(DAY, assignment_start_date , assignment_end_date)) AS total_travel_days 
FROM CREW_ASSIGNMENTS_TO_SHIPS 
WHERE assignment_end_date is NOT NULL
GROUP BY crew_id;


-- 3. Sumar los días de asignaciones activas de todos los tripulantes.
SELECT 
    crew_id,
    COUNT(*) AS number_of_ship,
    SUM(DATEDIFF(DAY, assignment_start_date , GETDATE())) AS total_travel_days 
FROM CREW_ASSIGNMENTS_TO_SHIPS 
WHERE assignment_end_date is NULL
GROUP BY crew_id;


-- 4. Sumar la cantidad total de días de viajes finalizados en 2024.
SELECT 
    SUM(DATEDIFF(DAY, voyage_start_date, voyage_end_date)) AS total_days_2024
FROM SHIPS_IN_ITINERARIES
WHERE YEAR(voyage_end_date) = 2024;


-- 5. Sumar la duración total de todos los itinerarios por barco.
SELECT 
    ship_id,
    SUM(DATEDIFF(DAY, voyage_start_date, voyage_end_date)) AS total_days_per_ship
FROM SHIPS_IN_ITINERARIES
GROUP BY ship_id;


-- 6. Sumar los días acumulados que los tripulantes han pasado en barcos de nacionalidad española.
SELECT 
    cs.ship_id,
    cs.crew_id,
    SUM(DATEDIFF(DAY, cs.assignment_start_date , cs.assignment_end_date)) AS total_travel_days 
FROM CREW_ASSIGNMENTS_TO_SHIPS cs
JOIN SHIP s ON cs.ship_id = s.ship_id
WHERE (cs.assignment_end_date is NOT NULL) AND (s.nationality = 'Spain')
GROUP BY cs.crew_id, cs.ship_id;


-- 7. Sumar la cantidad total de días que los barcos han pasado en puertos NIGHT
SELECT 
    SUM(DATEDIFF(DAY, si.voyage_start_date, si.voyage_end_date)) AS total_night_days
FROM SHIPS_IN_ITINERARIES si
JOIN HARBORS_IN_ITINERARIES hi ON si.itinerary_id = hi.itinerary_id
JOIN HARBOR h ON hi.harbor_id = h.harbor_id
WHERE h.port_type = 'NIGHT' AND si.voyage_end_date <= GETDATE()
GROUP BY si.ship_id


-- 8. Sumar los días totales de viajes de barcos registrados en SouthAfrica.
SELECT 
    SUM(DATEDIFF(DAY, si.voyage_start_date, si.voyage_end_date)) AS days_oftravel_to_SouthAfrica
FROM SHIPS_IN_ITINERARIES si
JOIN HARBORS_IN_ITINERARIES hi ON hi.itinerary_id = si.itinerary_id
JOIN HARBOR h ON h.harbor_id = hi.harbor_id 
WHERE h.country = 'South Africa';


-- 9. Sumar la duración total de todos los itinerarios de barcos que han participado en más de un itinerario.
SELECT 
    ship_id,
    SUM(DATEDIFF(DAY, voyage_start_date, voyage_end_date)) AS total_travel_days
FROM SHIPS_IN_ITINERARIES
GROUP BY ship_id
HAVING COUNT(itinerary_id) > 1;


-- 10. Sumar los días totales de asignaciones de tripulantes en una posición específica.
DECLARE @Position NVARCHAR(50) = 'Captain';
SELECT 
    cs.crew_id,
    p.position_type,
    SUM(DATEDIFF(DAY, assignment_start_date,ISNULL(assignment_end_date, GETDATE()))) AS total_days_in_position
FROM CREW_ASSIGNMENTS_TO_SHIPS cs
JOIN POSITION p ON p.position_id = cs.position_id
WHERE p.position_type = @Position
GROUP BY crew_id, p.position_type;