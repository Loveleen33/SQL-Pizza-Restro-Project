/*## DATA BASE ##*/
CREATE DATABASE PIZZA_RESTO;
SHOW DATABASES;
use pizza_resto;
/*## TABLES ##*/
show tables;
/*## EXISTING  CUSTOMERS COLUMN DATA TYPE CHANGE ##*/
desc pizza_cx;
alter table pizza_cx modify customer_id varchar(100)not null;
alter table pizza_cx modify column Customer_Name varchar(100)not null;
alter table pizza_cx modify column Phone_Number VARCHAR(15)not null;
/*## EXISTING  CATEGORY COLUMN DATA TYPE CHANGE ##*/
desc pizza_cet;
alter table pizza_cet modify pizza_id varchar(100)not null;
alter table pizza_cet modify pizza_name varchar(100)not null;
alter table pizza_cet modify category varchar(100)not null;
alter table pizza_cet modify quantity int not null;
alter table pizza_cet modify customer_id varchar(100)not null;
/*## EXISTING  ORDERS COLUMN DATA TYPE CHANGE ##*/
desc pizza_ord;
alter table pizza_ord modify Order_ID varchar(100)not null;
alter table pizza_ord modify Order_amount varchar(100)not null;
alter table pizza_ord modify order_date date not null;
alter table pizza_ord modify customer_ID varchar(100)not null;
/*##TO DISPLAY ALL INDEXES DEFINED ON A TABLE ##*/
show index from pizza_cx;
show index from pizza_ord;
show index from pizza_cet;
/*## ADD PRIMARY KEY IN EACH TABLE  ##*/
alter table pizza_cx add primary key (customer_id);
alter table pizza_ord add primary key (order_id);
alter table pizza_cet add primary key (pizza_id);
/*## VIEW ALL DATA FROM TABLES */
Select*from pizza_cet;
select*from pizza_cx;
select* from pizza_ord;
/*## SALES & CUSTOMER ANALYSIS ##*/
/*## Query 1: Total Customers ##*/
select count(*)  as total_customers from pizza_cx;
/*## Query 2:Total Orders ##*/
select count(*)  as total_orders from pizza_ord;
/*## Query 3:Total Revenue ##*/
select sum(order_amount) as  total_revenue from pizza_ord;
/*## Query 4:Total Pizzas Sold ##*/
select sum(quantity ) as total_quantity from pizza_cet;
/*## Query 5:Average  Revenue ##*/
select avg(order_amount) as  average_revenu from pizza_ord;
/*## PRODUCT INSIGHTS  ##*/
/*## Query 1: Top 5 Best-Selling Pizzas ##*/
select pizza_name ,sum(quantity) as total_sold from pizza_cet group by pizza_name order by total_sold desc limit 5;
/*## Query 2: Most Ordered Category ##*/
select category, sum(quantity) as total_quantity from pizza_cet group by category order by total_quantity desc limit 1 ;
/*## Query 3:Least Selling Pizzas##*/
select pizza_name, sum(quantity) as total_quantity from pizza_cet group by pizza_name order by total_quantity asc limit 1 ;
/*##Query 4:Revenue by Pizzas ##*/
Select  pizza_cet.pizza_name, SUM(pizza_ord.order_amount) as total_revenue from pizza_cet
inner join pizza_ord on pizza_cet.customer_id = pizza_ord.customer_id group by  pizza_cet.pizza_name order by  total_revenue Desc;
/*## Query 5:Revenue by Category ##*/
Select  pizza_cet.category, SUM(pizza_ord.order_amount) as total_revenue from pizza_cet
inner join pizza_ord on pizza_cet.customer_id = pizza_ord.customer_id group by  pizza_cet.category order by  total_revenue Desc;
/*## CUSTOMER BEHAVIOUR ##*/
/*## Query 1:Highest Spending Customers ##*/
Select  pizza_cx.customer_name, SUM(pizza_ord.order_amount) as total_revenue from pizza_cx
inner join pizza_ord on pizza_cx.customer_id = pizza_ord.customer_id group by  pizza_cx.customer_name order by  total_revenue Desc limit 1;
/*## Query 2:Lowest Spending Customers ##*/
Select  pizza_cx.customer_name, SUM(pizza_ord.order_amount) as total_revenue from pizza_cx
inner join pizza_ord on pizza_cx.customer_id = pizza_ord.customer_id group by  pizza_cx.customer_name order by  total_revenue asc limit 1;
/*##  Repeat Customers (More than 1 order) ##*/
select order_id, count(order_id) as order_count from pizza_ord group by order_id having(order_id) > 1;




