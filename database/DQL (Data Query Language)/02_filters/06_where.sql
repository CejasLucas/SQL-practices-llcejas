-- ⬜ WHERE ( BETWEEN )
USE MaritimeSystemDB;

SELECT name AS Tabla, create_date AS FechaCreacion 
FROM sys.tables ORDER BY name;


-- 1. Barcos con actividad entre 2010 y 2015
SELECT * FROM SHIP s
WHERE YEAR(s.start_of_activity) BETWEEN 2010 AND 2015
ORDER BY s.start_of_activity;

-- 2. Tripulantes nacidos entre 1980 y 1990
SELECT * FROM CREW_MEMBER cw
WHERE YEAR(cw.birth_date) BETWEEN 1980 AND 1990
ORDER BY cw.birth_date;

-- 3. Viajes con duración entre 20 y 25 días
SELECT 
    * ,
    DATEDIFF(
        DAY, vh.actual_start_date, vh.actual_end_date
    ) AS days_voyage
FROM VOYAGE_HISTORY vh
WHERE DATEDIFF( DAY, vh.actual_start_date, vh.actual_end_date)  
    BETWEEN 25 AND 28
ORDER BY days_voyage;

-- 4. Puertos con ID entre 21 y 29
SELECT * FROM HARBOR h
WHERE h.harbor_id BETWEEN 21 AND 29;

-- 5. Inicio de viajes entre fechas definidas
SELECT * FROM VOYAGE_HISTORY vh
WHERE vh.actual_start_date BETWEEN '2023-01-01' AND '2023-12-31'
ORDER BY vh.actual_start_date;

-- 6. Itinerarios con ID entre 13 y 17
SELECT * FROM ITINERARY i
WHERE i.itinerary_id BETWEEN 13 AND 17;

-- 7. Barcos registrados en un rango de fechas
SELECT * FROM SHIP s
WHERE s.start_of_activity BETWEEN '2012-12-01' AND '2013-07-01'
ORDER BY s.start_of_activity;

-- 8. Tripulantes contratados entre dos fechas
SELECT * FROM SHIPBOARD_STAFFING sp
WHERE sp.assignment_start_date BETWEEN '2025-10-01' AND '2026-01-01';

-- 9. Arrivos en un puerto dentro de dos periodos
SELECT * FROM ARRIVAL_HISTORY ah
WHERE ah.arrival_datetime BETWEEN '2024-03-01' AND '2024-06-30'
ORDER BY ah.arrival_datetime;

-- 10. Regiones alfabéticamente entre A y I
SELECT * FROM HARBOR h
WHERE h.region BETWEEN 'A' AND 'I'
ORDER BY h.region DESC;