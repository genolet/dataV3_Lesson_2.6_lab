USE sakila;

-- In the table actor, which are the actors whose last names are not repeated? For example if you would sort the data in the table actor by last_name, you would see that there is Christian Arkoyd, Kirsten Arkoyd, and Debbie Arkoyd. These three actors have the same last name. So we do not want to include this last name in our output. Last name "Astaire" is present only one time with actor "Angelina Astaire", hence we would want this in our output list.

SELECT last_name, count(last_name) as number_of_actors_with_same_surname
FROM actor
group by last_name
HAVING number_of_actors_with_same_surname = 1;

-- Which last names appear more than once? We would use the same logic as in the previous question but this time we want to include the last names of the actors where the last name was present more than once

SELECT last_name, count(last_name) as number_of_actors_with_same_surname
FROM actor
group by last_name
HAVING number_of_actors_with_same_surname > 1;

-- Using the rental table, find out how many rentals were processed by each employee.

SELECT staff_id, count(rental_id) as number_of_rentals_per_employee
FROM rental
group by staff_id;

-- Using the film table, find out how many films were released each year.

SELECT release_year, count(film_id) as number_of_film_releases_per_year
FROM film
group by release_year;

-- Using the film table, find out for each rating how many films were there.

SELECT rating, count(film_id) as number_of_films_per_rating
FROM film
group by rating;

-- What is the mean length of the film for each rating type. Round off the average lengths to two decimal places

SELECT rating, round(avg(length),2) as avg_length_per_rating
FROM film
group by rating;

-- Which kind of movies (rating) have a mean duration of more than two hours?

SELECT rating, round(avg(length),2) as avg_length_per_rating
FROM film
group by rating
HAVING avg_length_per_rating > 120;

-- Rank films by length (filter out the rows that have nulls or 0s in length column). In your output, only select the columns title, length, and the rank.

SELECT title, length,
RANK() OVER (
ORDER BY length, title Asc) film_rank
FROM film
WHERE length IS NOT NULL and length <> 0;

