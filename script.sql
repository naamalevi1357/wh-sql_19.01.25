-- a
CREATE TABLE nutritions(
nutrition_id INT PRIMARY KEY NOT NULL,
name TEXT NOT NULL,
claories INT NOT NULL,
fats INT NOT NULL,
Suger INT NOT NULL,
id_product INT, FOREIGN KEY (id_product)REFERENCES products(id_product))

CREATE TABLE products(
product_id INT PRIMARY KEY NOT NULL,
name TEXT NOT NULL,
price INT NOT NULL,
id_category INT, FOREIGN KEY (id_category)REFERENCES category(id_category))

CREATE TABLE category(
category_id INT PRIMARY KEY NOT NULL,
name TEXT NOT NULL)

CREATE TABLE orders (
order_id INT PRIMARY KEY NOT NULL,
date_time INT NOT NULL,
address TEXT NOT NULL,
customer_name TEXT NOT NULL,
customer_ph INT NOT NULL,
price_total INT NOT NULL)


CREATE TABLE products_orders (
order_id INT NOT NULL,
product_id INT NOT NULL,
amount INT NOT NULL,
PRIMARY KEY (order_id, product_id)
FOREIGN KEY (order_id) REFERENCES orders(order_id),
FOREIGN KEY (product_id) REFERENCES products(product_id))


-- B
nutritions- יחיד לרבים 
products- יחיד לרבים
category- יחיד ליחיד
orders- יחיד ליחיד  
products_orders- רבים לרבים


-- c
INSERT INTO orders (date_time, address, customer_name, customer_ph, price_total) VALUES
('2024-09-17 10:30', '123 Main St', 'John Doe', '555-1234', 30.08),
('2024-09-17 11:45', '456 Oak St', 'Jane Smith', '555-5678', 20.13),
('2024-09-17 12:15', '789 Pine St', 'Emily Davis', '555-8765', 22.22),
('2024-09-17 13:00', '321 Elm St', 'Michael Johnson', '555-4321', 15.15),
('2024-09-17 13:30', '654 Maple St', 'Sarah Wilson', '555-6789', 30.99);


INSERT INTO nutritions (nutrition_id, name, claories, fats, Suger,product_id) VALUES
(1, 'Orange Juice', 120, 0.2, 20,1),
(2, 'Chocolate Bar', 220, 12, 18,2),
(3, 'Milk', 150, 8, 12,3),
(4, 'Apple', 95, 0.3, 19,4),
(5, 'Carrot', 41, 0.1, 5,5),
(6, 'Coca Cola', 140, 0, 39,6),      
(7, 'Pepsi', 150, 0, 41,7),          
(8, 'Water Bottle', 0, 0, 0,8),    
(9, 'Orange Soda', 160, 0, 44,9),   
(10, 'Iced Tea', 90, 0, 23,10),       
(11, 'Potato Chips', 160, 10, 1,11),  
(12, 'Pretzels', 110, 1, 1,12),      
(13, 'Popcorn', 120, 5, 0,13),       
(14, 'Granola Bar', 150, 6, 7,14),   
(15, 'Cookies', 250, 12, 18,15),     
(16, 'Cheese', 113, 9, 1,16),         
(17, 'Yogurt', 80, 1.5, 11,17),       
(18, 'Butter', 100, 11, 0,18),        
(19, 'Cream Cheese', 99, 10, 1,19),   
(20, 'Ice Cream', 270, 14, 28,20),    
(21, 'Banana', 105, 0.3, 14,21),     
(22, 'Grapes', 62, 0.3, 15,22),     
(23, 'Mango', 99, 0.6, 23,23),      
(24, 'Pineapple', 50, 0.1, 10,24),   
(25, 'Strawberries', 53, 0.5, 8,25); 

INSERT INTO category (name) VALUES
('Beverages'),
('Snacks'),
('Dairy'),
('Fruits'),
('Vegetables');

INSERT INTO products (name, price, category_id) VALUES
('Orange Juice', 5.99, 1),
('Chocolate Bar', 2.50, 2),
('Milk', 3.20, 3),
('Apple', 1.50, 4),
('Carrot', 0.99, 5),
('Coca Cola', 1.50, 1),   
('Pepsi', 1.40, 1),        
('Water Bottle', 0.99, 1), 
('Orange Soda', 1.70, 1), 
('Iced Tea', 2.00, 1),     
('Potato Chips', 1.80, 2),   
('Pretzels', 2.20, 2),      
('Popcorn', 1.99, 2),        
('Granola Bar', 1.50, 2),   
('Cookies', 3.00, 2),       
('Cheese', 4.50, 3),     
('Yogurt', 1.25, 3),     
('Butter', 3.75, 3),    
('Cream Cheese', 2.50, 3),
('Ice Cream', 5.00, 3),
('Banana', 1.20, 4),     
('Grapes', 2.99, 4),      
('Mango', 1.75, 4),       
('Pineapple', 3.00, 4),   
('Strawberries', 2.80, 4);

