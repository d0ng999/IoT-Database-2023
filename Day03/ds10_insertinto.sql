-- INSERT 삽입문
-- INSERT에서의 컬럼수와 VALUES의 컬럼수가 동일해야한다.
-- 중복을 허용해서 넣는만큼 들어간다.
-- 한번 키로 들어간 값은 다시 살릴 수 없다.
-- 즉, 13, 14, 15, 16번째 키를 만들고 지운 후, 다시 하나 더 만들면 17번으로 만들어짐
INSERT INTO usertbl
(userID, name, birthYear, addr, mobile1, mobile2, height, mDate)
VALUES
('HDH', '홍동현', 1998,	'경남',	'010', '12345678', 171, '2023-03-02');

-- 전화번호1, 2와 키, 날짜는 NOT NULL이 아니기때문에 아무것도 안 넣고 싶으면, NULL 넣기
-- 컬럼을 다 적을 때, 입력안할 컬럼은 NULL로 고정
INSERT INTO usertbl
(userID, name, birthYear, addr, mobile1, mobile2, height, mDate)
VALUES
('HDS', '홍길순', 2000,	'서울',	NULL, NULL, 160, '2023-03-02');

-- NULL이 되는 값은 굳이 추가 안해줘도 NULL이 된다.
-- NULL 컬럼은 생략 가능
INSERT INTO usertbl
(userID, name, birthYear, addr)
VALUES
('SHM', '손흥민', 1991,	'서울');

-- 같은 순서로 입력만 해준다면, VALUES 값을 다 안적어도 된다.
-- 컬럼 지정을 아예 생략해도됨. 단 값의 순서가 컬럼 순서와 일치해야함!
INSERT INTO usertbl VALUES
('SJW', '손정우', 1967,	'서울', '010', '12346789', 176, NULL);

-- AUTO INCREMENT의 경우 필드값을 입력하지 않아도 되요.
-- num은 자동으로 추가되는 번호가 증가되므로 직접 넣을 필요는 없다.
INSERT INTO buytbl
(userID, prodName, groupName, price, amount)
VALUES
('HDH', '노트북', '전자', 5000000, 1);