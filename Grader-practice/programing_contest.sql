with table_1 as (
  select aid,tid, count(*) as total from task natural join submit
  where score = 100
  group by aid,tid
)
select aname,tname from author natural join task
where aid in (
  select aid from table_1
  where total = (
    select max(total) from table_1
  )
)
order by aid;