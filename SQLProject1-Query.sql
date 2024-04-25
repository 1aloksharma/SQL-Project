SELECT * FROM pizza_sales

SELECT SUM(total_price) AS Total_Revenue FROM pizza_sales

SELECT (SUM(total_price) / COUNT(DISTINCT order_id)) AS Avg_order_Value FROM pizza_sales

SELECT SUM(quantity) AS Total_pizza_sold FROM pizza_sales

SELECT COUNT(DISTINCT order_id) AS Total_Orders FROM pizza_sales

SELECT CAST (CAST(SUM(quantity) AS DECIMAl (10,2)) / CAST (COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2)) AS Avg_Pizzas_per_order FROM pizza_sales

SELECT DATENAME(DW, order_date) AS order_day, COUNT(DISTINCT order_id) AS total_orders 
FROM pizza_sales 
GROUP BY DATENAME(DW, order_date)
ORDER BY total_orders DESC

SELECT DATENAME(MONTH, order_date) AS Month_Name, COUNT(DISTINCT order_id) AS Total_orders 
FROM pizza_sales 
GROUP BY DATENAME(MONTH, order_date)
ORDER BY Total_orders DESC

SELECT pizza_category,CAST(sum(total_price) AS DECIMAL (10,2))  AS Total_revenue,CAST(sum(total_price)*100 / (SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS PCT_Sales
from pizza_sales
GROUP BY pizza_category
ORDER BY PCT_Sales DESC

SELECT pizza_category,sum(total_price)*100 / (SELECT SUM(total_price) from pizza_sales WHERE MONTH(order_date)=1) AS PCT_Sales
from pizza_sales
WHERE MONTH(order_date)=1
GROUP BY pizza_category
ORDER BY PCT_Sales DESC

SELECT pizza_size,CAST(sum(total_price) AS DECIMAL (10,2))  AS Total_revenue,CAST(sum(total_price)*100 / (SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS PCT_Sales
from pizza_sales
GROUP BY pizza_size
ORDER BY PCT_Sales DESC

SELECT pizza_size,CAST(sum(total_price) AS DECIMAL (10,2))  AS Total_revenue,CAST(sum(total_price)*100 / (SELECT SUM(total_price) from pizza_sales WHERE DATEPART(QUARTER,order_date)=1) AS DECIMAL(10,2)) AS PCT_Sales
from pizza_sales
WHERE DATEPART(QUARTER,order_date)=1
GROUP BY pizza_size
ORDER BY PCT_Sales DESC

SELECT pizza_category,sum(quantity) AS Total_Quantity_Sold
FROM pizza_sales
GROUP BY pizza_category
ORDER BY Total_Quantity_Sold DESC

SELECT TOP 5 pizza_name,sum(total_price) AS Total_revenue 
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_revenue DESC

SELECT TOP 5 pizza_name,CAST(sum(total_price) AS DECIMAL(10,2)) AS Total_revenue 
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_revenue ASC

SELECT TOP 5 pizza_name,sum(quantity) AS Total_Pizza_Sold 
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold DESC

SELECT TOP 5 pizza_name,sum(quantity) AS Total_Pizza_Sold 
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold ASC

SELECT TOP 5 pizza_name,COUNT(DISTINCT order_id) AS Total_Orders 
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders DESC

SELECT TOP 5 pizza_name,COUNT(DISTINCT order_id) AS Total_Orders 
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders ASC


SELECT DATEPART(HOUR,order_time) AS Order_time ,COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY DATEPART(HOUR,order_time)
ORDER BY Order_time DESC





