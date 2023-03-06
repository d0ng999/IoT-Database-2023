/* BookRentalShop 연습 */
SELECT *
  FROM membertbl;
  
-- 서브쿼리
SELECT b.Author AS '저자'   -- 1
	 , b.Division AS '장르' -- 2
     , b.Names AS '책제목'  -- 3
     , b.ISBN				-- 4
     , b.Price AS '금액'	-- 5
  FROM bookstbl AS b
 ORDER BY 5 DESC; -- b.Price를 대신해서 숫자 5로 표현가능!