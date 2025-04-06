with table_1 as(
  select mid,title, count(*) as total_views
  from movie natural join customer
  group by mid,title
)

select mid,title,total_views
from table_1
where total_views = (
  select max(total_views) from table_1
)
order by title asc
