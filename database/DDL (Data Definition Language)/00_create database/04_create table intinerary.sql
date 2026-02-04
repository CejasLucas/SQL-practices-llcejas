-- ITINERARY: Almacena la información general de los itinerarios o rutas que pueden ser recorridas por los barcos.
CREATE TABLE ITINERARY (
    itinerary_id INT IDENTITY(1,1) PRIMARY KEY,
    name VARCHAR(200) NOT NULL,
    description VARCHAR(MAX) NOT NULL
);