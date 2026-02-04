-- CREW_MEMBER: Almacena los datos personales y laborales de cada tripulante.
CREATE TABLE CREW_MEMBER (
    crew_id INT IDENTITY(1,1) PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(200) NOT NULL UNIQUE,
    birth_date DATE NOT NULL,
    passport_number VARCHAR(50) NOT NULL UNIQUE,
    address VARCHAR(300),
    city VARCHAR(100) NOT NULL,
    nationality VARCHAR(100),
    employment_start_date DATE NOT NULL,
    employment_end_date DATE,
    status VARCHAR(50) NOT NULL DEFAULT 'ACTIVE',

    CONSTRAINT CK_CrewEmploymentDates CHECK (employment_end_date IS NULL OR employment_end_date >= employment_start_date)
);