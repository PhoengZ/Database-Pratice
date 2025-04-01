select u.name,sum(p.price*o.quantity) as total_price
from users u join orders o on u.id = o.user_id join products p on p.id = o.product_id
group by u.name, u.id
order by total_price desc, u.id asc
limit 1;