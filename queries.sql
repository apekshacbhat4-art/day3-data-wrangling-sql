-- 1. View all payments
SELECT * FROM payments;


-- 2. Top 5 vendors by total payment
SELECT vendor, SUM(amount) AS total_amount
FROM payments
GROUP BY vendor
ORDER BY total_amount DESC
LIMIT 5;


-- 3. Total payments by vendor
SELECT vendor, SUM(amount) AS total_amount
FROM payments
GROUP BY vendor
ORDER BY total_amount DESC;


-- 4. Total payments by month
SELECT DATE_TRUNC('month', payment_date) AS month,
       SUM(amount) AS monthly_total
FROM payments
GROUP BY month
ORDER BY month;


-- 5. Payments above 10000
SELECT *
FROM payments
WHERE amount > 10000;


-- 6. Late payments
SELECT *
FROM payments
WHERE payment_date > due_date;


-- 7. Count payments per vendor
SELECT vendor, COUNT(*) AS payment_count
FROM payments
GROUP BY vendor
ORDER BY payment_count DESC;


-- 8. Duplicate invoices
SELECT vendor, invoice_no, COUNT(*) AS occurrences
FROM payments
GROUP BY vendor, invoice_no
HAVING COUNT(*) > 1;


-- 9. Average payment amount
SELECT AVG(amount) AS average_payment
FROM payments;


-- 10. Highest payment
SELECT *
FROM payments
ORDER BY amount DESC
LIMIT 1;