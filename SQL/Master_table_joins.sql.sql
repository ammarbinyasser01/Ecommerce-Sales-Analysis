DROP TABLE IF EXISTS master_orders;

CREATE TABLE master_orders AS
SELECT 
    o.order_id,
    o.customer_id,
    o.order_status,
    o.order_purchase_timestamp,
    o.order_delivered_customer_date,
    
    -- Customer Info
    c.customer_city,
    c.customer_state,
    
    -- Order Item Info
    oi.product_id,
    oi.price,
    oi.freight_value,
    
    -- Payment Info
    p.payment_type,
    p.payment_value,
    
    -- Product Info
    pr.product_category_name,
    
    -- Review Info
    r.review_score

FROM orders o
LEFT JOIN customers c 
    ON o.customer_id = c.customer_id
LEFT JOIN order_items oi 
    ON o.order_id = oi.order_id
LEFT JOIN payments p 
    ON o.order_id = p.order_id
LEFT JOIN products pr 
    ON oi.product_id = pr.product_id
LEFT JOIN order_reviews r 
    ON o.order_id = r.order_id;