-- Cambiar la ciudad de origen de un barco
UPDATE SHIP
SET city = 'Rosario'
WHERE registration_number = 'AR-MDS-4512';

-- Cambiar ciudad y nacionalidad de un barco
UPDATE SHIP
SET city = 'Montevideo',
    country = 'Uruguay'
WHERE nickname = 'South Sea';

-- Marcar todos los barcos argentinos como "Argentina - Mercosur"
UPDATE SHIP
SET country = 'Argentina - Mercosur'
WHERE country = 'Argentina';

-- Actualizar la posición de un tripulante según su asignación
UPDATE sp
SET sp.position_id = p.position_id
FROM SHIPBOARD_STAFFING sp
INNER JOIN POSITION p ON p.type = 'Capitán'
WHERE sp.crew_id = 12;

-- Cambiar la ciudad de origen de un barco al puerto principal de su país
UPDATE SHIP
SET city = (
    SELECT TOP 1 city
    FROM HARBOR
    WHERE HARBOR.country = SHIP.country
    ORDER BY HARBOR.name
)
WHERE country IN ('Spain', 'Italy');