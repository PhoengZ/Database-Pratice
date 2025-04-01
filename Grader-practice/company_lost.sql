select extract (year from order_date) as order_year ,round(sum(unit_price * quantity * discount)::numeric,2) as discount_amount
from products natural join order_details natural join orders 
group by order_year
order by order_year desc;