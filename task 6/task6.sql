select * from sales;

-- 1. Monthly Revenue and Order Volume
SELECT 
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month,
    SUM(sales) AS total_revenue,
    COUNT(DISTINCT order_id) AS total_orders
FROM sales
GROUP BY year, month
ORDER BY year, month;
-- What it does: Shows total sales and orders for every year/month.

-- 2️. Filtered for 2019 Only
SELECT 
    EXTRACT(MONTH FROM order_date) AS month,
    SUM(sales) AS revenue_2019,
    COUNT(DISTINCT order_id) AS orders_2019
FROM sales
WHERE EXTRACT(YEAR FROM order_date) = 2019
GROUP BY month
ORDER BY month;
-- What it does: Shows monthly performance just for 2019.

-- 3. Highest Revenue Month
SELECT 
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month,
    SUM(sales) AS monthly_revenue
FROM sales
GROUP BY year, month
ORDER BY monthly_revenue DESC
LIMIT 1;
-- What it does: Returns the month with highest revenue overall.

-- Quarter 4 (Q4) Only
SELECT 
    EXTRACT(MONTH FROM order_date) AS month,
    SUM(sales) AS q4_sales,
    COUNT(DISTINCT order_id) AS q4_orders
FROM sales
WHERE EXTRACT(MONTH FROM order_date) IN (10, 11, 12)
GROUP BY month
ORDER BY month;
-- Filters October to December — useful for seasonal/festive trend analysis.
