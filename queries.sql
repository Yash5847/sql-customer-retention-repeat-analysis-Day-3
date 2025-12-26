-- Repeat customers (more than one order)
SELECT
    customer_id,
    COUNT(order_id) AS total_orders
FROM orders
GROUP BY customer_id
HAVING COUNT(order_id) > 1;

-- One-time vs repeat customers
SELECT
    customer_type,
    COUNT(*) AS total_customers
FROM (
    SELECT
        customer_id,
        CASE
            WHEN COUNT(order_id) > 1 THEN 'Repeat Customer'
            ELSE 'One-time Customer'
        END AS customer_type
    FROM orders
    GROUP BY customer_id
) t
GROUP BY customer_type;

-- Customers with highest purchase frequency
SELECT
    customer_id,
    COUNT(order_id) AS total_orders
FROM orders
GROUP BY customer_id
ORDER BY total_orders DESC;
