-- VOYAGE_HISTORY: Asocia los barcos con itinerarios específicos
-- Registrando las fechas de inicio y fin del viaje.

CREATE TABLE VOYAGE_HISTORY (
    voyage_id INT IDENTITY(1,1) PRIMARY KEY,
    ship_id INT NOT NULL,
    itinerary_id INT NOT NULL,
    scheduled_start_date DATE NOT NULL,
    scheduled_end_date DATE,
    actual_start_date DATE,
    actual_end_date DATE,
    voyage_status VARCHAR(50) NOT NULL DEFAULT 'PLANNED',

    CONSTRAINT FK_Voyage_Ship
        FOREIGN KEY (ship_id) REFERENCES SHIP(ship_id),

    CONSTRAINT FK_Voyage_Itinerary
        FOREIGN KEY (itinerary_id) REFERENCES ITINERARY(itinerary_id),

    CONSTRAINT CK_VoyageDates
        CHECK (scheduled_end_date IS NULL 
               OR scheduled_end_date >= scheduled_start_date),

    CONSTRAINT CK_ActualVoyageDates
        CHECK (actual_end_date IS NULL 
               OR actual_end_date >= actual_start_date)
);
