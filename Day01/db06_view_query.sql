-- 그냥 테이블 접근
SELECT *
	FROM memberTBL;

-- 뷰 생성
CREATE VIEW uv_memberTBL
	AS
	SELECT memberName, memberAddress
		FROM membertbl;
        
-- 뷰로 조회(기본키는 가려서 보여준다)
SELECT *
	FROM uv_membertbl;