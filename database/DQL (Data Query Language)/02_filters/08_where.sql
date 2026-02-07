-- ⬜ WHERE ( IS NULL / IS NOT NULL )
USE MaritimeSystemDB;

SELECT name AS Tabla, create_date AS FechaCreacion 
FROM sys.tables ORDER BY name;


-- 1. Tripulantes sin fecha de fin de asignación.  
SELECT 
    cw.*
FROM SHIPBOARD_STAFFING sp
FULL JOIN CREW_MEMBER cw
    ON sp.crew_id = cw.crew_id
WHERE 
    sp.assignment_end_date IS NULL

-- 2. Barcos cuyo número de registro no esté vacío.  
SELECT * FROM SHIP s
WHERE s.registration_number IS NOT NULL

-- 3. Asignaciones con fecha de fin registrada.  
SELECT * FROM SHIPBOARD_STAFFING sp
WHERE sp.assignment_end_date IS NOT NULL;

-- 4. Puertos cuyo tipo no sea nulo.  
SELECT * FROM HARBOR h
WHERE h.operation_type IS NOT NULL;

-- 5. Itinerarios sin descripción.  
SELECT * FROM ITINERARY i
WHERE i.description IS NULL;

-- 6. Posiciones sin descripción establecida.  
SELECT * FROM POSITION p
WHERE p.description IS NULL;

-- 7. Barcos sin nacionalidad registrada.  
SELECT * FROM SHIP s
WHERE s.country IS NULL;

-- 8. Tripulantes sin email.
SELECT * FROM CREW_MEMBER cw
WHERE cw.email IS NULL;

-- 9. Puertos sin región asignada.  
SELECT * FROM HARBOR h
WHERE h.region IS NULL;

-- 10. Asignaciones sin fecha de inicio.  
SELECT * FROM SHIPBOARD_STAFFING sp
WHERE sp.assignment_start_date IS NULL;

-- 11. Itinerarios sin barcos asignados.  
SELECT i.*
FROM ITINERARY i
LEFT JOIN VOYAGE_HISTORY vh
    ON vh.itinerary_id = i.itinerary_id
WHERE vh.ship_id IS NULL;

-- 12. Barcos con ciudad origen definida.
SELECT *
FROM SHIP s
WHERE s.city IS NOT NULL;
