-- Grouping (집계함수를 사용하기 위해서)
-- GROUP BY는 작성된 컬럼명만 SELECT에 쓸 수 있음
-- SUM() 함수 GROUP BY에서 활용가능
SELECT userID AS '아이디'
	 , SUM(price) AS '총액'
     , SUM(amount) AS '갯수'
  FROM buytbl
 GROUP BY userID;

SELECT userID AS '아이디'
	 , SUM(price) AS '총액'
     , AVG(amount) AS '평균 구매량'
  FROM buytbl
 GROUP BY userID;
 
-- HAVING : GROUP BY와 같이 씀
-- HAVING은 집계함수등의 결과값을 필터링하기 위해서 사용
-- GROUP BY에서 WHERE과 같이 조건문을 사용하고 싶을 때, 사용하는 것!
SELECT userID
	 , SUM(price * amount)
  FROM buytbl
 GROUP BY userID
HAVING SUM(price * amount) > 1000;

-- ROLLUP :  전체 합산 값이 나온다!
-- 전체 합계를 자동으로 계산
SELECT userID
	 , SUM(price * amount)
  FROM buytbl
 GROUP BY userID
  WITH ROLLUP;