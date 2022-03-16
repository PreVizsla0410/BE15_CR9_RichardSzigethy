SELECT * FROM item WHERE price <="50";
 
--2
 
-- shows the sum of my orders
 
SELECT SUM(sum) FROM orders;
 
226
 
-- shows the average sum of my orders
 
SELECT AVG(sum)
FROM orders;
 
75.3333
 
--adding together the orders ID´s and customer orders
 
select customer_ID, First_Name, Last_Name, address from customers join item on item_id = customer_ID;
 
--adding together order and shipping lists
 
select order_ID, customer_order, fk_shipping_ID, fk_customer_ID, order_ID from orders join shipping on shipping_id = fk_shipping_ID;