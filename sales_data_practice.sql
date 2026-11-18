CREATE DATABASE retail_analytics;
USE retail_analytics;
SHOW DATABASES;
SELECT DATABASE();
CREATE TABLE customers(
customer_id INT auto_increment PRIMARY KEY,
first_name varchar(50) not null,
last_name varchar(50) not null,
email varchar(50) unique,
city varchar(50),
country varchar(50),
signup_date DATE);
select * from customers;

CREATE TABLE products(
product_id INT AUTO_INCREMENT PRIMARY KEY,
product_name varchar (100) not null,
category varchar(50),
unit_price decimal (10,2) not null);
select * from products;

CREATE TABLE orders(
order_id INT AUTO_INCREMENT PRIMARY KEY,
customer_id INT not null,
order_date date not null,
status varchar(50),
FOREIGN KEY(customer_id) REFERENCES customers(customer_id));
select * from orders;

CREATE TABLE order_items(
order_item_id INT AUTO_INCREMENT PRIMARY KEY,
order_id INT not null,
product_id INT not null,
quantity INT not null,
unit_price decimal(10,2) not null,
FOREIGN KEY(order_id) REFERENCES orders(order_id),
FOREIGN KEY(product_id) REFERENCES products(product_id));
select * from orders;

SHOW tables;

INSERT INTO customers
(first_name, last_name, email, city, country, signup_date)
VALUES
('Samuel', 'Muchiri', 'samuel@email.com', 'Nairobi', 'Kenya', '2025-01-10'),
('Mary', 'Wanjiku', 'mary@email.com', 'Nairobi', 'Kenya', '2025-02-15'),
('John', 'Kamau', 'john@email.com', 'Mombasa', 'Kenya', '2025-03-20'),
('Grace', 'Achieng', 'grace@email.com', 'Kisumu', 'Kenya', '2025-04-05'),
('Peter', 'Mwangi', 'peter@email.com', 'Nakuru', 'Kenya', '2025-05-12'),
('Jane', 'Njeri', 'jane@email.com', 'Nairobi', 'Kenya', '2025-06-18'),
('David', 'Otieno', 'david@email.com', 'Eldoret', 'Kenya', '2025-07-22'),
('Alice', 'Muthoni', 'alice@email.com', 'Thika', 'Kenya', '2025-08-09');
select* from customers;

INSERT into orders(customer_id,order_date,status) 
values
(1,'2025-09-01','completed'),
(2, '2025-09-03', 'Completed'),
(3, '2025-09-05', 'Pending'),
(1, '2025-09-08', 'Completed'),
(4, '2025-09-10', 'Completed'),
(5, '2025-09-12', 'Cancelled'),
(6, '2025-09-15', 'Completed'),
(7, '2025-09-18', 'Completed'),
(8, '2025-09-20', 'Pending'),
(3, '2025-09-22', 'Completed');
select* from orders;

INSERT INTO products
(product_name, category, unit_price)
VALUES
('Laptop', 'Electronics', 65000.00),
('Smartphone', 'Electronics', 35000.00),
('Office Chair', 'Furniture', 12000.00),
('Desk', 'Furniture', 18000.00),
('T-Shirt', 'Clothing', 1500.00),
('Jeans', 'Clothing', 3000.00),
('Rice 5kg', 'Groceries', 1200.00),
('Cooking Oil 2L', 'Groceries', 800.00);
select* from  products;

INSERT INTO order_items
(order_id, product_id, quantity, unit_price)
VALUES
(1, 1, 1, 65000.00),
(1, 5, 2, 1500.00),
(2, 2, 1, 35000.00),
(2, 6, 1, 3000.00),
(3, 3, 1, 12000.00),
(4, 4, 1, 18000.00),
(4, 7, 3, 1200.00),
(5, 5, 4, 1500.00),
(5, 8, 2, 800.00),
(6, 1, 1, 65000.00),
(7, 6, 2, 3000.00),
(8, 2, 1, 35000.00),
(9, 3, 2, 12000.00),
(10, 7, 5, 1200.00);
select* from  order_items;

show tables;

SELECT first_name, last_name,city from customers;

select* from customers where city='Nairobi';
select* from products where unit_price > 5000;
select* from products order by unit_price desc;
select* from customers order by signup_date asc;
select distinct city from customers;
select* from products order by unit_price desc limit 3;

