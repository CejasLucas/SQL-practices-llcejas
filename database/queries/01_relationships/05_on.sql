-- 🟥 JOIN ( ON ) 
USE MaritimeLogisticsDB;

SELECT name AS Tabla, create_date AS FechaCreacion 
FROM sys.tables ORDER BY name;


-- 1. Relacionar barcos con asignaciones por `ship_id`.  

-- 2. Relacionar tripulantes con asignaciones por `crew_id`.  

-- 3. Relacionar posiciones con asignaciones por `position_id`.  

-- 4. Relacionar itinerarios con barcos en itinerarios.  

-- 5. Relacionar itinerarios con puertos.  

-- 6. Unir barcos con puertos mediante itinerarios.  

-- 7. Unir tripulantes con itinerarios vía asignaciones.  

-- 8. Relacionar puertos con barcos según viajes.  

-- 9. Relacionar itinerarios con fechas de viaje.  

-- 10. Relacionar puertos con regiones mediante itinerarios.
