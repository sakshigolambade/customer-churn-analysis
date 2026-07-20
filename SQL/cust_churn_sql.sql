--  Phase 2: MySQL — Load, Clean & Create Views -------------
-- Step 1 — Create the Database & Staging Table -----
CREATE DATABASE db_Churn;
USE db_Churn;

-- Step 2 — Create the Production Table ---------------------
CREATE TABLE prod_Churn AS
SELECT * FROM stg_Churn;

-- To Verify prod_Churn was created correctly:
SELECT COUNT(*) FROM prod_Churn; -- should show 6418
SELECT * FROM prod_Churn LIMIT 5; -- preview first 5 rows

-- Step 3 — Explore with SQL Queries ------------------------

-- 1. Overall churn rate 
SELECT Customer_Status, COUNT(*) AS Total,
		ROUND(COUNT(*)*100.0 / SUM(COUNT(*)) OVER(), 2) AS Percentage
FROM prod_Churn
GROUP BY Customer_Status;

-- 2. Churn by Contract Type
SELECT Contract, Customer_Status, COUNT(*) AS Count
FROM prod_Churn
GROUP BY Contract, Customer_Status;

-- 3. Churn by Internet Type
SELECT Internet_Type, COUNT(*) AS Churned
FROM prod_Churn
WHERE Customer_Status = 'Churned'
GROUP BY Internet_Type;

-- 4. Top Churn Reasons
SELECT Churn_Reason, COUNT(*) AS Count
FROM prod_Churn
WHERE Customer_Status = 'Churned'
GROUP BY Churn_Reason
ORDER BY Count DESC LIMIT 10;

-- 5. Avg tenure of churned vs stayed
SELECT Customer_Status, ROUND(AVG(Tenure_in_Months), 1) AS Avg_Tenure
FROM prod_Churn GROUP BY Customer_Status;
