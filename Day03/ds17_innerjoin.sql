-- INNER JOIN
-- Inner Join은 기준이 없어요
SELECT b.num -- 275p에 나와요
	 , b.userID
     , b.prodName
     , u.name
     , u.addr
     , u.birthYear
  FROM buytbl AS b
 INNER JOIN usertbl AS u
    ON b.userID = u.userID
 ORDER BY b.num DESC;
-- WHERE u.userID = 'JYP';