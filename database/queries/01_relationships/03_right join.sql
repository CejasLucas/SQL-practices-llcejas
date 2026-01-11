-- 🟥 JOIN ( RIGHT JOIN )
USE MaritimeLogisticsDB;

SELECT name AS Tabla, create_date AS FechaCreacion 
FROM sys.tables ORDER BY name;

-- 1. Mostrar todos los tripulantes aunque no estén asignados a barcos.  

-- 2. Ver todas las posiciones aunque no tengan nadie asignado.  

-- 3. Listar todos los puertos, aunque no estén en itinerarios.  

-- 4. Mostrar todos los itinerarios, aunque no tengan barcos.  

-- 5. Ver todos los barcos aunque no tengan viajes definidos.  

-- 6. Mostrar todos los tripulantes y los barcos donde podrían trabajar.  

-- 7. Ver todos los puertos junto con itinerarios donde aparecen, incluso sin asociación.  

-- 8. Mostrar todas las posiciones con los barcos que las utilizan.  

-- 9. Itinerarios con barcos, incluso si no están asignados.  

-- 10. Puertos con barcos que los visitan, aunque no existan visitas.
