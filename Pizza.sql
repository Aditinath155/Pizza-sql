--Business Problem
--We need to analyse  key indicator for our pizza sales data to gain insights into our business performance. 

select * from pizza_sales$;

--Total revenue
select sum(total_price) as total_revenue from 
pizza_sales$;

--Average order value
select sum(total_price)/count(distinct order_id) as Average_order_value
from pizza_sales$;

--Total pizza sold
select sum(quantity) as Total_pizza_sold
from pizza_sales$;

--Total number order placed
select count(distinct order_id) Total_number_order
from pizza_sales$;

--Average pizza per order
select cast (sum(quantity) as int) / count(distinct order_id) as Average_pizza_per_order
from pizza_sales$;

--Daily trend  for total order 
select Datename(DW, order_date) as order_day ,
count(distinct order_id) as total_order
from pizza_sales$
group by Datename(DW, order_date);

--Hourly trend
select Datepart(Hour, order_time) as order_hour,
count(distinct order_id) as total_order
from pizza_sales$
group by Datepart(Hour, order_time)
order by total_order DESC;

--Percentage of sales pizza category
select pizza_category,sum(total_price) * 100 / (select sum(total_price) from pizza_sales$) as totalSales
from pizza_sales$
group by pizza_category;


select pizza_category,sum(total_price) * 100 / (select sum(total_price) from pizza_sales$ WHERE MONTH(order_date) = 1) as totalSalesPercent
from pizza_sales$
WHERE MONTH(order_date) = 1
group by pizza_category;

--Percentage of sales pizza size
select pizza_size,sum(total_price) * 100 / (select sum(total_price) from pizza_sales$) as totalSalesPercent
from pizza_sales$
group by pizza_size;


select pizza_category , sum(quantity) as Total_pizza_sold
from pizza_sales$
group by pizza_category;

--top 5 pizza sold
select top 5 pizza_name, sum(quantity) as Total_pizza_sold
from pizza_sales$
group by pizza_name
order by sum(quantity) desc;

--bottom 5
select top 5 pizza_name, sum(quantity) as Total_pizza_sold
from pizza_sales$
group by pizza_name
order by sum(quantity) asc
;

