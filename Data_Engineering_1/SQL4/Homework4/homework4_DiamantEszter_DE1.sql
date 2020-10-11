-- Exercise1: Join all fields of order and orderdetails
SELECT * FROM orders inner join orderdetails on orders.orderNumber = orderdetails.orderNumber;

-- Exercise2: Join all fields of order and orderdetails. Display only orderNumber, status and sum of totalsales (quantityOrdered * priceEach) for each orderNumber.
use classicmodels;
SELECT 
	t1.orderNumber,
    t1.status,
    sum(quantityOrdered * priceEach) totalsales
    FROM orders t1
    inner join orderdetails t2
    on t1.orderNumber = t2.orderNumber
    group by orderNumber;
    
    
-- Exercise3: We want to how the employees are performing. Join orders, customers and employees and return orderDate,lastName, firstName
SELECT orderDate, lastName, firstName
	from orders t1
    inner join customers t2
    using (customerNumber)
    inner join employees t3
    on t2.salesRepEmployeeNumber = t3.employeeNumber;
    
-- Exercise4: Why President is not in the list?
-- Because the presidentdoes not report to anyone theoritically and he was left out in the INNER JOIN. In order to iclude, the INNER JOIN must be changed to LEFT JOIN

-- Homework:
-- INNER join orders,orderdetails,products and customers. Return back:
select t1.orderNumber, t1.priceEach, t1.quantityOrdered, t2.orderDate, t3.city, t3.country, t4.productLine, t4.productName from orderdetails t1 inner join orders t2 using(orderNumber) inner join customers t3 using (customernumber) inner join products t4 on t1.productCode = t4.productCode;
select orderNumber, priceEach, quantityOrdered from orderdetails;
-- orderNumber,

-- priceEach,

-- quantityOrdered,

-- productName,

-- productLine,

-- city,

-- country,

-- orderDate,

