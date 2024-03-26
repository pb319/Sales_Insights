USE sales;
-- Exploring Customer table
SELECT * FROM customers LIMIT 50;
DESC customers;
SELECT count(DISTINCT customer_code), count(DISTINCT custmer_name), count(DISTINCT customer_type) FROM sales.customers;
SELECT DISTINCT customer_type FROM customers;
# There are 38 different customers divided into two types: Brick & MORtar, E-commerce

--  Exploring date table
SELECT * FROM date LIMIT 100;
DESC date;
SELECT count(DISTINCT date), count(DISTINCT cy_date), count(DISTINCT year), count(DISTINCT month_name), count(DISTINCT date_yy_mmm)
FROM date;
SELECT DISTINCT year FROM date;
# This database shows the sales fOR 4 years: 2017, 2018, 2019, 2020

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
# There are 17 different markets/location (called by the city name) 15 cities/ markets in india and their codes are a sequence of 001 to 015,
# and New YORk (Market Code 097) and Paris (Market Code 999). 
# There are 4 zones: NORth, South, Center (applies fOR the indian markets) and Blank fOR New YORk and Paris

--  Exploring product table
SELECT * FROM products LIMIT 100;
DESC products;
SELECT count(DISTINCT product_code), count(DISTINCT product_type) FROM sales.products;
SELECT DISTINCT product_type FROM products;
#There are 279 different products falls into two type: Own Brand, Distribution

--  Exploring transactions table
SELECT * FROM transactions LIMIT 100;
DESC transactions;
SELECT DISTINCT currency FROM transactions;
# Transaction tables shows sales amount in two different currencies. This should be fixed and shows sales amount only in one currency.
# All sales amount will be transfered to USD currency.

# Let's Dig Deeper into International Markets
SELECT * FROM sales.transactions 
INNER JOIN sales.markets on sales.transactions.market_code = sales.markets.markets_code 
WHERE sales.markets.markets_code = 'New York' OR sales.markets.markets_code  = 'Paris';
# There is no data i.e. Only Indigenous Market ins covered
# Henceforth We shall cover only Indian Market Sales Insigts.