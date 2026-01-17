-- 🟪 WHERE ( > / < / >= / <= )
USE MaritimeLogisticsDB;

SELECT name AS Tabla, create_date AS FechaCreacion 
FROM sys.tables ORDER BY name;

-- 1. Barcos creados después de 2010.  
SELECT * FROM SHIP s
WHERE YEAR(s.start_of_activity) > 2010
ORDER BY s.start_of_activity;

-- 2. Tripulantes nacidos antes de 1986.  
SELECT * FROM CREW_MEMBER cw
WHERE YEAR(cw.birth_date) > 1986
ORDER BY cw.birth_date;

-- 3. Asignaciones que comenzaron después de 2020. 
SELECT * FROM CREW_ASSIGNMENTS_TO_SHIPS cws
WHERE YEAR(cws.assignment_start_date) > 2020 
ORDER BY cws.assignment_start_date;

-- 4. Viajes que terminaron antes de 2025.  
SELECT * FROM SHIPS_IN_ITINERARIES si
WHERE YEAR(si.voyage_end_date) < 2025 
ORDER BY si.voyage_end_date; 

-- 5. Puertos en ciudades alfabéticamente > “M”.  
SELECT * FROM HARBOR h
WHERE h.city > 'M'
ORDER BY h.city;

-- 6. Barcos con ID mayor a 50.  
SELECT * FROM SHIP s
WHERE s.ship_id > 50;

-- 7. Puertos con ID menor a 20.  
SELECT * FROM HARBOR h
WHERE h.harbor_id < 20;

-- 8. Itinerarios con ID mayor o igual a 10.  
SELECT * FROM ITINERARY i
WHERE i.itinerary_id >= 10;

-- 9. Tripulantes con fecha de nacimiento <= 1988.
SELECT * FROM CREW_MEMBER cw
WHERE YEAR(cw.birth_date) <= 1988
ORDER BY cw.birth_date DESC;

-- 10. Barcos activos antes de 2000.  
SELECT * FROM SHIP s
WHERE YEAR(s.start_of_activity) < 2000
ORDER BY s.start_of_activity;

-- 11. Puertos con región < “Norte”.  
SELECT * FROM HARBOR h
ORDER BY h.region;

-- 12. Itinerarios con duración mayor a 10 días. 
SELECT * FROM SHIPS_IN_ITINERARIES si
WHERE DATEDIFF(DAY, si.voyage_start_date, si.voyage_end_date) > 10;

-- 13. Asignaciones de más de 40 días.  
SELECT * FROM CREW_ASSIGNMENTS_TO_SHIPS cws
WHERE DATEDIFF(DAY, cws.assignment_start_date, cws.assignment_end_date) > 40;

-- 14. Barcos registrados antes de 2015.  
SELECT * FROM SHIP s
WHERE YEAR(s.start_of_activity) < 2015
ORDER BY s.start_of_activity DESC;

--15. Tripulantes contratados después de 2018.
SELECT * FROM CREW_ASSIGNMENTS_TO_SHIPS cws
WHERE YEAR(cws.assignment_start_date) > 2018;
