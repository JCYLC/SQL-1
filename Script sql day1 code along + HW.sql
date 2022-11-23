-- first SQL Query, SELECT all records from actor table
SELECT * FROM actor;

-- Query for First_name and last_name in the actor table
SELECT FIRST_NAME, last_name
FROM ACTOR;

-- Query for a first_name that equals Nick using the WHERE clause
SELECT first_name, last_name
FROM actor 
WHERE first_name = 'Nick';

-- Query for a first_name that is equal to Nick using the LIKE and WHERE clauses
SELECT first_name,last_name
FROM actor
WHERE first_name LIKE 'Nick';

-- Query for all first_name data that starts with a J using the LIKE and WHERE clauses -- using the wildcard'%' totally optional, can be no letter
SELECT first_name, actor_id
FROM actor
WHERE first_name LIKE 'J%';

-- Query for all first_name data that starts with K and has 2 and ONLY 2 letters after the K using Like and WHERE clauses -- using underscore
SELECT first_name, actor_id
FROM actor
WHERE first_name like 'K__';

-- Query for all first_name data that starts with a K and ends with th
-- using the LIKE and WHERE clauses -- using BOTH wildcard AND underscore
SELECT first_name, last_name,actor_id
FROM actor
WHERE first_name LIKE 'K__%th';



-- Comparing operators are: 
-- Greater Than (>) -- Less Than (<)
-- Greater or Equal (>=) -- Less or Equal (<=)
-- Not Equal (<>)

-- Explore Data with SELECT All Query (Specific to changing into new table)
SELECT *
FROM payment;

-- Query for data that shows customers who paid 
-- an amount GREATER than $2
SELECT customer_id,amount
FROM payment
WHERE amount > 2.00;

-- Query for data that shows customers who paid
-- an amount LESS than $7.99
SELECT customer_id,amount
FROM payment
WHERE amount < 7.99;

-- Query for data that shows customers who paid
-- an amount LESS than or EQUAL to $7.99
SELECT customer_id, amount
FROM payment
WHERE amount <= 7.99;

-- Query for data that shows customers who paid
-- an amount GREATER than or EQUAL to $2.00
-- in Ascending order
SELECT customer_id,amount
FROM payment
WHERE amount >= 2.00
ORDER BY amount ASC;

-- Query for data that shows customers who paid
-- an amount BETWEEN $2.00 and $7.99
-- Using the BETWEEN with the AND clause
SELECT customer_id,amount
FROM payment
WHERE amount BETWEEN 2.00 AND 7.99;

-- Query for data that shows customers who paid
-- an amount NOT EQUAL to $0.00
-- Ordered in DESCENDING Order
SELECT customer_id, amount
FROM payment
WHERE amount <> 0.00
ORDER BY amount DESC;




-- SQL Aggregations => SUM(), AVG(), COUNT(), MIN(), MAX()

-- Query to display sum of amounts payed that are greater than $5.99
SELECT SUM(amount)
FROM payment
WHERE amount > 5.99;

-- Query to display average of amounts payed that are greater than $5.99
SELECT AVG(amount)
FROM payment
WHERE amount > 5.99;

-- Query to display the count of amounts payed that are greater than $5.99
SELECT COUNT(amount)
FROM payment
WHERE amount > 5.99;

-- Query to display the count of DISTINCT amounts payed that are greater than $5.99
SELECT COUNT(DISTINCT amount)
FROM payment
WHERE amount > 5.99;

-- Query to display min amount greater than 7.99
SELECT MIN(amount) AS Min_Num_Payments
FROM payment
WHERE amount > 7.99;

-- Query to display max amount greater than 7.99
SELECT MAX(amount) AS Max_Num_Payments
FROM payment
WHERE amount > 7.99;

-- Query to display all amounts (quick demo of groupby)
SELECT amount
FROM payment
WHERE amount = 7.99;

-- Query to display different amounts grouped together
-- and count the amounts
SELECT amount, COUNT(amount)
FROM payment
GROUP BY amount
ORDER BY amount;

-- Query to display customer_ids with the summed amounts for each customer_id
SELECT customer_id, SUM(amount)
FROM payment
GROUP BY customer_id
ORDER BY customer_id DESC;

-- Query to display customer_ids with the summed amounts for each customer_id -- Seperate example of 
-- a different way to use Group By
SELECT customer_id,amount
FROM payment
GROUP BY amount,customer_id
ORDER BY customer_id DESC;



-- EXTRA MATERIAL NOT COVERED IN VIDEO !!
-- Query to explore the data inside of the customer table
SELECT *
FROM customer;

-- Query to display customer_ids that show up more than 5 times
-- Grouping by the customer's email
SELECT COUNT(customer_id),email
FROM customer
WHERE email LIKE 'j__.w%'
GROUP BY email
HAVING COUNT(customer_id) > 0;






--HOMEWORK 
--1. How many actors are there with the last name ‘Wahlberg’?    2
SELECT COUNT(actor_id)
FROM actor
WHERE last_name LIKE 'Wahlberg';

--2. How many payments were made between $3.99 and $5.99?     4803
SELECT COUNT(amount)
FROM payment
WHERE amount BETWEEN 3.99 AND 5.99;

--3. What film does the store have the most of? (search in inventory) 
--the following film IDs all have 8:
193
789
730
378
595
849
231
586
69
764
745
1
767
369
738
638
31
356
199
683
127
609
403
174
266
109
434
220
239
873
893
468
525
897
697
835
773
945
444
412
880
846
331
911
621
301
1000
361
91
200
358
973
350
559
86
489
382
702
531
856
870
295
206
73
418
460
103
341
748
500
753
572
SELECT film_id, COUNT(inventory_id)
FROM inventory
GROUP BY film_id 
ORDER BY COUNT(inventory_id) DESC

--4. How many customers have the last name ‘William’?    0
SELECT COUNT(customer_id)
FROM customer
WHERE last_name LIKE 'William';

--5. What store employee (get the id) sold the most rentals?  staff id 1 
SELECT staff_id, COUNT(staff_id)
FROM rental
GROUP BY staff_id
ORDER BY staff_id DESC;

--6. How many different district names are there?     378
select COUNT(distinct district)
from address;


--7. What film has the most actors in it? (use film_actor table and get film_id)   film_id 508 with 15 actors
select film_id, COUNT(distinct actor_id)
from film_actor 
group by film_id
order by COUNT(distinct actor_id) desc;

--8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table) 13
select count(last_name)
from customer 
where store_id = '1' and last_name like '%es'; 

--9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers
--with ids between 380 and 430? (use group by and having > 250)    ----3
select amount
from payment 
where customer_id between 380 and 430
group by amount 
having COUNT(rental_id) > 250;

--10. Within the film table, how many rating categories are there? And what rating has the most
--movies total?  ---5, 223 total for PG-13
select COUNT(distinct film_id), rating
from film 
group by rating;









