-- 🟥 JOIN ( LEFT JOIN )
USE MaritimeLogisticsDB;

SELECT name AS Tabla, create_date AS FechaCreacion 
FROM sys.tables ORDER BY name;

-- 1. Listar todos los barcos, incluso los que no tienen tripulantes.  
SELECT 
    cws.assignment_id,
    cws.crew_id,
    s.ship_id,
    s.name_or_nickname,
    s.registration_number,
    CONCAT(s.origin_city, ', ', s.nationality) AS location
FROM SHIP s
LEFT JOIN CREW_ASSIGNMENTS_TO_SHIPS cws 
ON s.ship_id = cws.ship_id
ORDER BY cws.assignment_id, s.ship_id;

-- 2. Mostrar puertos, incluso los no utilizados en itinerarios.  
SELECT 
    hi.id,
    hi.itinerary_id,
    h.harbor_id,
    h.name,
    h.city, 
    h.country
FROM HARBOR h
LEFT JOIN HARBORS_IN_ITINERARIES hi
ON h.harbor_id = hi.harbor_id
ORDER BY hi.id, h.harbor_id;

-- 3. Mostrar posiciones, aunque no estén asignadas a nadie.  
SELECT 
    cws.assignment_id,
    cws.ship_id,
    cws.crew_id,
    p.position_id,
    p.type
FROM POSITION p
LEFT JOIN CREW_ASSIGNMENTS_TO_SHIPS cws
ON p.position_id = cws.position_id
ORDER BY cws.assignment_id;

-- 4. Ver tripulantes, incluso si no tienen asignaciones.  
SELECT 
    cws.assignment_id,
    cws.ship_id,
    cw.crew_id,
    cw.first_name,
    cw.last_name,
    cw.passport_number
FROM CREW_MEMBER cw
LEFT JOIN CREW_ASSIGNMENTS_TO_SHIPS cws
ON cw.crew_id = cws.crew_id
ORDER BY cws.assignment_id, cw.crew_id;

-- 5. Mostrar itinerarios, incluso si no tienen puertos.  
SELECT 
    *
FROM ITINERARY i
LEFT JOIN HARBORS_IN_ITINERARIES hi
ON i.itinerary_id = hi.itinerary_id
ORDER BY hi.id 

-- 6. Listar barcos y sus itinerarios, aunque algunos no tengan.  
SELECT  
    si.itinerary_id,
    s.ship_id,
    s.name_or_nickname,
    s.origin_city,
    s.nationality
FROM SHIP s
LEFT JOIN SHIPS_IN_ITINERARIES si
ON s.ship_id = si.ship_id
ORDER BY si.itinerary_id, ship_id

-- 7. Mostrar tripulantes y fechas de asignación, aunque estén vacías.  
SELECT 
    cw.crew_id,
    cws.ship_id,
    cws.assignment_start_date,
    cws.assignment_end_date
FROM  CREW_MEMBER cw
LEFT JOIN CREW_ASSIGNMENTS_TO_SHIPS cws
ON cw.crew_id = cws.crew_id
ORDER BY cw.crew_id

-- 8. Barcos y el puerto donde empezaron su primer viaje, incluso sin definir.  
SELECT 
    s.ship_id,
    s.name_or_nickname,
    s.nationality,

    si.itinerary_id,
    si.voyage_start_date,
    si.voyage_end_date
FROM SHIP s
LEFT JOIN SHIPS_IN_ITINERARIES si
    ON s.ship_id = si.ship_id
ORDER BY s.ship_id;

-- 9. Tripulantes y la ciudad donde están trabajando, aunque no tengan asignación.  

-- 10. Puertos y barcos que los visitan, aunque no existan viajes registrados.
