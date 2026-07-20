# 📊 Customer Churn Analysis Dashboard

An end-to-end customer churn analysis project for a telecom business — covering data cleaning in Python, exploratory analysis in SQL, and an interactive Power BI dashboard with a rule-based churn risk scoring system.

![Summary Page](dashboards/dashboard%201.png)

---
## 🚨 Business Problem
Telecom companies lose significant revenue every year to customer churn. This project analyzes a dataset of **6,418 customers** to answer three core business questions:

1. **What does churn look like today?** — Who is churning, from where, and why?
2. **What factors drive churn?** — Contract type, tenure, internet service, demographics.
3. **Who is likely to churn next?** — Score active customers by churn risk so retention teams can act before they leave, not after.
---
## 🧰 Tech Stack
| Stage | Tools |
|---|---|
| Data Cleaning & Preparation | 🐍Python (Pandas, NumPy) |
| Database & Querying | 🗄️MySQL |
| Visualization & Risk Scoring | 📊Power BI (DAX) |
---
## 🔄 Project Workflow
### 1️⃣ Data Cleaning & Preparation (Python)
- Loaded raw dataset (6,418 rows × 32 columns) and inspected structure, nulls, and data types
- Handled missing values contextually rather than dropping rows:
  - `Value_Deal` → filled with `"No Deal"`
  - `Multiple_Lines` → filled with `"No Phone Service"`
  - Internet-dependent fields (`Internet_Type`, `Online_Security`, `Streaming_TV`, etc.) → filled with `"No Internet Service"`
  - `Churn_Category` / `Churn_Reason` → filled with `"Not Applicable"` for non-churned customers
- Corrected data type issues (e.g., normalized `Monthly_Charge` to absolute values)
- Exported two clean datasets: one full cleaned set for MySQL loading, and one filtered to active/churned customers (excluding new joins) for the Power BI prediction model
- 📓 Notebook: [`python/CustomerChurn.ipynb`](Python_EDA/CustomerChurn.ipynb)

### 2️⃣ Database & Querying (SQL)
- Loaded cleaned data into a MySQL staging table, then built a production table (`prod_Churn`)
- Wrote analytical queries covering:
  - Overall churn rate and customer status distribution
  - Churn breakdown by contract type and internet type
  - Top churn reasons ranked by frequency
  - Average tenure comparison between churned and retained customers
- Used window functions (`SUM() OVER()`) for percentage-of-total calculations
- 🗄️ Script: [`sql/cust_churn_sql.sql`](SQl/cust_churn_sql.sql)

### 3️⃣ Visualization & Risk Scoring (Power BI)
Built a 3-page interactive dashboard on a unified dark navy theme:

**Page 1 — Summary**
High-level KPIs (Total Customers, Churn Rate, Revenue Lost, New Joiners), churn breakdown by state, contract type, internet type, and payment method, with interactive slicers for contract, internet type, and gender.

**Page 2 — Churn Analysis**
Deeper diagnostic view: top churn reasons, churned vs. stayed trends by tenure, a churn-rate heatmap by age group and gender, and a customer status funnel.

**Page 3 — Predictions**
A DAX-driven risk scoring system that classifies active customers into Low / Medium / High churn risk based on key behavioral and account attributes, surfaced through:
- Risk distribution and predicted outcome visuals
- A sortable High-Risk Customer table with conditional formatting
- Risk breakdown by contract type
- An interactive risk-level filter and a summarized business recommendation
---
## 📈 Key Insights
- **27% overall churn rate** across 6,418 customers, representing ₹3.41M in lost revenue
- **Month-to-Month contracts account for the vast majority of churn** (1,529 of 1,732 total churned customers) — customers on longer contracts churn far less
- **Fiber Optic internet users churn at the highest rate** among internet types (1,136 churned)
- Churn is **highest among customers aged 60+** and **under 30**, with the 60+ segment showing a 36% churn rate in both genders
- **62 currently active customers are flagged High Risk**, concentrated in Month-to-Month contracts — the priority segment for retention outreach
---
## 🖼️ Dashboard Preview
| Summary | Churn Analysis | Predictions |
|---|---|---|
| ![Summary Page](dashboards/dashboard%201.png) | ![Churn Analysis](dashboards/dashboard%202.png) | ![Predictions](dashboards/dashboard%203.png) |

---

## 📌 Author
**Sakshi Golambade**
Data Analyst | Python · SQL · Power BI
