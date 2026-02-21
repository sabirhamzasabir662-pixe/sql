--==============================================================================
-- 1️ USERS TABLE
CREATE TABLE Users (
    user_id NUMBER PRIMARY KEY,
    name VARCHAR2(50) NOT NULL,
    email VARCHAR2(100) UNIQUE NOT NULL,
    password VARCHAR2(100) NOT NULL,
    phone VARCHAR2(20),
    role VARCHAR2(20)
);
--==============================================================================
--INSERT DATA (DML – Insert)
--Insert Users
INSERT INTO Users VALUES (1, 'Ali', 'ali@gmail.com', '1234', '03001234567', 'Customer');
INSERT INTO Users VALUES (2, 'Admin', 'admin@gmail.com', 'admin123', '03111234567', 'Admin');
INSERT INTO Users VALUES (3, 'hamza', 'hamza@gmail.com', 'hamza123', '03111234886', 'Admin');
INSERT INTO Users VALUES (4, 'khan', 'khan@gmail.com', 'khan123', '03111238867', 'Admin');
INSERT INTO Users VALUES (5, 'Ahmad', 'ahmad@gmail.com', 'ahmad123', '03111664567', 'Admin');
SELECT * FROM Users;
--==============================================================================
--==============================================================================
SELECT * FROM Users;
--==============================================================================
-- 2️ CATEGORY TABLE
CREATE TABLE Category (
    category_id NUMBER PRIMARY KEY,
    category_name VARCHAR2(50) NOT NULL,
    description VARCHAR2(200)
);
--==============================================================================
--Insert Category
INSERT INTO Category VALUES (1, 'Electronics', 'Electronic Items');
INSERT INTO Category VALUES (2, 'Clothes', 'Fashion Items');
INSERT INTO Category VALUES (3, 'CD', 'Gaming Items');
INSERT INTO Category VALUES (4, 'shose', 'Fashion Items');
SELECT * FROM Category;
--==============================================================================
SELECT * FROM Category;
--==============================================================================
-- 3️ PRODUCT TABLE
CREATE TABLE Product (
    product_id NUMBER PRIMARY KEY,
    product_name VARCHAR2(100) NOT NULL,
    price NUMBER(10,2) NOT NULL,
    stock NUMBER NOT NULL,
    category_id NUMBER,
    FOREIGN KEY (category_id) REFERENCES Category(category_id)
);
--==============================================================================
--Insert Product
INSERT INTO Product VALUES (1, 'Mobile', 50000, 10, 1);
INSERT INTO Product VALUES (2, 'Laptop', 120000, 5, 1);
INSERT INTO Product VALUES (3, 'T-Shirt', 2000, 50, 2);
INSERT INTO Product VALUES (4, 'Shirt', 3000, 40, 2);
INSERT INTO Product VALUES (5, 'Jeans', 4500, 35, 2);
INSERT INTO Product VALUES (6, 'Headphones', 8000, 25, 1);
INSERT INTO Product VALUES (7, 'Smart Watch', 15000, 15, 1);
INSERT INTO Product VALUES (8, 'Bluetooth Speaker', 7000, 20, 1);
INSERT INTO Product VALUES (9, 'Shoes', 6000, 30, 2);
INSERT INTO Product VALUES (10, 'Tablet', 40000, 12, 1);
SELECT * FROM product;
--==============================================================================
-- 4️ CART TABLE
CREATE TABLE Cart (
    cart_id NUMBER PRIMARY KEY,
    user_id NUMBER,
    product_id NUMBER,
    quantity NUMBER NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
);
--==============================================================================
--Insert Cart
INSERT INTO Cart VALUES (1, 1, 1, 2);
INSERT INTO Cart VALUES (2, 1, 2, 1);
INSERT INTO Cart VALUES (3, 2, 3, 3);
INSERT INTO Cart VALUES (4, 2, 5, 2);
INSERT INTO Cart VALUES (5, 3, 1, 1);
INSERT INTO Cart VALUES (6, 3, 7, 2);
INSERT INTO Cart VALUES (7, 4, 4, 1);
INSERT INTO Cart VALUES (8, 4, 6, 2);
INSERT INTO Cart VALUES (9, 5, 8, 1);
INSERT INTO Cart VALUES (10, 5, 10, 1);

SELECT * FROM cart;
--==============================================================================
-- 5️ ORDERS TABLE
CREATE TABLE Orders (
    order_id NUMBER PRIMARY KEY,
    user_id NUMBER,
    order_date DATE DEFAULT SYSDATE,
    total_amount NUMBER(10,2),
    status VARCHAR2(20),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);
