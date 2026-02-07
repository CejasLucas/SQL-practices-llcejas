-- ⚫ MIN()
USE MaritimeSystemDB;

SELECT name AS Tabla, create_date AS FechaCreacion 
FROM sys.tables ORDER BY name;


-- 1. Fecha más antigua de creación de barco
SELECT 
    MIN(s.start_of_activity) AS date_of_oldest_ship 
FROM SHIP s;

-- 2. Fecha de nacimiento más antigua de un tripulante
SELECT 
    MIN(cw.birth_date) AS oldest_date_of_birth 
FROM CREW_MEMBER cw;

-- 3. Viaje más corto registrado
SELECT TOP 1 *
FROM VOYAGE_HISTORY vh
ORDER BY DATEDIFF(DAY, vh.actual_start_date, vh.actual_end_date) ASC;

-- 4. Primer itinerario creado (según primer viaje registrado)
SELECT TOP 1 *
FROM VOYAGE_HISTORY vh
ORDER BY vh.actual_start_date ASC;

-- 5. Puerto alfabéticamente más pequeño (por nombre)
SELECT TOP 1 *
FROM HARBOR h
ORDER BY h.name ASC;

-- 6. Primer tripulante en ser contratado
SELECT TOP 1 *
FROM SHIPBOARD_STAFFING sp
ORDER BY sp.assignment_start_date ASC;

-- 7. Primer día de cualquier viaje registrado
SELECT 
    MIN(vh.actual_start_date) AS first_voyage_date
FROM VOYAGE_HISTORY vh;

-- 8. Mínimo número de puertos en un itinerario
SELECT TOP 1 
    vh.itinerary_id, 
    COUNT(DISTINCT ah.harbor_id) AS num_ports
FROM VOYAGE_HISTORY vh
INNER JOIN ARRIVAL_HISTORY ah
    ON vh.voyage_id = ah.voyage_id
GROUP BY vh.itinerary_id
ORDER BY num_ports ASC;

-- 9. Itinerario con menor duración
SELECT TOP 1 *
FROM VOYAGE_HISTORY vh
ORDER BY DATEDIFF(DAY, vh.actual_start_date, vh.actual_end_date) ASC;

-- 10. Asignación con menor duración de trabajo
SELECT TOP 1 *
FROM SHIPBOARD_STAFFING sp
ORDER BY DATEDIFF(DAY, sp.assignment_start_date, COALESCE(sp.assignment_end_date, GETDATE())) ASC;
