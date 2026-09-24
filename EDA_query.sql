-- total customer
select count(order_id) total_orders, count(distinct customer_id) total_cust
from orders;

-- order by priority
select order_priority, count(order_id) total
from orders
group by order_priority
order by total desc;

-- total orders by customer
select customer_id, count(order_id) total_orders
from orders
group by customer_id
order by total_orders desc;

-- customer distribution by city & country
select customer_city, customer_country, count(distinct customer_id) total_cust
from orders
group by customer_city, customer_country;

-- total order value & average order value
with total_customer as (
	select count(distinct customer_id) total_cust
	from orders
),
total_order_value as (
	select sum(order_value_usd/100) sum_value
	from orders
)
select a.total_cust, b.sum_value, sum_value/total_cust avg_order_value
from total_customer a
cross join total_order_value b;

-- top city by order value
select customer_city, sum(order_value_usd) order_val
from orders
group by customer_city
order by order_val desc;

-- count of warehouse
select count(distinct warehouse_id) count_wh
from orders;

-- orders by warehouse
select warehouse_id, warehouse_city, count(order_id) total
from orders
group by warehouse_id, warehouse_city
order by total desc;

-- warehouse processing hours
select avg(warehouse_processing_hours) avg_process, min(warehouse_processing_hours) min_process_time, max(warehouse_processing_hours) max_process_times
from orders;

-- average processing hours and delay by warehouse
select warehouse_id, avg(warehouse_processing_hours) process_hours, avg(delivery_delay_days) avg_delay
from orders
group by warehouse_id;

-- average processing hours and delay by package size
select package_size, avg(warehouse_processing_hours) process_hours, avg(delivery_delay_days) avg_delay
from orders
group by package_size;

-- count of delivery delay days
select delivery_delay_days, count(order_id) total
from orders
where delivery_delay_days <> 0
group by delivery_delay_days
order by total desc;

-- count carrier
select count(distinct carrier) total
from orders;

-- count order by carrier
select carrier, count(order_id) total
from orders
group by carrier;

-- late delivery by carrier
select carrier, count(order_id) total
from orders
where late_delivery="Yes"
group by carrier
order by total desc;