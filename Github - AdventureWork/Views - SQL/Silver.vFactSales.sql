CREATE VIEW [Silver].[vFactSales] AS (SELECT
    CAST(s2020.OrderDate AS date)        AS OrderDate,
    CAST(s2020.StockDate AS date)        AS StockDate,
    s2020.OrderNumber,
    s2020.OrderLineItem,
    s2020.ProductKey,
    s2020.CustomerKey,
    s2020.TerritoryKey,
    CAST(s2020.OrderQuantity AS int)     AS OrderQuantity,
    YEAR(CAST(s2020.OrderDate AS date))  AS OrderYear
FROM sales2020 s2020

UNION ALL

SELECT
    CAST(s2021.OrderDate AS date)        AS OrderDate,
    CAST(s2021.StockDate AS date)        AS StockDate,
    s2021.OrderNumber,
    s2021.OrderLineItem,
    s2021.ProductKey,
    s2021.CustomerKey,
    s2021.TerritoryKey,
    CAST(s2021.OrderQuantity AS int)     AS OrderQuantity,
    YEAR(CAST(s2021.OrderDate AS date))  AS OrderYear
FROM sales2021 s2021

UNION ALL

SELECT
    CAST(s2022.OrderDate AS date)        AS OrderDate,
    CAST(s2022.StockDate AS date)        AS StockDate,
    s2022.OrderNumber,
    s2022.OrderLineItem,
    s2022.ProductKey,
    s2022.CustomerKey,
    s2022.TerritoryKey,
    CAST(s2022.OrderQuantity AS int)     AS OrderQuantity,
    YEAR(CAST(s2022.OrderDate AS date))  AS OrderYear
FROM sales2022 s2022)