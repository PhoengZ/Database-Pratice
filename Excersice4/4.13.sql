select sum(standard_price * ordered_quantity) as total_payment
from (
	select standard_price, product_id, order_id, ordered_quantity
	from product natural join order_line
)as table_1
where order_id = '3'