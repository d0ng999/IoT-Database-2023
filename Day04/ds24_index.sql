USE tabledb;

CREATE TABLE tbl1 (
	ID INT NOT NULL PRIMARY KEY,
    bridge INT NULL,
    contents VARCHAR(5000)
);

-- sqldb DB의 usertbl 데이터 중에서 userID, name, birthYear, addr만 가져와서
-- tabledb.usertbl에 집어넣었다.
INSERT INTO tabledb.usertbl 
SELECT userID, name, birthYear, addr
  FROM sqldb.usertbl;
  
-- INDEX는 검색시간을 빠르게 해주는데 INDEX를 설정할 때, 컬럼에 NULL이 많으면 오히려 역효과봄!
SELECT *
  FROM usertbl
 WHERE name = '김범수';
