CREATE TABLE Products (
    product_id SERIAL PRIMARY KEY,  
    product_name VARCHAR(50),       
    Category VARCHAR(50),           
    price INT                      
);


create table Orders (
    order_id SERIAL primary key,        
    customer_name VARCHAR(100),          
    product_id INT references Products(product_id),  
    quantity INT,                        
    order_date TIMESTAMP                 
);


INSERT INTO Products (product_name, Category, price) VALUES
('Laptop', 'Electronics', 1200),
('Headphones', 'Electronics', 150),
('Coffee Maker', 'Home Appliances', 80),
('Book', 'Books', 20),
('Office Chair', 'Furniture', 200);


INSERT INTO Orders (customer_name, product_id, quantity, order_date) VALUES
('Ram', 1, 2, '2024-07-01 10:30:00'),
('Hari', 2, 1, '2024-07-02 14:45:00'),
('Chanfra', 3, 3, '2024-07-03 09:00:00'),
('Mandra', 4, 5, '2024-07-03 11:15:00'),
('Meow', 5, 1, '2024-07-04 16:20:00');


UPDATE Products SET category = 'hardware' WHERE product_id = 1;



SELECT p.category, SUM(o.quantity) AS total_quantity
FROM Orders o
JOIN Products p ON o.product_id = p.product_id
GROUP BY p.category;

select o.product_id, (select product_name from products where product_id = o.product_id), sum(quantity)
from orders o group by product_id;

select * from products p 
where product_id = (select product_id from orders group by product_id having sum(quantity) > 5)

