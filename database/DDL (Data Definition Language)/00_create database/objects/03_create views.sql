USE MaritimeSystemDB;
GO 

CREATE VIEW vw_available_crew_members
AS
SELECT
    c.crew_id,
    c.first_name,
    c.last_name,
    c.email,
    c.nationality,
    c.city
FROM CREW_MEMBER c
WHERE
    c.status = 'ACTIVE'
    AND NOT EXISTS (
        SELECT 1
        FROM SHIPBOARD_STAFFING ss
        WHERE ss.crew_id = c.crew_id
          AND ss.assignment_end_date IS NULL
    );
GO 