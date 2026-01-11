-- CREW_MEMBER: Almacena los datos personales y laborales de cada tripulante.
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