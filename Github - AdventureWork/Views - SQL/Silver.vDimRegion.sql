CREATE VIEW [Silver].[vDimRegion] 
	AS 
(SELECT DISTINCT
    t.SalesTerritoryKey,
    t.Region,
    t.Country,
    t.Continent
FROM territory AS t)