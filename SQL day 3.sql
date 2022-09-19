--1. List all customers who live in Texas (use
--JOINs)
-- ANSWER 5
SELECT customer.first_name, customer.last_name, district
FROM customer
INNER JOIN address
ON customer.address_id = address.address_id
WHERE address.district = 'Texas';


--2. Get all payments above $6.99 with the Customer's Full
--Name
--ANSWER 1406
SELECT first_name, last_name, payment.amount
FROM customer
INNER JOIN payment
ON customer.customer_id = payment.customer_id
WHERE amount > 6.99;

--3. Show all customers names who have made payments over $175(use
--subqueries)
--ANSWER 
SELECT first_name, last_name
FROM customer
WHERE customer_id IN(
    SELECT customer_id
    FROM payment
    WHERE amount > 175
);

--4. List all customers that live in Nepal (use the city
--table)

--5. Which staff member had the most
--transactions?
-- ANSWER JON
SELECT first_name, last_name
FROM staff
WHERE staff_id IN(
SELECT staff_id
FROM payment
GROUP BY payment_id
ORDER BY COUNT(payment_id) DESC
);
--6. How many movies of each rating are
--there?
--ANSWER R=195 PG=194 NC-17=210 PG-13=223 G=178
SELECT COUNT(title),rating
FROM film
GROUP BY rating;

--7.Show all customers who have made a single payment
--above $6.99 (Use Subqueries)
-- ANSWER 539
SELECT first_name, last_name
FROM customer
WHERE customer_id IN(
SELECT customer_id
FROM payment
WHERE amount > 6.99
);
--8. How many free rentals did our stores give away?
--ANSWER 0
SELECT COUNT(amount)
FROM payment
WHERE amount = 0;