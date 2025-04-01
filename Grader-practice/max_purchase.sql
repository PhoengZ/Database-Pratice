select first_name 
from (
    select sum(i.total_spent) as spent,count(i.id) as number,c.first_name,c.cus_id
    from customer c natural join invoice i
    group by c.cus_id,c.first_name
    order by spent desc, number asc ,cus_id asc
  ) as table_1
where number > 0
limit 1;