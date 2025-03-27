select customer_id, customer_name
from (
	select customer_id, customer_name, count(order_id) as number_of_orders
	from ordert natural join customer
	group by customer_id, customer_name
) as table_1
where number_of_orders = (
	select max(number_of_orders) as number_of_orders
	from (
		select customer_id, count(order_id) as number_of_orders
		from ordert natural join customer
		group by customer_id
	)as table_1
)


