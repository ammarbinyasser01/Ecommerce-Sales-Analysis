# E-Commerce Sales & Customer Insights

## Project Overview
This project analyzes the Brazilian Olist E-Commerce dataset to uncover customer behavior, sales trends, and business insights. Multiple datasets were joined using SQL to create a master table, which was then analyzed in Python using Pandas and visualization libraries. An interactive Streamlit dashboard was developed to present key insights dynamically.

The project demonstrates a complete workflow from raw data cleaning and preprocessing to data analysis, visualization, and interactive reporting, making it suitable for showcasing Python, SQL, and data visualization skills.

---

## Features

### Data Handling
- Load and clean multiple CSV datasets
- Create a single master table by joining datasets using SQL
- Handle missing or inconsistent data

### Exploratory Data Analysis (EDA)
- Analyze key metrics like revenue, average order value, and delivery success
- Visualize distributions, correlations, and trends
- Identify patterns across categories, regions, and time

### Interactive Dashboard
- Built with Streamlit
- Displays sales trends, revenue breakdown, and customer insights
- Allows dynamic exploration of data metrics

---

## Project Workflow

### SQL Data Preparation
- Load multiple datasets
- Clean and standardize data
- Join datasets to create a single master table

### Python EDA
- Load master table into Pandas
- Perform numerical and categorical analysis
- Generate visualizations: histograms, bar charts, scatter plots, box plots
- Extract actionable insights

### Streamlit Dashboard
- Display KPIs like revenue, order volume, and delivery rates
- Visualize trends interactively
- Share insights dynamically with stakeholders

---

## Technologies Used
- **Python:** Pandas, NumPy, Matplotlib, Seaborn  
- **SQL:** MySQL for data cleaning, joining, and aggregation  
- **Streamlit:** Interactive dashboard  
- **Jupyter Notebook:** For workflow documentation and reproducibility  

---

## Project Structure
## Project Structure

```text
ecommerce-sales-analysis/
├── data/                      # Sample master dataset
│   └── master_orders_sample.csv
├── notebooks/                 # Jupyter notebooks for EDA
│   └── E_Commerce_Analysis.ipynb
├── sql/                       # SQL scripts for data cleaning
│   ├── Schema.sql
│   └── Master_table_joins.sql
├── dashboard/                 # Streamlit app
│   └── app.py
├── Requirements.txt           # Python dependencies
└── README.md                  # Project documentation
```

---

## Dataset
- **Source:** [Kaggle – Brazilian E-Commerce Dataset](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce)  
- **Note:** Full dataset is not included due to size limitations. A sample dataset is provided for reference.  

---

## Learning Outcomes
- Built a complete EDA pipeline from raw data to actionable insights
- Developed practical experience in Python data analysis and SQL joins
- Gained hands-on experience with Streamlit dashboards for visualization
- Learned to integrate multiple datasets into a single master table
