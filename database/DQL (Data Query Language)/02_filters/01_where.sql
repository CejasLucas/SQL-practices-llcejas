-- ⬜ WHERE ( = )
USE MaritimeSystemDB;

SELECT name AS Tabla, create_date AS FechaCreacion 
FROM sys.tables ORDER BY name;

-- 1. Obtener barcos cuya nacionalidad sea “Chile”.  
SELECT * FROM SHIP s
WHERE s.country = 'Chile';

-- 2. Tripulantes cuyo país sea “España”.
SELECT * FROM CREW_MEMBER cw 
WHERE cw.nationality = 'Spain';

-- 3. Puertos ubicados en “Italia”.  
SELECT * FROM HARBOR h 
WHERE h.country = 'Italy';

-- 4. Asignaciones con posicion de tipo “Capitán”.  
SELECT 
    sp.crew_id, 
    sp.ship_id,
    sp.assignment_start_date, 
    sp.assignment_end_date,  
    p.type 
FROM SHIPBOARD_STAFFING sp 
INNER JOIN POSITION p ON sp.position_id = p.position_id
WHERE p.type = 'Captain';

-- 5. Itinerarios con descripción que contenga “Cargo”.  
SELECT * FROM ITINERARY i
WHERE i.description LIKE '%cargo%';

-- 6. Puertos con tipo “DAY”.  
SELECT * FROM HARBOR h
WHERE h.operation_type = 'DAY';

-- 7. Tripulantes cuya ciudad natal sea “Lima”.  
SELECT * FROM CREW_MEMBER cw
WHERE cw.city = 'Lima';

-- 8. Barcos cuyo número de registro sea uno específico.  
DECLARE @Registration NVARCHAR(50) = 'AR-MDF-4441';
SELECT * FROM SHIP s
WHERE s.registration_number = @Registration;

-- 9. Tripulantes con un email concreto.  
DECLARE @Emai NVARCHAR(50) = 'llcejas@gmail.com';
SELECT * FROM CREW_MEMBER cw
WHERE cw.email = @Emai;

-- 10. Viaje con fecha de inicio planificada, igual a 2024-01-01.
DECLARE @Day NVARCHAR(50) = '2024-01-12';
SELECT * FROM VOYAGE_HISTORY vh
WHERE vh.scheduled_start_date = @Day;