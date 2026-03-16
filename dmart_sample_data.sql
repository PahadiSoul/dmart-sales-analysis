Create database dmart;
Use dmart;
/*Import CSV File
Create table with the name - dmart_sample_data */

Select *
from dmart_sample_data;

/* Convert Date */ 
SELECT STR_TO_DATE(Date,'%d-%m-%Y %H:%i') 
FROM dmart_sample_data;

/* Check Missing Values*/
SELECT *
FROM dmart_sample_data
WHERE ProductCategory IS NULL;

/*Remove Duplicates*/
SELECT FullName, COUNT(*)
FROM dmart_sample_data
GROUP BY FullName
HAVING COUNT(*) > 1;

/*Total Revenue*/
SELECT SUM(Total) AS Total_Revenue
FROM dmart_sample_data;

/*Top Selling Product Categories*/
SELECT ProductCategory,
SUM(Total) AS Revenue
FROM dmart_sample_data
GROUP BY ProductCategory
ORDER BY Revenue DESC;

/*Highest Quantity Sold*/
SELECT ProductCategory,
SUM(Quantity) AS Total_Quantity
FROM dmart_sample_data
GROUP BY ProductCategory
ORDER BY Total_Quantity DESC;

/*Revenue by Customer Type*/
SELECT CustomerType,
SUM(Total) AS Revenue
FROM dmart_sample_data
GROUP BY CustomerType;

/*Monthly Sales Trend*/
SELECT MONTH(Date) AS Month,
SUM(Total) AS Monthly_Revenue
FROM dmart_sample_data
GROUP BY Month
ORDER BY Month;

/*Average Order Value*/
SELECT AVG(Total) AS Avg_Order_Value
FROM dmart_sample_data;

/*Top Customers by Spending*/
SELECT FullName,
SUM(Total) AS Total_Spent
FROM dmart_sample_data
GROUP BY FullName
ORDER BY Total_Spent DESC
LIMIT 10;

/*Highest Revenue Transaction*/
SELECT *
FROM dmart_sample_data
ORDER BY Total DESC
LIMIT 1;