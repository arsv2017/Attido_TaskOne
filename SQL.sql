

SELECT orderdate, orderdetailID, quantity* price as totalprice, categoryid * quantity as totalweight FROM(
SELECT orderdate, orderdetailID, quantity, productID FROM Orders
INNER JOIN OrderDetails ON Orders.OrderID=OrderDetails.OrderID)a
INNER JOIN Products ON a.productID = Products.productID




1


SELECT a.description as OrderDescription, a.number, items.description as ItemDescription,
a.quantity* items.price as TotalPrice, items.weight * a.quantity as TotalWeight 

FROM(

SELECT Orders.description, orderLines.number, orderLines.quantity, orderLines.itemID 

FROM Orders INNER JOIN OrderLines ON Orders.ID=OrderLines.OrderID)a


INNER JOIN Items ON a.itemID = Items.ID


2


select b.description, sum(price*quantity) as TotalSum, b.Quantity from (

Select a.description, a.orderID, a.itemID, a.quantity, price from( 

SELECT orders.description, orders.ID, OrderLines.itemID, orderLines.quantity  FROM Orders
Inner Join OrderLines ON Orders.ID=OrderLines.orderID)a

inner join items on items.ID=a.itemID)b
group by orderID


3

select c.description, max(c.max) from(
select b.description, sum(price*quantity) as TotalSum from (

Select a.description, a.orderID, a.itemID, a.quantity, price from( 

SELECT orders.description, orders.ID, OrderLines.itemID, orderLines.quantity  FROM Orders
Inner Join OrderLines ON Orders.ID=OrderLines.orderID)a

inner join items on items.ID=a.itemID)b
group by orderID)c








select c.orderdate, max(c.sum) from(
select b.orderdate, orderid, sum(price*quantity) as sum, b.quantity from (

Select a.orderdate, a.orderid, a.productid, a.quantity, price from( 

SELECT orderDate, orders.orderid, productid,quantity  FROM Orders
Inner Join OrderDetails ON Orders.orderid=orderdetails.orderid)a

inner join products on products.productid=a.productid)b
group by b.orderid)c



















