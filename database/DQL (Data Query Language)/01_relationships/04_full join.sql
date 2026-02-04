-- 🟪 FULL JOIN
USE MaritimeSystemDB;

SELECT name AS Tabla, create_date AS FechaCreacion 
FROM sys.tables ORDER BY name;


-- 1. Listar barcos y tripulantes existan o no asignaciones.  

-- 2. Mostrar puertos e itinerarios aunque no estén relacionados.  

-- 3. Mostrar barcos e itinerarios aunque no coincidan.  

-- 4. Ver tripulantes y posiciones aunque no haya relaciones.  

-- 5. Mostrar puertos y barcos aunque no haya viajes registrados.  

-- 6. Listar posiciones y asignaciones aunque no existan vínculos.  

-- 7. Mostrar itinerarios y puertos aunque no haya visitas.  

-- 8. Barcos e itinerarios sin importar si hay participación.  

-- 9. Tripulantes y asignaciones aunque no haya registros.  

-- 10. Puertos y barcos sin viajes en común.