/* Project: E-Commerce Operations & Profitability
   Description: Data Cleaning and ETL for Olist Dataset
*/

-- 1. Create and Load Orders
CREATE TABLE orders (
    order_id VARCHAR(50) PRIMARY KEY,
    customer_id VARCHAR(50),
    order_status VARCHAR(20),
    order_purchase_timestamp VARCHAR(50), 
    order_approved_at VARCHAR(50),
    order_delivered_carrier_date VARCHAR(50),
    order_delivered_customer_date VARCHAR(50),
    order_estimated_delivery_date VARCHAR(50)
);

-- (Followed by LOAD DATA INFILE command)

-- 2. Data Cleaning: Handling NULLs and casting types
UPDATE orders SET order_delivered_customer_date = NULL WHERE order_delivered_customer_date = '';
UPDATE orders SET order_approved_at = NULL WHERE order_approved_at = '';

ALTER TABLE orders MODIFY COLUMN order_purchase_timestamp DATETIME;
ALTER TABLE orders MODIFY COLUMN order_delivered_customer_date DATETIME;

-- 3. Profitability Check: Revenue by Payment Type
SELECT 
    payment_type, 
    SUM(payment_value) AS total_revenue
FROM order_payments
GROUP BY payment_type
ORDER BY total_revenue DESC;