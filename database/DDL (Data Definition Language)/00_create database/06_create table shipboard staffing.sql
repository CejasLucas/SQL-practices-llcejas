-- SHIPBOARD_STAFFING: Registra las asignaciones de miembros de la tripulación a barcos
-- Incluyendo su rol y período de vigencia.

CREATE TABLE SHIPBOARD_STAFFING (
    assignment_id INT IDENTITY(1,1) PRIMARY KEY,
    ship_id INT NOT NULL,
    crew_id INT NOT NULL,
    position_id INT NOT NULL,
    assignment_start_date DATE NOT NULL,
    assignment_end_date DATE,

    CONSTRAINT FK_Staffing_Ship
        FOREIGN KEY (ship_id) REFERENCES SHIP(ship_id),

    CONSTRAINT FK_Staffing_Crew
        FOREIGN KEY (crew_id) REFERENCES CREW_MEMBER(crew_id),

    CONSTRAINT FK_Staffing_Position
        FOREIGN KEY (position_id) REFERENCES POSITION(position_id),

    CONSTRAINT UQ_Staffing_Assignment
        UNIQUE (ship_id, crew_id, position_id, assignment_start_date),

    CONSTRAINT CK_StaffingDates
        CHECK (assignment_end_date IS NULL 
               OR assignment_end_date >= assignment_start_date)
);