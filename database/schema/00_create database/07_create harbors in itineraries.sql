-- HARBORS_IN_ITINERARIES: Relaciona los puertos que forman parte de un itinerario determinado.
CREATE TABLE HARBORS_IN_ITINERARIES (
    id INT IDENTITY(1,1) PRIMARY KEY,
    harbor_id INT NOT NULL,
    itinerary_id INT NOT NULL,

    CONSTRAINT FK_HARBOR_ITINERARY_HARBOR FOREIGN KEY (harbor_id) REFERENCES HARBOR(harbor_id),

    CONSTRAINT FK_HARBOR_ITINERARY_ITINERARY FOREIGN KEY (itinerary_id) REFERENCES ITINERARY(itinerary_id)
);