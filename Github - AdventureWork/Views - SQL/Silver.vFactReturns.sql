

CREATE VIEW Silver.vFactReturns
AS
SELECT
    TRY_CAST(r.ReturnDate AS date)        AS ReturnDate,
    TRY_CAST(r.ProductKey AS int)         AS ProductKey,
    TRY_CAST(r.TerritoryKey AS int)       AS TerritoryKey,
    TRY_CAST(r.ReturnQuantity AS int)     AS ReturnQuantity
FROM returns AS r;
