CREATE TABLE "Customer" (
    customer_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    phone VARCHAR(30),
    address VARCHAR(300)
);


CREATE TABLE "Category" (
    category_id SERIAL PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL,
    description TEXT
);


CREATE TABLE "BrandCollection" (
    brandcollection_id SERIAL PRIMARY KEY,
    brand_name VARCHAR(150) NOT NULL,
    description TEXT
);


CREATE TABLE "Shipping" (
    shipping_id SERIAL PRIMARY KEY,
    shipping_address VARCHAR(300) NOT NULL,
    shipping_date DATE,
    delivery_date DATE,
    carrier VARCHAR(100),
    status VARCHAR(50)
);


CREATE TABLE "Product" (
    product_id SERIAL PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    description TEXT,
    price DECIMAL(10,2) NOT NULL,
    stock_quantity INT DEFAULT 0,
    category_id INT,
    brandcollection_id INT,
    CONSTRAINT fk_product_category FOREIGN KEY (category_id)
        REFERENCES "Category" (category_id)
        ON DELETE SET NULL
        ON UPDATE CASCADE,
    CONSTRAINT fk_product_brand FOREIGN KEY (brandcollection_id)
        REFERENCES "BrandCollection" (brandcollection_id)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);


CREATE TABLE "Orders" (
    order_id SERIAL PRIMARY KEY,
    order_date DATE NOT NULL DEFAULT CURRENT_DATE,
    status VARCHAR(50),
    total_amount DECIMAL(12,2),
    customer_id INT NOT NULL,
    shipping_id INT,
    CONSTRAINT fk_orders_customer FOREIGN KEY (customer_id)
        REFERENCES "Customer" (customer_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT fk_orders_shipping FOREIGN KEY (shipping_id)
        REFERENCES "Shipping" (shipping_id)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);


CREATE TABLE "OrderLine" (
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (order_id, product_id),
    CONSTRAINT fk_orderline_order FOREIGN KEY (order_id)
        REFERENCES "Orders" (order_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT fk_orderline_product FOREIGN KEY (product_id)
        REFERENCES "Product" (product_id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);


CREATE TABLE "Payment" (
    payment_id SERIAL PRIMARY KEY,
    order_id INT NOT NULL,
    payment_date DATE NOT NULL DEFAULT CURRENT_DATE,
    amount DECIMAL(12,2) NOT NULL,
    payment_method VARCHAR(50),
    status VARCHAR(50),
    CONSTRAINT fk_payment_order FOREIGN KEY (order_id)
        REFERENCES "Orders" (order_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
