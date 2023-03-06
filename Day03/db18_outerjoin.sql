-- INNER JOIN
SELECT DISTINCT s.stdName, s.addr, j.clubName, c.roomNo
  FROM stdtbl AS s
  JOIN stdclubtbl AS j
    ON s.stdName = j.stdName
  JOIN clubtbl AS c
    ON c.clubName = j.clubName