Select first_name, last_name, email from customers;
select * from products where category='electronics';
select * from products order by unit_price asc;
select* from customers where city !='Nairobi';
select* from orders order by order_date desc limit 5;

SELECT COUNT(*) AS total_customers FROM customers;
SELECT SUM(unit_price) AS total_product_value FROM products;
SELECT AVG(unit_price) AS average_product_price FROM products;
SELECT 
    MIN(unit_price) AS cheapest_product,
    MAX(unit_price) AS most_expensive_product
FROM products;

select count(*) as total_products from products;
select count(quantity) as total_qty from order_items;
select sum(quantity) as total_qty from order_items;
select avg(unit_price) as avg_unit_price from products;
select max(unit_price) as max_unit_price  from products;

SELECT category, COUNT(*) AS total_products, AVG(unit_price) AS average_price FROM products GROUP BY category;

SELECT category, COUNT(*) AS product_qty FROM products GROUP BY category;
SELECT category,avg(unit_price) AS product_price_avg FROM products GROUP BY category;
SELECT product_id,sum(quantity) AS total_qty FROM order_items group by product_id;

-- HAVING
SELECT category, AVG(unit_price) AS avg_price FROM products GROUP BY category HAVING AVG(unit_price) > 5000;
SELECT category, AVG(unit_price) AS avg_price FROM products where unit_price > 5000 GROUP BY category ;

SELECT
    customers.customer_id,
    customers.first_name,
    customers.last_name,
    orders.order_id,
    orders.order_date,
    orders.status
FROM customers
INNER JOIN orders
ON customers.customer_id = orders.customer_id;

SELECT
    customers.customer_id,
    customers.first_name,
    customers.last_name,
    orders.order_id,
    orders.order_date,
    orders.status
FROM customers
INNER JOIN orders
ON customers.customer_id = orders.customer_id;

SELECT
    c.first_name,
    c.last_name,
    o.order_id,
    p.product_name,
    oi.quantity,
    oi.unit_price
FROM customers AS c
INNER JOIN orders AS o
ON c.customer_id = o.customer_id
INNER JOIN order_items AS oi
ON o.order_id = oi.order_id
INNER JOIN products AS p
ON oi.product_id = p.product_id;



SELECT CUSTOMERS.first_name,CUSTOMERS.last_name,ORDERS.order_id,ORDERS.order_date FROM CUSTOMERS JOIN ORDERS ON CUSTOMERS.customer_id=ORDERS.customer_id;

SELECT PRODUCTS.product_name,order_items.Quantity FROM PRODUCTS JOIN order_items ON PRODUCTS.product_id= order_items.product_id;

SELECT CUSTOMERS.first_name,PRODUCTS.product_name,order_items.Quantity,ORDERS.STATUS 
FROM CUSTOMERS 
JOIN ORDERS ON CUSTOMERS.customer_id=ORDERS.customer_id
JOIN ORDER_ITEMS ON ORDER_ITEMS.order_id=ORDERS.order_id
JOIN PRODUCTS ON PRODUCTS.product_id=ORDER_ITEMS.product_id;

SELECT
c.customer_id,c.first_name,c.last_name
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

SELECT customers.customer_id,customers.first_name,customers.last_name, orders.order_id
  FROM CUSTOMERS LEFT JOIN ORDERS ON CUSTOMERS.customer_id=ORDERS.customer_id;
  
SELECT PRODUCTS.product_ID,PRODUCTS.product_name,order_items.ORDER_ID FROM PRODUCTS LEFT JOIN order_items ON PRODUCTS.product_id= order_items.product_id;  


SELECT product_name, unit_price FROM products
WHERE unit_price > (SELECT AVG(unit_price) FROM products);  


SELECT product_name, unit_price FROM products
WHERE unit_price > (SELECT AVG(unit_price) FROM products);  


SELECT * FROM products WHERE product_id IN (SELECT product_id FROM order_items );

