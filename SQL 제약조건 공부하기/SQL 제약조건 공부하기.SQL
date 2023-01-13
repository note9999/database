--SQL 제약조건 공부하기

CREATE TABLE NULL_TEST3(
    ID VARCHAR(50) NOT NULL, -- 제약조건 이름은 오라클이 자동으로 설정
    PW VARCHAR(50) CONSTRAINT PW_NULL NOT NULL, --제약 조건 이름은 PW_NULL
    NAME VARCHAR(50) --제약조건 설정안함
);

--제약조건에 위배되는 데이터가 없으므로 잘 싱핼 됨
INSERT INTO NULL_TEST3
    VALUES('AAA', '1234', NULL);

--ID에 설정된 제약조건에 위배되므로 실행 불가
INSERT INTO NULL_TEST3
    VALUES(NULL, '1234', '티모');
    
--PW에 설정된 제약조건에 위배되므로 실행 불가
INSERT INTO NULL_TEST3
    VALUES('BBB', '', '티모');
    
-- 이미 생성된 테이블 안에 제약조건 추가
-- 이미 입력된 데이터 중 NAME에 NULL이 존재하므로 제약조건 추가 불가능 
ALTER TABLE NULL_TEST3 
MODIFY NAME NOT NULL; -- 제약조건 이름은 오라클이 자동으로 설정
--참고사항

ALTER TABLE NULL_TEST3   
MODIFY NAME CONSTRAINT NAME_NULL NOT NULL; -- 제약조건이름은 NAME_NULL로 설정

--확인해보면 NAME에 NULL이 있어서 위에 코드가 실행 안됨
SELECT*FROM NULL_TEST3;

--NAME NOT NULL을 추가하기 위해선 기존 입력된 데이터 중 NULL 인걸 삭제야해야함 
-- 그래서 NAME이 NULL인 데이터를 삭제함 
DELETE FROM NULL_TEST3 WHERE NAME IS NULL;

--삭제 후 제약조건을 추가하면 잘 추가됨

ALTER TABLE NULL_TEST3 
    MODIFY NAME CONSTRAINT NAME_NULL NOT NULL;
    
--제약조건 잘 추가 된지 확인 ( 실행이 안되면 잘 추가 된것임)

INSERT INTO NULL_TEST3 
VALUES('AA', '11' NULL);

--현재 3개의 컬럼에 모두 NOT NULL 설정이 되어있으므로 추가는 무조건 다 입력해줘야함
INSERT INTO NULL_TEST3 
VALUES('AA','11','홍길동');

SELECT*FROM NULL_TEST3 

--생각해보니 NAME에는 NOT NULL 일 필요가 없을 것 같음
--그래서 제약조건 삭제시킬거임
ALTER TABLE NULL_TEST
DROP CONSTRAINT NAME_NULL; --제약조건이름이 NAME_NULL인거 삭제

--위에서 NAME제약조건을 지웠으므로 이제 NULL이 추가됨
INSERT INTO NULL_TEST
VALUES ('BB','123'NULL);

--NULL추가 된건지 최종확인
SELECT*FROM NULL_TEST;