--==============================================================================
--Insert Order
INSERT INTO Orders VALUES (1, 1, SYSDATE, 100000, 'Pending');
INSERT INTO Orders VALUES (2, 2, SYSDATE, 45000, 'Completed');
INSERT INTO Orders VALUES (3, 3, SYSDATE, 120000, 'Pending');
INSERT INTO Orders VALUES (4, 4, SYSDATE, 8000, 'Shipped');
INSERT INTO Orders VALUES (5, 5, SYSDATE, 60000, 'Completed');
INSERT INTO Orders VALUES (6, 1, SYSDATE, 15000, 'Cancelled');
INSERT INTO Orders VALUES (7, 2, SYSDATE, 25000, 'Pending');
INSERT INTO Orders VALUES (8, 3, SYSDATE, 70000, 'Shipped');
INSERT INTO Orders VALUES (9, 4, SYSDATE, 5000, 'Completed');
INSERT INTO Orders VALUES (10, 5, SYSDATE, 95000, 'Pending');

SELECT * FROM orders;
--==============================================================================
-- 6️ ORDER_DETAIL TABLE
CREATE TABLE Order_Detail (
    order_detail_id NUMBER PRIMARY KEY,
    order_id NUMBER,
    product_id NUMBER,
    quantity NUMBER NOT NULL,
    price NUMBER(10,2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
);
--==============================================================================
--Insert Order Detail
INSERT INTO Order_Detail VALUES (1, 1, 1, 2, 50000);
INSERT INTO Order_Detail VALUES (2, 2, 2, 1, 120000);
INSERT INTO Order_Detail VALUES (3, 2, 6, 2, 8000);
INSERT INTO Order_Detail VALUES (4, 3, 3, 3, 2000);
INSERT INTO Order_Detail VALUES (5, 3, 5, 1, 4500);
INSERT INTO Order_Detail VALUES (6, 4, 8, 1, 7000);
INSERT INTO Order_Detail VALUES (7, 5, 10, 1, 40000);
INSERT INTO Order_Detail VALUES (8, 6, 7, 2, 15000);
INSERT INTO Order_Detail VALUES (9, 7, 4, 1, 3000);
INSERT INTO Order_Detail VALUES (10, 8, 9, 2, 6000);
INSERT INTO Order_Detail VALUES (11, 9, 12, 1, 2500);
INSERT INTO Order_Detail VALUES (12, 10, 14, 1, 85000);

SELECT * FROM order_detail;
--==============================================================================
 --7️ PAYMENT TABLE
CREATE TABLE Payment (
    payment_id NUMBER PRIMARY KEY,
    order_id NUMBER,
    payment_method VARCHAR2(50),
    payment_date DATE DEFAULT SYSDATE,
    amount NUMBER(10,2),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);
--Insert Payment
INSERT INTO Payment VALUES (1, 1, 'Cash', SYSDATE, 100000);
INSERT INTO Payment VALUES (2, 2, 'Credit Card', SYSDATE, 45000);
INSERT INTO Payment VALUES (3, 3, 'Debit Card', SYSDATE, 120000);
INSERT INTO Payment VALUES (4, 4, 'Cash', SYSDATE, 8000);
INSERT INTO Payment VALUES (5, 5, 'Online Transfer', SYSDATE, 60000);
INSERT INTO Payment VALUES (6, 6, 'Cash', SYSDATE, 15000);
INSERT INTO Payment VALUES (7, 7, 'Credit Card', SYSDATE, 25000);
INSERT INTO Payment VALUES (8, 8, 'Online Transfer', SYSDATE, 70000);
INSERT INTO Payment VALUES (9, 9, 'Debit Card', SYSDATE, 5000);
INSERT INTO Payment VALUES (10, 10, 'Cash', SYSDATE, 95000);


SELECT * FROM payment;
--==============================================================================
--SELECT Queries
--🔹 Show All Products
SELECT * FROM Product;
--==============================================================================
--🔹 Show Products with Category
SELECT p.product_name, p.price, c.category_name
FROM Product p
JOIN Category c
ON p.category_id = c.category_id;
--==============================================================================
--🔹 Show User Orders
SELECT u.name, o.order_id, o.total_amount
FROM Users u
JOIN Orders o
ON u.user_id = o.user_id;
SELECT * FROM orders;
--==============================================================================
--🔹 Update Product Price
UPDATE Product
SET price = 55000
WHERE product_id = 1;

SELECT * FROM product;
--==============================================================================
--🔹 Delete Cart Item
DELETE FROM Cart
WHERE cart_id = 1;
SELECT * FROM cart;
































