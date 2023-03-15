USE RetailOrders

SELECT *
FROM Orders
ORDER BY 1

----------------------------------------------------------------------------------------------------------------------------------------------------
--Converting Unit Price to USD

UPDATE Orders
SET [Unit Price] = [Unit Price]/14.72
WHERE country = 'ZA'

UPDATE Orders
SET [Unit Price] = [Unit Price]/402
WHERE country = 'NG'

-------------------------------------------------------------------------------------------------------------------------------------------------------
--Adding a Revenue Column

ALTER TABLE ORDERS
ADD Revenue Float;

--Updating the Revenue Column

UPDATE Orders
SET Revenue = ROUND ([Unit Price]*Quantity, 2)

----------------------------------------------------------------------------------------------------------------------------------------------------------
--Adding column for total hours

ALTER TABLE ORDERS
ADD Total_hours INT;

--Updating Column for Delivery time

UPDATE Orders
SET Total_hours = DATEDIFF (HOUR,[OrderAt Date],[Delivery Date]) 


----------------------------------------------------------------------------------------------------------------------------------------------------------

--Overview

SELECT COUNT ([Order No#])  AS Total_Orders, COUNT (DISTINCT [customer Name]) AS Number_of_outlets, 
		ROUND (SUM (Revenue),2) AS Total_Revenue_USD, COUNT (DISTINCT [Producer]) AS Number_of_producers, COUNT (DISTINCT [Product]) AS Number_of_products ,
		COUNT (DISTINCT [Product Variant ]) AS Number_of_SKUs, SUM (Quantity) AS Quantity_ordered,
		AVG (DATEDIFF (HOUR,[OrderAt Date],[Delivery Date])) AS Average_delivery_hours
FROM Orders

----------------------------------------------------------------------------------------------------------------------------------------------------------
--Number of SKUs and quantity ordered by OutletTpye

SELECT outletType, COUNT (DISTINCT [Product Variant ]) AS Number_of_SKUs, SUM (Quantity) AS Quantity_ordered
FROM Orders
GROUP BY outletType

--------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Fullfilment Rate

SELECT shippingStatus, COUNT ([Order No#]) AS Number_of_Orders,  SUM (Quantity) AS Quantity_ordered
FROM Orders
GROUP BY shippingStatus

--------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Orders by time of day

SELECT DATEPART(HOUR,[OrderAt Date]) AS Time_of_Day, COUNT ([Order No#]) AS Number_of_Orders, SUM (Quantity) AS Quantity_ordered
FROM Orders
GROUP BY DATEPART(HOUR,[OrderAt Date])
ORDER BY 2 DESC


----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Percentage of Orders with late delivery

SELECT COUNT ([Order No#]) AS Total_orders, SUM (CASE WHEN Total_hours >48 THEN 1 ELSE 0 END) AS Late_delivery, 
		100* SUM (CASE WHEN Total_hours >48 THEN 1 ELSE 0 END)/COUNT ([Order No#]) AS Percentage_of_late_delivery
FROM Orders


--------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Average SKU lines bought by customers per producer

	SELECT Producer, AVG (Number_of_SKUs) AS Average_SKU
			FROM
				(SELECT [customer Name],Producer, COUNT ( DISTINCT [Product Variant ]) AS Number_of_SKUs
				FROM Orders
				GROUP BY Producer,[customer Name]) AS Producer_SKU_Count
			GROUP BY Producer
			ORDER BY 2 DESC

--------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Sales Volume by Producer

SELECT Producer, COUNT ( [Order No#]) AS Number_of_Orders, SUM (Quantity) AS Quantity_ordered, ROUND (SUM (Revenue),2) AS Total_Revenue
FROM Orders
GROUP BY Producer
ORDER BY 4 DESC

--------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Product Ranking by Customers who bought them

SELECT Product, COUNT ([customer Name]) AS Number_of_customers, ROUND (SUM (Revenue),2)  AS Total_Revenue, RANK () OVER (ORDER BY SUM (Revenue) DESC ) AS Product_rank
FROM Orders	
GROUP BY Product
ORDER BY 4 

--------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Sales channel performance

SELECT salesChannel, COUNT ([Order No#]) AS Number_of_orders, SUM (Quantity) AS Quantity_ordered,ROUND (SUM (Revenue),2) AS Total_Revenue
FROM Orders
GROUP BY salesChannel
ORDER BY 4 DESC

--------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Delivery by time of day

SELECT DATEPART(HOUR,[Delivery Date]) AS Time_of_Day, COUNT ([Order No#]) AS Number_of_Orders
FROM Orders
GROUP BY DATEPART(HOUR,[Delivery Date])
ORDER BY 2 DESC

--------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Average Fulfillment time per state

SELECT 	State,AVG (DATEDIFF (HOUR,[OrderAt Date],[Delivery Date])) AS Average_delivery_hours
FROM Orders
GROUP BY state
ORDER BY 2 

--------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Fullfilment Rate by Delivery Agent

SELECT [Delivery Agent], shippingStatus, COUNT ([Order No#]) AS Number_of_Orders
FROM Orders
GROUP BY shippingStatus,[Delivery Agent]
ORDER BY 3 DESC
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Sales by category group

SELECT [Category Group], COUNT ([Order No#]) AS Number_of_orders, SUM (Quantity) AS Quantity_ordered,ROUND (SUM (Revenue),2) AS Total_Revenue
FROM Orders
GROUP BY [Category Group]
ORDER BY 4 DESC

--------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Top 5 customers by Revenue

SELECT TOP 5 [customer Name],COUNT ([Order No#]) AS Number_of_orders,SUM (Quantity) AS Quantity_ordered, ROUND (SUM(Revenue),2) AS Total_Revenue
FROM Orders
GROUP BY [customer Name]
ORDER BY 3 DESC

--------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Performance by location

SELECT Country, state, COUNT ([Order No#]) AS Number_of_orders,SUM (Quantity) AS Quantity_ordered, ROUND (SUM(Revenue),2) AS Total_Revenue
FROM Orders
GROUP BY Country, state
ORDER BY 5 DESC

--------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Top 10 Delivery Agent by Average delivery time

SELECT TOP 10 [Delivery Agent], COUNT ([Order No#]) AS Number_of_orders,SUM (Quantity) AS Quantity_ordered, ROUND (SUM(Revenue),2) AS Total_Revenue, 
		AVG (DATEDIFF (HOUR,[OrderAt Date],[Delivery Date])) AS Average_delivery_hours
FROM Orders
GROUP BY [Delivery Agent]
HAVING AVG (DATEDIFF (HOUR,[OrderAt Date],[Delivery Date])) > 0
ORDER BY 5



