-- ⬜ WHERE ( > / < / >= / <= )
USE MaritimeSystemDB;

SELECT name AS Tabla, create_date AS FechaCreacion 
FROM sys.tables ORDER BY name;


-- 1. Barcos construidos después de 2010.  
SELECT * FROM SHIP s
WHERE YEAR(s.start_of_activity) > 2010
ORDER BY s.start_of_activity;

-- 2. Tripulantes nacidos antes de 1986.  
SELECT * FROM CREW_MEMBER cw
WHERE YEAR(cw.birth_date) > 1986
ORDER BY cw.birth_date;

-- 3. Asignaciones iniciadas después de 2020.  
SELECT * FROM SHIPBOARD_STAFFING sp
WHERE YEAR(sp.assignment_start_date) > 2020 
ORDER BY sp.assignment_start_date;

-- 4. Viajes terminados antes de 2025.  
SELECT * FROM VOYAGE_HISTORY vh
WHERE YEAR(vh.actual_start_date) < 2025 
ORDER BY vh.actual_start_date; 

-- 5. Puertos con nombre alfabéticamente mayor a “M”.  
SELECT * FROM HARBOR h
WHERE h.city > 'M'
ORDER BY h.city;

-- 6. Barcos con ID mayor a 50.  
SELECT * FROM SHIP s
WHERE s.ship_id > 50;

-- 7. Puertos con ID menor a 200.  
SELECT * FROM HARBOR h
WHERE h.harbor_id < 20;

-- 8. Itinerarios con ID mayor igual a 10.  
SELECT * FROM ITINERARY i
WHERE i.itinerary_id >= 10;

-- 9. Tripulantes nacidos antes o en 1995.  
SELECT * FROM CREW_MEMBER cw
WHERE YEAR(cw.birth_date) <= 1988
ORDER BY cw.birth_date DESC;

-- 10. Barcos activos antes del año 2000.  
SELECT * FROM SHIP s
WHERE YEAR(s.start_of_activity) < 2000
ORDER BY s.start_of_activity;

-- 11. Puertos con región < “Norte”.  
SELECT * FROM HARBOR h
ORDER BY h.region;

-- 12. Viaje con duración > 10 días.  
SELECT * FROM VOYAGE_HISTORY vh
WHERE DATEDIFF(DAY, vh.actual_start_date, vh.actual_end_date) > 10;

-- 13. Asignaciones > 30 días.  
SELECT * FROM SHIPBOARD_STAFFING sp
WHERE DATEDIFF(DAY, sp.assignment_start_date, sp.assignment_end_date) > 40;

-- 14. Barcos registrados antes de 2015.  
SELECT * FROM SHIP s
WHERE YEAR(s.start_of_activity) < 2015
ORDER BY s.start_of_activity DESC;

-- 15. Tripulantes contratados después de 2018.
SELECT * FROM SHIPBOARD_STAFFING sp
WHERE YEAR(sp.assignment_start_date) > 2018;
