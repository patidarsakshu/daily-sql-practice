-- Day 01
-- Problem: Find customers who placed more than one order.

-- Input Table: customers

-- +-------------+---------------+
-- | customer_id | customer_name |
-- +-------------+---------------+
-- | 101         | Asha          |
-- | 102         | Ravi          |
-- | 103         | Neha          |
-- +-------------+---------------+

-- Input Table: orders

-- +----------+-------------+------------+
-- | order_id | customer_id | order_date |
-- +----------+-------------+------------+
-- | 1        | 101         | 2024-01-01 |
-- | 2        | 102         | 2024-01-02 |
-- | 3        | 101         | 2024-01-03 |
-- | 4        | 103         | 2024-01-04 |
-- | 5        | 102         | 2024-01-05 |
-- +----------+-------------+------------+


-- Expected Output
-- +-------------+---------------+--------------+
-- | customer_id | customer_name | total_orders |
-- +-------------+---------------+--------------+
-- | 101         | Asha          | 2            |
-- | 102         | Ravi          | 2            |
-- +-------------+---------------+--------------+

  
select customer_id,count(order_id) AS total_orders
from orders 
group by customer_id
having count(order_id)>1;

Output:
-- +-------------+---------------+
-- | customer_id | total_orders  |
-- +-------------+---------------+
-- | 101         |    2          |
-- | 102         |    2          |
-- +-------------+---------------+

------------------OR----------------
SELECT 
    c.customer_id, 
    c.customer_name, 
    COUNT(o.order_id) AS total_orders
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
HAVING COUNT(o.order_id) > 1;
