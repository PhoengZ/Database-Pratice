select p.product_id, p.product_description
from product p, (
	select product_id
	from order_line
	group by product_id
	having count(product_id) = (
		select max(product_count)
		from(
			select count(product_id) as product_count
			from order_line
			group by product_id
		)as table_1
	)
)as table_2 
where table_2.product_id = p.product_id
