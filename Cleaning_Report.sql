USE Sales;
-- Primary Cleaning
SELECT * FROM customers;

-- Deleting "New York", "Paris" row
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
