-- ⬜ WHERE ( LIKE ) 
USE MaritimeSystemDB;

SELECT name AS Tabla, create_date AS FechaCreacion 
FROM sys.tables ORDER BY name;

-- 1. Buscar puertos cuyo nombre comience con “Port of San%”.  
SELECT * FROM HARBOR h
WHERE h.name LIKE 'Port of San%';

-- 2. Buscar tripulantes con apellido que empiece en “G%”.  
SELECT * FROM CREW_MEMBER cw
WHERE cw.last_name LIKE 'G%';

-- 3. Barcos con nombre que comience con “Sea%”.  
SELECT * FROM SHIP s
WHERE s.nickname LIKE 'Sea%';

-- 4. Puertos cuyo país termine con “land”.  
SELECT * FROM HARBOR h
WHERE h.country LIKE '%land';

-- 5. Emails que contienen “@gmail”.  
SELECT * FROM CREW_MEMBER cw
WHERE cw.email LIKE '%@gmail%';

-- 6. Descripciones de itinerarios con la palabra “Commercial”.  
SELECT * FROM ITINERARY i
WHERE i.description LIKE '%Commercial%';

-- 7. Posiciones con descripción que incluya “responsable”.  
SELECT * FROM POSITION p
WHERE p.description LIKE '%Responsible%';

-- 8. Ciudades de barcos que comienzan con “New”.  
SELECT * FROM SHIP s
WHERE s.city LIKE 'New%';

-- 9. Nacionalidades de tripulantes que terminen con “an”.  
SELECT * FROM CREW_MEMBER cw
WHERE cw.nationality LIKE '%an'
ORDER BY cw.nationality;

-- 10. Barcos cuyo apodo incluya “Star”.  
SELECT * FROM SHIP s
WHERE s.nickname LIKE '%Star%';

-- 11. Puertos con región que incluya “South”.  
SELECT * FROM HARBOR h
WHERE h.region LIKE '%Sur%'

-- 12. Tripulantes con nombre que tenga doble vocal
UPDATE CREW_MEMBER
SET
    first_name = 'Eileen',
    email = 'eileen.walker@company.com'
WHERE passport_number = 'US9923412';

SELECT * FROM CREW_MEMBER cm
WHERE cm.first_name LIKE '%aa%'
   OR cm.first_name LIKE '%ee%'
   OR cm.first_name LIKE '%ii%'
   OR cm.first_name LIKE '%oo%'
   OR cm.first_name LIKE '%uu%';