INSERT INTO products (name, price, category_id) VALUES
('Orange Juice', 5.99, 1),
('Chocolate Bar', 2.50, 2),
('Milk', 3.20, 3),
('Apple', 1.50, 4),
('Carrot', 0.99, 5),
('Coca Cola', 1.50, 1),   
('Pepsi', 1.40, 1),        
('Water Bottle', 0.99, 1), 
('Orange Soda', 1.70, 1), 
('Iced Tea', 2.00, 1),     
('Potato Chips', 1.80, 2),   
('Pretzels', 2.20, 2),      
('Popcorn', 1.99, 2),        
('Granola Bar', 1.50, 2),   
('Cookies', 3.00, 2),       
('Cheese', 4.50, 3),     
('Yogurt', 1.25, 3),     
('Butter', 3.75, 3),    
('Cream Cheese', 2.50, 3),
('Ice Cream', 5.00, 3),
('Banana', 1.20, 4),     
('Grapes', 2.99, 4),      
('Mango', 1.75, 4),       
('Pineapple', 3.00, 4),   
('Strawberries', 2.80, 4);


-- d 

--SELECT *  FROM products
--SELECT *  FROM nutritions
--SELECT *  FROM category
--1 
select products.*, nutritions.claories, nutritions.Suger,
nutritions.fats,category.name from products
inner join nutritions ON products.product_id = nutritions.product_id 
inner join category ON products.category_id = category.category_id

-- 2
SELECT products_orders.*,products.* from products_orders
inner join products ON products_orders.product_id = products.product_id 

SELECT products_orders.order_id, products.* from products_orders
inner join products ON products_orders.product_id = products.product_id 

-- 3
INSERT INTO products_orders (order_id, product_id, amount) VALUES
(1, 5, 3),
(2, 10, 1),
(3, 1, 5),
(4, 20, 3),
(5, 13,4);


-- 4
UPDATE orders
SET price_total = (SELECT SUM(products.price * products_orders.amount)FROM products_orders
JOIN products ON products_orders.product_id = products.product_id
WHERE products_orders.order_id = orders.order_id)
WHERE orders.order_id = 5;

--5 
SELECT max(price_total) FROM orders

SELECT min(price_total) FROM orders

SELECT avg(price_total) FROM orders

-- 6
SELECT count(products_orders.order_id)as lakoach_max, orders.customer_name FROM products_orders 
INNER JOIN orders ON products_orders.order_id = orders.order_id
GROUP BY products_orders.order_id, orders.customer_name
having products_orders.order_id = (SELECT MAX(order_id) FROM products_orders)

-- 7

-- 7

--SELECT count(product_id) from products_orders
--WHERE product_id = (SELECT MAX(product_id) FROM products_orders)
--max

SELECT products.name, products.product_id , COUNT(products_orders.product_id) AS product_max FROM products_orders
INNER JOIN products ON products_orders.product_id = products.product_id
GROUP BY products.name
ORDER BY product_max DESC LIMIT 1
-- min
SELECT products.name,products.product_id, COUNT(products_orders.product_id) AS product_min
FROM products_orders
INNER JOIN products ON products_orders.product_id = products.product_id
GROUP BY products.name
ORDER BY product_min LIMIT 1

-- avg
SELECT AVG(product_avg) FROM (SELECT COUNT(products_orders.product_id) AS product_avg FROM products_orders
GROUP BY products_orders.product_id)


--SELECT count(products_orders.product_id) ,products.name FROM products_orders
--INNER JOIN products ON products_orders.product_id = products.product_id
--WHERE products_orders.product_id = (SELECT MAX(product_id) FROM products_orders);

-- 8
SELECT category.*,COUNT(products_orders.product_id) AS product_max FROM products_orders
INNER JOIN products ON products_orders.product_id = products.product_id
INNER JOIN category ON category.category_id = products.category_id
GROUP BY category.name
ORDER BY product_max DESC LIMIT 1

SELECT category.*,COUNT(products_orders.product_id) AS product_max FROM products_orders
INNER JOIN products ON products_orders.product_id = products.product_id
INNER JOIN category ON category.category_id = products.category_id
GROUP BY category.name
ORDER BY product_max  LIMIT 1

