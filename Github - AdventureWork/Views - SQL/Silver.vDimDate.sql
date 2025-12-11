

CREATE Silver.vDimDate
AS
WITH Bounds AS (
    SELECT
        CAST(MIN(OrderDate) AS date) AS MinDate,
        CAST(MAX(OrderDate) AS date) AS MaxDate
    FROM Silver.vFactSales
),
DateSeries AS (
    SELECT
        DATEADD(DAY, value, MinDate) AS [Date]
    FROM Bounds
    CROSS APPLY GENERATE_SERIES(
        0,
        DATEDIFF(DAY, MinDate, MaxDate),
        1
    )
)
SELECT
    [Date]                                         AS [Date],
    YEAR([Date])                                   AS [Year],
    DATEPART(QUARTER, [Date])                      AS QuarterNumber,
    CONCAT('Q', DATEPART(QUARTER, [Date]))         AS Quarter,
    MONTH([Date])                                  AS MonthNumber,
    DATENAME(MONTH, [Date])                        AS MonthName,
    (YEAR([Date]) * 100 + MONTH([Date]))           AS YearMonthNumber,
    FORMAT([Date], 'yyyy-MM')                      AS YearMonth,
    DATEPART(ISO_WEEK, [Date])                     AS ISOWeeknumber,
    DATEPART(WEEKDAY, [Date])                      AS DayOfWeek,
    DATENAME(WEEKDAY, [Date])                      AS DayOfWeekName,
    CASE WHEN DATEPART(WEEKDAY, [Date]) IN (1,7)
         THEN 1 ELSE 0 END                         AS IsWeekend,
    CASE WHEN DATEPART(WEEKDAY, [Date]) IN (2,3,4,5,6)
         THEN 1 ELSE 0 END                         AS IsWorkday
FROM DateSeries;
