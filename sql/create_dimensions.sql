CREATE TABLE dim_customers (
    customer_key INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT UNIQUE,
    customer_name VARCHAR(100),
    email VARCHAR(150)
);

INSERT INTO dim_customers
(customer_id, customer_name, email)
SELECT DISTINCT
    customer_id,
    customer_name,
    email
FROM cleaned_orders
WHERE customer_id IS NOT NULL;
