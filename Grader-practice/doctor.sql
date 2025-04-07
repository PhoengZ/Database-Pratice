select d.dname as Mor_name from Doctor d
where not exists (
  select w.d_id from Work_For w
  where w.d_id = d.d_id
) and d.dname like 'C%'
order by d.dage desc, d.d_id asc