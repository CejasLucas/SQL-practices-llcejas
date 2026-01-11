-- ⚫ AVG()
USE MaritimeLogisticsDB;

SELECT name AS Tabla, create_date AS FechaCreacion 
FROM sys.tables ORDER BY name;

-- 1. Calcular la edad promedio de los tripulantes
SELECT AVG(years) AS average_age
FROM (
    SELECT
        DATEDIFF(YEAR, birth_date, GETDATE())
        - CASE 
            WHEN DATEADD(
                    YEAR,
                    DATEDIFF(YEAR, birth_date, GETDATE()),
                    birth_date
              ) > GETDATE()
            THEN 1 ELSE 0
          END AS years
    FROM CREW_MEMBER
) t;


-- 2. Obtener el promedio de duración de los viajes realizados
SELECT AVG(days_per_trip) AS average_days
FROM (
    SELECT
        DATEDIFF(DAY, voyage_start_date, voyage_end_date) AS days_per_trip
    FROM SHIPS_IN_ITINERARIES
    WHERE voyage_end_date IS NOT NULL
) t;


-- 3. Promedio de puertos por itinerario
SELECT AVG(port_count) AS average_number_of_ports_per_itinerary
FROM (
    SELECT
        itinerary_id,
        COUNT(*) AS port_count
    FROM HARBORS_IN_ITINERARIES
    GROUP BY itinerary_id
) t;


-- 4. Promedio de años de actividad de los barcos
SELECT AVG(years) AS average_years_of_activity
FROM (
    SELECT
        DATEDIFF(YEAR, start_of_activity, GETDATE())
        - CASE 
            WHEN DATEADD(
                    YEAR,
                    DATEDIFF(YEAR, start_of_activity, GETDATE()),
                    start_of_activity
              ) > GETDATE()
            THEN 1 ELSE 0
          END AS years
    FROM SHIP
) t;


-- 5. Edad promedio por nacionalidad de tripulantes
SELECT
    nationality,
    AVG(
        DATEDIFF(YEAR, birth_date, GETDATE())
        - CASE 
            WHEN DATEADD(
                    YEAR,
                    DATEDIFF(YEAR, birth_date, GETDATE()),
                    birth_date
              ) > GETDATE()
            THEN 1 ELSE 0
          END
    ) AS average_age
FROM CREW_MEMBER
GROUP BY nationality;


-- 6. Promedio de duración de asignaciones de tripulantes
SELECT
    crew_id,
    AVG(
        DATEDIFF(
            DAY,
            assignment_start_date,
            ISNULL(assignment_end_date, GETDATE())
        )
    ) AS average_duration
FROM CREW_ASSIGNMENTS_TO_SHIPS
GROUP BY crew_id;


-- 7. Promedio de barcos por itinerario
SELECT AVG(ship_count) AS average_ships_per_itinerary
FROM (
    SELECT
        itinerary_id,
        COUNT(DISTINCT ship_id) AS ship_count
    FROM SHIPS_IN_ITINERARIES
    GROUP BY itinerary_id
) t;


-- 8. Promedio de días de trabajo por tripulante
SELECT
    crew_id,
    AVG(
        DATEDIFF(
            DAY,
            assignment_start_date,
            ISNULL(assignment_end_date, GETDATE())
        )
    ) AS avg_working_days
FROM CREW_ASSIGNMENTS_TO_SHIPS
GROUP BY crew_id;


-- 9. Edad promedio de los tripulantes de nacionalidad argentina
SELECT
    AVG(
        DATEDIFF(YEAR, birth_date, GETDATE())
        - CASE 
            WHEN DATEADD(
                    YEAR,
                    DATEDIFF(YEAR, birth_date, GETDATE()),
                    birth_date
              ) > GETDATE()
            THEN 1 ELSE 0
          END
    ) AS average_age_argentina
FROM CREW_MEMBER
WHERE nationality = 'Argentina';


-- 10. Tiempo promedio entre inicio y fin de viaje en itinerarios
SELECT
    AVG(
        DATEDIFF(DAY, voyage_start_date, voyage_end_date)
    ) AS average_trip_duration
FROM SHIPS_IN_ITINERARIES
WHERE voyage_end_date IS NOT NULL;


-- 11. Promedio de puertos visitados por barcos argentinos
SELECT AVG(port_count) AS avg_ports_per_arg_ship
FROM (
    SELECT
        s.ship_id,
        COUNT(DISTINCT h.harbor_id) AS port_count
    FROM SHIP s
    JOIN SHIPS_IN_ITINERARIES si
        ON s.ship_id = si.ship_id
    JOIN HARBORS_IN_ITINERARIES h
        ON si.itinerary_id = h.itinerary_id
    WHERE s.nationality = 'Argentina'
    GROUP BY s.ship_id
) t;


-- 12. Promedio de tripulantes por barco
SELECT AVG(crew_count) AS avg_crew_per_ship
FROM (
    SELECT
        ship_id,
        COUNT(DISTINCT crew_id) AS crew_count
    FROM CREW_ASSIGNMENTS_TO_SHIPS
    GROUP BY ship_id
) t;
