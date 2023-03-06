-- UPDATE & TRANSACTION
START TRANSACTION; 

-- 경고! UPDATE 구문에는 WHERE 절을 빼면 안됨!!!
UPDATE usertbl_bak
   SET mobile1 = '010'
     , mobile2 = '66547523'
     , addr = '경남'
 WHERE userID = 'YJS';
 
COMMIT;
ROLLBACK;

-- DELETE
-- WHERE절이 빠지면 
DELETE FROM usertbl_bak
 WHERE userID = 'HDS';