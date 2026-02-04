-- 🟪 LEFT JOIN
USE MaritimeSystemDB;

SELECT name AS Tabla, create_date AS FechaCreacion 
FROM sys.tables ORDER BY name;


-- 1. Listar todos los barcos, incluso los que no tienen o tuvieron tripulantes asignados.
SELECT 
    s.ship_id,
    s.nickname,
    sp.assignment_id
FROM SHIP s
LEFT JOIN SHIPBOARD_STAFFING sp
    ON s.ship_id = sp.ship_id
ORDER BY sp.assignment_id;

-- 2. Mostrar puertos, incluso los no utilizados en itinerarios.  
SELECT
    h.harbor_id,
    h.name,
    h.city,
    h.country,
    ah.voyage_id
FROM HARBOR h
LEFT JOIN ARRIVAL_HISTORY ah
    ON h.harbor_id = ah.harbor_id
ORDER BY h.harbor_id;

-- 3. Mostrar posiciones, aunque no estén asignadas a nadie.  
SELECT
    p.position_id,
    p.type,
    p.description,
    sp.assignment_id
FROM POSITION p
LEFT JOIN SHIPBOARD_STAFFING sp
    ON p.position_id = sp.position_id
ORDER BY p.position_id;

-- 4. Ver tripulantes, incluso si no tienen asignaciones.  
SELECT
    cw.crew_id,
    cw.first_name,
    cw.last_name,
    sp.assignment_id
FROM CREW_MEMBER cw
LEFT JOIN SHIPBOARD_STAFFING sp
    ON cw.crew_id = sp.crew_id
ORDER BY cw.crew_id;

-- 5. Mostrar itinerarios, incluso si no tienen puertos.  
SELECT
    i.itinerary_id,
    i.name,
    vh.voyage_id,
    ah.harbor_id
FROM ITINERARY i
LEFT JOIN VOYAGE_HISTORY vh
    ON i.itinerary_id = vh.itinerary_id
LEFT JOIN ARRIVAL_HISTORY ah
    ON vh.voyage_id = ah.voyage_id
ORDER BY i.itinerary_id;

-- 6. Listar barcos y sus itinerarios, aunque algunos no tengan.  
SELECT
    s.ship_id,
    s.nickname,
    i.itinerary_id,
    i.name AS itinerary_name
FROM SHIP s
LEFT JOIN VOYAGE_HISTORY vh
    ON s.ship_id = vh.ship_id
LEFT JOIN ITINERARY i
    ON vh.itinerary_id = i.itinerary_id
ORDER BY s.ship_id;

-- 7. Mostrar tripulantes y fechas de asignación, aunque estén vacías.  
SELECT
    cw.crew_id,
    cw.first_name,
    cw.last_name,
    sp.assignment_start_date,
    sp.assignment_end_date
FROM CREW_MEMBER cw
LEFT JOIN SHIPBOARD_STAFFING sp
    ON cw.crew_id = sp.crew_id
ORDER BY cw.crew_id;

-- 8. Barcos y el puerto donde empezaron su viaje, incluso sin definir.  
SELECT
    s.ship_id,
    s.nickname,
    h.harbor_id,
    h.name AS harbor_name
FROM SHIP s
LEFT JOIN VOYAGE_HISTORY vh
    ON s.ship_id = vh.ship_id
LEFT JOIN ARRIVAL_HISTORY ah
    ON vh.voyage_id = ah.voyage_id
        AND ah.arrival_order = 1
LEFT JOIN HARBOR h
    ON ah.harbor_id = h.harbor_id
ORDER BY s.ship_id;

-- 9. Tripulantes y la ciudad donde están viviendo, aunque no tengan asignación.  
SELECT
    cw.crew_id,
    cw.first_name,
    cw.last_name,
    s.city AS working_city
FROM CREW_MEMBER cw
LEFT JOIN SHIPBOARD_STAFFING sp
    ON cw.crew_id = sp.crew_id
LEFT JOIN SHIP s
    ON sp.ship_id = s.ship_id
ORDER BY cw.crew_id;

-- 10. Puertos y barcos que los visitan, aunque no existan viajes registrados.
SELECT
    h.harbor_id,
    h.name AS harbor_name,
    s.ship_id,
    s.nickname
FROM HARBOR h
LEFT JOIN ARRIVAL_HISTORY ah
    ON h.harbor_id = ah.harbor_id
LEFT JOIN VOYAGE_HISTORY vh
    ON ah.voyage_id = vh.voyage_id
LEFT JOIN SHIP s
    ON vh.ship_id = s.ship_id
ORDER BY h.harbor_id;
