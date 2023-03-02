-- INSERT INTO SELECT
-- usertbl에서 앞의 4개의 컬럼값을 가져와서 전부
-- usertbl_bak에 집어넣어라 라는 뜻!
INSERT INTO usertbl_bak (userID, name, birthYear, addr)
SELECT userID, name, birthYear, addr FROM usertbl;