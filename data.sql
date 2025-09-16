INSERT INTO "Customer" (name, email, phone, address) VALUES
('Tom Jean', 'Jean@example.com', '0123456789', '123 rue A'),
('Louis Roy', 'Louis@example.com', '0987654321', '456 rue B');


INSERT INTO "Category" (category_name, description) VALUES
('Shoes', 'Chaussures sport'),
('Accessories', 'Sacs et ceintures');


INSERT INTO "BrandCollection" (brand_name, description) VALUES
('Nike', 'Marque sportive'),
('Adidas', 'Marque allemande');


INSERT INTO "Product" (name, description, price, stock_quantity, category_id, brandcollection_id) VALUES
('Air Max 90', 'Sneakers confortables', 120.00, 50, 1, 1),
('Adidas Superstar', 'Chaussures classiques', 90.00, 30, 1, 2),
('Nike Backpack', 'Sac à dos sport', 60.00, 20, 2, 1);


INSERT INTO "Shipping" (shipping_address, shipping_date, delivery_date, carrier, status) VALUES
('123 rue A', '2025-09-16', '2025-09-18', 'DHL', 'Pending'),
('456 rue B', '2025-09-16', '2025-09-19', 'UPS', 'Pending');


INSERT INTO "Orders" (order_date, status, total_amount, customer_id, shipping_id) VALUES
('2025-09-16', 'Paid', 240.00, 1, 1),
('2025-09-16', 'Pending', 90.00, 2, 2);


INSERT INTO "OrderLine" (order_id, product_id, quantity, unit_price) VALUES
(1, 1, 2, 120.00),
(2, 2, 1, 90.00);


INSERT INTO "Payment" (order_id, payment_date, amount, payment_method, status) VALUES
(1, '2025-09-16', 240.00, 'Credit Card', 'Completed'),
(2, '2025-09-16', 90.00, 'PayPal', 'Pending');
