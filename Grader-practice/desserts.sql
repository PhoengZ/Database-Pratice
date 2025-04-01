select c.name, sum(d.price * o.amount) as total
from customers c join orders o on c.id = o.c_id join desserts d on d.id = o.d_id
group by c.name,c.id
order by total desc , c.id asc
limit 1