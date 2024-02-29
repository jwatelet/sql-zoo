--1
SELECT id, title
 FROM movie
 WHERE yr=1962

--2
SELECT yr
FROM movie
WHERE title LIKE 'Citizen Kane'

--3
SELECT id, title, yr
FROM movie
WHERE title  LIKE '%Star Trek%'
ORDER BY yr

--4
SELECT id
FROM actor
WHERE name LIKE 'Glenn Close'

--5
SELECT id
FROM movie
WHERE title LIKE 'Casablanca'

--6
SELECT name
FROM actor JOIN casting ON (id = actorid)
WHERE movieid=11768

--7
SELECT name
FROM actor 
JOIN casting ON (actor.id = actorid)
JOIN movie ON (movie.id = movieid)
WHERE title LIKE 'Alien'

--8
SELECT title
FROM actor 
JOIN casting ON (actor.id = actorid)
JOIN movie ON (movie.id = movieid)
WHERE actor.name LIKE 'Harrison Ford'

--9
SELECT title
FROM actor 
JOIN casting ON (actor.id = actorid)
JOIN movie ON (movie.id = movieid)
WHERE actor.name LIKE 'Harrison Ford'
AND casting.ord != 1

--10
SELECT title, name
FROM actor 
JOIN casting ON (actor.id = actorid)
JOIN movie ON (movie.id = movieid)
WHERE casting.ord = 1
AND movie.yr = 1962

--11
SELECT yr,COUNT(title) FROM
  movie JOIN casting ON movie.id=movieid
        JOIN actor   ON actorid=actor.id
WHERE name='Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 2

--12
SELECT title, name FROM movie
JOIN casting x ON movie.id = movieid
JOIN actor ON actor.id =actorid
WHERE ord=1 AND movieid IN
(SELECT movieid FROM casting y
JOIN actor ON actor.id=actorid
WHERE name='Julie Andrews')

--13
SELECT name
  FROM actor
        JOIN casting
        ON actor.id = casting.actorid
        JOIN movie
        ON casting.movieid = movie.id
 WHERE casting.ord = 1
 GROUP BY name
 HAVING COUNT(*) >= 15;

 --14
SELECT title, COUNT(actorid) AS cast_num
FROM movie
JOIN casting
ON movie.id = casting.movieid
JOIN actor
ON casting.actorid = actor.id
WHERE yr = 1978
GROUP BY title
ORDER BY cast_num DESC, title;

--15

SELECT DISTINCT actor.name
FROM movie
JOIN casting
ON movie.id = casting.movieid
JOIN actor
ON casting.actorid = actor.id
WHERE movie.id IN (
SELECT movieid
FROM casting
JOIN actor
ON id = actorid
WHERE actor.name = 'Art Garfunkel'
) AND actor.name != 'Art Garfunkel';