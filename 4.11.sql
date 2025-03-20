select customer_id, customer_name
from customer
where customer_id not in (
	select distinct customer_id
	from ordert
)