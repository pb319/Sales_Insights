SELECT * FROM sales.transactions;
SELECT ROUND(sum(sales_amount/1000000),2) as Revenue,
ROUND(sum(sales_qty/1000),2) as Sales,
round(sum(profit_margin/1000000),2) as Profit_Margin
FROM sales.transactions as t
INNER JOIN sales.date as d
ON t.order_date = d.date
WHERE currency = "INR"; -- AND  year = 2020;