USE order_warehouse;

CREATE TABLE staging_orders (
    order_id INT,
    customer_id INT,
    customer_name VARCHAR(100),
    email VARCHAR(150),
    order_date DATE,
    product_name VARCHAR(100),
    quantity INT,
    amount DECIMAL(10,2),
    status VARCHAR(30)
);
