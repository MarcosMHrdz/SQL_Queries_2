-- Seleccione todos los actores con el nombre 'Scarlett'.

SELECT first_name
FROM actor
WHERE first_name = 'Scarlett';

-- Selecciona todos los actores con el apellido 'Johansson'.

SELECT last_name
FROM actor
WHERE last_name = 'Johansson';

-- ¿Cuántas películas (películas) hay disponibles para alquilar?
---------------
---------
SELECT COUNT(DISTINCT film_id) AS peliculas_disponibles
FROM inventory;
-------------
---------------
-- ¿Cuál es el período de alquiler más corto y más largo?

SELECT MIN(rental_duration) AS periodo_mas_corto
FROM sakila.film;

SELECT MAX(rental_duration) AS periodo_mas_largo
FROM sakila.film;

-- Cuáles es la duración más corta y más larga de la película? Nombra los valores max_durationy min_duration.

select max(length) as max_duration 
from sakila.film;
select min(length) as min_duration
from sakila.film;
 
 -- ¿Cuál es la duración promedio de la película?
 
 select avg(length) as promedio
 from sakila.film;
 
 -- ¿Cuál es la duración promedio de una película expresada en formato (horas, minutos)?
 
SELECT
    CONCAT(
        TRUNCATE(AVG(length) / 60, 0), ' horas ',
        TRUNCATE(AVG(length) % 60, 0), ' minutos'
    ) AS tiempo_convertido
FROM sakila.film;

-- ¿Cuántas películas duran más de 3 horas?

select count(length)
FROM sakila.film
where  length >  180;

-- Obtenga el formato del nombre y el correo electrónico.

select CONCAT (last_name, ' ', last_name, ' - ', email) as formato_nombre_correo
FROM customer ;



SELECT MAX(LENGTH(title)) AS duracion_maxima
FROM sakila.film;


SELECT title AS nombre_pelicula 
FROM sakila.film
WHERE LENGTH(title) = (
    SELECT MAX(LENGTH(title))
    FROM sakila.film
);

SELECT title AS nombre_pelicula, LENGTH(title) AS duracion
FROM sakila.film
WHERE LENGTH(title) = (
    SELECT MAX(LENGTH(title))
    FROM sakila.film
);
 