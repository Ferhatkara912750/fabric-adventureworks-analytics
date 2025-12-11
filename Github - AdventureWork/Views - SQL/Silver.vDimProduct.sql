CREATE [Silver].[vDimProduct] AS (SELECT DISTINCT
    p.ProductKey,
    p.ProductSubcategoryKey AS ProductSubcategoryKey,
    p.ProductName,
    p.ProductColor,
    p.ProductCost,
    p.ProductPrice,

    sc.ProductSubcategoryKey AS SubcategoryKey,
    sc.SubcategoryName,

    pc.ProductCategoryKey AS CategoryKey,
    pc.CategoryName
FROM [product] AS p
LEFT JOIN [productsubcategory] AS sc
    ON p.ProductSubcategoryKey = sc.ProductSubcategoryKey
LEFT JOIN [productcategory] AS pc
    ON sc.ProductCategoryKey = pc.ProductCategoryKey)