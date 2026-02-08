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


USE MaritimeSystemDB;


-- Borra todos los barcos de Argentina
DELETE FROM SHIP
WHERE country = 'Argentina';


-- Borra todos los registros de la tabla y resetea el ID
DELETE FROM SHIPBOARD_STAFFING;
DBCC CHECKIDENT ('SHIPBOARD_STAFFING', RESEED, 0);
SELECT * FROM SHIPBOARD_STAFFING; --Verification

DELETE FROM VOYAGE_HISTORY;
DBCC CHECKIDENT ('VOYAGE_HISTORY', RESEED, 0);
SELECT * FROM VOYAGE_HISTORY; --Verification

DELETE FROM ARRIVAL_HISTORY;
DBCC CHECKIDENT ('ARRIVAL_HISTORY', RESEED, 0);
SELECT * FROM ARRIVAL_HISTORY; --Verification

-- Borrar los ultimos 20 elementos de una tabla
WITH last_20_rows AS (
    SELECT TOP 20 *
    FROM ARRIVAL_HISTORY
    ORDER BY arrival_id DESC   
)
DELETE FROM last_20_rows;