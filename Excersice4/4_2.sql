select postal_code, count(*) as customer_numbers
from customer
group by postal_code
having count(*) > 1
order by customer_numbers
