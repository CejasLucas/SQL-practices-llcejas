-- 🟪 INNER JOIN
USE MaritimeSystemDB;

SELECT name AS Tabla, create_date AS FechaCreacion 
FROM sys.tables ORDER BY name;


-- 1. Obtener los barcos junto con sus tripulantes asignados.  
SELECT 
    sp.assignment_id,
    sp.ship_id,
    s.registration_number,
    sp.crew_id,
    cw.passport_number
FROM SHIPBOARD_STAFFING sp
INNER JOIN SHIP s ON sp.ship_id = s.ship_id
INNER JOIN CREW_MEMBER cw 
    ON sp.crew_id = cw.crew_id

-- 2. Listar los tripulantes con su posición dentro de un barco.  
SELECT 
    sp.assignment_id,
    sp.ship_id,
    sp.crew_id,
    p.type
FROM SHIPBOARD_STAFFING sp
INNER JOIN POSITION p 
    ON sp.position_id = p.position_id
ORDER BY sp.assignment_id

-- 3. Ver los barcos y los itinerarios en los que participan.  
SELECT 
    vh.voyage_id,
    vh.ship_id,
    s.registration_number,
    vh.itinerary_id,
    i.description
FROM VOYAGE_HISTORY vh
INNER JOIN SHIP s
    ON vh.ship_id = s.ship_id
INNER JOIN ITINERARY i 
    ON vh.itinerary_id = i.itinerary_id;


-- 4. Mostrar los puertos de cada itinerario (vía viajes)
SELECT
    vh.itinerary_id,
    vh.voyage_id,
    h.harbor_id,
    h.name     AS harbor_name,
    h.country
FROM VOYAGE_HISTORY vh
JOIN ARRIVAL_HISTORY ah
  ON ah.voyage_id = vh.voyage_id
JOIN HARBOR h
  ON h.harbor_id = ah.harbor_id
ORDER BY vh.itinerary_id, vh.voyage_id, h.name;


-- 5. Consultar las asignaciones activas junto con nombres de barcos.  
SELECT  
    sp.assignment_id,
    sp.crew_id,
    sp.ship_id,
    s.nickname,
    s.registration_number,
    sp.assignment_start_date,
    sp.assignment_end_date
FROM SHIPBOARD_STAFFING sp
INNER JOIN SHIP s 
    ON sp.ship_id = s.ship_id
WHERE sp.assignment_end_date IS NULL
   OR sp.assignment_end_date >= GETDATE();

-- 6. Relacionar tripulantes con itinerarios en los que trabajaron.  
SELECT
    sp.crew_id,
    vh.ship_id,
    vh.itinerary_id,
    i.name as itinerary_description
FROM SHIPBOARD_STAFFING sp
INNER JOIN VOYAGE_HISTORY vh
    ON sp.ship_id = vh.ship_id
INNER JOIN ITINERARY i
    ON vh.itinerary_id = i.itinerary_id
WHERE
    sp.assignment_start_date <= vh.actual_start_date
        AND (sp.assignment_end_date >= vh.actual_end_date OR sp.assignment_end_date IS NULL)
ORDER BY sp.crew_id, sp.ship_id;

-- 7. Mostrar los puertos visitados por cada barco.  
SELECT DISTINCT
    vh.ship_id,
    h.harbor_id,
    h.name
FROM VOYAGE_HISTORY vh
INNER JOIN ARRIVAL_HISTORY ah
    ON vh.voyage_id = ah.voyage_id
INNER JOIN HARBOR h
    ON ah.harbor_id = h.harbor_id
ORDER BY
    vh.ship_id,
    h.name;

-- 8. Listar posiciones solo si están asignadas a tripulantes
SELECT DISTINCT
    sp.position_id,
    p.type,
    p.description
FROM POSITION p
INNER JOIN SHIPBOARD_STAFFING sp 
    ON p.position_id = sp.position_id
WHERE sp.crew_id IS NOT NULL
ORDER BY
    sp.position_id;

-- 9. Mostrar itinerarios solo si tienen viajes.  
SELECT DISTINCT
    vh.itinerary_id,
    i.name as description_itinerary
FROM ITINERARY i
INNER JOIN VOYAGE_HISTORY vh
    ON i.itinerary_id = vh.itinerary_id
ORDER BY
    vh.itinerary_id;

-- 10. Ver tripulantes que tienen asignaciones registradas.  
SELECT DISTINCT
    sp.crew_id,
    cw.first_name,
    cw.last_name,
    cw.passport_number,
    CONCAT(cw.city, ' ', cw.nationality) as location
FROM CREW_MEMBER cw
INNER JOIN SHIPBOARD_STAFFING sp
    ON sp.crew_id = cw.crew_id
ORDER BY sp.crew_id;

-- 11. Listar barcos que han participado en itinerarios.  
SELECT 
    vh.itinerary_id,
    vh.ship_id,
    s.nickname,
    s.city,
    s.country
FROM VOYAGE_HISTORY vh
INNER JOIN SHIP s
    ON vh.ship_id = s.ship_id
ORDER BY ship_id;

-- 12. Obtener puertos que están en itinerarios que tienen barcos asignados.
SELECT DISTINCT
    h.harbor_id,
    h.name,
    h.city,
    h.country
FROM VOYAGE_HISTORY vh
INNER JOIN ARRIVAL_HISTORY ah
    ON vh.voyage_id = ah.voyage_id
INNER JOIN HARBOR h
    ON h.harbor_id = ah.harbor_id
WHERE vh.ship_id IS NOT NULL;
