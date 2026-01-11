-- ⚫ MAX()
USE MaritimeLogisticsDB;

SELECT name AS Tabla, create_date AS FechaCreacion 
FROM sys.tables ORDER BY name;


-- 1. Obtener la fecha más reciente de inicio de actividades de los barcos
SELECT MAX(start_of_activity) AS latest_start_of_activity FROM SHIP;


-- 2. Obtener la fecha más avanzada de nacimiento de un tripulante (más joven)
SELECT MAX(birth_date) AS most_recent_birth_date FROM CREW_MEMBER;


-- 3. Fecha de fin de itinerario más lejana
SELECT MAX(voyage_end_date) AS farthest_voyage_end_date FROM SHIPS_IN_ITINERARIES;


-- 4. Máximo número de puertos en un itinerario
SELECT TOP 1 itinerary_id, COUNT(*) AS number_of_ports
FROM HARBORS_IN_ITINERARIES
GROUP BY itinerary_id
HAVING COUNT(*) = (
    SELECT MAX(number_of_ports)
    FROM (
        SELECT COUNT(*) AS number_of_ports
        FROM HARBORS_IN_ITINERARIES
        GROUP BY itinerary_id
    ) AS t
);


-- 5. Mayor duración de un viaje registrado (en días)
SELECT TOP 1 *
FROM SHIPS_IN_ITINERARIES
WHERE DATEDIFF(DAY, voyage_start_date, voyage_end_date) = (
    SELECT MAX(DATEDIFF(DAY, voyage_start_date, voyage_end_date))
    FROM SHIPS_IN_ITINERARIES
);


-- 6. Última fecha de inicio de asignación
SELECT MAX(assignment_start_date) AS last_assignment_date FROM CREW_ASSIGNMENTS_TO_SHIPS;


-- 7. Puerto más al norte (alfabéticamente)
SELECT TOP 1 *
FROM HARBOR
WHERE name = (
    SELECT MAX(name) 
    FROM HARBOR
);


-- 8. Barco con el nombre más largo
SELECT TOP 1 *
FROM SHIP
WHERE LEN(name_or_nickname) = (
    SELECT MAX(LEN(name_or_nickname)) 
    FROM SHIP
);


-- 9. Mayor número de tripulantes en un barco
SELECT TOP 1 ship_id, COUNT(*) AS number_of_crew
FROM CREW_ASSIGNMENTS_TO_SHIPS
GROUP BY ship_id
HAVING COUNT(*) = (
    SELECT MAX(crew_count)
    FROM (
        SELECT COUNT(*) AS crew_count
        FROM CREW_ASSIGNMENTS_TO_SHIPS
        GROUP BY ship_id
    ) AS t
);


-- 10. Itinerario con más barcos asignados
SELECT TOP 1 itinerary_id, COUNT(*) AS number_of_ships
FROM SHIPS_IN_ITINERARIES
GROUP BY itinerary_id
HAVING COUNT(*) = (
    SELECT MAX(ship_count)
    FROM (
        SELECT COUNT(*) AS ship_count
        FROM SHIPS_IN_ITINERARIES
        GROUP BY itinerary_id
    ) AS t
);
