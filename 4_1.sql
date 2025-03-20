select postal_code, count(*) as customer_numbers
from customer
group by postal_code
order by customer_numbers
