-- 🟪 WHERE ( <> )
USE MaritimeLogisticsDB;

SELECT name AS Tabla, create_date AS FechaCreacion 
FROM sys.tables ORDER BY name;

-- 1. Barcos cuya nacionalidad no sea “Argentina”.  

-- 2. Puertos cuyo país no sea “Brasil”.  

-- 3. Tripulantes cuya ciudad natal no sea “Madrid”.  

-- 4. Itinerarios que no tengan descripción vacía.  

-- 5. Puertos no pertenecientes al tipo “NIGHT”.  

-- 6. Tripulantes cuyo país no sea “Perú”.  

-- 7. Barcos cuya ciudad origen no sea “Barcelona”.  

-- 8. Puertos no ubicados en la región “Norte”.  

-- 9. Barcos cuyo nombre no coincida con uno específico.  

-- 10. Tripulantes cuyo país no sea “Portugal”. */