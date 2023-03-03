/* 책대여점 데이터베이스 실습 */
-- 1. divtbl
-- 사람마다 입력하는 방식이 달라서 AND 컴퓨터는 우리 언어를 받아들일 수 없어서 코드화가 필요하다.
-- 예로) 책 장르를 코드화한 것!
SELECT *
  FROM divtbl;
  
-- 2. bookstbl
SELECT *
  FROM bookstbl;

-- 3. memberybl
SELECT *
  FROM membertbl;
  
-- 4. rentaltbl
SELECT *
  FROM rentaltbl;
  
-- 책을 봅니다
-- DATE_FORMAT(문자열, 형태)
-- ctrl + l = 한 줄 지우기
SELECT b.Division AS '장르코드'
	 , b.Names AS '책 제목', b.Author AS '저자명'
     , DATE_FORMAT(b.ReleaseDate, '%Y년 %m월 %m일') AS '출판일'
     , FORMAT(b.price, '0,000') AS '금액'
  FROM bookstbl AS b;

-- DATE_FORMAT 예제
SELECT DATE_FORMAT('2023-03-03 17:03:10', '%Y년%m월%d일 %H시%i분%s초') AS '일시분'; -- 분은 i 나 m을 넣어도 되요

-- 회원을 봅니다
SELECT m.Names AS '회원명'
	 , m.Levels AS '등급'
     , m.Addr AS '주소'
     , m.Mobile AS '연락처'
     , CONCAT(UPPER(SUBSTRING_INDEX(m.Email, '@', 1)),
			  '@',
			  LOWER(SUBSTRING_INDEX(m.Email, '@', -1)))
  FROM membertbl AS m
 ORDER BY m.Names ASC;