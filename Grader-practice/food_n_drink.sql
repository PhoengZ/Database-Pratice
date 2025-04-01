select name,unit_price 
from  product
where (category_name = 'food' or category_name = 'drink') and unit_price > 2000
order by unit_price desc
