select customer_id,customer_name, count(order_id) as number_of_orders
from ordert natural join customer
group by customer_id,customer_name
order by number_of_orders desc
limit 3
