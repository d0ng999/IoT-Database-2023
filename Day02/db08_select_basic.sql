-- Active: 1677474332022@@127.0.0.1@3306@employees
-- 사용 데이터베이스 변경
USE homeplus;

-- * : ALL로 모든 것을 의미함
-- 항상 마지막에는 ; 를 넣어주기
SELECT * FROM indextbl;
SELECT * FROM homeplus.indextbl; /* 스키마.테이블명 으로도 가능! */

SELECT * FROM employees.titles; /* 다른 스키마의 테이블도 불러올 수 있음 */

-- 필요한 컬럼(열)만 가져오기
SELECT first_name, last_name FROM indextbl;

-- sqldb를 사용
USE sqldb;

-- 조건절 검색, 실무에서는 아래와 같은 형식으로 코드를 짠다.!
SELECT userID
	 , name
     , birthYear
     , height 
  FROM usertbl 
 WHERE name = '김경호';
 
-- 관계 연산자 (필터링)
SELECT *
  FROM usertbl
 WHERE birthYear >= 1970 
   AND height >= 182;
   
-- Between 사용
SELECT *
  FROM usertbl
 WHERE height >= 180
   AND height <= 183;

SELECT *
  FROM usertbl
 WHERE height BETWEEN 180 AND 183;
 
-- IN 연산자
SELECT *
  FROM usertbl
 WHERE addr = '경남' 
    OR addr = '경북' 
    OR addr = '전남';
    
SELECT *
  FROM usertbl
 WHERE addr IN ('경남', '경북', '전남');
 
-- 문자열 검색, 뉴스 본문안에서 일정단어를 검색할 때는 반드시 필요!!!@!@!@!@!
-- %를 대신할 수 있는 문자는 _가 있지만 _를 사용할 때는 문자개수를 정확히 해야함
SELECT *
  FROM usertbl
 WHERE name LIKE '%김%'; 

SELECT *
  FROM usertbl
 WHERE name LIKE '김__';
 
-- Subquery 서브쿼리(WHERE절에 또 다른 조건문을 사용)
-- 서브쿼리 사용위치
-- 1. 컬럼 위치
-- 2. 테이블 위치
-- 3. 조건절 위치
-- WHERE 절에 서브쿼리의 컬럼이 한 개이상이거나 결과가 한 개이상이면 조건연산자로 조회불가능
-- 단, IN 을 쓰면 가능하네?
SELECT name 
	 , height
  FROM usertbl
 WHERE height IN (SELECT height FROM usertbl WHERE name LIKE '%김%');

-- 가상 테이블(서브쿼리를 사용한 예시, FROM절에 서브쿼리 사용)
-- AS '이름' = 별명이 나온다 가상테이블에
-- AS를 안써도 되긴함
SELECT u.userID
     , u.name
     , (2023 - u.birthYear) AS 'name'
  FROM (
		SELECT userID
			 , name
			 , birthYear
			 , addr
		  FROM usertbl
	   ) AS u
 WHERE u.birthYear > 1969;
 
-- 컬럼에 쓰는 서브쿼리
SELECT b.userID '아이디'
	 , (SELECT name FROM usertbl WHERE userID = b.userID) AS '이름'
     , b.prodName '제품명'
     , b.price * b.amount AS '판매액'
  FROM buytbl AS b;

-- 정렬 ORDER BY
-- 내림차순은 DESC
  SELECT *
     , birthYear
     , height
  FROM usertbl
 WHERE birthYear > 1969
 ORDER BY height DESC, birthYear ASC; /* DEFAULT 값은 ASC이다. */