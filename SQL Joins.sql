/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
SELECT products.Name, categories.Name FROM products JOIN categories ON categories.CategoryID = products.CategoryID WHERE categories.Name = "Computers";
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
SELECT products.NAME, reviews.Rating FROM products JOIN reviews ON products.ProductID = reviews.ProductID WHERE reviews.Rating = 5;
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
SELECT employees.FirstName, employees.LastName, SUM(sales.Quantity) AS TotalSales 
FROM sales JOIN employees 
ON sales.EmployeeID = employees.EmployeeID 
GROUP BY employees.FirstName, employees.LastName 
ORDER BY TotalSales DESC Limit 2;
/* joins: find the name of the department, and the name of the category for Appliances and Games */
SELECT d.Name AS "Dept Name", c.Name AS "Category Name"
FROM departments AS d JOIN categories AS c
ON d.departmentID = c.DepartmentID
WHERE c.Name = 'Appliances' OR c.Name = 'Games';
/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM()-- Product ID = 97*/
SELECT p.Name, SUM(s.Quantity) AS 'Total Sold', s.PricePerUnit AS 'Unit Price', (p.Price * SUM(s.Quantity)) AS 'Total Sales'
FROM products AS p
JOIN sales AS s
ON p.ProductID = s.ProductID
WHERE p.Name LIKE '%Hotel Cali%';
/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
SELECT p.Name AS 'Product Name', r.Reviewer, r.Rating, r.Comment
FROM products AS p
JOIN reviews AS r
ON p.ProductID = r.ProductID
WHERE p.ProductID = 857 AND r.Rating = 1; 

-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */
SELECT e.EmployeeID AS "Employee ID", e.LastName AS "Last Name", e.FirstName AS "First Name", p.Name AS "Product Name", SUM(s.Quantity) AS "Total Sold"
FROM sales AS s JOIN employees AS e
ON e.EmployeeID = s.EmployeeID
JOIN products AS p ON p.ProductID = s.ProductID
GROUP BY e.EmployeeID, p.ProductID
ORDER BY e.LastName;
