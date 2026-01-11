-- 🟥 JOIN ( LEFT JOIN )
USE MaritimeLogisticsDB;

SELECT name AS Tabla, create_date AS FechaCreacion 
FROM sys.tables ORDER BY name;

-- 1. Listar todos los barcos, incluso los que no tienen tripulantes.  

-- 2. Mostrar puertos, incluso los no utilizados en itinerarios.  

-- 3. Mostrar posiciones, aunque no estén asignadas a nadie.  

-- 4. Ver tripulantes, incluso si no tienen asignaciones.  

-- 5. Mostrar itinerarios, incluso si no tienen puertos.  

-- 6. Listar barcos y sus itinerarios, aunque algunos no tengan.  

-- 7. Mostrar tripulantes y fechas de asignación, aunque estén vacías.  

-- 8. Barcos y el puerto donde empezaron su viaje, incluso sin definir.  

-- 9. Tripulantes y la ciudad donde están trabajando, aunque no tengan asignación.  

-- 10. Puertos y barcos que los visitan, aunque no existan viajes registrados.
