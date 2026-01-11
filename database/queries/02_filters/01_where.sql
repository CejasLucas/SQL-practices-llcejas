-- 🟪 WHERE ( = )
USE MaritimeLogisticsDB;

SELECT name AS Tabla, create_date AS FechaCreacion 
FROM sys.tables ORDER BY name;


-- 1. Obtener barcos cuya nacionalidad sea “Chile”.  
SELECT * FROM SHIP s 
WHERE s.nationality = 'Chile';

-- 2. Tripulantes cuyo país sea “España”.  
SELECT * FROM CREW_MEMBER cw 
WHERE cw.nationality = 'Spain';

-- 3. Puertos ubicados en “Italia”.  
SELECT * FROM HARBOR h 
WHERE h.country = 'Italy';

-- 4. Posiciones con tipo “Capitán”.  
SELECT 
    cws.crew_id, cws.ship_id,
    cws.assignment_start_date, 
    cws.assignment_end_date,  
    p.position_type 
FROM CREW_ASSIGNMENTS_TO_SHIPS cws 
INNER JOIN POSITION p ON cws.position_id = p.position_id
WHERE p.position_type = 'Captain'

-- 5. Itinerarios con descripción que contenga a “Los Angeles”.  
SELECT si.ship_id,
       si.itinerary_id,
       i.description
FROM SHIPS_IN_ITINERARIES si
INNER JOIN ITINERARY i
    ON si.itinerary_id = i.itinerary_id
WHERE i.description LIKE '%Los Angeles%';

-- 6. Puertos con tipo “DAY”.  
SELECT * FROM HARBOR h
WHERE h.port_type = 'DAY'

-- 7. Tripulantes cuya ciudad natal sea “Lima”.  

-- 8. Barcos cuyo número de registro sea uno específico.  

-- 9. Tripulantes con un email concreto.  

-- 10. Itinerarios con fecha de inicio igual a 2024-01-01. 
