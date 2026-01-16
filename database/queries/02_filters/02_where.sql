-- 🟪 WHERE ( <> )
USE MaritimeLogisticsDB;

SELECT name AS Tabla, create_date AS FechaCreacion 
FROM sys.tables ORDER BY name;

-- 1. Barcos cuya nacionalidad no sea “Argentina”.  
SELECT * FROM SHIP s
WHERE s.nationality <> 'Argentina'
ORDER BY s.nationality;

-- 2. Puertos cuyo país no sea “Brasil”.  
SELECT * FROM HARBOR h 
WHERE h.country <> 'Brazil'
ORDER BY h.country; 

-- 3. Tripulantes cuya ciudad natal no sea “Madrid”.  
SELECT * FROM CREW_MEMBER cw  
WHERE cw.home_city <> 'Madrid'
ORDER BY cw.home_city;

-- 4. Itinerarios que no tengan descripción vacía.  
SELECT * FROM ITINERARY i
WHERE i.description <> '';

-- 5. Puertos no pertenecientes al tipo “NIGHT”.  
SELECT * FROM HARBOR h
WHERE h.port_type <> 'NIGHT';

-- 6. Tripulantes cuyo país no sea “Perú”.  
SELECT * FROM CREW_MEMBER cw
WHERE cw.nationality <> 'Peru';

-- 7. Barcos cuya ciudad origen no sea “Barcelona”.  
SELECT * FROM SHIP s
WHERE s.origin_city <> 'Barcelona';

-- 8. Tripulantes que no tengan un nombre en especifico.  
DECLARE @Name NVARCHAR(50) = 'Lucas';
SELECT * FROM CREW_MEMBER cw
WHERE cw.first_name <> @Name; 

-- 9. Barcos cuyo nombre no coincida con uno específico.  
DECLARE @Name_Ship NVARCHAR(50) = 'Golden Princess'
SELECT * FROM SHIP s
WHERE s.name_or_nickname <> @Name_Ship;

-- 10. Tripulantes cuyo país no sea “Portugal”.
SELECT * FROM CREW_MEMBER cw
WHERE cw.nationality <> 'Portugal'
ORDER BY cw.nationality;
