-- HARBOR: Representa los puertos disponibles, incluyendo su ubicación y tipo de operación.
CREATE TABLE HARBOR (
    harbor_id INT IDENTITY(1,1) PRIMARY KEY,
    name VARCHAR(200) NOT NULL,
    region VARCHAR(100) NOT NULL,
    city VARCHAR(100) NOT NULL,
    country VARCHAR(100) NOT NULL,
    port_type VARCHAR(10) NOT NULL CHECK (port_type IN ('DAY','NIGHT'))
);