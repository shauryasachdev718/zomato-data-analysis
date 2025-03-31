use zomatodb;
-- 1st solution--
select customer_id, count(order_id) as total_orders
from order_detail
group by customer_id
order by total_orders desc
limit 3;

-- 2nd solution --
select restaurant_id, avg(rrating) as AVERAGE_rating
from restaurant
group by restaurant_id
order by AVERAGE_rating desc
limit 1;

-- 3rd solution --
select order_id 
from order_detail
where timestampdiff(minute, order_time, delivered_time)<30;


-- 4th solution --

select f.food_id, f.food_name, sum(ofd.quantity * f.price_per_unit) as total_revenue
from order_food ofd
join foods f on f.food_id = ofd.food_id
group by f.food_id, f.food_name
order by total_revenue desc;

-- 5th solution --
select od.restaurant_id, sum(ofd.quantity * f.price_per_unit) as total_revenue
from order_food ofd
join foods f on f.food_id=ofd.food_id
join order_detail od on od.restaurant_id=ofd.restaurant_id
group by od.restaurant_id
order by total_revenue desc
limit 1 offset 1;

-- 6th solution --
select f.food_name,f.food_id, sum(ofd.quantity) as popular_food
from order_food ofd
join foods f on f.food_id = ofd.food_id
group by f.food_id,f.food_name
order by popular_food desc
limit 5;

-- 7th solution --
select employee_id, employee_name, employee_avg_rating
from zomato_employee
group by employee_id
order by employee_avg_rating desc
limit 3; 

-- 8th solution--
select month(order_time) as month, count(order_id) as total_orders
from order_detail
group by month
order by total_orders desc
limit 1;

-- 9th solution--
select od.customer_id, avg(ofd.quantity * price_per_unit) as average_order_quantity
from order_food ofd
join foods f on f.food_id = ofd.food_id
join order_detail od on od.order_id = ofd.order_id
group by od.customer_id
order by average_order_quantity desc;

-- 10 solution --
#not able to do

-- 11th solution -- 
select count(order_id) as total_orders_weekends
from order_detail
where dayofweek(order_time) in (1,7);

-- 12th solution--
select order_status, avg(delivered_time) as average_dlvr_time
from order_detail
group by order_status
order by average_dlvr_time;

select 
case
    when dayofweek(order_time) in (1,7) then 'weekend'
    else 'weekdays'
    end as day_type,
    avg(timestampdiff(minute, order_time, delivered_time)) as average_delievered_time
from order_detail
group by day_type;

-- 13th solution --
select food_id, food_name, price_per_unit
from foods
group by food_id, food_name
order by price_per_unit desc
limit 5;

-- 14th solution--
select od.restaurant_id, count(distinct ofd.food_id) as menu_items
from order_food ofd
join order_detail od on ofd.order_id = od.order_id
group by od.restaurant_id 
order by menu_items desc
limit 1;

-- 15th solution--
select payment_type, count(transaction_id) as total_transactions
from payment_table
group by payment_type;