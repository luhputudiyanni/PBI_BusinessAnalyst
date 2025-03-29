CREATE TABLE `bank_muamalat.master_table` AS
SELECT 
    o.Date AS order_date,
    pc.CategoryName AS category_name,
    p.ProdName AS product_name,
    p.Price AS product_price,
    o.Quantity AS order_qty,
    (o.Quantity * p.Price) AS total_sales,
    c.CustomerEmail AS cust_email,
    c.CustomerCity AS cust_city
FROM 
    `bank_muamalat.orders` o
JOIN 
    `bank_muamalat.products` p 
    ON p.ProdNumber = o.ProdNumber
JOIN 
    `bank_muamalat.productcategory` pc 
    ON pc.CategoryID = p.Category
JOIN 
    `bank_muamalat.customers` c 
    ON o.CustomerID = c.CustomerID
ORDER BY 
    order_date ASC;
