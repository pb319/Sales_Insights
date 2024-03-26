# Sales_Insights
My First GitHub repository as well as the first-ever end-to-end Power BI project relating to sales insights of a fictional company named AtliQ Hardware.

#  *** Sales Insights ***
![Atliq](https://github.com/pb319/Sales_Insights/assets/66114329/b0296e2a-9be1-4636-be5d-ae412de02e28)

#### In this project I’ve simulated a business problem resolution for a hardware company in India where I used MySQL and Power BI for data mining and visualization.

#### **AtliQ Hardware**
- Is a company which supplies computer hardware and peripherals to many clients across India;
- The company has a head office in Delhi and regional offices throughout India.

### Imagine the scenario:

The Director **Bhavin Patel** is facing the issue of tracking the sales and other Major KPIs in this dynamically growing market.


## Dashboard Overview:

***
![01_Revenue](https://github.com/pb319/Sales_Insights/assets/66114329/1fece1fc-cb4d-4bf0-8551-a5436b5f3d62)



![02_Profit Margin](https://github.com/pb319/Sales_Insights/assets/66114329/27cf7bd4-3ef1-41bd-956c-4a867b3be8b8)



![03_Performance](https://github.com/pb319/Sales_Insights/assets/66114329/b31e9239-8892-46c5-9d99-24ea58c16ebe)
***

**DATA EXPLORATION**

Before the data cleaning and data analysis, It was needed to understand and explore the database (see what data the database presents, in which format, how it is presenting the data, what are the fact tables and what are the dimension tables) decide which data is useful for the data analysis goal to extract.

Below is showing the SQL queries run to explore the database:
```
Data Exploration:
------------------------------------------------
USE sales;
-- Exploring Customer table
SELECT * FROM customers LIMIT 50;
DESC customers;
SELECT count(DISTINCT customer_code), count(DISTINCT custmer_name), count(DISTINCT customer_type) FROM sales.customers;
SELECT DISTINCT customer_type FROM customers;
# There are 38 different customers divided into two types: Brick & Mortar, E-commerce

--  Exploring data table
SELECT * FROM date LIMIT 100;
DESC date;
SELECT count(DISTINCT date), count(DISTINCT cy_date), count(DISTINCT year), count(DISTINCT month_name), count(DISTINCT date_yy_mmm)
FROM date;
SELECT DISTINCT year FROM date;
# This database shows the sales for 4 years: 2017, 2018, 2019, 2020

--  Exploring market table
SELECT * FROM sales.markets LIMIT 50;
DESC sales.markets;
SELECT count(DISTINCT markets_code), count(DISTINCT markets_name), count(DISTINCT zone) FROM sales.markets;
SELECT markets_code, markets_name 
FROM markets 
GROUP BY markets_code;
SELECT DISTINCT markets_code FROM markets;
SELECT DISTINCT count(markets_name) FROM markets;
SELECT DISTINCT zone FROM markets;
# There are 17 different markets/locations (called by the city name) 15 cities/ markets in India and their codes are a sequence of 001 to 015,
# and New York (Market Code 097) and Paris (Market Code 999). 
# There are 4 zones: North, South, Center (applies fOR the Indian markets) and Blank fOR New York and Paris

--  Exploring product table
SELECT * FROM products LIMIT 100;
DESC products;
SELECT count(DISTINCT product_code), count(DISTINCT product_type) FROM sales.products;
SELECT DISTINCT product_type FROM products;
#There are 279 different products fall into two types: Own Brand, Distribution

--  Exploring transactions table
SELECT * FROM transactions LIMIT 100;
DESC transactions;
SELECT DISTINCT currency FROM transactions;
# Transaction tables show sales amounts in two different currencies. This should be fixed and show the sales amount only in one currency.
# All sales amount will be transferred to USD currency.

# Let's Dig Deeper into International Markets
SELECT * FROM sales.transactions 
INNER JOIN sales.markets on sales.transactions.market_code = sales.markets.markets_code 
WHERE sales.markets.markets_code = 'New York' OR sales.markets.markets_code  = 'Paris';
# There is no data i.e. Only Indigenous Market ins covered
# Henceforth We shall cover only Indian Market Sales Insigts.


Primary Cleaning
----------------------

USE Sales;
-- Primary Cleaning
SELECT * FROM customers;

-- Deleting "New York", and "Paris" row
set sql_safe_updates = 0;
DELETE FROM markets
WHERE markets.markets_name in ('New York', 'Paris');
SELECT * FROM markets;
SELECT count(DISTINCT markets_code), count(DISTINCT markets_name), count(DISTINCT zone) FROM sales.markets;
SELECT markets_code, markets_name 
FROM markets 
GROUP BY markets_code;

SELECT distinct(markets_code) FROM date;
SELECT distinct(markets_code) FROM s.transactions 
inner join markets 
on sales.transactions.market_code = sales.markets.markets_code
# The currency needs to fixed (transfered to doller), it will be done in Power Query in data cleaning stage


```
