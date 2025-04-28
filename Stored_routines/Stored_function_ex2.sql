create or replace function get_all_customers_w_their_level()
	returns table(
		customer_name varchar,
		sum_balances double precision,
		customer_level text
	)
	language plpgsql
	as
$$
begin
	return query
	select d.customer_name, sum(a.balance) as sum_balances ,
	case
		when sum(a.balance) >= 180 then 'GOLD'
		when sum(a.balance) >= 100 then 'SILVER'
		when sum(a.balance) >= 50 then 'BRONZE'
		else '-'
	end as customer_level
	from depositor d natural join account a
	group by d.customer_name
	order by sum_balances desc;
end;
$$