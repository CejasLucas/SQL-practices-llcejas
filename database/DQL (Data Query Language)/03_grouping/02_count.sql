-- ⚫ COUNT()
USE MaritimeSystemDB;

SELECT name AS Tabla, create_date AS FechaCreacion 
FROM sys.tables ORDER BY name;


-- 1. Contar cuántos barcos existen en el sistema.  
SELECT 
    COUNT(*) AS number_of_ships 
FROM SHIP;

-- 2. Contar cuántos tripulantes están registrados.  
SELECT 
    COUNT(*) AS number_of_registered_crew_members 
FROM CREW_MEMBER cw 
WHERE cw.employment_start_date IS NOT NULL;

-- 3. Contar cuántos puertos están asociados a itinerarios.  
SELECT
    vh.itinerary_id,
    COUNT(DISTINCT ah.harbor_id) AS ports_count
FROM VOYAGE_HISTORY vh
INNER JOIN ARRIVAL_HISTORY ah
    ON vh.voyage_id = ah.voyage_id
GROUP BY vh.itinerary_id;

-- 4. Contar cuántos itinerarios existen.  
SELECT 
    COUNT(*) AS number_of_itineraries 
FROM ITINERARY i;

-- 5. Contar cuántos tripulantes tienen nacionalidad española.  
SELECT 
    COUNT(*) AS number_of_Spanish_crew_members 
FROM CREW_MEMBER cw
WHERE cw.nationality = 'Spain';

-- 6. Contar la cantidad de puertos de tipo “DAY”.  
SELECT COUNT(*) AS number_of_day_ports 
FROM HARBOR h
WHERE h.operation_type = 'DAY';

-- 7. Contar cuántos tripulantes tiene cada barco.  
SELECT 
    sp.ship_id, 
    COUNT (*) AS number_of_crew_members_per_ship 
FROM SHIPBOARD_STAFFING sp 
GROUP BY sp.ship_id;

-- 8. Contar cuántas posiciones existen.  
SELECT 
    COUNT(*) AS number_of_positions 
FROM POSITION p;

-- 9. Contar cuántas asignaciones están activas.  
SELECT 
    COUNT(*) AS active_assignments 
FROM SHIPBOARD_STAFFING sp
WHERE sp.assignment_end_date IS NULL;

-- 10. Contar cuántos barcos se crearon después de 2015.  
SELECT 
    COUNT(*) AS ships_built_after_2015 
FROM SHIP s
WHERE YEAR(s.start_of_activity) > 2015;

-- 11. Contar cuántos puertos están en Italia.  
SELECT 
    COUNT(*) AS number_of_Italian_ports 
FROM HARBOR h
WHERE h.country = 'Italy';

-- 12. Contar cuántos itinerarios tienen más de 2 puertos asignados.  
SELECT
    vh.itinerary_id,
    COUNT(DISTINCT ah.harbor_id) AS harbor_count
FROM VOYAGE_HISTORY vh
INNER JOIN ARRIVAL_HISTORY ah 
    ON vh.voyage_id = ah.voyage_id
GROUP BY vh.itinerary_id
HAVING COUNT(DISTINCT ah.harbor_id) > 2;

-- 13. Contar cuántos tripulantes han trabajado en más de un barco.  
SELECT 
    sp.crew_id,
    COUNT(DISTINCT sp.ship_id) AS ship_count
FROM SHIPBOARD_STAFFING sp
GROUP BY sp.crew_id

-- 14. Contar cuántos puertos de un país participan en itinerarios.  
SELECT 
    h.country, 
    COUNT(DISTINCT h.harbor_id) AS harbors_participating
FROM VOYAGE_HISTORY vh
INNER JOIN ARRIVAL_HISTORY ah
    ON vh.voyage_id = ah.voyage_id
INNER JOIN HARBOR h
    ON ah.harbor_id = h.harbor_id
GROUP BY h.country;


-- 15. Contar cuántos barcos de nacionalidad argentina existen.
SELECT 
    COUNT(*) AS number_of_Argentine_ships
FROM SHIP s 
WHERE s.country = 'Argentina';
