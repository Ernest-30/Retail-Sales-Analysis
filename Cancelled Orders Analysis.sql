USE RetailOrders

SELECT*
FROM Orders
WHERE shippingStatus = 'Cancelled'

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Overview of Cancelled Orders
SELECT COUNT ([Order No#]) AS CancelledOrders, ROUND (SUM (Revenue),2) AS Loss_sales, COUNT (DISTINCT [customer Name]) AS Number_of_outlets,
		COUNT (DISTINCT [Product]) AS Number_of_products, COUNT (DISTINCT [Product Variant ]) AS Number_of_SKUs, 
		SUM (Quantity) AS Quantity_Cancelled,
		AVG (DATEDIFF (HOUR,[OrderAt Date],[Delivery Date])) AS Average_cancellation_hours --COUNT ([customer Name]) AS Nuber_of_Customers, 
FROM Orders
WHERE shippingStatus = 'Cancelled'

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Cancelled Orders by Outlet Type

SELECT OutletType, COUNT ([Order No#]) AS CancelledOrders, COUNT (DISTINCT [Product Variant ]) AS Number_of_SKUs_Cancelled, 
		SUM (Quantity) AS Quantity_Cancelled, ROUND (SUM (Revenue),2) AS Loss_sales
FROM Orders
WHERE shippingStatus = 'Cancelled'
GROUP BY outletType
ORDER BY 2 DESC

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Order Cancellation by time of day

SELECT DATEPART(HOUR,[OrderAt Date]) AS Time_of_Day, COUNT ([Order No#]) AS CancelledOrders, 
		SUM (Quantity) AS Quantity_Cancelled,ROUND (SUM (Revenue),2) AS Loss_sales
FROM Orders
WHERE shippingStatus = 'Cancelled'
GROUP BY DATEPART(HOUR,[OrderAt Date])
ORDER BY 2 DESC

--------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Average SKU lines Cancelled by customers per producer

	SELECT Producer, AVG (Number_of_SKUs) AS Average_SKU
			FROM
				(SELECT [customer Name],Producer, COUNT ( DISTINCT [Product Variant ]) AS Number_of_SKUs
				FROM Orders
				WHERE shippingStatus = 'Cancelled'
				GROUP BY Producer,[customer Name]) AS Producer_SKU_Count
			GROUP BY Producer
			ORDER BY 2 DESC
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Cancelled Volume per Producer

SELECT Producer,COUNT ([Order No#]) AS CancelledOrders, SUM (Quantity) AS Quantity_Cancelled, ROUND (SUM (Revenue),2) AS Loss_sales
FROM Orders
WHERE shippingStatus = 'Cancelled'
GROUP BY Producer
ORDER BY 4 DESC

--------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Product Ranking by Customers who Cancelled their Orders

SELECT Product, COUNT ([customer Name]) AS Number_of_customers, ROUND (SUM (Revenue),2) AS Loss_sales, RANK () OVER (ORDER BY SUM (Revenue) DESC ) AS Product_rank
FROM Orders	
WHERE shippingStatus = 'Cancelled'
GROUP BY Product
ORDER BY 4 

--------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Cancelled Orders by Sales channel 

SELECT SalesChannel, COUNT ([Order No#]) AS CancelledOrders, SUM (Quantity) AS Quantity_Cancelled, ROUND (SUM (Revenue),2) AS Loss_sales
FROM Orders
WHERE shippingStatus = 'Cancelled'
GROUP BY salesChannel
ORDER BY 2 DESC
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Cancelled Orders by category group

SELECT [Category Group], COUNT ([Order No#]) AS CancelledOrders, SUM (Quantity) AS Quantity_Cancelled, ROUND (SUM (Revenue),2) AS Loss_sales
FROM Orders
WHERE shippingStatus = 'Cancelled'
GROUP BY [Category Group]
ORDER BY 2 DESC

--------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Top 5 customers by Cancelled Orders

SELECT TOP 5 [customer Name], COUNT ([Order No#]) AS CancelledOrders, SUM (Quantity) AS Quantity_Cancelled, ROUND (SUM (Revenue),2) AS Loss_sales
FROM Orders
WHERE shippingStatus = 'Cancelled'
GROUP BY [customer Name]
ORDER BY 2 DESC

--------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Cancelled Orders per location

SELECT Country, state, COUNT ([Order No#]) AS CancelledOrders, SUM (Quantity) AS Quantity_Cancelled, ROUND (SUM (Revenue),2) AS Loss_sales
FROM Orders
WHERE shippingStatus = 'Cancelled'
GROUP BY Country, state
ORDER BY 3 DESC

--------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Cancelled Orders per Delivery Agent

SELECT [Delivery Agent], shippingStatus, COUNT ([Order No#]) AS CancelledOrders, ROUND (SUM (Revenue),2) AS Loss_sales
FROM Orders
WHERE shippingStatus = 'Cancelled'
GROUP BY shippingStatus,[Delivery Agent]
ORDER BY 3 DESC



