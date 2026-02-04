-- ⚫ MIN()
USE MaritimeLogisticsDB;

SELECT name AS Tabla, create_date AS FechaCreacion 
FROM sys.tables ORDER BY name;


-- 1. Fecha más antigua de creación de barco
SELECT MIN(start_of_activity) AS date_of_oldest_ship 
FROM SHIP;


-- 2. Fecha de nacimiento más antigua de un tripulante
SELECT MIN(birth_date) AS oldest_date_of_birth 
FROM CREW_MEMBER;


-- 3. Viaje más corto registrado
SELECT TOP 1 *
FROM SHIPS_IN_ITINERARIES
WHERE DATEDIFF(DAY, voyage_start_date, voyage_end_date) = (
    SELECT MIN(DATEDIFF(DAY, voyage_start_date, voyage_end_date)) 
    FROM SHIPS_IN_ITINERARIES
);


-- 4. Primer itinerario creado
SELECT TOP 1 *
FROM SHIPS_IN_ITINERARIES
WHERE voyage_start_date = (
    SELECT MIN(voyage_start_date) 
    FROM SHIPS_IN_ITINERARIES
);


-- 5. Puerto alfabéticamente más pequeño (por nombre)
SELECT TOP 1 *
FROM HARBOR
WHERE name = (
    SELECT MIN(name) 
    FROM HARBOR
);


-- 6. Primer tripulante en ser contratado
SELECT TOP 1 *
FROM CREW_ASSIGNMENTS_TO_SHIPS
WHERE assignment_start_date = (
    SELECT MIN(assignment_start_date) 
    FROM CREW_ASSIGNMENTS_TO_SHIPS
);


-- 7. Primer día de cualquier viaje registrado
SELECT MIN(voyage_start_date) AS first_voyage_date
FROM SHIPS_IN_ITINERARIES;


-- 8. Mínimo número de puertos en un itinerario
SELECT TOP 1 itinerary_id, COUNT(harbor_id) AS num_ports
FROM HARBORS_IN_ITINERARIES
GROUP BY itinerary_id
HAVING COUNT(harbor_id) = (
    SELECT MIN(num_ports)
    FROM (
        SELECT COUNT(harbor_id) AS num_ports
        FROM HARBORS_IN_ITINERARIES
        GROUP BY itinerary_id
    ) AS sub
);


-- 9. Itinerario con menor duración
SELECT TOP 1 *
FROM SHIPS_IN_ITINERARIES
WHERE DATEDIFF(DAY, voyage_start_date, voyage_end_date) = (
    SELECT MIN(DATEDIFF(DAY, voyage_start_date, voyage_end_date))
    FROM SHIPS_IN_ITINERARIES
);


-- 10. Asignación con menor duración de trabajo
SELECT TOP 1 *
FROM CREW_ASSIGNMENTS_TO_SHIPS
WHERE DATEDIFF(DAY, assignment_start_date, assignment_end_date) = (
    SELECT MIN(DATEDIFF(DAY, assignment_start_date, assignment_end_date))
    FROM CREW_ASSIGNMENTS_TO_SHIPS
);
