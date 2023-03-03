-- 뷰
USE sqldb;

CREATE VIEW uv_potentialUser
AS
	SELECT u.*
		 , b.num, b.prodName, b.price, b.amount
	  FROM usertbl AS u
      LEFT OUTER JOIN buytbl AS b
        ON u.userID = b.userID
	 WHERE b.userID IS NULL;
     
SELECT * 
  FROM uv_potentialUser;
  
-- 사용자테이블 뷰
CREATE VIEW uv_usertbl
AS
	SELECT u.userID
		 , u.name
         , u.birthYear
         , u.addr
	  FROM usertbl AS u;