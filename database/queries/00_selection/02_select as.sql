-- 🟦 SELECT AS
USE MaritimeSystemDB;

SELECT name AS Tabla, create_date AS FechaCreacion 
FROM sys.tables ORDER BY name;


-- 1. Mostrar el nombre del barco con el alias `nombre_barco`.  
SELECT s.nickname as nombre_barco FROM SHIP s;

-- 2. Renombrar la columna `email` como `correo_tripulante`.  
SELECT * FROM CREW_MEMBER cw;
EXEC sp_rename 'CREW_MEMBER.email', 'correo_tripulante', 'COLUMN';
EXEC sp_rename 'CREW_MEMBER.correo_tripulante', 'email', 'COLUMN';

-- 3. Mostrar `position_type` como `rol_en_barco`.  
SELECT p.type as rol_en_barco FROM POSITION p;

-- 4. Mostrar el país del puerto como `pais_puerto`.  
SELECT DISTINCT h.country as pais_puerto FROM HARBOR h;

-- 5. Renombrar `voyage_start_date` como `inicio_viaje`.  
SELECT * FROM VOYAGE_HISTORY vh;
EXEC sp_rename 'VOYAGE_HISTORY.scheduled_start_date', 'inicio_viaje', 'COLUMN';
EXEC sp_rename 'VOYAGE_HISTORY.inicio_viaje', 'scheduled_start_date', 'COLUMN';

-- 6. Renombrar `voyage_end_date` como `fin_viaje`.  
SELECT * FROM VOYAGE_HISTORY vh;
EXEC sp_rename 'VOYAGE_HISTORY.scheduled_end_date', 'fin_viaje', 'COLUMN';
EXEC sp_rename 'VOYAGE_HISTORY.fin_viaje', 'scheduled_end_date', 'COLUMN';

-- 7. Mostrar `first_name` como `nombre` y `last_name` como `apellido`.  
SELECT cw.first_name as nombre, cw.last_name as apellido FROM CREW_MEMBER cw;

-- 8. Renombrar `registration_number` como `matricula`.  
SELECT * FROM SHIP s;
EXEC sp_rename 'SHIP.registration_number', 'matricula', 'COLUMN';
EXEC sp_rename 'SHIP.matricula', 'registration_number', 'COLUMN';

-- 9. Mostrar `origin_city` como `ciudad_origen_barco`.  
SELECT s.city as ciudad_origen_barco FROM SHIP s;

-- 10. Renombrar `nationality` del tripulante como `pais_tripulante`.  
SELECT * FROM CREW_MEMBER cw;
EXEC sp_rename 'CREW_MEMBER.nationality', 'pais_tripulante', 'COLUMN';
EXEC sp_rename 'CREW_MEMBER.pais_tripulante', 'nationality', 'COLUMN';

-- 11. Mostrar `assignment_start_date` como `inicio_asignación`.  
SELECT sf.assignment_start_date as inicio_asignación FROM SHIPBOARD_STAFFING sf;

-- 12. Renombrar `assignment_end_date` como `fin_asignación`.
SELECT * FROM SHIPBOARD_STAFFING sf
EXEC sp_rename 'SHIPBOARD_STAFFING.assignment_end_date', 'fin_asignación', 'COLUMN';
EXEC sp_rename 'SHIPBOARD_STAFFING.fin_asignación', 'assignment_end_date', 'COLUMN';
