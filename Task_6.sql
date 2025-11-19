create database supermarketDB;
use supermarketDB;
show databases;
create table Product(
p_id int primary key,
p_name varchar(50),
price int
);
desc Product;


INSERT INTO Product(p_id,p_name,price) VALUES
(1,"Tea",20),
(2,"Coffee",30),
(3,"Biscuit",80),
(4,"Juice",140),
(5,"Cake",300);
desc Product;
SELECT * FROM Product;

UPDATE Product
SET price = 300
WHERE p_id = 5;

create table orders(
order_id int primary key,
p_id int,
amount int
);
desc orders;

INSERT INTO orders(order_id,p_id,amount)VALUES
(11,1,25),
(12,2,10),
(13,3,70),
(14,4,100),
(15,5,50);
SELECT * FROM orders;
-- 2. Select products with price higher than the cheapest order. 
SELECT * FROM Product 
WHERE price > (SELECT MIN(amount) FROM orders);

create table Customers(
c_id int primary key,
c_name varchar(100)
);
desc Customers;

alter table orders add c_id int;
desc orders;

SELECT * FROM Customers
WHERE c_id IN(SELECT c_id from orders);

SELECT 
c.c_id,
c.c_name,
(SELECT COUNT(*)
FROM orders o
WHERE o.c_id = c.c_id) AS total_orders
FROM Customers c;

SELECT * FROM Product p
WHERE EXISTS(
SELECT 1
FROM orders o 
WHERE o.p_id = p.p_id
);


