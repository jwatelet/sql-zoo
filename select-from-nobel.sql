--1
SELECT yr, subject, winner
  FROM nobel
 WHERE yr = 1950

--2
SELECT winner
  FROM nobel
 WHERE yr = 1962
   AND subject = 'literature'

--3
SELECT yr, subject
FROM nobel
WHERE winner LIKE 'Albert Einstein'

--4
SELECT winner
FROM nobel
WHERE yr >= 2000
and subject = 'peace'

--5
SELECT yr, subject, winner
FROM nobel
WHERE subject LIKE 'literature'
AND yr >= 1980
AND yr <= 1989

--6
SELECT * FROM nobel
  WHERE winner IN ('Theodore Roosevelt',
                  'Thomas Woodrow Wilson',
                  'Jimmy Carter',
                  'Barack Obama'   )

--7
SELECT winner
FROM nobel
WHERE winner like 'John%'

--8
SELECT yr, subject, winner
FROM nobel
WHERE yr = 1980 AND subject LIKE 'physics'
OR yr = 1984 AND subject LIKE 'chemistry'

--9
SELECT yr, subject, winner
FROM nobel
WHERE yr = 1980 AND subject NOT IN ('chemistry', 'medicine')

--10
SELECT yr, subject, winner
FROM nobel
WHERE subject LIKE 'Medicine' AND yr < 1910
OR subject LIKE 'Literature' AND yr >= 2004

--11
SELECT *
FROM nobel
WHERE winner LIKE 'PETER GRÜNBERG'

--12
SELECT *
FROM nobel
WHERE winner LIKE 'EUGENE O''NEILL'

--13
SELECT winner, yr, subject
FROM nobel
WHERE winner LIKE 'Sir%'
ORDER BY yr DESC, winner

--14
SELECT winner, subject
  FROM nobel
 WHERE yr=1984
 ORDER BY subject IN ('physics','chemistry'), subject,winner
