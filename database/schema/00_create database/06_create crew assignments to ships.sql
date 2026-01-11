-- CREW_ASSIGNMENTS_TO_SHIPS: Registra las asignaciones de miembros de la tripulación a barcos, incluyendo su rol y período de vigencia.
CREATE TABLE CREW_ASSIGNMENTS_TO_SHIPS (
    assignment_id INT IDENTITY(1,1) PRIMARY KEY,
    ship_id INT NOT NULL,
    crew_id INT NOT NULL,
    position_id INT NOT NULL,
    assignment_start_date DATE NOT NULL,
    assignment_end_date DATE,

    CONSTRAINT FK_CREW_ASSIGN_SHIP FOREIGN KEY (ship_id) REFERENCES SHIP(ship_id),
    
    CONSTRAINT FK_CREW_ASSIGN_MEMBER FOREIGN KEY (crew_id) REFERENCES CREW_MEMBER(crew_id),
    
    CONSTRAINT FK_CREW_ASSIGN_POSITION FOREIGN KEY (position_id) REFERENCES POSITION(position_id),
    
    CONSTRAINT UQ_CREW_ASSIGNMENT UNIQUE (ship_id, crew_id, position_id, assignment_start_date),
    
    CONSTRAINT CK_AssignmentDates CHECK (assignment_end_date IS NULL OR assignment_end_date >= assignment_start_date)
);
