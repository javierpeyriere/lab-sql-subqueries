-- 1 Determine the number of copies of the film "Hunchback Impossible" that exist in the inventory system.
select inv.film_id, film.title, count(1)
from film
inner join inventory as inv
	using(film_id)
where film.title like "%Hunchback Impossible%"
group by inv.film_id, film.title;

-- with subquery
select inv.film_id, count(1)
from inventory as inv
where inv.film_id in (select film.film_id from film where film.title like "%Hunchback Impossible%")
group by inv.film_id;

-- 2 List all films whose length is longer than the average length of all the films in the Sakila database.
select title, length as length_minutes
from film
where length > (select avg(length) from film);

-- 3 Use a subquery to display all actors who appear in the film "Alone Trip".
select last_name -- concat(a.first_name, ' ', a.last_name)
from actor
inner join film_actor
	using(actor_id)
inner join film
	using(film_id)
where film.title  like '%Alone Trip%'
    limit 10;
-- attempt with subquery
select concat(first_name, ' ', last_name)
from actor
inner join film_actor
	using(actor_id)
where film_actor.film_id like (select film_id from film where film.title like '%Alone Trip%');

-- BONUS (later)
