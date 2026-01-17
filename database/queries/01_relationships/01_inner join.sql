-- 🟥 JOIN ( INNER JOIN )
USE MaritimeLogisticsDB;

SELECT name AS Tabla, create_date AS FechaCreacion 
FROM sys.tables ORDER BY name;

-- 1. Obtener los barcos junto con sus tripulantes asignados.  
SELECT 
    cws.ship_id,
    CONCAT(s.origin_city, ', ', s.nationality) AS ship_origin,
    cws.crew_id,
    CONCAT(cw.first_name, ' ', cw.last_name) AS full_name,
    CONCAT(cw.home_city, ', ', cw.nationality) AS crew_origin,
    cws.assignment_start_date,
    cws.assignment_end_date
FROM CREW_ASSIGNMENTS_TO_SHIPS cws
INNER JOIN CREW_MEMBER cw 
    ON cw.crew_id = cws.crew_id
INNER JOIN SHIP s 
    ON s.ship_id = cws.ship_id;


-- 2. Listar los tripulantes con su posición dentro de un barco.  
SELECT 
    cws.crew_id,
    cws.ship_id,
    CONCAT(cw.first_name, ' ', cw.last_name) AS full_name,
    cw.nationality,
    p.type,
    cws.assignment_start_date,
    cws.assignment_end_date
FROM CREW_ASSIGNMENTS_TO_SHIPS cws
INNER JOIN CREW_MEMBER cw 
    ON cw.crew_id = cws.crew_id
INNER JOIN POSITION p 
    ON p.position_id = cws.position_id;


-- 3. Ver los barcos y los itinerarios en los que participan.  
SELECT 
    si.ship_id,
    s.registration_number,
    s.nationality,
    si.itinerary_id,
    i.description
FROM SHIPS_IN_ITINERARIES si
INNER JOIN SHIP s
    ON s.ship_id = si.ship_id
INNER JOIN ITINERARY i
    ON i.itinerary_id = si.itinerary_id;

-- 4. Mostrar los puertos de cada itinerario.  
SELECT 
    hi.itinerary_id,
    hi.harbor_id,
    i.description,
    h.name,
    h.country
FROM HARBORS_IN_ITINERARIES hi
INNER JOIN HARBOR h
    ON h.harbor_id = hi.harbor_id
INNER JOIN ITINERARY i
    ON i.itinerary_id = hi.itinerary_id;


-- 5. Consultar las asignaciones activas junto con nombres de barcos.  
SELECT 
    cws.ship_id,
    s.name_or_nickname,
    s.registration_number,
    cws.assignment_start_date,
    cws.assignment_end_date
FROM CREW_ASSIGNMENTS_TO_SHIPS cws
INNER JOIN SHIP s
    ON s.ship_id = cws.ship_id
WHERE cws.assignment_end_date IS NULL
   OR cws.assignment_end_date > GETDATE();


-- 6. Relacionar tripulantes con itinerarios en los que trabajaron.  
SELECT
    cws.crew_id,
    si.itinerary_id,
    si.voyage_start_date,
    si.voyage_end_date,
    i.description
FROM CREW_ASSIGNMENTS_TO_SHIPS cws
INNER JOIN SHIPS_IN_ITINERARIES si
    ON cws.ship_id = si.ship_id
   AND cws.assignment_start_date <= si.voyage_end_date
   AND cws.assignment_end_date   >= si.voyage_start_date
INNER JOIN ITINERARY i
    ON si.itinerary_id = i.itinerary_id
ORDER BY cws.crew_id, si.voyage_start_date;


-- 7. Mostrar los puertos visitados por cada barco.  
SELECT 
    si.ship_id,
    hi.harbor_id,
    h.name,
    h.city, 
    h.country
FROM SHIPS_IN_ITINERARIES si
INNER JOIN HARBORS_IN_ITINERARIES hi 
    ON si.itinerary_id = hi.itinerary_id
INNER JOIN HARBOR h 
    ON hi.harbor_id = h.harbor_id
ORDER BY ship_id, harbor_id;


-- 8. Listar posiciones solo si están asignadas a tripulantes.  
SELECT 
    cws.ship_id,
    cws.crew_id,
    p.type,
    cws.assignment_start_date,
    cws.assignment_end_date
FROM CREW_ASSIGNMENTS_TO_SHIPS cws
INNER JOIN POSITION p 
    ON cws.position_id = p.position_id;


-- 9. Mostrar itinerarios solo si tienen puertos.  
SELECT DISTINCT
    i.itinerary_id,
    i.description
FROM ITINERARY i
INNER JOIN HARBORS_IN_ITINERARIES hi
    ON i.itinerary_id = hi.itinerary_id;


-- 10. Ver tripulantes que tienen asignaciones registradas.  
SELECT DISTINCT
    cw.crew_id,
    CONCAT(cw.first_name, ' ', cw.last_name) AS full_name,
    cw.nationality
FROM CREW_MEMBER cw
INNER JOIN CREW_ASSIGNMENTS_TO_SHIPS cws
    ON cw.crew_id = cws.crew_id;


-- 11. Listar barcos que han participado en itinerarios.  
SELECT DISTINCT
    s.ship_id,
    s.name_or_nickname,
    s.registration_number,
    s.nationality
FROM SHIP s
INNER JOIN SHIPS_IN_ITINERARIES si
    ON s.ship_id = si.ship_id;


-- 12. Obtener puertos que están en itinerarios que tienen barcos asignados.
SELECT DISTINCT
    h.harbor_id,
    h.name,
    h.city,
    h.country
FROM HARBOR h
INNER JOIN HARBORS_IN_ITINERARIES hi
    ON h.harbor_id = hi.harbor_id
INNER JOIN SHIPS_IN_ITINERARIES si
    ON hi.itinerary_id = si.itinerary_id;
