-- ⬜ WHERE ( AND / OR / NOT )
USE MaritimeSystemDB;

SELECT name AS Tabla, create_date AS FechaCreacion 
FROM sys.tables ORDER BY name;


-- 1. Tripulantes españoles **o** argentinos.  
SELECT * FROM CREW_MEMBER cw
WHERE cw.nationality = 'Spain' OR cw.nationality = 'Argentina'

-- 2. Puertos en Italia **y** de tipo noche.  
SELECT * FROM HARBOR h
WHERE h.country = 'Italy' AND h.operation_type = 'NIGHT'

-- 3. Barcos cuya ciudad origen no sea “Montevideo”.  
SELECT * FROM SHIP s
WHERE s.city NOT LIKE 'Montevideo';

-- 4. Tripulantes de España y nacidos después de 1990.  
SELECT * FROM CREW_MEMBER cw
WHERE cw.nationality = 'Spain' AND YEAR(cw.birth_date) > 1990;

-- 5. Puertos de tipo NIGHT o DAY.  
SELECT * 
FROM HARBOR h
WHERE h.operation_type = 'NIGHT' OR h.operation_type = 'DAY';

-- 6. Itinerarios que no sean "Comercial".  
SELECT * FROM ITINERARY i
WHERE i.description NOT LIKE '%Commercial%';

-- 7. Barcos estadounidenses y actividad posterior a 2015.  
SELECT * FROM SHIP s
WHERE s.country = 'United States' 
    AND YEAR(s.start_of_activity) > 2015;

-- 8. Tripulantes cuya ciudad sea Madrid o Valencia.  
SELECT * FROM CREW_MEMBER cw
WHERE cw.city = 'Madrid' OR cw.city = 'Valencia'

-- 9. Puertos cuyo nombre contenga “Port” y país Francia.  
SELECT * FROM HARBOR h
WHERE h.name LIKE '%Port%' AND h.country = 'France'

-- 10. Tripulantes no nacidos antes de 1992.  
SELECT * FROM CREW_MEMBER cw
WHERE YEAR(cw.birth_date) >= 1992
ORDER BY birth_date;

-- 11. Barcos de ciudades españolas o portuguesas.  
SELECT * FROM SHIP s
WHERE s.country = 'Spain' OR s.country = 'Portugal'
ORDER BY s.country, s.start_of_activity DESC;

-- 12. Puertos que no estén en regiones del norte.  
SELECT * FROM HARBOR h

-- 13. Itinerarios con puertos chinos o japoneses.  
SELECT 
    vh.itinerary_id,
    h.name,
    h.city,
    h.country
FROM VOYAGE_HISTORY vh
INNER JOIN ARRIVAL_HISTORY ah ON vh.voyage_id = ah.voyage_id
INNER JOIN HARBOR h ON ah.harbor_id = h.harbor_id 
WHERE h.country = 'China' OR h.country = 'Japan'
ORDER BY h.country;

-- 14. Tripulantes no mayores a 35 y contratados recientemente.  
SELECT
    sp.crew_id,
    sp.assignment_start_date,
    YEAR(GETDATE()) - YEAR(cw.birth_date) AS year,
    CONCAT(cw.first_name, ' ', cw.last_name) AS name,
    CONCAT(cw.city, ', ', cw.nationality) AS location
FROM SHIPBOARD_STAFFING sp
INNER JOIN CREW_MEMBER cw ON sp.crew_id = cw.crew_id
WHERE 
    YEAR(GETDATE()) - YEAR(cw.birth_date) <= 35 AND 
    sp.assignment_start_date >= DATEADD(MONTH, -1, GETDATE());

-- 15. Barcos cuyo nombre no comience con “A”.
SELECT * FROM SHIP s
WHERE s.nickname NOT LIKE 'A%';
