
-- TOTAL REVENUE -> The sum of the total price of all pizza orders

SELECT SUM(total_price) AS Total_Revenue FROM TBL_PIZZA_SALES_DATA;

/*
AVERAGE ORDER VALUE -> The average amount spent per order, 
calculating by dividing the total revenue by the total number of orders.
*/

SELECT (SUM(total_price)/COUNT(DISTINCT order_id)) AS Average_Order_Value 
FROM TBL_PIZZA_SALES_DATA;

-- TOTAL PIZZA SOLD -> The sum of the quantities of all pizza sold

SELECT SUM(quantity) AS Total_Pizza_Sold FROM TBL_PIZZA_SALES_DATA;

-- TOTAL ORDERS -> The total number of orders placed

SELECT COUNT(DISTINCT order_id) AS Total_Orders FROM TBL_PIZZA_SALES_DATA;

/*
Average Pizzas Per Order -> The average number of pizzas sold per order,
calculating by dividing the total number of pizzas sold by the 
total number of orders.
*/

SELECT (SUM(quantity)/COUNT(DISTINCT order_id)) AS Average_pizzas_per_order 
FROM TBL_PIZZA_SALES_DATA;

------------------------------------------------------------------------

-- Daily Trends For Total Orders 

SELECT TRIM(TO_CHAR(order_date,'Day')) AS Day_Name,
COUNT(DISTINCT order_id) AS Total_Orders
FROM TBL_PIZZA_SALES_DATA
GROUP BY Day_Name,EXTRACT(DOW FROM order_date)
ORDER BY EXTRACT(DOW FROM order_date);

-- Monthly Trend For Orders

SELECT TRIM(TO_CHAR(order_date,'Month')) AS Month_Name,
COUNT(DISTINCT order_id) AS Total_Orders
FROM TBL_PIZZA_SALES_DATA
GROUP BY Month_Name,EXTRACT(MONTH FROM order_date)
ORDER BY EXTRACT(MONTH FROM order_date);

-- Percentage of Sales by Pizza Category and its total revenue

SELECT pizza_category,ROUND(SUM(total_price)::numeric,2) AS Total_Revenue,
ROUND(((SUM(total_price)*100)/(SELECT SUM(total_price) FROM TBL_PIZZA_SALES_DATA))::numeric,2) || '%' AS Total_Sales
FROM TBL_PIZZA_SALES_DATA
GROUP BY pizza_category;

-- Percentage of Sales by Pizza Size

SELECT pizza_size,ROUND(SUM(total_price)::numeric,2) AS Total_Revenue,
ROUND(((SUM(total_price)*100)/(SELECT SUM(total_price) FROM TBL_PIZZA_SALES_DATA))::numeric,2) || '%' AS Total_Sales
FROM TBL_PIZZA_SALES_DATA
GROUP BY pizza_size;

-- Total Pizzas Sold by Pizza Category

SELECT pizza_category,SUM(quantity) AS Pizza_Sold
FROM TBL_PIZZA_SALES_DATA
GROUP BY pizza_category
ORDER BY Pizza_Sold DESC;

-- Top 5 Pizzas By Sales 

SELECT pizza_name,SUM(total_price) AS Total_Sales
FROM TBL_PIZZA_SALES_DATA
GROUP BY pizza_name
ORDER BY Total_Sales DESC
LIMIT 5;

-- Bottom 5 Pizzas By Sales

SELECT pizza_name,SUM(total_price) AS Total_Sales
FROM TBL_PIZZA_SALES_DATA
GROUP BY pizza_name
ORDER BY Total_Sales
LIMIT 5;

-- Top 5 Pizzas by Quantity

SELECT pizza_name,SUM(quantity) AS Pizza_Sold 
FROM TBL_PIZZA_SALES_DATA
GROUP BY pizza_name
ORDER BY Pizza_Sold DESC
LIMIT 5;

-- Bottom 5 Pizzas by Quantity

SELECT pizza_name,SUM(quantity) AS Pizza_Sold 
FROM TBL_PIZZA_SALES_DATA
GROUP BY pizza_name
ORDER BY Pizza_Sold 
LIMIT 5;

-- Top 5 Pizzas by Total Orders

SELECT pizza_name,COUNT(DISTINCT order_id) AS Total_Orders 
FROM TBL_PIZZA_SALES_DATA
GROUP BY pizza_name
ORDER BY Total_Orders DESC
LIMIT 5;

-- Bottom 5 Pizzas by Total Orders

SELECT pizza_name,COUNT(DISTINCT order_id) AS Total_Orders 
FROM TBL_PIZZA_SALES_DATA
GROUP BY pizza_name
ORDER BY Total_Orders 
LIMIT 5;

