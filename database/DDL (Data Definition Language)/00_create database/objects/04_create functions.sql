USE MaritimeSystemDB;
GO 

CREATE OR ALTER FUNCTION dbo.fn_CalculateAge (@BirthDate DATE)
RETURNS INT
AS
BEGIN
    DECLARE @Age INT;
    
    SET @Age = DATEDIFF(YEAR, @BirthDate, GETDATE()) - 
        CASE 
            WHEN (MONTH(@BirthDate) > MONTH(GETDATE())) 
            OR (MONTH(@BirthDate) = MONTH(GETDATE()) AND DAY(@BirthDate) > DAY(GETDATE())) 
            THEN 1 ELSE 0 
        END;               
    RETURN @Age;
END;
GO 