INSERT INTO proctbl (total_name)
VALUES ('BBK');

SELECT *
  FROM proctbl;

DELETE FROM proctbl
 WHERE ID = 4;
 
-- 완전 초기화 + 모든 값 삭제
TRUNCATE proctbl;