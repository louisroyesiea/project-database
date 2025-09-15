# OnlineStore - Database

## Context

OnlineStore is an online shop selling shoes, accessories, and clothing.  
This database was created to manage customers, products, orders, payments, and shipments. It allows easy tracking of sales and stock.

--------------------------------------------------------------------------------------------------------------------------------------------------------------------

## Tables

Here are the main tables in the database and their purpose:

**Customer**: contains customer information (name, email, phone, address).  
**Category**: groups products by category (shoes, accessories, clothing).  
**BrandCollection**: contains the different brands or product collections.  
**Product**: lists all available products with price, stock, and category.  
**Orders**: records orders placed by customers, including total amount and status.  
**OrderLine**: details each order (products and quantities), linked to a specific order.  
**Payment**: records payments for each order (amount, date, method, status).  
**Shipping**: contains information about order deliveries (address, dates, carrier, status).

--------------------------------------------------------------------------------------------------------------------------------------------------------------------

## Notes

The database includes all relationships between tables to ensure data integrity.  
