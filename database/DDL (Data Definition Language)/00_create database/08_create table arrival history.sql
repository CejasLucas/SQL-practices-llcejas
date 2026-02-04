-- ARRIVAL_HISTORY: Relaciona los puertos que forman parte de un itinerario determinado.
CREATE TABLE ARRIVAL_HISTORY (
    arrival_id INT IDENTITY(1,1) PRIMARY KEY,
    voyage_id INT NOT NULL,
    harbor_id INT NOT NULL,
    arrival_order INT NOT NULL,
    arrival_datetime DATETIME NOT NULL,
    departure_datetime DATETIME,

    CONSTRAINT FK_Arrival_Voyage
        FOREIGN KEY (voyage_id) REFERENCES VOYAGE_HISTORY(voyage_id),

    CONSTRAINT FK_Arrival_Harbor
        FOREIGN KEY (harbor_id) REFERENCES HARBOR(harbor_id),

    CONSTRAINT UQ_VoyageArrivalOrder
        UNIQUE (voyage_id, arrival_order),

    CONSTRAINT CK_ArrivalDates
        CHECK (departure_datetime IS NULL 
               OR departure_datetime >= arrival_datetime)
);
