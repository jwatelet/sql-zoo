--1
SELECT SUM(population)
FROM world

--2
SELECT DISTINCT continent
FROM world

--3
SELECT SUM(gdp)
FROM world
WHERE continent like 'Africa'

--4
SELECT count(name)
FROM world
where area >= 1000000

--5
SELECT sum(population)
FROM world
where name in ('Estonia', 'Latvia', 'Lithuania') 

--6
SELECT continent, count(name)
FROM world
GROUP BY continent

--7
SELECT continent, count(name)
FROM world
WHERE population >= 10000000
GROUP BY continent

--8
SELECT continent
FROM world
GROUP BY continent
HAVING sum(population) >= 100000000
