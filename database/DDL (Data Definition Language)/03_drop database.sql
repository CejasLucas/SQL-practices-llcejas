/* ================= 🗑️ Delete database ====================
00. Cambiar al contexto master para poder eliminar otra base
01. Verificar si la base existe
02. Terminar conexiones activas a la base
03. Eliminar la base de datos
========================================================= */

USE master; GO

IF EXISTS (SELECT name FROM sys.databases WHERE name = N'PortFleetDB')
BEGIN
    ALTER DATABASE PortFleetDB SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE PortFleetDB;
    PRINT 'La base de datos PortFleetDB fue eliminada correctamente.';
END
ELSE
BEGIN
    PRINT 'La base de datos PortFleetDB >>> NO existe.';
END
GO