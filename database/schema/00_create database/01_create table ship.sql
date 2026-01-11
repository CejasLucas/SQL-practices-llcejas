-- SHIP: Almacena la información principal de los barcos que operan dentro del sistema.
CREATE TABLE SHIP (
    ship_id INT IDENTITY(1,1) PRIMARY KEY,
    name_or_nickname VARCHAR(200) NOT NULL,
    registration_number VARCHAR(200) NOT NULL UNIQUE,
    start_of_activity DATE NOT NULL,
    origin_city VARCHAR(200) NOT NULL,
    nationality VARCHAR(200) NOT NULL
);