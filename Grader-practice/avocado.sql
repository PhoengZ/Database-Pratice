select id, customer,order_date,delivery_date,(delivery_date - order_date)as days_late
from purchase_orders
where (delivery_date - order_date) > 5