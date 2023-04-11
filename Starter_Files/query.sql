SELECT * FROM card_holder;

SELECT * FROM credit_card;

SELECT * FROM merchant;

SELECT * FROM merchant_category;

SELECT * FROM transaction;


SELECT ch.name as Cardholder, round(SUM(t.amount)) as Total_spent
FROM transaction t
JOIN credit_card c ON t.card = c.card
JOIN card_holder ch ON c.cardholder_id = ch.id
GROUP BY ch.name；

SELECT ch.name as Cardholder, COUNT(*) as Transaction_Count
FROM transaction t
JOIN credit_card c ON t.card = c.card
JOIN card_holder ch ON c.cardholder_id = ch.id
WHERE t.amount < 2.00
GROUP BY ch.name;

SELECT t.id, t.date, t.amount, c.card, m.name as merchant_name
FROM transaction t
JOIN credit_card c ON t.card = c.card
JOIN merchant m ON t.id_merchant = m.id
WHERE t.date::time BETWEEN '07:00:00' AND '09:00:00'
ORDER BY t.amount DESC
LIMIT 100;

SELECT m.name as merchant_name, COUNT(*) as Transaction_Count
FROM transaction t
JOIN merchant m ON t.id_merchant = m.id
WHERE t.amount < 2.00
GROUP BY m.name 
ORDER BY Transaction_Count DESC
LIMIT 5;

CREATE VIEW total_spent_by_cardholder AS
SELECT ch.name as Cardholder, round(SUM(t.amount)) as Total_spent
FROM transaction t
JOIN credit_card c ON t.card = c.card
JOIN card_holder ch ON c.cardholder_id = ch.id
GROUP BY ch.name;

CREATE VIEW small_transactions_by_cardholder AS
SELECT ch.name as Cardholder, COUNT(*) as Transaction_Count
FROM transaction t
JOIN credit_card c ON t.card = c.card
JOIN card_holder ch ON c.cardholder_id = ch.id
WHERE t.amount < 2.00
GROUP BY ch.name;

CREATE VIEW top_100_transactions_morning AS
SELECT t.id, t.date, t.amount, c.card, m.name as merchant_name
FROM transaction t
JOIN credit_card c ON t.card = c.card
JOIN merchant m ON t.id_merchant = m.id
WHERE EXTRACT(hour FROM t.date) BETWEEN 7 AND 9
ORDER BY t.amount DESC
LIMIT 100;

CREATE VIEW top_5_merchants_hacked AS
SELECT m.name as merchant_name, COUNT(*) as Transaction_Count
FROM transaction t
JOIN merchant m ON t.id_merchant = m.id
WHERE t.amount < 2.00
GROUP BY m.name
ORDER BY Transaction_Count DESC
LIMIT 5;

select * from total_spent_by_cardholder

select * from small_transactions_by_cardholder

select * from top_100_transactions_morning

select * from top_5_merchants_hacked