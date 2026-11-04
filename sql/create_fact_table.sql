CREATE TABLE fact_orders (
    order_key INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    customer_key INT,
    order_date DATE,
    product_name VARCHAR(100),
    quantity INT,
    amount DECIMAL(10,2),
    status VARCHAR(30),
    FOREIGN KEY (customer_key)
        REFERENCES dim_customers(customer_key)
);
INSERT INTO fact_orders
(order_id, customer_key, order_date, product_name,
 quantity, amount, status)
SELECT
    c.order_id,
    d.customer_key,
    c.order_date,
    c.product_name,
    c.quantity,
    c.amount,
    c.status
FROM cleaned_orders c
JOIN dim_customers d
    ON c.customer_id = d.customer_id;
SELECT * FROM fact_orders;
