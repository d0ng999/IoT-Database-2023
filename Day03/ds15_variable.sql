-- 변수 사용
USE sqldb;

SET @myVar = 5;
SELECT @myVar;
SET @myVar = '가수이름 ==> ';

SELECT @myVar, name
  FROM usertbl
 WHERE height > 170;

SELECT name, height + @myVar
  FROM usertbl;
  
-- 형변환(VARCHAR는 안되네?)
-- 형태와 맞는 문자로 바꿔야 함
SELECT CAST(birthYear AS CHAR)
  FROM usertbl;
SELECT CAST(CONVERT(birthYear, CHAR) AS SIGNED INTEGER) FROM usertbl;

SELECT CONVERT(birthYear, CHAR) FROM usertbl;

SELECT CAST('1000' AS decimal);

-- 암시적 형변환
SELECT 200 + 300;

SELECT CONCAT('Hello', 'World'); -- CONCAT은 문자열 합치는 함수명

SELECT '200' + '300' ;  -- MySQL 이외에서는 '200300'으로 출력됨
SELECT CONCAT(200, '300');
SELECT 200 + '300';

/* 내장함수 리스트 */
-- 흐름함수
SELECT IF(100>200, '참', '거짓');

SELECT IFNULL(NULL, '널입니다'); -- NULL인 경우에만 출력됨, NULL이 아니면 1번째 값이 출력됨
SELECT IFNULL(NULL, 0) + 100; -- NULL이 참이라 0의 값을 가지고 그 값에 100을 더함
-- 원래는 NULL이랑 계산을 진행하면 계산에 오류가 발생한다.

-- NULLIF 두 값이 같으면 NULL이 발생
-- 많이 사용은 안함
SELECT NULLIF(100, 900); 

-- 쿼리작성할 때 많이 사용
SELECT name
	 , birthYear
     , addr
     , CASE addr -- 주소값이 서울이나 경기라면 수도권으로 그게 아니라면 모름!
	   WHEN '서울' THEN '수도권'
       WHEN '경기' THEN '수도권'
       WHEN '부산' THEN '광역시'
       ELSE '지역권' END AS '권역'
  FROM usertbl;
  
-- 문자열 함수
SELECT ASCII('A'), CHAR(65), ASCII('a');
SELECT ASCII('한'), CHAR(236); -- 아스키코드에서 한글은 사용하면 안되요

-- CHAR_LNEGTH은 글자의 길이, LENGTH는 byte크기
SELECT CHAR_LENGTH('ABC'), LENGTH('ABC');
-- utf-8을 사용해서이다.
SELECT CHAR_LENGTH('가나다'), LENGTH('가나다'); -- 한글 한 글자당 3bytes

-- REPLACE 특정 문자를 바꿔주는 함수명
SELECT REPLACE('Hello World', 'Hello', 'ByeBye');

-- DATABASE에서는 인덱스를 1부터 시작
-- INSTR 은 특정 문자의 위치가 몇 번째인지 알려줌
SELECT INSTR('안녕하세요, 여러분', '여');

-- LEFT, RIGHT
SELECT LEFT('ABCDEFGHIJKLNM', 3), RIGHT('ABCDEFGHIJKLNM', 3);

-- UPPER, LOWER
SELECT UPPER('Hello World'), LOWER('Hello World');

-- LTRIM, RTRIM, TRIM
-- 왼쪽, 오른쪽, 모든 여백을 없애줌
SELECT LTRIM('          Hello, World!          ') AS 'ltrim'
	 , RTRIM('          Hello, World!          ') AS 'rtrim'
     , TRIM('          Hello, World!          ') AS 'trim';
     
-- REPEAT
SELECT REPEAT('Hello', 3); -- 반복할 문자와 반복할 회수

-- substring
SELECT SUBSTRING('대한민국만세', 5, 2); -- 5번째 문자부터 시작해서 2개 출력

-- 수학함수
SELECT ABS(-10);

-- CEILING 올림, FLOOR 내림, ROUND 반올림
SELECT CEILING(4.3), FLOOR(4.9), ROUND(4.4);

-- MOD 나머지를 구할 때 사용
SELECT MOD(157, 10);

-- RAND 무작위 값
SELECT RAND(), FLOOR(1 + (RAND() * 6)); -- 주사위

-- 날짜 및 시간함수
-- NOW(현재시간)
-- ADDDATE 날짜를 더해주는 함수
SELECT NOW();
SELECT ADDDATE('2023-03-02', INTERVAL 1 YEAR);
SELECT YEAR(NOW());
SELECT MONTH(NOW());
SELECT HOUR(NOW());
SELECT DATE(NOW());
SELECT TIME(NOW());
SELECT DAYOFWEEK(NOW()); -- 1 = 일요일 ~ 7 = 토요일
SELECT LAST_DAY('2020-02-01'); -- 그 달의 마지막날짜를 알려줌

-- 시스템 함수
SELECT USER(); -- 사용자 명

SELECT DATABASE(); -- 현재 사용되고 있는 데이타베이스 종류(이름)

-- ROW_COUNT()
USE sqldb;
UPDATE buytbl SET price = price * 2;
-- 다른 함수랑 같이 사용하고, 사용시 함수에 의해 영향을 받은 컬럼의 갯수를 알려줌
SELECT ROW_COUNT(); 

SELECT VERSION();