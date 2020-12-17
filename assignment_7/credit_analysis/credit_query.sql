-- View our tables
select * from card_holder;
select * from credit_card;
select * from merchant;
select * from merchant_category;
select * from transaction;

-- Count the number of transactions of each cardholder 
SELECT b.cardholder_id, COUNT(a.card) as transactions_amount
FROM transaction AS a
JOIN credit_card AS b ON a.card = b.card
GROUP BY b.cardholder_id
ORDER BY COUNT(a.card) DESC;

-- Create cardholder transactions number view
CREATE VIEW cardholder_transactions_number AS
SELECT b.cardholder_id, COUNT(a.card) as transactions_amount
FROM transaction AS a
JOIN credit_card AS b ON a.card = b.card
GROUP BY b.cardholder_id
ORDER BY COUNT(a.card) DESC;

-- Count the number of transcations less than $2.00
SELECT b.cardholder_id, COUNT(a.card) as number_of_transactions
FROM transaction AS a
JOIN credit_card AS b ON a.card = b.card
WHERE a.amount < 2.00
GROUP BY b.cardholder_id
ORDER BY COUNT(a.card) DESC;

-- Create transactions less 2 view
CREATE VIEW transactions_less_2 AS
SELECT b.cardholder_id, COUNT(a.card) as number_of_transactions
FROM transaction AS a
JOIN credit_card AS b ON a.card = b.card
WHERE a.amount < 2.00
GROUP BY b.cardholder_id
ORDER BY COUNT(a.card) DESC;

-- Count the top 100 highest transactions between 7:00 am and 9:00 am
SELECT  a.date, b.cardholder_id, a.amount
FROM transaction AS a
JOIN credit_card AS b ON a.card = b.card
WHERE EXTRACT(HOUR FROM date) BETWEEN 7 AND 8
ORDER BY a.amount DESC
LIMIT 100;

-- Create top 100 transactions view
CREATE VIEW top_100_transactions AS
SELECT  a.date, b.cardholder_id, a.amount
FROM transaction AS a
JOIN credit_card AS b ON a.card = b.card
WHERE EXTRACT(HOUR FROM date) BETWEEN 7 AND 8
ORDER BY a.amount DESC
LIMIT 100;

-- Count the top 100 highest transactions in other time frame
SELECT  a.date, b.cardholder_id, a.amount
FROM transaction AS a
JOIN credit_card AS b ON a.card = b.card
WHERE EXTRACT(HOUR FROM date) NOT BETWEEN 7 AND 8
ORDER BY a.amount DESC
LIMIT 100;

-- Create top 100 transactions other view
CREATE VIEW top_100_transactions_other AS
SELECT  a.date, b.cardholder_id, a.amount
FROM transaction AS a
JOIN credit_card AS b ON a.card = b.card
WHERE EXTRACT(HOUR FROM date) NOT BETWEEN 7 AND 8
ORDER BY a.amount DESC
LIMIT 100;


-- Top 5 merchants prone to be hacked
SELECT b.name, COUNT(a.card) as number_of_transacations
FROM transaction AS a
JOIN merchant AS b ON a.id_merchant = b.id
WHERE a.amount < 2.00
GROUP BY b.name 
ORDER BY COUNT(a.card) DESC
LIMIT 5;

-- Create transactions less 2 view
CREATE VIEW top_5_merchants AS
SELECT b.name, COUNT(a.card) as number_of_transacations
FROM transaction AS a
JOIN merchant AS b ON a.id_merchant = b.id
WHERE a.amount < 2.00
GROUP BY b.name 
ORDER BY COUNT(a.card) DESC
LIMIT 5;



