-- create products-table
CREATE TABLE Products (
    product_id SERIAL PRIMARY KEY,  
    product_name VARCHAR(50),       
    Category VARCHAR(50),           
    price INT                      
);

-- create orders-table
create table Orders (
    order_id SERIAL primary key,        
    customer_name VARCHAR(100),          
    product_id INT references Products(product_id),  
    quantity INT,                        
    order_date TIMESTAMP                 
);

-- insert values to products-table
INSERT INTO Products (product_name, Category, price) VALUES
('Laptop', 'Electronics', 1200),
('Headphones', 'Electronics', 150),
('Coffee Maker', 'Home Appliances', 80),
('Book', 'Books', 20),
('Office Chair', 'Furniture', 200);

-- insert values to orders-table
INSERT INTO Orders (customer_name, product_id, quantity, order_date) VALUES
('Ram', 1, 2, '2024-07-01 10:30:00'),
('Hari', 2, 1, '2024-07-02 14:45:00'),
('Chanfra', 3, 3, '2024-07-03 09:00:00'),
('Mandra', 4, 5, '2024-07-03 11:15:00'),
('Meow', 5, 1, '2024-07-04 16:20:00');

-- update a particular product
UPDATE Products SET category = 'hardware' WHERE product_id = 1;

--  total quantity ordered for each product category in the orders table
select o.product_id, (select product_name from products where product_id = o.product_id), sum(quantity)
from orders o group by product_id order by o.product_id;

-- categories where the total number of products ordered is greater than 5
select * from products p 
where product_id = (select product_id from orders group by product_id having sum(quantity) > 5)

