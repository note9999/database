# Database
DDL(데이터 정의어) data definition languate.


▪SCHEMA, DOMAIN, TABLE, VIEW, INDEX를 정의하거나 변경 또는 삭제할 때 사용하는 언어

▪데이터베이스 관리자나 데이터베이스 설계자가 사용함



▪데이터 정의어(DDL)의 3가지 유형

명령어	기능

CREATE Schema, Domain, Table, View, Index를 정의함

ALTER	Table에 대한 정의를 변경하는 데 사용함

DROP	Schema, Domain,Table, View, Index를 삭제함




DML(데이터 조작어) data Manipulation language

▪데이터베이스 사용자가 응용 프로그램이나 질의어를 통하여 저장된 데이터를 실질적으로 처리하는데 사용하는 언어

▪데이터베이스 사용자와 데이터베이스 관리 시스템 간의 인터페이스 제공



▪데이터 조작어(DML)의 4가지 유형

명령어	기능
SELECT	테이블에서 조건에 맞는 튜플을 검색함

INSERT	테이블에 새로운 튜플을 삽입함

DELETE	테이블에서 조건에 맞는 튜플을 삭제함

UPDATE	테이블의 조건에 맞는 튜플의 내용을 변경함





DCL(데이터 제어어) data Control language

▪데이터의 보안, 무결성, 데이터 회복, 병행 수행 제어 등을 정의하는 데 사용하는 언어

▪데이터베이스 관리자가 데이터 관리를 목적으로 사용함



▪데이터 제어어(DCL)의 종류

명령어	기능

COMMIT	데이터베이스 조작 작업이 정상적으로 완료되었음을 관리자에게 알려줌

ROLLBACK	데이터베이스 조작 작업이 비정상적으로 종료되었을 때 원래의 상태로 복구함

GRANT	데이터베이스 사용자에게 사용권한을 부여함

REVOKE	데이터베이스 사용자의 사용권한을 취소함
