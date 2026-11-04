CREATE TABLE cleaned_orders AS
SELECT
    order_id,
    customer_id,
    COALESCE(NULLIF(TRIM(customer_name), ''), 'Unknown') AS customer_name,
    COALESCE(NULLIF(TRIM(email), ''), 'Not Provided') AS email,
    order_date,
    product_name,
    COALESCE(quantity, 0) AS quantity,
    COALESCE(amount, 0.00) AS amount,
    CASE
        WHEN UPPER(TRIM(status)) IN ('COMPLETED', 'COMPLETE')
            THEN 'Completed'
        WHEN UPPER(TRIM(status)) = 'PENDING'
            THEN 'Pending'
        WHEN UPPER(TRIM(status)) = 'SHIPPED'
            THEN 'Shipped'
        WHEN UPPER(TRIM(status)) = 'CANCELLED'
            THEN 'Cancelled'
        ELSE 'Unknown'
    END AS status
FROM staging_orders;
