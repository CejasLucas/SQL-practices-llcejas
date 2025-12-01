/* ===============================================
  📅 Create TABLES
================================================*/
SELECT name AS Tabla, create_date AS FechaCreacion
FROM sys.tables ORDER BY name;


-- Tabla para POSITION  
CREATE TABLE POSITION (
    position_id INT IDENTITY(1,1) PRIMARY KEY,
    position_type VARCHAR(100) NOT NULL UNIQUE,
    position_description VARCHAR(MAX) NOT NULL
);

-- Tabla para CREW_MEMBER 
CREATE TABLE CREW_MEMBER (
    crew_id INT IDENTITY(1,1) PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(200) NOT NULL UNIQUE,
    passport_number VARCHAR(50) NOT NULL UNIQUE,
    home_city VARCHAR(100) NOT NULL,
    nationality VARCHAR(100) NOT NULL,
    birth_date DATE NOT NULL,
    employment_start_date DATE NOT NULL
);

-- Tabla para SHIP 
CREATE TABLE SHIP (
    ship_id INT IDENTITY(1,1) PRIMARY KEY,
    name_or_nickname VARCHAR(200) NOT NULL,
    registration_number VARCHAR(200) NOT NULL UNIQUE,
    start_of_activity DATE NOT NULL,
    origin_city VARCHAR(200) NOT NULL,
    nationality VARCHAR(200) NOT NULL
);

-- Tabla para ITINERARY  
CREATE TABLE ITINERARY (
    itinerary_id INT IDENTITY(1,1) PRIMARY KEY,
    description VARCHAR(MAX) NOT NULL
);

-- Tabla para HARBOR  
CREATE TABLE HARBOR (
    harbor_id INT IDENTITY(1,1) PRIMARY KEY,
    name VARCHAR(200) NOT NULL,
    region VARCHAR(100) NOT NULL,
    city VARCHAR(100) NOT NULL,
    country VARCHAR(100) NOT NULL,
    port_type VARCHAR(10) NOT NULL CHECK (port_type IN ('DAY','NIGHT'))
);


-- Tabla para CREW_ASSIGNMENTS_TO_SHIPS 
CREATE TABLE CREW_ASSIGNMENTS_TO_SHIPS (
    ship_id INT NOT NULL,
    crew_id INT NOT NULL,
    position_id INT NOT NULL,
    assignment_start_date DATE NOT NULL,
    assignment_end_date DATE,
    CONSTRAINT PK_CREW_ASSIGNMENTS PRIMARY KEY (ship_id, crew_id, position_id),
    CONSTRAINT FK_CREW_ASSIGN_SHIP FOREIGN KEY (ship_id) REFERENCES SHIP(ship_id),
    CONSTRAINT FK_CREW_ASSIGN_MEMBER FOREIGN KEY (crew_id) REFERENCES CREW_MEMBER(crew_id),
    CONSTRAINT FK_CREW_ASSIGN_POSITION FOREIGN KEY (position_id) REFERENCES POSITION(position_id)
);

-- Tabla para SHIPS_IN_ITINERARIES 
CREATE TABLE SHIPS_IN_ITINERARIES (
    id INT IDENTITY(1,1) PRIMARY KEY,
    ship_id INT NOT NULL,
    itinerary_id INT NOT NULL,
    voyage_start_date DATE NOT NULL,
    voyage_end_date DATE,
    CONSTRAINT FK_SHIP_ITINERARY_SHIP FOREIGN KEY (ship_id) REFERENCES SHIP(ship_id),
    CONSTRAINT FK_SHIP_ITINERARY_ITINERARY FOREIGN KEY (itinerary_id) REFERENCES ITINERARY(itinerary_id)
);

-- Tabla para HARBORS_IN_ITINERARIES 
CREATE TABLE HARBORS_IN_ITINERARIES (
    id INT IDENTITY(1,1) PRIMARY KEY,
    harbor_id INT NOT NULL,
    itinerary_id INT NOT NULL,
    CONSTRAINT FK_HARBOR_ITINERARY_HARBOR FOREIGN KEY (harbor_id) REFERENCES HARBOR(harbor_id),
    CONSTRAINT FK_HARBOR_ITINERARY_ITINERARY FOREIGN KEY (itinerary_id) REFERENCES ITINERARY(itinerary_id)
);


-- Verification Of Elements
SELECT * FROM SHIP;

SELECT * FROM CREW_MEMBER;

SELECT * FROM POSITION;

SELECT * FROM ITINERARY;

SELECT * FROM HARBOR;

SELECT * FROM CREW_ASSIGNMENTS_TO_SHIPS;

SELECT * FROM SHIPS_IN_ITINERARIES;

SELECT * FROM HARBORS_IN_ITINERARIES;
