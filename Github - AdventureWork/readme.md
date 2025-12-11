# AdventureWorks Analytics in Microsoft Fabric

This project is an end-to-end analytics solution built in **Microsoft Fabric** using the AdventureWorks dataset.

It demonstrates:

- Ingesting CSV files into a **Lakehouse**
- Building a **Warehouse** with a Silver layer using SQL views
- Designing a **star schema** semantic model with proper relationships (incl. inactive date relationship for returns)
- Writing **DAX measures** for Sales, YoY, Margin and Return Rate
- Doing simple **data science in Python (pandas)**, including data cleaning, yearly sales analysis and a correlation heatmap

---

## Architecture Overview

1. **Data source**  
   - AdventureWorks CSV files (sales 2020–2022, returns, customers, products, territories)

2. **Lakehouse & Warehouse**  
   - CSV files stored in Lakehouse  
   - SQL views in a `silver` schema to clean and type-cast the data  
   - Example views: `vDimCustomer`, `vDimProduct`, `vDimRegion`, `vFactSales`, `vFactReturns`, `DimDate`

3. **Semantic model (Direct Lake)**  
   - Star schema with:
     - DimCustomer, DimProduct, DimRegion, DimDate
     - FactSales, FactReturns
   - Active date relationship: `DimDate[Date] -> FactSales[OrderDate]`
   - Inactive date relationship: `DimDate[Date] -> FactReturns[ReturnDate]` (used via `USERELATIONSHIP` in DAX)

4. **Python notebook**  
   - Reads tables from the Lakehouse (`sales2020`, `sales2021`, `sales2022`, `product`, `customers`)  
   - Combines and cleans data into a single `sales_full` DataFrame  
   - Calculates `SalesAmount` and yearly totals  
   - Builds a **correlation heatmap** for numerical variables

---

## Files in this repository

- `sql/` – SQL scripts for the Warehouse Silver views and DimDate
- `dax/measures_sales_and_returns.md` – DAX measures used in the semantic model
- `notebooks/adventureworks_fabric_notebook.ipynb` – Python notebook with data cleaning and EDA
- `images/model-view.png` – Screenshot of the star schema in the semantic model
- `images/report-summary.png` – Sample Power BI / Fabric report summary page
- `images/correlation_heatmap.png` – Correlation heatmap created in the notebook

---

## Key Insights (example)

- **Sales trend:** Sales grew from 2020 to 2021 and slightly declined in 2022.
- **Sales drivers:** `SalesAmount` is mainly driven by `OrderQuantity` and `ProductPrice`, as confirmed by the correlation analysis.
- **Returns:** Returns are modelled in a separate fact table and linked to the same dimensions, with an inactive date relationship activated in DAX when needed.

---

## How to reproduce (high level)

1. Create a Fabric Lakehouse and upload the AdventureWorks CSV files.
2. Create Warehouse views using the SQL scripts in `/sql`.
3. Build a semantic model on top of the Warehouse tables and add the DAX measures.
4. Open the Python notebook in a Fabric Notebook, attach it to the Lakehouse, and run all cells.

---

## Technologies

- Microsoft Fabric (Lakehouse, Warehouse, Semantic model / Direct Lake)
- SQL (T-SQL style views)
- DAX (time intelligence, inactive relationships, KPI measures)
- Python (pandas, matplotlib)
