USE MaritimeLogisticsDB; GO

SELECT name AS Tabla, create_date AS FechaCreacion
FROM sys.tables ORDER BY name;

ALTER TABLE SHIP
ADD tonnage INT;

ALTER TABLE SHIP
DROP COLUMN tonnage;

SELECT * FROM SHIP;