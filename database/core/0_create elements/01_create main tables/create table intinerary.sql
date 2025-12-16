-- ITINERARY: Almacena la información general de los itinerarios o rutas que pueden ser recorridas por los barcos.
CREATE TABLE ITINERARY (
    itinerary_id INT IDENTITY(1,1) PRIMARY KEY,
    description VARCHAR(MAX) NOT NULL
);