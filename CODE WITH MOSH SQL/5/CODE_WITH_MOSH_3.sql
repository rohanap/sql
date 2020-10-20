SELECT * FROM sql_store.orders;

SELECT *
FROM sql_store.orders
Where order_date > '2018-01-01'
order by order_date;

SELECT *
FROM order_items
WHERE order_id = 6 and (quantity * unit_price) > 30;

SELECT *
FROM customers
where state IN  ("VA","FL","GA");

SELECT *
FROM customers
where state NOT IN  ("VA","FL","GA");