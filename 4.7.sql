select product_id, product_description
from product
where product_id in (
	select product_id
	from (
		select product_id,count(product_id) as number_of_orders
		from order_line
		group by product_id
	)as table_2
	where number_of_orders = (
		select max(number_of_orders)
		from(
			select product_id, count(product_id) as number_of_orders
			from order_line
			group by product_id
		)as table_1
	)
)






