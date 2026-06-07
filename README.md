# 📊 Customer Churn Analysis

A complete end-to-end **Customer Churn Prediction and Business Insights Project** using Python, SQL, and Power BI.

---

## 🚨 Problem Statement

Customer churn is one of the most critical challenges in the telecom industry. Losing customers is significantly more expensive than acquiring new ones — often **5 to 7 times costlier**.

This project analyzes a telecom dataset of ~7,000 customers with 21 features to understand:
- Why customers churn
- Which segments are high-risk
- How churn can be reduced using data-driven insights

---

## 🧠 Tech Stack

- Python 🐍 (Pandas, NumPy, Scikit-learn)
- SQL 🗄️ (Business insights extraction)
- Power BI 📊 (Interactive dashboard) — :contentReference[oaicite:0]{index=0}
- Excel 📑

---

## 📂 Project Workflow

### 1️⃣ Exploratory Data Analysis (EDA)
- Used `df.info()` and `df.describe()` to understand dataset structure
- Identified **data quality issues** (TotalCharges stored as object)
- Detected **class imbalance (26% churn rate)**

---

### 2️⃣ Data Cleaning & Preprocessing
- Converted `TotalCharges` to numeric
- Handled missing values using median imputation
- Encoded categorical variables (Label + One-Hot Encoding)
- Applied **StandardScaler** for feature scaling

---

### 3️⃣ SQL-Based Business Insights
Used SQL queries to analyze:
- Churn rate by contract type
- Payment method impact
- Tenure-based customer segmentation

👉 These insights helped form hypotheses before modeling.

---

### 📈 Results:
- Accuracy: ~80%
- F1 Score: 0.76

---

## 🔍 Key Business Insight

- Month-to-month customers have a churn rate of **~43%**
- One-year contracts: **~11%**
- Two-year contracts: **~3%**

👉 This shows a **3x higher risk** in short-term contracts.

High monthly charges + short contracts = 🚨 highest churn risk segment

---

## 📊 Power BI Dashboard

Built an interactive dashboard in :contentReference[oaicite:1]{index=1} including:

- Churn breakdown by contract type
- Tenure vs Monthly Charges analysis
- KPI cards (Overall churn rate, risk segments)

---
