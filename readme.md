# AdventureWorks Analytics in Microsoft Fabric

This project demonstrates an end-to-end analytics workflow using the **Microsoft Fabric** ecosystem.  
It covers ingestion, transformation, modeling, semantic layer development, DAX metrics, and Python-based exploratory data analysis — following modern best practices such as the **Medallion Architecture**.

The goal is to show how raw CSV files evolve into a rich analytical model powering business insights.

---

## 📐 Medallion Architecture (Bronze → Silver → Gold)

### 🥉 Bronze – Raw Layer  
The Bronze layer contains the **original CSV files** uploaded directly into the Lakehouse under `Files/`.  
No transformation is performed at this stage.

<img width="1823" height="713" alt="Lakehouse_files" src="https://github.com/user-attachments/assets/5c07454a-bbfa-4480-88a2-8dcbadbd33a5" />



---

### 🥈 Silver – Cleaned & Modeled Layer  
The Silver layer is implemented using **SQL views** inside the Warehouse.  
These views perform:

- type casting  
- standardization of business keys  
- joining lookup tables  
- date normalization  
- early cleaning steps  

Example views:

- `silver.vDimCustomer`  
- `silver.vDimProduct`  
- `silver.vDimRegion`  
- `silver.vFactSales`  
- `silver.vFactReturns`  
- `silver.DimDate`

<img width="1839" height="838" alt="warehouse_views" src="https://github.com/user-attachments/assets/e33b1ddf-6a29-4b3f-a73c-c96b2a50ea14" />


---

### 🥇 Gold – Analytics & Semantic Layer  
The Gold layer powers the **semantic model (Direct Lake)** used by Power BI / Fabric reporting.  
A classic **star schema** is created with:

- Fact tables: Sales, Returns  
- Dimensions: Date, Product, Customer, Region  

This layer includes business metrics implemented in DAX, such as:

- **Sales Amount**  
- **Sales Amount Last Year**  
- **Sales YoY %**  
- **Return Quantity (with USERELATIONSHIP)**  
- **Return Rate**  
- **KPI color logic**

<img width="1045" height="656" alt="model-view" src="https://github.com/user-attachments/assets/3b91f238-bc9a-40e7-b973-692907b71b4e" />

---

## 📊 Python Exploratory Data Analysis (EDA)

A Fabric Notebook is used to perform light data science on top of the unified cleaned dataset.

Key steps include:

### ✔ Loading and merging data from Lakehouse  
Data is loaded via Spark and converted to pandas for transformation.

### ✔ Data cleaning  
- Normalizing data types  
- Handling missing values  
- Removing invalid records  

### ✔ Creating business metrics  
`SalesAmount = OrderQuantity * ProductPrice`

### ✔ Yearly sales summary  
A simple grouped aggregation yields total revenue per year.

<img width="1045" height="656" alt="model-view" src="https://github.com/user-attachments/assets/a5304d86-3f81-4d8f-9e33-976a9c48276b" />


### ✔ Product performance  
Identification of the Top 5 products by SalesAmount.

### ✔ Correlation heatmap  
A numerical correlation matrix is visualized to understand relationships between key variables.

<img width="1048" height="704" alt="image" src="https://github.com/user-attachments/assets/142e0932-8d2d-4424-8562-98f553cffe65" />

---

## Key Findings

- `Sales increased significantly from 2020 → 2021, with a minor dip in 2022`
- `SalesAmount is driven mainly by OrderQuantity and ProductPrice`
- `Returns represent a small portion of total orders`
- `Semantic modeling enables flexible KPI calculations`
- `Correlation analysis confirms expected business patterns`

## Technologies Used

- Microsoft Fabric Lakehouse
- Microsoft Fabric Warehouse
- SQL (views, type casting, joins)
- DAX (time intelligence, inactive relationships, KPIs)
- Python (pandas, numpy, matplotlib)
- Direct Lake semantic model
- Power BI visualizations

