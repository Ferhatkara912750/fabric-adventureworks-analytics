### Sales Amount


Sales Amount = 
SUMX (
    vFactSales,
    vFactSales[OrderQuantity] * RELATED(vDimProduct[ProductPrice])
)


### Sales Amount Last Year

Sales Amount Last Year = 
VAR CurrYear = SELECTEDVALUE( vDimDate[Year] )
VAR FirstSalesYear = CALCULATE(
    MIN( vDimDate[Year] ),
    FILTER( ALL(vDimDate), NOT ISBLANK( [Sales Amount] ) )
)
VAR LastSalesYear = CALCULATE(
    MAX( vDimDate[Year] ),
    FILTER( ALL(vDimDate), NOT ISBLANK( [Sales Amount] ) )
)
RETURN
IF(
    CurrYear > FirstSalesYear &&
    CurrYear <= LastSalesYear,
    CALCULATE(
        [Sales Amount],
        ALL( vDimDate ),
        vDimDate[Year] = CurrYear - 1
    ),
    BLANK()
)


### Sales Amount YoY %

Sales Amount YoY % = 
VAR LY = [Sales Amount Last Year]
RETURN
IF(
    ISBLANK(LY),
    BLANK(),
    DIVIDE( [Sales Amount] - LY, LY )
)


### Total Returns Quantity (med USERELATIONSHIP)

Total Returns Quantity = 
CALCULATE (
    SUM ( vFactReturns[ReturnQuantity] ),
    USERELATIONSHIP ( vFactReturns[ReturnDate], vDimDate[Date] )
)


### Return Rate

Return Rate = 
DIVIDE ( [Total Returns Quantity], [Total Order Quantity] )