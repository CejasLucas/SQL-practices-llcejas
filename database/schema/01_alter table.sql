USE MaritimeLogisticsDB; GO

SELECT name AS Tabla, create_date AS FechaCreacion
FROM sys.tables ORDER BY name;

ALTER TABLE SHIP
ADD tonnage INT;

ALTER TABLE SHIP
DROP COLUMN tonnage;

SELECT * FROM SHIP;

SELECT * FROM POSITION

EXEC sp_rename 'POSITION.job_type', 'type', 'COLUMN';

EXEC sp_rename 'POSITION.position_description', 'description', 'COLUMN';
