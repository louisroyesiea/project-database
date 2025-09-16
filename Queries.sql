--Customer orders with totals
SELECT 
    o.order_id, 
    o.order_date,
    o.status, --Order status 
    SUM(ol.quantity * ol.unit_price) AS order_total  --Total amount for the order
FROM "Orders" o
JOIN "OrderLine" ol 
    ON o.order_id = ol.order_id   --Join order lines to the order
JOIN "Customer" c 
    ON o.customer_id = c.customer_id  --Filter by customer
WHERE c.customer_id = 1  --Replace with desired customer ID
GROUP BY o.order_id, o.order_date, o.status  --Group by order to calculate total
ORDER BY o.order_date DESC;  --Sort orders by most recent first


--Products in a specific collection
SELECT 
    p.product_id,   
    p.name,  
    p.price  
FROM "Product" p
JOIN "BrandCollection" bc 
    ON p.brandcollection_id = bc.brandcollection_id  
WHERE bc.brand_name = 'Nike';  


--Top 5 products sold
SELECT 
    p.product_id,  
    p.name,  
    SUM(ol.quantity) AS qty_sold  --Total quantity sold
FROM "OrderLine" ol
JOIN "Product" p 
    ON ol.product_id = p.product_id  
GROUP BY p.product_id, p.name   
ORDER BY qty_sold DESC  
LIMIT 5;  -


--Orders awaiting shipment
SELECT 
    o.order_id,  
    c.name AS client,  
    o.order_date  
FROM "Orders" o
LEFT JOIN "Shipping" s 
    ON o.shipping_id = s.shipping_id  
JOIN "Customer" c 
    ON o.customer_id = c.customer_id  
WHERE s.shipping_id IS NULL  --No shipping assigned yet
   OR s.status = 'Pending';  



--Total stock by category
SELECT 
    cat.category_name,  
    SUM(p.stock_quantity) AS total_stock 
FROM "Product" p
JOIN "Category" cat 
    ON p.category_id = cat.category_id  
GROUP BY cat.category_name;  





