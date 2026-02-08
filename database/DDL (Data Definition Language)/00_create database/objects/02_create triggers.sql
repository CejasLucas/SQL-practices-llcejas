-- Trigger: Validar que la fecha final sea mayor que la inicial (asignación)
CREATE TRIGGER trg_validate_assignment_dates
ON SHIPBOARD_STAFFING
AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM inserted
        WHERE assignment_end_date IS NOT NULL
          AND assignment_end_date < assignment_start_date
    )
    BEGIN
        RAISERROR ('La fecha de fin no puede ser menor que la fecha de inicio.', 16, 1);
        ROLLBACK TRANSACTION;
    END
END; GO
