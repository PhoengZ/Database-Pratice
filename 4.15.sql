delete from order_line 
where order_id in (
	select order_id
	from  ordert
	where customer_id = '10001'
);

delete from ordert
where customer_id = '10001';

delete from customer
where customer_id = '10001';

select * from customer;
select * from ordert;
select * from order_line;

