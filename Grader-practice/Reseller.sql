select pname,pprice, sum(quantity_sold) as total_sales
from product natural join product_sales
where sale_date between '01-01-2022 00:00:00' and '01-01-2025 00:00:00'
group by pname,pprice,pid
having sum(quantity_sold) <= 100
order by total_sales desc, pprice asc ,pname asc
limit 3