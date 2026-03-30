DROP TABLE IF EXISTS orders;

CREATE TABLE orders (
    order_id VARCHAR(50) PRIMARY KEY,
    customer_id VARCHAR(50),
    order_status VARCHAR(50),
    order_purchase_timestamp DATETIME NULL,
    order_approved_at DATETIME NULL,
    order_delivered_carrier_date DATETIME NULL,
    order_delivered_customer_date DATETIME NULL,
    order_estimated_delivery_date DATETIME NULL
);
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/olist_orders_dataset.csv'
INTO TABLE orders
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@order_id, @customer_id, @order_status, 
 @order_purchase_timestamp, @order_approved_at, @order_delivered_carrier_date, 
 @order_delivered_customer_date, @order_estimated_delivery_date)
SET 
    order_id = @order_id,
    customer_id = @customer_id,
    order_status = @order_status,
    order_purchase_timestamp = NULLIF(@order_purchase_timestamp, ''),
    order_approved_at = NULLIF(@order_approved_at, ''),
    order_delivered_carrier_date = NULLIF(@order_delivered_carrier_date, ''),
    order_delivered_customer_date = NULLIF(@order_delivered_customer_date, ''),
    order_estimated_delivery_date = NULLIF(@order_estimated_delivery_date, '');

DROP TABLE IF EXISTS customers;

CREATE TABLE customers (
    customer_id VARCHAR(50) PRIMARY KEY,
    customer_unique_id VARCHAR(50),
    customer_zip_code_prefix VARCHAR(10),
    customer_city VARCHAR(100),
    customer_state VARCHAR(10)
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/olist_customers_dataset.csv'
INTO TABLE customers
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@customer_id, @customer_unique_id, @zip, @city, @state)
SET
    customer_id = @customer_id,
    customer_unique_id = @customer_unique_id,
    customer_zip_code_prefix = @zip,
    customer_city = @city,
    customer_state = @state;

DROP TABLE IF EXISTS order_items;

CREATE TABLE order_items (
    order_id VARCHAR(50),
    order_item_id INT,
    product_id VARCHAR(50),
    seller_id VARCHAR(50),
    shipping_limit_date DATETIME NULL,
    price DECIMAL(10,2),
    freight_value DECIMAL(10,2)
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/olist_order_items_dataset.csv'
INTO TABLE order_items
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@order_id, @item_id, @product_id, @seller_id, @shipping_date, @price, @freight)
SET
    order_id = @order_id,
    order_item_id = @item_id,
    product_id = @product_id,
    seller_id = @seller_id,
    shipping_limit_date = NULLIF(@shipping_date,''),
    price = @price,
    freight_value = @freight;

DROP TABLE IF EXISTS payments;

CREATE TABLE payments (
    order_id VARCHAR(50),
    payment_sequential INT,
    payment_type VARCHAR(50),
    payment_installments INT,
    payment_value DECIMAL(10,2)
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/olist_order_payments_dataset.csv'
INTO TABLE payments
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@order_id,@seq,@type,@installments,@value)
SET
    order_id = @order_id,
    payment_sequential = @seq,
    payment_type = @type,
    payment_installments = @installments,
    payment_value = @value;

DROP TABLE IF EXISTS products;

CREATE TABLE products (
    product_id VARCHAR(50) PRIMARY KEY,
    product_category_name VARCHAR(100),
    product_name_lenght INT,
    product_description_lenght INT,
    product_photos_qty INT,
    product_weight_g DECIMAL(10,2) NULL,
    product_length_cm DECIMAL(10,2) NULL,
    product_height_cm DECIMAL(10,2) NULL,
    product_width_cm DECIMAL(10,2) NULL
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/olist_products_dataset.csv'
INTO TABLE products
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@product_id, @category, @name_len, @desc_len, @photos, @weight, @length, @height, @width)
SET
    product_id = @product_id,
    product_category_name = @category,
    product_name_lenght = NULLIF(@name_len,''),
    product_description_lenght = NULLIF(@desc_len,''),
    product_photos_qty = NULLIF(@photos,''),
    product_weight_g = NULLIF(@weight,''),
    product_length_cm = NULLIF(@length,''),
    product_height_cm = NULLIF(@height,''),
    product_width_cm = NULLIF(@width,'');
    
DROP TABLE IF EXISTS sellers;

CREATE TABLE sellers (
    seller_id VARCHAR(50) PRIMARY KEY,
    seller_zip_code_prefix VARCHAR(10),
    seller_city VARCHAR(100),
    seller_state VARCHAR(10)
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/olist_sellers_dataset.csv'
INTO TABLE sellers
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@seller_id,@zip,@city,@state)
SET
    seller_id = @seller_id,
    seller_zip_code_prefix = @zip,
    seller_city = @city,
    seller_state = @state;

drop table if exists order_reviews;
CREATE TABLE order_reviews ( 
     review_id VARCHAR(50),
     order_id VARCHAR(50),
     review_score INT,
     review_comment_title VARCHAR(255),
     review_comment_message TEXT,
     review_creation_date DATETIME NULL,
     review_answer_timestamp DATETIME NULL,
     PRIMARY KEY (review_id) )
     ENGINE=InnoDB;
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/olist_order_reviews_dataset.csv'
IGNORE
INTO TABLE order_reviews
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@review_id,@order_id,@score,@title,@msg,@created,@answer)
SET
    review_id = @review_id,
    order_id = @order_id,
    review_score = @score,
    review_comment_title = NULLIF(@title,''),
    review_comment_message = NULLIF(@msg,''),
    review_creation_date = NULLIF(@created,''),
    review_answer_timestamp = NULLIF(@answer,'');