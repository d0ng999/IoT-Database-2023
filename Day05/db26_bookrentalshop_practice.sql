/* BookRentalShop 연습 */
SELECT *
  FROM divtbl;
  
-- 서브쿼리, 성능이 떨어지는 영향이 있다.
SELECT b.Author AS '저자'   -- 1
	 , (SELECT Names 
		  FROM divtbl 
		 WHERE Division = b.Division) AS '장르'
     , b.Names AS '책제목'  -- 3
     , b.ISBN				-- 4
     , b.Price AS '금액'	-- 5
  FROM bookstbl AS b
-- 번호로 표현을 하면 중간에 컬럼을 추가할 때 조심!
 ORDER BY b.Price DESC; -- b.Price를 대신해서 숫자 5로 표현가능!
 
-- JOIN, 무조건 조인을 써서 나타내자
SELECT b. Author AS '저자'
--   , b.Division 
     , d.Names AS '장르'
     , b.Names AS '제목'
     , b.ISBN  
     , b.Price AS '금액'
  FROM bookstbl AS b
 INNER JOIN divtbl AS d
    ON b.Division = d.Division
 ORDER BY b.Price DESC;
  
-- 서브쿼리가 빛을 바라는 경우
-- 장르로 그룹 했다
SELECT (SELECT Names
		  FROM divtbl
		 WHERE Division = bb.Division) AS '장르'
	 , bb.총액
  FROM (
		SELECT b.Division
			 , SUM(b.Price) AS '총액'
		  FROM bookstbl AS b
		 GROUP BY b.Division
		) AS bb;
        
-- INNER 조인 - 여러개의 테이블 조인
SELECT m.Names AS '이름'
	 , m.Addr AS '주소'
     , m.Mobile AS '연락처'
     , r.rentalDate AS '대여일자'
     , IFNULL(r.returnDate, '미반납') AS '반납일자' -- 반납일자가 NULL이라면 미반납
--   , r.bookIdx 
     , b.Names AS '책제목'
     , d.Names AS '장르'
     , b.Price AS '금액'
  FROM membertbl AS m
 INNER JOIN rentaltbl AS r
	ON m.memberIdx = r.memberIdx
 INNER JOIN bookstbl AS b
	ON r.bookIdx = b.bookIdx
 INNER JOIN divtbl AS d
    ON b.Division = d.Division;

-- OUTER 조인
-- 두 테이블을 조인했을 때, 한 테이블의 키 값이 NULL이 나온다면 이때의 조인은 무조건 OUTER JOIN 이다.
SELECT m.Names AS '이름'
	 , m.Addr AS '주소'
     , m.Mobile AS '연락처'
     , r.rentalIdx
     , r.rentalDate AS '대여일자'
     , r.returnDate AS '반납일자'
--   , r.bookIdx 
     , b.Names AS '책제목'
     , d.Names AS '장르'
     , b.Price AS '금액'
  FROM membertbl AS m
  LEFT OUTER JOIN rentaltbl AS r
	ON m.memberIdx = r.memberIdx
  LEFT OUTER JOIN bookstbl AS b
	ON r.bookIdx = b.bookIdx
  LEFT OUTER JOIN divtbl AS d
    ON b.Division = d.Division
 WHERE r.rentalIdx IS NULL;
 
-- 책을 2권이상 출판한 저자
SELECT bb.Author
	 , d.Names
     , bb.출판권수
     , bb.합계금액
  FROM (
		SELECT b.Author
			 , b.Division
			 , COUNT(b.Author) AS '출판권수'
			 , SUM(b.Price) AS '합계금액'
		  FROM bookstbl AS b
		 GROUP BY b.Author, b.Division -- GROUP BY, HAVING(조건문)
		HAVING 출판권수 >= 2
	   ) AS bb
 INNER JOIN divtbl AS d
    ON bb.Division = d.Division
 ORDER BY bb.출판권수 DESC;