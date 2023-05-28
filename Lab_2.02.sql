USE sakila;


-- 1. Select all the actors with the first name ‘Scarlett’.

SELECT * FROM sakila.actor
WHERE first_name LIKE 'Scarlett';

-- 2. Select all the actors with the last name ‘Johansson’.

SELECT * FROM sakila.actor
WHERE last_name LIKE 'Johansson';

-- 3. How many films (movies) are available for rent?

SELECT COUNT(DISTINCT inventory_id)  FROM sakila.rental;

-- 4. How many films have been rented?

SELECT COUNT(rental_id) FROM sakila.rental;


-- 5. What is the shortest and longest rental period?

-- Maximo

SELECT MAX(DATEDIFF(return_date, rental_date)) AS Max_dif_days
FROM sakila.rental;

-- Minimo

SELECT MIN(DATEDIFF(return_date, rental_date)) AS Min_dif_days
FROM sakila.rental;

-- 6. What are the shortest and longest movie duration? Name the values `max_duration` and `min_duration`.

-- Maximo

SELECT MAX(length) AS max_duration
FROM sakila.film;

-- Minimo

SELECT MIN(length) AS min_duration
FROM sakila.film;

-- 7. What's the average movie duration?

SELECT AVG(length) AS avg_duration
FROM sakila.film;

-- 8. What's the average movie duration expressed in format (hours, minutes)?

SELECT CONCAT(
    FLOOR(AVG(length) / 60), 
    ' hours, ', 
    AVG(length) % 60, 
    ' minutes'
) AS average_duration
FROM sakila.film;

-- 9. How many movies longer than 3 hours?

SELECT * FROM sakila.film
WHERE length >= 180;

-- 10. Get the name and email formatted. Example: Mary SMITH - *mary.smith@sakilacustomer.org*.

SELECT CONCAT(first_name, ' ', LOWER(last_name), ' - *', email, '*') AS email
FROM sakila.customer;

-- 11. What's the length of the longest film title?

SELECT LENGTH(title) AS title_length FROM sakila.film 
ORDER BY title_length DESC
LIMIT 1;

