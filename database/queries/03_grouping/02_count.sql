-- ⚫ COUNT()
USE MaritimeLogisticsDB;

SELECT name AS Tabla, create_date AS FechaCreacion 
FROM sys.tables ORDER BY name;


-- 1. Contar cuántos barcos existen en el sistema.  
SELECT COUNT(*) AS number_of_ships FROM SHIP;

-- 2. Contar cuántos tripulantes están registrados.  
SELECT COUNT(*) AS number_of_registered_crew_members 
FROM CREW_MEMBER WHERE employment_start_date is not NULL;

-- 3. Contar cuántos puertos están asociados a itinerarios.  
SELECT COUNT(*) AS number_of_ports_with_itinerary FROM HARBORS_IN_ITINERARIES;

-- 4. Contar cuántos itinerarios existen.  
SELECT COUNT(*) AS number_of_itineraries FROM ITINERARY;

-- 5. Contar cuántos tripulantes tienen nacionalidad española.  
SELECT COUNT(*) AS number_of_Spanish_crew_members FROM CREW_MEMBER WHERE nationality = 'Spain';

-- 6. Contar la cantidad de puertos de tipo “DAY”.  
SELECT COUNT(*) AS number_of_day_ports FROM HARBOR WHERE port_type = 'DAY';

-- 7. Contar cuántos tripulantes tiene cada barco.  
SELECT ship_id, COUNT (*) AS number_of_crew_members_per_ship 
FROM CREW_ASSIGNMENTS_TO_SHIPS GROUP BY ship_id;

-- 8. Contar cuántas posiciones existen.  
SELECT COUNT(*) AS number_of_positions FROM POSITION;

-- 9. Contar cuántas asignaciones están activas.  
SELECT COUNT(*) AS active_assignments FROM CREW_ASSIGNMENTS_TO_SHIPS 
WHERE assignment_end_date is NULL;

-- 10. Contar cuántos barcos se crearon después de 2015.  
SELECT COUNT(*) AS ships_built_after_2015 FROM SHIP 
WHERE YEAR(start_of_activity) > 2015;

-- 11. Contar cuántos puertos están en Italia.  
SELECT COUNT(*) AS number_of_Italian_ports FROM HARBOR 
WHERE country = 'Italy';

-- 12. Contar cuántos itinerarios tienen más de 2 puertos asignados.  
SELECT COUNT(*) AS itineraries_with_more_than_2_harbors
FROM (
    SELECT i.itinerary_id, i.description, COUNT(*) AS harbors_assigned
    FROM HARBORS_IN_ITINERARIES hi
    JOIN ITINERARY i ON i.itinerary_id = hi.itinerary_id
    GROUP BY i.itinerary_id, i.description 
	HAVING COUNT(*) > 2
) AS new_table;

-- 13. Contar cuántos tripulantes han trabajado en más de un barco.  
SELECT COUNT(*) AS crew_members_with_more_than_one_ship
FROM (
    SELECT cw.crew_id, CONCAT(cw.first_name,' ',cw.last_name) AS name_crew, COUNT(*) AS job_count
    FROM CREW_ASSIGNMENTS_TO_SHIPS cws 
	JOIN CREW_MEMBER cw ON cw.crew_id = cws.crew_id
    GROUP BY cw.crew_id, cw.first_name, cw.last_name 
	HAVING COUNT(*) > 1
) AS new_table;

-- 14. Contar cuántos puertos de un país participan en itinerarios.  
SELECT country, COUNT(DISTINCT harbor_id) AS harbors_participating
FROM (
    SELECT h.harbor_id, h.city, h.country
    FROM HARBORS_IN_ITINERARIES hi
    JOIN HARBOR h ON h.harbor_id = hi.harbor_id
) AS new_table
GROUP BY country;

-- 15. Contar cuántos barcos de nacionalidad argentina existen.
SELECT COUNT(*) AS number_of_Argentine_ships
FROM SHIP WHERE nationality = 'Argentina';

SELECT nationality, COUNT(*) AS number_of_ships
FROM SHIP GROUP BY nationality HAVING nationality = 'Argentina';


/* ============================================================================
[NOTA] En los ejercicios 12, 13 y 14 el JOIN no es necesario para contar,
solo lo incluí para mostrar información adicional de las tablas relacionadas 
============================================================================ */