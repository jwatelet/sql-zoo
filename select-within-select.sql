--1
SELECT name FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='Russia')

--2
SELECT name
FROM world
WHERE continent like 'EUROPE'
AND gdp/population > (select gdp/population from world where name like 'United Kingdom')

--3
SELECT name, continent
FROM world
WHERE continent IN (SELECT continent FROM world WHERE name IN ('Argentina', 'Australia'))

--4
SELECT name, population
FROM world
WHERE population > (SELECT population FROM world WHERE name LIKE 'United Kingdom')
AND population < (SELECT population FROM world WHERE name LIKE 'Germany')

--5
SELECT name, CONCAT(ROUND(population /(SELECT population FROM world WHERE name LIKE 'Germany') * 100), '%') AS 'Percentage'
FROM world
WHERE continent = 'Europe'

--6
SELECT name
  FROM world
 WHERE GDP > ALL(SELECT GDP
                           FROM world
                          WHERE GDP>0 AND continent LIKE 'Europe')

--7
SELECT continent, name, area FROM world x
  WHERE area >= ALL
    (SELECT area FROM world y
        WHERE y.continent=x.continent
          AND population>0)

--8
SELECT continent, name
FROM world x 
WHERE name LIKE
(select name from world y
 where x.continent = y.continent
 order by name
LIMIT 1
)

--9
SELECT name, continent, population FROM world x
WHERE 25000000 >= ALL(SELECT population FROM world y WHERE x.continent=y.continent) 

--10
SELECT name, continent
FROM world x
WHERE population > ALL(
      SELECT population*3 FROM world y 
      WHERE y.continent=x.continent
      AND y.name!=x.name)