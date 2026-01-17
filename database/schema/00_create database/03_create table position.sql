-- POSITION: Define los distintos roles o cargos que puede ocupar un miembro de la tripulación.
CREATE TABLE POSITION (
    position_id INT IDENTITY(1,1) PRIMARY KEY,
    type VARCHAR(100) NOT NULL UNIQUE,
    description VARCHAR(MAX) NOT NULL
);