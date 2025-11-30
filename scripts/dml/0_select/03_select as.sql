USE MaritimeLogisticsDB; -- Verficar la conexión
GO

SELECT name AS Tabla, create_date AS FechaCreacion
FROM sys.tables ORDER BY name;

-- 1. Mostrar el nombre del barco con el alias `nombre_barco`.  
SELECT name_or_nickname as nombre_barco FROM SHIP;

-- 2. Renombrar la columna `email` como `correo_tripulante`.  
SELECT * FROM CREW_MEMBER;
EXEC sp_rename 'CREW_MEMBER.email', 'correo_tripulante', 'COLUMN';
EXEC sp_rename 'CREW_MEMBER.correo_tripulante', 'email', 'COLUMN';

-- 3. Mostrar `position_type` como `rol_en_barco`.  
SELECT position_type as rol_en_barco FROM POSITION;

-- 4. Mostrar el país del puerto como `pais_puerto`.  
SELECT DISTINCT country as pais_puerto FROM HARBOR;

-- 5. Renombrar `voyage_start_date` como `inicio_viaje`.  
SELECT * FROM SHIPS_IN_ITINERARIES;
EXEC sp_rename 'SHIPS_IN_ITINERARIES.voyage_start_date', 'inicio_viaje', 'COLUMN';
EXEC sp_rename 'SHIPS_IN_ITINERARIES.inicio_viaje', 'voyage_start_date', 'COLUMN';

-- 6. Renombrar `voyage_end_date` como `fin_viaje`.  
SELECT * FROM SHIPS_IN_ITINERARIES;
EXEC sp_rename 'SHIPS_IN_ITINERARIES.voyage_end_date', 'fin_viaje', 'COLUMN';
EXEC sp_rename 'SHIPS_IN_ITINERARIES.fin_viaje', 'voyage_end_date', 'COLUMN';

-- 7. Mostrar `first_name` como `nombre` y `last_name` como `apellido`.  
SELECT first_name as nombre, last_name as apellido FROM CREW_MEMBER;

-- 8. Renombrar `registration_number` como `matricula`.  
SELECT * FROM SHIP;
EXEC sp_rename 'SHIP.registration_number', 'matricula', 'COLUMN';
EXEC sp_rename 'SHIP.matricula', 'registration_number', 'COLUMN';

-- 9. Mostrar `origin_city` como `ciudad_origen_barco`.  
SELECT origin_city as ciudad_origen_barco FROM SHIP;

-- 10. Renombrar `nationality` del tripulante como `pais_tripulante`.  
SELECT * FROM CREW_MEMBER;
EXEC sp_rename 'CREW_MEMBER.nationality', 'pais_tripulante', 'COLUMN';
EXEC sp_rename 'CREW_MEMBER.pais_tripulante', 'nationality', 'COLUMN';

-- 11. Mostrar `assignment_start_date` como `inicio_asignación`.  
SELECT assignment_start_date as inicio_asignación FROM CREW_ASSIGNMENTS_TO_SHIPS;

-- 12. Renombrar `assignment_end_date` como `fin_asignación`.
SELECT * FROM CREW_ASSIGNMENTS_TO_SHIPS;
EXEC sp_rename 'CREW_ASSIGNMENTS_TO_SHIPS.assignment_end_date', 'fin_asignación', 'COLUMN';
EXEC sp_rename 'CREW_ASSIGNMENTS_TO_SHIPS.fin_asignación', 'assignment_end_date', 'COLUMN';
