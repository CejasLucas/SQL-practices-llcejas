-- SHIPS_IN_ITINERARIES: Asocia barcos con itinerarios específicos, registrando las fechas de inicio y fin del viaje.
CREATE TABLE SHIPS_IN_ITINERARIES (
    id INT IDENTITY(1,1) PRIMARY KEY,
    ship_id INT NOT NULL,
    itinerary_id INT NOT NULL,
    voyage_start_date DATE NOT NULL,
    voyage_end_date DATE,

    CONSTRAINT FK_SHIP_ITINERARY_SHIP FOREIGN KEY (ship_id) REFERENCES SHIP(ship_id),
    
    CONSTRAINT FK_SHIP_ITINERARY_ITINERARY FOREIGN KEY (itinerary_id) REFERENCES ITINERARY(itinerary_id),
    
    CONSTRAINT CK_ShipItineraryDates CHECK (voyage_end_date IS NULL OR voyage_end_date >= voyage_start_date)
);