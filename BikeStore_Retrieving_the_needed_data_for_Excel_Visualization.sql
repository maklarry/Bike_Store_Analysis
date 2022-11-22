/*After loading the BikeStore SQL Scripts we will have to join the data we need and then export it to Excel for analysis 
and Visualization*/

SELECT
 ord.order_id,
 cus.first_name +' '+ cus.last_name Full_name,
 cus.city,cus.state,
 ord.order_date,
 SUM(ite.quantity) total_units,
 SUM(ite.quantity*ite.list_price) revenue,
 pro.product_name,
 cat.category_name,
 sto.store_name,
 staf.first_name+' '+staf.last_name Staff_Full_name
FROM sales.orders ord
JOIN sales.customers cus
ON ord.customer_id = cus.customer_id
JOIN sales.order_items ite
ON ord.order_id = ite.order_id
JOIN production.products pro
ON ite.product_id = pro.product_id 
JOIN production.categories cat
ON pro.category_id = cat.category_id
JOIN sales.stores sto
ON sto.store_id = ord.store_id
JOIN sales.staffs staf
ON staf.staff_id = ord.staff_id
GROUP BY 
  ord.order_id,
  cus.first_name +' '+ cus.last_name,
  cus.city,cus.state,
  ord.order_date,
  pro.product_name,
  cat.category_name,
  sto.store_name,
  staf.first_name+' '+staf.last_name
  
/*The SQL Script above gives us the order id, customer full name, city and state, order date,revenue,product name and category,
store name and staff name
We then export the database to Excel using the "Get External Data" in Excel and input the SQL Script above. This will return only the data we need to analyze from the dataset */  