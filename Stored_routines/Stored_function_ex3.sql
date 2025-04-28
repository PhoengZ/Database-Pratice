create or replace function get_branches_assets_greater_than(
	con numeric
)
	returns table(
		branch_name varchar,
		branch_city varchar,
		assets numeric
	)
	language plpgsql
	as
$$
begin
	return query
	select b.branch_name, b.branch_city, round(b.assets::numeric,2) from
	branch b
	where b.assets > con;
end;
$$