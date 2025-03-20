select customer_id,customer_name
from customer natural join (
	select * from ordert
	where order_date between '2020-01-10' and '2020-01-15'
)as table_1
group by customer_id, customer_name

