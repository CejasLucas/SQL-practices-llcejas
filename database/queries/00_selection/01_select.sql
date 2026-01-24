-- 🟦 SELECT
USE MaritimeSystemDB;

SELECT name AS Tabla, create_date AS FechaCreacion 
FROM sys.tables ORDER BY name;

-- 🟦 SELECT
USE MaritimeSystemDB;

-- 1. Listar todos los nombres o apodos de los barcos
SELECT s.nickname FROM SHIP s;

-- 2. Mostrar el nombre y la nacionalidad de cada tripulante
SELECT cw.first_name, cw.nationality FROM CREW_MEMBER cw;

-- 3. Consultar el número de pasaporte y ciudad natal de cada tripulante
SELECT cw.passport_number, cw.city  FROM CREW_MEMBER cw;

-- 4. Listar las regiones de todos los puertos
SELECT DISTINCT h.region FROM HARBOR h;

-- 5. Mostrar la descripción de cada itinerario
SELECT i.description FROM ITINERARY i;

-- 6. Obtener los IDs de todos los barcos registrados
SELECT s.ship_id FROM SHIP s;

-- 7. Consultar el tipo de posición de cada cargo en los barcos
SELECT DISTINCT p.type FROM POSITION p;

-- 8. Mostrar las fechas de inicio de actividad de los barcos
SELECT s.start_of_activity FROM SHIP s;

-- 9. Listar los correos electrónicos de todos los tripulantes
SELECT cw.email FROM CREW_MEMBER cw;

-- 10. Mostrar los países donde hay puertos
SELECT DISTINCT h.country FROM HARBOR h;

-- 11. Consultar la ciudad de origen y nacionalidad de los barcos
SELECT s.city, s.country FROM SHIP s ORDER BY s.country;

-- 12. Obtener los nombres de los puertos de tipo 'NIGHT'
SELECT h.name FROM HARBOR h WHERE h.operation_type = 'NIGHT';

-- 13. Listar nombres y apellidos de los tripulantes
SELECT cw.first_name, cw.last_name FROM CREW_MEMBER cw;

-- 14. Consultar las fechas de nacimiento de los tripulantes
SELECT cw.birth_date FROM CREW_MEMBER cw;

-- 15. Obtener todos los números de registro de los barcos
SELECT s.registration_number FROM SHIP s;

-- 16. Listar todas las ciudades donde hay puertos
SELECT DISTINCT h.city FROM HARBOR h;

-- 17. Listar las nacionalidades de los tripulantes presentes en los barcos
SELECT DISTINCT cw.nationality FROM CREW_MEMBER cw;

-- 18. Obtener los IDs de los tripulantes registrados
SELECT cw.crew_id, cw.first_name, cw.last_name FROM CREW_MEMBER cw ORDER BY cw.crew_id;

-- 19. Mostrar los nombres o apodos de los barcos ordenados alfabéticamente
SELECT s.nickname FROM SHIP s ORDER BY s.nickname ASC;

-- 20. Listar todos los viajes ordenados por fecha de inicio
SELECT 
    v.voyage_id,
    v.ship_id,
    v.itinerary_id,
    v.actual_start_date,
    v.actual_end_date
FROM VOYAGE_HISTORY v ORDER BY v.actual_start_date;

-- 21. Mostrar todos los registros de tripulación asignada a barcos, con IDs de barco y tripulante.
SELECT 
    *
FROM SHIPBOARD_STAFFING sf
ORDER BY sf.assignment_id;

-- 22. Listar el historial completo de viajes, incluyendo barco y fechas de inicio y fin.
SELECT *
FROM VOYAGE_HISTORY vh;

-- 23. Consultar todas las llegadas de barcos a puertos, mostrando fecha y puerto.
SELECT *
FROM ARRIVAL_HISTORY ah;

-- 24. Obtener los tripulantes actualmente activos en barcos según la fecha actual.
SELECT 
    sf.assignment_id,
    sf.crew_id,
    sf.ship_id
FROM SHIPBOARD_STAFFING sf
WHERE CAST(GETDATE() AS DATE) 
BETWEEN sf.assignment_start_date AND sf.assignment_end_date;

-- 25. Listar los barcos y el número de llegadas registradas en el historial de arribos.
SELECT vh.ship_id, COUNT(*) AS total_arrivals
FROM ARRIVAL_HISTORY ah
INNER JOIN VOYAGE_HISTORY vh ON ah.voyage_id = vh.voyage_id
GROUP BY vh.ship_id
ORDER BY total_arrivals DESC;
