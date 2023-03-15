# Retail-Sales-Analysis

# Introduction

The dataset contains retail orders from 11 Locations (Lagos, FCT, Ogun, Gauteng, Kano, Anambra, Abia, Oyo, Rivers, Katlehong, Soweto) in 2 different countries (Nigeria and South Africa). The purpose of the analysis is to understand the business flow, sales performance accross the States, different time of day and by delivery agents. The dataset conay=tains only data for sales in the month of july 2021.

The revenue was captured in the local currency of the respective country. The business required the analysis to be done in USD. I first converted the Revenue to USD using the FX rate provided by the business.


# Business Task

1. Analyse the number of orders by time of Day highlighting peak periods on the days
2. Average SKU Lines bought by customers per Producer
3. Provide an analysis of Sales Volume by Producer also, showing the Number of Cases for each
4. Provide a ranking of products by number of customers who purchased them
5. What is the relative contribution of the sales channels to the top 5 products in this ranking. 
6. Peak Delivery Time (Hours of the Day)
7. Average Fulfilment Time per State
8. Fulfilment Rate by Delivery Agent
9. What is the performance of the different product category group?
10. Who are the top 5 customers with the highest revenue contribution?
11. Analyze sales performance by location
12. What is the order Fulfillment Rate?
13. What is the number of SKUs per retail outlet type?
14. Who is the top Delivery Agent by Average delivery time?


# Analysis

Analysis was done using SQL. I chose to use SQL for the analysis because it can process and manipulate large amount of data much faster than excel. 

The dataset was first uploaded on SQL Server, where I cleaned the data, normalized some of the columns and created additional columns that will be required for the analysis.

[This](https://github.com/Ernest-30/Retail-Sales-Analysis/blob/main/RetailSalesAnalysis.sql) is the SQL code for the analysis.



# Summary

Number of Outlets - 2,072 

Number of Orders	- 8,904	

Total Quantity Ordered - 36,915

Total Volume (USD) - 384,723.74 USD

Average Delivery Time	- 40hrs

Number of SKUs - 264

% of orders with late deliveries - 24%



# Findings

1. The total number of orders received was 8,904. The time of Day highest number of orders received was 10:00 am with a total of 1,059 orders.

![image](https://user-images.githubusercontent.com/123366282/225406984-eb01f674-342a-4b4e-bd23-5012e2d1d74c.png)


2. On the Average, customers purchased more products from Danone Nigeria (9), this means that a mix of prodcuts manufactured by Danone Nigeria are usually bought together.


![image](https://user-images.githubusercontent.com/123366282/225391768-ced81435-bac2-44d9-8332-e27904278c4a.png)


3. In terms of sales volume, Arla Foods prodcuts contributed the highest amount of revenue, 133,121.97 USD, with a total of 778 orders and 4,690.25	quantities ordered

![image](https://user-images.githubusercontent.com/123366282/225393240-12c3d4e2-1fcd-48ce-afca-23d6ff9dd6f3.png)


4. Provide a ranking of products by number of customers who purchased them: 
Dano Cool Cow Rank 1st in terms of number of customers  (675) who bought the product. It also generated a revenue of 107,059.9  USD.

![image](https://user-images.githubusercontent.com/123366282/225400454-f8f77bb1-3795-46ed-819e-7b6a74732e90.png)


5. What is the relative contribution of the sales channels to the total revenue generated:

Field Sales has the highest revenue contribution of 272,562.43 USD with a total of 1,440 orders and 20,996 quanties ordered through the channel. it is also interesting to note that Mobile App has the highest contribution in terms of number of orders with a total of 4,087 recieved through the channel but has the lowest revenue genrated of 33,942.46 USD and 7,084 quantities ordered.

![image](https://user-images.githubusercontent.com/123366282/225406879-8d3acf83-e89b-4918-a3f1-b3f87b37169b.png)


6. Peak Delivery Time (Hours of the Day):

The peak delivery time of the day is 11:00 am with a total of 1,112 orders delivered.

![image](https://user-images.githubusercontent.com/123366282/225408003-df1a1dd0-c9cc-4f0e-8e3b-12261bfd6374.png)



7. Average Fulfilment Time per State

The State with the fastest delivery time on the average is Anambra with average delivery time of 16 hours. While Rivers State has the slowest delivery time with an average of  103 hours.

![image](https://user-images.githubusercontent.com/123366282/225408463-6c389b48-117e-4be7-91df-f57df0ea61d9.png)


8. Fulfilment Rate by Delivery Agent:

The top performing delivery agent is Kagiso Katlego with a total of 1,313 (23.08% of the total orders received) delivered orders 


![image](https://user-images.githubusercontent.com/123366282/225409495-ebbd69a1-bf71-4af1-a4f3-3fc988018834.png)


9. What is the performance of the different product category group?

The highest performing category group in terms of revenue is Breakfast & Snacks with a total of 2,033 orders, 11,409.5 quantites ordered and a revenue generation of 186,860.77 USD


![image](https://user-images.githubusercontent.com/123366282/225412112-15b1368c-7ca3-4832-89c8-e5aa60545010.png)


10. Who are the top 5 customers with the highest revenue contribution?

The top 5 Customers with the highest revenue contribution are;

Iya Ruka K Store - 7,657.18

Ben Green Venture Store - 6,886.21

Royal Born Store Lagos State - 6,843.48

Gidan Sama Supermarket - 5,684.09

Nonye Store - 5,184.59

![image](https://user-images.githubusercontent.com/123366282/225414012-877924ea-3a31-4d71-830a-6f49785e2e87.png)


11. Analyze sales performance by location;

Lagos, Nigeria is the highest performing location in terms of revenue contribution with 3,838 orders recieved, 19,007 quantities ordered and revenue of 247,780.53 USD/ While the lowest performing location is Soweto, South Africa with a total of 8	orders, 11 quantites ordered and revenue of 22.98 USD.

![image](https://user-images.githubusercontent.com/123366282/225415612-8c300235-3ec0-4f26-b2f3-193d1f473b89.png)


12. Fulfillment Rate;

Out of the 8,904 orders received, 7,957(97.14%) were delivered while 947 (2.86%) was cancelled

![image](https://user-images.githubusercontent.com/123366282/225417807-33345d75-0a43-41c6-9038-457b8c49d91e.png)


13. What is the number of SKUs per retail outlet type?

The distribution of SKus per outlet type are;

Convenience Store	- 227
Kiosk             - 222
Supermarket	      - 232


![image](https://user-images.githubusercontent.com/123366282/225418686-cd6c02f2-7697-4df4-ba37-945cd4dba4e1.png)


14. Who is the top Delivery Agent by Average delivery time?

The delivery agent with the fasts delivery time is Emeka Nnaemeka with an average delivery time of 16 hours


![image](https://user-images.githubusercontent.com/123366282/225419984-dc268a60-3848-4347-8d53-b7d57c5c3b65.png)



# Visualization

Visualization was done on Tableau. I created an interactive dashboard using tableau to visualize results of the analysis. CLick [Here](https://public.tableau.com/app/profile/ernest.obi/viz/Retail_Orders/GeneralDashboard#1) to view the full Dashboard.




