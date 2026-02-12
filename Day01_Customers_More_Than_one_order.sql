## DAY01-> WAQ to find customers who ordered more than once
select c_id count(order_id)AS total_orders
from orders 
group by c_id
having count(order_id)>1;
