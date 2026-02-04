-- ⬜ WHERE ( <> )
USE MaritimeSystemDB;

SELECT name AS Tabla, create_date AS FechaCreacion 
FROM sys.tables ORDER BY name;


-- 1. Barcos cuya nacionalidad no sea “Argentina”.  
SELECT * FROM SHIP s
WHERE s.country <> 'Argentina'
ORDER BY s.country;

-- 2. Puertos cuyo país no sea “Brasil”.  
SELECT * FROM HARBOR h 
WHERE h.country <> 'Brazil'
ORDER BY h.country; 

-- 3. Tripulantes cuya ciudad natal no sea “Madrid”.  
SELECT * FROM CREW_MEMBER cw  
WHERE cw.city <> 'Madrid'
ORDER BY cw.city;

-- 4. Itinerarios con descripción distinta de vacía.  
SELECT * FROM ITINERARY i
WHERE i.description <> '';

-- 5. Puertos que no sean de tipo “NIGHT”.  
SELECT * FROM HARBOR h
WHERE h.operation_type <> 'NIGHT';

-- 6. Tripulantes cuyo país no sea “Perú”.  
SELECT * FROM CREW_MEMBER cw
WHERE cw.nationality <> 'Peru';

-- 7. Barcos cuya ciudad origen no sea “Barcelona”.  
SELECT * FROM SHIP s
WHERE s.city <> 'Barcelona';

-- 8. Puertos fuera de la región “Norte”.  
DECLARE @Name NVARCHAR(50) = 'Lucas';
SELECT * FROM CREW_MEMBER cw
WHERE cw.first_name <> @Name; 

-- 9. Barcos con nombre distinto de uno específico.  
DECLARE @Name_Ship NVARCHAR(50) = 'Golden Princess'
SELECT * FROM SHIP s
WHERE s.nickname <> @Name_Ship;

-- 10. Tripulantes que no sean de “Portugal”.
SELECT * FROM CREW_MEMBER cw
WHERE cw.nationality <> 'Portugal'
ORDER BY cw.nationality;
