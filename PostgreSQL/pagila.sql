
SELECT * FROM data_src
WHERE journal = 'Food Chemistry';


SELECT * FROM nutr_def
WHERE nutrdesc = 'Retinol';


SELECT * FROM food_des
WHERE manufacname = 'Kellogg, Co.';


SELECT COUNT(*) FROM data_src
WHERE year > 2000;

SELECT COUNT(*) FROM food_des
WHERE fat_factor<4;


SELECT * FROM actor;

SELECT * FROM film;

SELECT * FROM staff;

SELECT address,district FROM address;

SELECT title,description FROM film;

SELECT city,country_id FROM city;


SELECT DISTINCT(last_name) FROM customer;

SELECT DISTINCT(first_name) FROM actor;

SELECT DISTINCT(inventory_id) FROM rental;

SELECT COUNT(*) FROM film;

SELECT COUNT(*) FROM category;

SELECT COUNT(DISTINCT first_name) FROM actor;

SELECT rental_id,return_date-rental_date FROM rental;
