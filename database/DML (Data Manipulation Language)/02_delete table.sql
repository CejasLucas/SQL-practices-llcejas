/* =========================================================
DELETE
→ Borra filas de una tabla (todas o con WHERE).
→ Mantiene la tabla, constraints, índices y relaciones.
→ Respeta claves foráneas y dispara triggers.

TRUNCATE
→ Vacía una tabla completa de forma rápida.
→ Mantiene la tabla pero reinicia IDENTITY.
→ Solo funciona en tablas aisladas (sin FK).

DROP
→ Elimina la tabla por completo.
→ Borra datos, estructura, constraints e índices.
→ La tabla deja de existir.
============================================================ */


USE MaritimeLogisticsDB;


-- Borra todos los barcos de Argentina
DELETE FROM SHIP
WHERE nationality = 'Argentina';


-- Borra todos los registros de la tabla y resetea el ID
DELETE FROM CREW_ASSIGNMENTS_TO_SHIPS;
DBCC CHECKIDENT ('CREW_ASSIGNMENTS_TO_SHIPS', RESEED, 0);
SELECT * FROM CREW_ASSIGNMENTS_TO_SHIPS; --Verification

DELETE FROM SHIPS_IN_ITINERARIES;
DBCC CHECKIDENT ('SHIPS_IN_ITINERARIES', RESEED, 0);
SELECT * FROM SHIPS_IN_ITINERARIES; --Verification

DELETE FROM HARBORS_IN_ITINERARIES;
DBCC CHECKIDENT ('HARBORS_IN_ITINERARIES', RESEED, 0);
SELECT * FROM HARBORS_IN_ITINERARIES; --Verification

-- Borrar los ultimos 20 elementos de una tabla
WITH last_20_rows AS (
    SELECT TOP 20 *
    FROM SHIPS_IN_ITINERARIES
    ORDER BY id DESC   
)
DELETE FROM last_20_rows;