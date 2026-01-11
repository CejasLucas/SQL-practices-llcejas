-- 🟦 SELECT
USE MaritimeLogisticsDB;

SELECT name AS Tabla, create_date AS FechaCreacion 
FROM sys.tables ORDER BY name;


SELECT * FROM SHIP;

SELECT * FROM POSITION;

SELECT * FROM CREW_MEMBER;

SELECT * FROM HARBOR;

SELECT * FROM ITINERARY;

SELECT * FROM SHIPS_IN_ITINERARIES;

SELECT * FROM HARBORS_IN_ITINERARIES;

SELECT * FROM CREW_ASSIGNMENTS_TO_SHIPS;


-- 1. Obtener los nombres de todos los barcos registrados.  
SELECT name_or_nickname FROM SHIP;

-- 2. Mostrar el nombre y la nacionalidad de cada tripulante.  
SELECT first_name, nationality FROM CREW_MEMBER;

-- 3. Consultar el n�mero de pasaporte y la ciudad natal de cada tripulante.  
SELECT passport_number, home_city FROM CREW_MEMBER;

-- 4. Listar las regiones de todos los puertos.  
SELECT region FROM HARBOR;

-- 5. Mostrar la descripci�n de todos los itinerarios.  
SELECT description FROM ITINERARY;

-- 6. Obtener los IDs de todos los barcos asignados a itinerarios.  
SELECT ship_id FROM SHIPS_IN_ITINERARIES;

-- 7. Mostrar el tipo de posici�n de cada cargo dentro del barco.  
SELECT position_type FROM POSITION;

-- 8. Consultar las fechas de inicio de actividad de cada barco.  
SELECT start_of_activity FROM SHIP;

-- 9. Mostrar los emails de todos los tripulantes.  
SELECT email FROM CREW_MEMBER;

-- 10. Listar los pa�ses donde existen puertos registrados.  
SELECT country FROM HARBOR;

-- 11. Mostrar la ciudad de origen y nacionalidad de los barcos.  
SELECT origin_city, nationality FROM SHIP;

-- 12. Obtener los nombres de los puertos de tipo �NIGHT�.  
SELECT name FROM HARBOR WHERE port_type = 'NIGHT'

-- 13. Mostrar los nombres y apellidos de todos los tripulantes.  
SELECT first_name, last_name FROM CREW_MEMBER;

-- 14. Consultar las fechas de nacimiento de los tripulantes.  
SELECT birth_date FROM CREW_MEMBER;

-- 15. Obtener todos los n�meros de registro de los barcos.  
SELECT registration_number FROM SHIP;

-- 16. Mostrar todas las ciudades asociadas a puertos.  
SELECT city FROM HARBOR;

-- 17. Listar los idiomas (nacionalidades) presentes en los barcos.  
SELECT cws.ship_id, cw.nationality as language_by_nationality FROM CREW_ASSIGNMENTS_TO_SHIPS cws
JOIN CREW_MEMBER cw ON cws.crew_id = cw.crew_id;

-- 18. Obtener los IDs de los miembros de la tripulaci�n asignados a barcos.  
SELECT cw.crew_id, cw.first_name, cw.last_name FROM CREW_ASSIGNMENTS_TO_SHIPS cws
JOIN CREW_MEMBER cw ON cws.crew_id = cw.crew_id ORDER BY cw.crew_id;

-- 19. Mostrar el nombre o apodo de los barcos ordenados alfab�ticamente.
SELECT name_or_nickname FROM SHIP ORDER BY name_or_nickname DESC;  

-- 20. Listar todos los itinerarios activos ordenados por fecha de inicio.
SELECT voyage_start_date, voyage_end_date FROM SHIPS_IN_ITINERARIES
WHERE CAST(GETDATE() AS DATE) BETWEEN voyage_start_date AND voyage_end_date
ORDER BY voyage_start_date;