SELECT * FROM order_items;
SELECT * FROM PRODUCTS;
SELECT * FROM orderS;
SELECT * FROM CUSTOMERS;
SELECT customer_id, COUNT(order_id) AS total_orders FROM orders GROUP BY customer_id ;
# CTE
WITH customer_orders AS 
(SELECT customer_id, COUNT(order_id) AS total_orders FROM orders GROUP BY customer_id)
SELECT * FROM customer_orders WHERE total_orders > 1;

 WITH product_sales   AS 
(SELECT product_id, sum(quantity) AS total_quantity FROM order_items GROUP BY product_id)
SELECT * FROM product_sales WHERE total_oquantity > 3;

 WITH category_sales AS 
(SELECT products.category, SUM(order_items.quantity * order_items.unit_price) as total_revenue FROM order_items 
  join products on products.product_id = order_items.product_id group by category)
       SELECT * FROM category_sales ;
 
WITH customer_orders AS (
    SELECT
        customer_id,
        COUNT(order_id) AS total_orders
    FROM orders
    GROUP BY customer_id
),
customer_spending AS (
    SELECT
        o.customer_id,
        SUM(oi.quantity * oi.unit_price) AS total_spent
    FROM orders o
    JOIN order_items oi
        ON o.order_id = oi.order_id
    WHERE o.status = 'Completed'
    GROUP BY o.customer_id
)
SELECT
    co.customer_id,
    co.total_orders,
    cs.total_spent
FROM customer_orders co
JOIN customer_spending cs
    ON co.customer_id = cs.customer_id;
    
    SELECT category,SUM(quantity * order_items.unit_price) AS TOTAL_REVENUE FROM PRODUCTS  JOIN  order_items ON order_items.product_id=PRODUCTS.product_id GROUP BY CATEGORY;
    
SELECT * FROM order_items;
SELECT * FROM PRODUCTS;
SELECT * FROM orderS;
SELECT * FROM CUSTOMERS;


# MULTIPLE CTEs
    WITH category_quantity AS 
    (SELECT category,SUM(quantity) AS TOTAL_QUANTITY FROM PRODUCTS  JOIN  order_items ON order_items.product_id=PRODUCTS.product_id GROUP BY CATEGORY),
    category_revenue AS 
    (SELECT category,SUM(quantity * order_items.unit_price) AS TOTAL_REVENUE FROM PRODUCTS  JOIN  order_items ON order_items.product_id=PRODUCTS.product_id GROUP BY CATEGORY)
    SELECT * FROM category_quantity JOIN category_revenue ON category_revenue.CATEGORY=category_quantity.CATEGORY;
    
    #WHERE category_quantity.TOTAL_QUANTITY>5,  WHERE category_revenue.TOTAL_REVENUE>10000
    
    WITH category_quantity AS 
    (SELECT category,SUM(quantity) AS TOTAL_QUANTITY FROM PRODUCTS JOIN  order_items ON order_items.product_id=PRODUCTS.product_id  GROUP BY CATEGORY HAVING SUM(quantity)>5),
    category_revenue AS 
    (SELECT category,SUM(quantity * order_items.unit_price) AS TOTAL_REVENUE FROM PRODUCTS JOIN  order_items ON order_items.product_id=PRODUCTS.product_id  GROUP BY CATEGORY HAVING SUM(quantity * order_items.unit_price)>10000)
    SELECT * FROM category_quantity JOIN category_revenue ON category_revenue.CATEGORY=category_quantity.CATEGORY;
    
    
   #WINDOW FNS
SELECT customer_id, COUNT(order_id) AS total_orders FROM orders GROUP BY customer_id;

SELECT order_id, customer_id, COUNT(order_id) OVER( PARTITION BY customer_id ) AS total_orders FROM orders;

SELECT customer_id, order_date, order_id,  COUNT(order_id) OVER( PARTITION BY customer_id ) AS total_orders FROM orders;

select order_item_id,order_id, product_id, quantity ,sum(quantity) over (partition by product_id) as total_quantity from order_items;

select order_id, customer_id, order_date  ,count(order_id) over (partition by order_id) as total_orders from orders order by order_date;

select product_name,unit_price, rank() over (order by unit_price desc) as Product_ranking from products;

select product_name,unit_price, dense_rank() over (order by unit_price desc) as Product_ranking from products;

select unit_price,order_id, product_id, quantity ,sum(quantity* unit_price) over (partition by order_id) as revenue from order_items;


