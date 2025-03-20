select customer_id, customer_name, count(order_id) as number_of_orders
from (
	select *
	from ordert natural join customer
) as table_1
group by customer_id, customer_name
order by number_of_orders desc


