-- SHIP: Almacena la información principal de los barcos que operan dentro del sistema.
CREATE TABLE SHIP (
    ship_id INT IDENTITY(1,1) PRIMARY KEY,
    nickname VARCHAR(200) NOT NULL,
    registration_number VARCHAR(200) NOT NULL UNIQUE,
    city VARCHAR(200) NOT NULL,
    country VARCHAR(200) NOT NULL,
    start_of_activity DATE NOT NULL,
    capacity INT,
    tonnage DECIMAL(10,2),
    status VARCHAR(50) NOT NULL DEFAULT 'ACTIVE',

    CONSTRAINT CK_ShipStartDate CHECK (start_of_activity <= GETDATE())
);
