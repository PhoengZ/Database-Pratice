create or replace function get_customers_with_sum_balance()
returns table(
    customer_name varchar,
    sum_balance double precision
)
language plpgsql
as
$$
begin
    return query
    select d.customer_name, sum(a.balance) as sum_balance
    from account a
    natural join depositor d
    group by d.customer_name
    order by sum_balance desc;
end;
$$
