SELECT name AS Tabla, create_date AS FechaCreacion FROM sys.tables ORDER BY name;

-- Verficar la conexión
USE MaritimeLogisticsDB; 
GO 


-- 1. Calcular la edad promedio de los tripulantes.  
SELECT AVG(years) AS average_age
FROM(
    SELECT
        DATEDIFF(YEAR, birth_date, GETDATE()) -
        CASE 
            WHEN DATEADD(YEAR, DATEDIFF(YEAR, birth_date, GETDATE()), birth_date) > GETDATE() 
            THEN 1 ELSE 0
        END
        AS years    
    FROM CREW_MEMBER
) AS new_table
    

-- 2. Obtener el promedio de duración de los viajes realizados.  
SELECT AVG(days_per_trip) as average_days
FROM(
    SELECT DATEDIFF(DAY, voyage_start_date, voyage_end_date) as days_per_trip FROM SHIPS_IN_ITINERARIES
    WHERE voyage_end_date < GETDATE()
) AS new_table


-- 3. Promedio de puertos por itinerario.  
SELECT AVG(number_of_port_itineraries) as average_number_of_ports_per_route
FROM (
    SELECT harbor_id, COUNT(*) AS number_of_port_itineraries FROM HARBORS_IN_ITINERARIES
    GROUP BY harbor_id
) AS new_table
    

-- 4. Promedio de años de actividad de los barcos.  
SELECT AVG(years) AS average_age
FROM(
    SELECT
        DATEDIFF(YEAR, start_of_activity, GETDATE()) -
        CASE 
            WHEN DATEADD(YEAR, DATEDIFF(YEAR, start_of_activity, GETDATE()), start_of_activity) > GETDATE() 
            THEN 1 ELSE 0
        END
        AS years    
    FROM SHIP
) AS new_table


-- 5. Edad promedio por nacionalidad de tripulantes.  
SELECT 
    nationality, 
    AVG(DATEDIFF(YEAR, birth_date, GETDATE()) -
        CASE 
            WHEN DATEADD(YEAR, DATEDIFF(YEAR, birth_date, GETDATE()), birth_date) > GETDATE() 
            THEN 1 ELSE 0
        END
    ) AS average_age 
FROM CREW_MEMBER
GROUP BY nationality;

-- 6. Promedio de duración de asignaciones de tripulantes.  
SELECT crew_id, 
    AVG(DATEDIFF(DAY, assignment_start_date, assignment_end_date)) AS average_duration
FROM CREW_ASSIGNMENTS_TO_SHIPS 
WHERE assignment_end_date IS NOT NULL 
GROUP BY crew_id;


-- 7. Promedio de barcos por itinerario.  
SELECT itinerary_id, AVG(ship_count) AS average_ships_per_itinerary
FROM (
    SELECT itinerary_id, COUNT(DISTINCT ship_id) AS ship_count
    FROM SHIPS_IN_ITINERARIES
    GROUP BY itinerary_id
) AS itinerary_ships
GROUP BY itinerary_id;


-- 8. Promedio de días de trabajo por tripulante.  

-- 9. Edad promedio de los tripulantes de nacionalidad argentina.  

-- 10. Tiempo promedio entre inicio y fin de viaje en itinerarios.  

-- 11. Promedio de puertos visitados por barcos argentinos.  

-- 12. Promedio de tripulantes por barco.