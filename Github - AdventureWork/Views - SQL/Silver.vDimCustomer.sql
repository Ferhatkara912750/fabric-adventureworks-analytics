

CREATE VIEW Silver.vDimCustomer
AS
SELECT DISTINCT
    TRY_CAST(c.CustomerKey AS int)           AS CustomerKey,
    CAST(c.FirstName AS varchar(100))        AS FirstName,
    CAST(c.LastName AS varchar(100))         AS LastName,
    CAST(c.Gender AS varchar(20))            AS Gender,
    TRY_CAST(c.BirthDate AS date)            AS BirthDate,
    CAST(c.MaritalStatus AS varchar(50))     AS MaritalStatus,
    CAST(c.EmailAddress AS varchar(200))     AS EmailAddress
FROM customers AS c;
