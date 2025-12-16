-- Cambiar la ciudad de origen de un barco
UPDATE SHIP
SET origin_city = 'Rosario'
WHERE registration_number = 'AR-MDS-4512';

-- Cambiar ciudad y nacionalidad de un barco
UPDATE SHIP
SET origin_city = 'Montevideo',
    nationality = 'Uruguay'
WHERE name_or_nickname = 'South Sea';

-- Marcar todos los barcos argentinos como "Argentina - Mercosur"
UPDATE SHIP
SET nationality = 'Argentina - Mercosur'
WHERE nationality = 'Argentina';

-- Actualizar la posición de un tripulante según su asignación
UPDATE CA
SET position_id = P.position_id
FROM CREW_ASSIGNMENTS_TO_SHIPS CA
INNER JOIN POSITION P ON P.name = 'Capitán'
WHERE CA.crew_id = 12;

-- Cambiar la ciudad de origen de un barco al puerto principal de su país
UPDATE SHIP
SET origin_city = (
    SELECT TOP 1 city
    FROM HARBOR
    WHERE HARBOR.country = SHIP.nationality
    ORDER BY HARBOR.name
)
WHERE nationality IN ('Spain', 'Italy');