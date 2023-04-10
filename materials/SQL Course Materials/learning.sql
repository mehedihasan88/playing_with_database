-- arithmetic operations and functions can be applied on columns both in select and where sections of query?
-- select , from , where , order by , limit
-- 
-- 
-- 
-- 



use sql_store;  -- select database to work with

-- select
select * from customers; 
select * from customers where customer_id > 8 order by birth_date desc; -- by default ascending
select first_name, last_name, points, points+10 from customers; -- can support arithmetic operators on columns selected.. lists in order : () > */% > +- 
select first_name, points, points % 100 as 'discount factor' from customers where customer_id > 5; -- as keyword to rename columns(called alias)
select state, first_name from customers;
select name , unit_price , unit_price * 1.1 as new_price from products;
select * from orders where order_date > '2018-12-31';

-- distinct 
select distinct state from customer; -- distinct keywords on single comlumn
select distinct state, city from customers; -- distinct keywords on multiple columns works as combination of all columns

-- logical operators : not and or
select * from customers where customer_id > 5 and points > 1000; -- logical operators on where clause ..in order :  not > and > or 

-- in
select * from customers where state = 'VA' or state = 'CO' or state = 'CA'; -- (1)
select * from customers where state in ('VA','CO','CA'); -- (2)
select * from customers where state not in ('VA','CO','CA'); -- (3)  -- (1,2) are same (3) is reverse of (1,2)
select * from products where quantity_in_stock in (49,38,72);

-- between
select * from customers where points >= 1000 and points <= 3000 order by points desc;
select * from customers where points between 1000 and 3000 order by points; -- above two lines describes between and it's equivalent and conditions
select * from customers where birth_date between '1990-1-1' and '2000-1-1' order by birth_date;

-- like : used to pattern such where % means any number of character _ means a single character
select * from customers where first_name like 'a%';
select * from customers where last_name like 'Roseb___h'; 
select * from customers where address like '%avenue' or address like "%trail";-- '%avenue%';
select * from customers where phone like '%9';

-- REGEXP : ^$|[abc][a-c]
select * from customers where last_name regexp 'ey$'; -- strings ends with sign $
select * from customers where first_name regexp '^f'; -- string start with sign ^
select * from customers where last_name regexp 'ey$' or first_name regexp '^f';
select * from customers where concat(first_name,last_name) regexp 'ey$|^f'; -- logical or operators |
select * from customers where last_name regexp '[abcdefg]y'; -- means : ay,by,cy,dy,.. gy ,also written as : '[a-g]y' same
select concat(first_name ," ", last_name) as name from customers where concat(first_name , " " , last_name) regexp "mm|y$|^i";
select * from customers where first_name regexp 'elka|ambur';
select * from customers where last_name regexp 'ey$|on$';
select * from customers where last_name regexp '^my|se';
select * from customers where last_name regexp 'b[ru]';

-- null 
select * from customers where phone is null;
select * from customers where phone is not null;
select * from orders where shipped_date is null;

-- order by 
select *, quantity*unit_price as total_price from order_items where order_id = 2 order by quantity*unit_price desc;
select * from customers order by state desc, points desc;

-- limit 
select * from customers limit 5;
select * from customers limit 6,2;
select * from customers order by points desc limit 3;

-- joins : inner join , left join , right join , cross join
select concat(customers.first_name," ",customers.last_name) , orders.order_id from customers,orders where customers.customer_id = orders.customer_id;
select concat(c.first_name," ",c.last_name) as name, o.order_id from customers c inner join orders o on c.customer_id = o.customer_id; 
-- queries above return same result


-- https://www.youtube.com/watch?v=7S_tz1z_5bA&t=5102s (not finished watching)
