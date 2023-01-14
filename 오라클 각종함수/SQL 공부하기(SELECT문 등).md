https://note9999.tistory.com/103

함수(메서드 같은거) 

 

UPPER 대문자 변환 

LOWER 소문자 변환 

 

EMP 테이블에서 이름이 S를 포함하는 레코드만 조회

 

SELECT * 
FROM EMP
WHERE ENAME LIKE upper('%s%');
 

LENGTH 글자수 세줌

LENGTHB : 바이트로 세줌

EMP 테이블에서 이름이 5글자인 레코드만 조회하기 

SELECT *
FROM EMP
WHERE LENGTH(ENAME)=5;
 

계산식을 조회하는 더미테이블(임시제공)(기존테이블이용하기 번거로울 때) : DUAL;

SELECT 20*30 FROM DUAL;
결과값 600만 출력

 

 

ABS: 절대값 구해주는 함수 

SELECT ABS(-10) FROM DUAL;
결과값: 10 

 

ROUND: 반올림 해주는 함수 

소수 둘째자리에서 반올림

반올림하여 소수 둘째까지

 

양수(소수), 음수(정수부분) 

 

2: 소수 셋째자리에서 반올림 

1: 소수 둘째자리에서 반올림

0: 소수 첫째자리에서 반올림

-1: 일의자리에서반올림

-2: 십의 자리에서 반올림 

SELECT 12.3456, ROUND(12.3456), ROUND(12.3456,-1)
FROM DUAL;
 결과값 12.3456, 12, 10

 

TRUNC: 버림 

SELECT 12.3456, TRUNC(12.3456), TRUNC(12.3456,2) , TRUNC(12.3456,-1) 
FROM DUAL;
결과값 12.3456 12 12.34 10

 

CEIL:더 위에있는 정수값 출력 ( 두번째 인수 없음) 

-> 소수 있으면 걍 올려버림( 정수로 바뀜)

FLOOR: 더 밑에있는 정수값 출력 두번째 인수가 없음) 

 

나머지 MOD(X,Y) -> X나누기 Y의 나머지를 구함

이름의 길이가 홀수 인것 출력 

 

12.345*10-> 123.45-> CEIL(123.45) -> 124-> 124/10 

 

 

POWER(X,Y) -> X를 Y제곱한 결과를 출력 

SELECT POWER(3,4) FROM DUAL;
결과값:81

 

SUBSTR (문자열X,Y)

해당 문자열(컬럼)에서 X번째 부터 Y개만큼 출력

Y가 생략시 끝까지 출력해줌

X가 양수면 맨 왼쪽부터 Y가 음수면 맨 오른쪽부터

SELECT JOB,SUBSTR(JOB ,1,2),SUBSTR(JOB,3,2),SUBSTR(JOB,5)
FROM EMP;
결과값: 

CLERK CL ER K
SALESMAN SA LE SMAN
SALESMAN SA LE SMAN
MANAGER MA NA GER
SALESMAN SA LE SMAN
MANAGER MA NA GER
MANAGER MA NA GER
PRESIDENT PR ES IDENT
SALESMAN SA LE SMAN
CLERK CL ER K
ANALYST AN AL YST
CLERK CL ER K

 

INSTR -> 해당 문자의 위치를 출력

 

INSTR (문자열(컬럼명),찾을 문자)-> 문자열에서 찾을 문자가 몇번째인지 알려줌(단 첫번째꺼위치나옴) 

 

INSTR(문자열(컬럼명),찾을문자, X)-> 문자열에서 찾을 문자가 몇번째 인지 알려줌(X번째부터 검색을 시작함) 

 

INSTR(문자열(컬럼명),찾을문자, X,Y)-> 문자열에서 찾을문자가 몇번째인지 알려줌(X번째부터 검색시작해서 Y번째 찾을문자의 위치를 출력)

 

EX) SELECT INSTR('HELLO ORACLE'  , 'L' 1,2) FROM DUAL;

HELLO ORACLE에서 L의 위치를 첫번쨰부터 검색해서 2번째 L의 위치가 출력됨

그래서 결과가 4가나옴

주소

서울시 강동구 천호동 -> 강동구

서울특별시 강동구 천호동-> 강동구

 

SELECT INSTR ('HELLO ORACLE', 'L', 5) FROM DUAL;

SELECT INSTR ('HELLO ORACLE', 'L', 1,2) FROM DUAL;
5번째부터(그전꺼다건너뛰고)  L의 위치를  찾아라, L이 들어간문자 1개를 출력하는데 2번째꺼에서 출력 

 

 

 

 

REPLACE(문자열(컬럼명)X,Y) 

해당문자열 (컬럼)에서 X를 Y로 바꾸는 함수 

 

REPLACE(문자열(컬럼명),X)-> 헤당 문자열(컬럼)에서 X를 지움

SELECT REPLACE ('010-1234-5678', '-', 'X') FROM DUAL;
결과값: 010X1234X5678 

 

 

LPAD 

RPAD

해당 문자열(컬럼)을 X칸 만큼 공간을 만들어서 빈칸은 Y로 채움( L은 왼쪽에 채움, R은 오른쪽에 채움) 

SELECT LPAD('ORACLE', 10,'+'), RPAD('ORACLE',10,'+')
FROM DUAL;
 결과값: ++++ORACLE ORACLE++++

 

SELECT RPAD('010-1234-',13,'*') FROM DUAL;
결과값: 010-1234-****

 

CONCAT: 두개 연결시켜줌 

SELECT CONCAT(EMPNO, ENAME), EMPNO||ENAME 
FROM EMP;
결과값

7369SMITH 7369SMITH
7499ALLEN 7499ALLEN
7521WARD 7521WARD
7566JONES 7566JONES
7654MARTIN 7654MARTIN
7698BLAKE 7698BLAKE
7782CLARK 7782CLARK
7839KING 7839KING
7844TURNER 7844TURNER
7900JAMES 7900JAMES
7902FORD 7902FORD
7934MILLER 7934MILLER

SYSDATE 현재날짜 알려줌

 

ADD_MONTH( 날짜, X개월수)-> 해당날짜에서 X개월 수를 더한날짜가 나옴 

 

EMP테이블에서 입사일에 10년 뒤 날짜를 출력 

SELECT HIREDATE, ADD_MONTHS(HIREDATE,120) FROM EMP;
결과값:

80/12/17 90/12/17
81/02/20 91/02/20
81/02/22 91/02/22
81/04/02 91/04/02


SELECT SYSDATE - HIREDATE FROM EMP;
15364.4901388888888888888888888888888889
15299.4901388888888888888888888888888889
15297.4901388888888888888888888888888889

 

 

MONTHS_BETWEEN 

 

SELECT HIREDATE, MONTHS_BETWEEN(SYSDATE,HIREDATE) FROM EMP;
결과값

80/12/17 504.790035842293906810035842293906810036
81/02/20 502.693261648745519713261648745519713262
81/02/22 502.628745519713261648745519713261648746
81/04/02 501.273906810035842293906810035842293907
81/09/28 495.435197132616487455197132616487455197

NEXT_DAY

오늘 날짜를 기준으로 돌아오는 바로 다음 월요일 의 날짜

select sysdate, next_day(sysdate,'월요일') from dual;
결과값

23/01/10현재날짜 23/01/16돌아오는월요일날짜 

 

 

이번달 마지막 일 며칠인

select last_day(sysdate) from dual;
23/01/31

 

 

 

TO_CHAR 문자로변환하기 

SELECT TO_CHAR(SYSDATE,'YYYY/DD/DD HH:MI:SS') FROM DUAL;
결과값

2023/10/10 12:00:06

 

 

YYYY (년 4자리)

YY 년 (2자리)

MM: 월 ( MON: 약자 MONTH :다나옴)

DD:일

DDD:일( 365일중 몇번째 일인지 알려줌)

DY: 요일 (약자)

DAY: 요일(다나옴) 

W: 몇째 주 인지 나옴( 1년 중 총 몇번째 주인지) 

HH24: 시(24시간형식)

HH: 시( 12시간형식)

MI: 분

SS:초 

 

L : 지역 화폐 기호

9: 숫자(0을 표시안함, 불필요한 0 표시안함) 

0: 숫자(0을 표시함, 내가 쓴만큼 0 전부표시 ) 소수점이나 이런거 할떄는 0 

 

SELECT TO_NUMBER 숫자로 변환하기 

SELECT TO_NUMBER('1300')-TO_NUMBER('1100') FROM DUAL;
결과값 200 문자 1300,1100을 숫자로 바꾸어주고 계산해서 200나옴

 

 

SELECT TO_DATE 날짜로 변환하기 

SELECT TO_DATE('20200101', 'YY/MM/DD') FROM DUAL;
결과값: 20/01/01

 

NVL(A,B)

A가 NULL인지 아닌지 파악

A가 NULL이면 B출력, A가 NULL이 아니면 A그대로 출력

 

SELECT NVL (A,B)  A가 NULL이면 B출력, A가 NULL이 아니면 A그대로 출력 

SELECT NVL(SAL+COMM,0) FROM EMP;
NVL 앞에 인수가 NULL이면 뒤에 0값을 출력하고 NULL이 아니면 SAL+COMM 값 그대로 출력

 

응용하기

NVL(SAL+COMM(추가수당), SAL)

연봉 추가수당 계산한게 NULL인지 아닌지-> NULL 이면 연봉만 출력, NULL이아니면 연봉+추가수당 출력

 

NVL2(A,B,C)

A가 널인지 아닌지 파악

A가 널일경우 B가출력

A가 널이 아닐경우 C가출력

 

SELECT NVL2

SELECT COMM, NVL2(COMM,'O','X') FROM EMP;

 

NULLIF (A,B) 

A==B 이면 A 출력, A!=B이면 B출력

 

DECODE(SWITCH~CASE문 이랑 똑같음)

직책(JOB)이 MANAGER면 1000, SALESMAN 500, 나머지는 300

SELECT DECODE( JOB, 
'MANAGER',1000, 
'SALESMAN',500,
300)
FROM EMP
300
500
500
1000


select job, decode(job, 
                'MANAGER', 1000,
                'SALESMAN', 500,
                300)
        from emp;
        
select job,
        case
            when job = 'MANAGER' then 1000
            when job = 'SALESMAN' then 500
        end as 케이스
    from emp;
 

select sal,
case
when sal>=2000 then '급여높음'
else '급여낮음'
end as 케이스
from emp;
연봉 2000이상이면 급여높으로 표시 나머지경우는 급여낮음으로 표시

800 급여낮음
1600 급여낮음
1250 급여낮음
2975 급여높음

RPAD,SUBSTR,LENGTH,

 

RPAD('A' ,5 , '*') 뜻 :  A라는 글자를 총5칸 차지하게 만들고 비어있는 공간을 *로 메꾸어라는 뜻 

RPAD('A', NUM,'B') -> A라는 글자를 총 NUM칸 차지하게 만들고(A포함)  나머지 공간을 B로 메꾸어라. 

 

EMP 테이블에서 이름이 다섯글자인 사람들의 사원번호, 이름 그리고 사원번호 앞 두자리와 뒤 두자리는

**로 출력하고 이림의 첫글자와 나머지 글자는*로 출력

사원번호, 이름       사원번호+함수    이름+함수 

1234         ABCDE      12**                       A****

SELECT EMPNO, ENAME,
SUBSTR(EMPNO,1,2)||'**'AS 사원번호처리,
RPAD(SUBSTR(ENAME,1,1), LENGTH(ENAME), '*')AS 이름처리한것 
FROM EMP
WHERE LENGTH(ENAME)=5;
↑코드 설명 이름의 첫글자가 필요한 상황, 이름의 첫글자를 뽑아내기 위해 SUBSTR(ENAME,1,1) 사용  근데 그 첫글자 뒤에 나머지 글자 수만큼 *를 찍어내야하는데 *가 고정적이지 않음(EX 이름이 세글자 네글자 이런경우) 그래서RPAD를 사용함. RPAD의 기능은 두번 

 

EMP 테이블에서 사원들의 평균 근무일수는 20일이다. 

하루 근무시간 8시간으로 처리했을 때 일당과 시급을 게산해서 출력하여라. 

 

결과는 사원번호,이름,급여,일당,시급순으로 출력하고

일당은 소수 세째자리에서 버림

시급은 소수 둘떄자리에서 반올림

 

SELECT EMPNO, ENAME, HIREDATE, --사원번호, 이름, 입사일
    TO_CHAR(NEXT_DAY(ADD_MONTHS(HIREDATE, 3), '월요일'), 'YYYY/MM/DD') AS 정직원날짜,--정직원 날짜 형식
    NVL(TO_CHAR(COMM), 'N/A') --추가수당
    FROM EMP; --EMP 테이블
NVL 할때 앞에 COMM 이라는 컬럼이 숫자로 이루어져있고 뒤에 'N/A'는 문자이므로 통일시켜야 해서

앞에있는 COMM 컬럼을 TO CHAR를 이용해 문자로 바꿔준것임! 

 

 

EMP 테이블에서 사원들에게 직속상관 번호를 아래 조건에 맞게 변환해서 출력

 

직속상관이 없으면 0000 ( 직속상관이 없으면= NULL 이라는 뜻) 

직속상관 번호 앞 두자리가 75-> 5555

직속상관 번호 앞 두자리가 75-> 5555

직속상관 번호 앞 두자리가 75-> 5555

직속상관 번호 앞 두자리가 75-> 5555

나머지 해당 직속상관 사원번호 그대로 출력 

결과는 사원번호, 이름, 직속상관번호,변환된 번호순으로 출력 

SELECT 
EMPNO,
ENAME,
MGR,
CASE 
WHEN MGR IS NULL THEN 0000
WHEN SUBSTR(MGR,1,2)='75' THEN 5555
WHEN SUBSTR(MGR,1,2)='76' THEN 5555
WHEN SUBSTR(MGR,1,2)='77' THEN 5555
WHEN SUBSTR(MGR,1,2)='78' THEN 5555
ELSE MGR
END AS MGR
FROM EMP;
    
-- 1. EMP테이블에서 COMM 의 값이 NULL이 아닌 정보 조회
    SELECT * from emp where comm is not null;  

-- 2. EMP테이블에서 추가수당을 받지 못하는 직원 조회
    select*from emp where comm is null
    or comm = 0; --추가수당이0인 경우도 있기때문
    
-- 3. EMP테이블에서 관리자가 없는 직원 정보 조회
    select * from emp where MGR is null;
    
-- 4. EMP테이블에서 급여를 많이 받는 직원 순으로 조회
    select * from emp order by sal desc;
    
-- 5. EMP테이블에서 급여가 같을 경우 추가수당을 내림차순 정렬 조회
    select * from emp order by sal desc,comm desc;
    
-- 6. EMP테이블에서 사원번호, 사원명,직급, 입사일 조회 (단, 입사일을 오름차순 정렬 처리)
      select empno,ename,job,hiredate from emp
      order by hiredate asc;
            
-- 7. EMP테이블에서 사원번호, 사원명 조회 (사원번호 기준 내림차순 정렬)
    select empno, ename
        from emp
    order by empno desc;
    
-- 8. EMP테이블에서 사번, 입사일, 사원명, 급여 조회 
-- (부서번호가 빠른 순으로, 같은 부서번호일 때는 최근 입사일 순으로 처리)
SELECT empno, hiredate, ename, sal
    from emp
order by deptno asc, hiredate desc;

-- 9. 오늘 날짜에 대한 정보 조회
SELECT sysdate from dual;
   
-- 10. EMP테이블에서 사번, 사원명, 급여 조회 
-- (단, 급여는 100단위까지의 값만 출력 처리하고 급여 기준 내림차순 정렬)
SELECT empno,ename,round(sal,-1) as 급여
    from emp
order by 급여 desc;

-- 11. EMP테이블에서 사원번호가 홀수인 사원들을 조회
SELECT *
    from emp
where mod(empno, 2)=1; --나머지가 1

-- 12. EMP테이블에서 사원명, 입사일 조회 (단, 입사일은 년도와 월을 분리 추출해서 출력)
-- 12번은 하지마셈
SELECT ENAME,
    EXTRACT(YEAR FROM HIREDATE)AS 입사년도,--연도만 뽑아내기
    EXTRACT(MONTH FROM HIREDATE)AS 입사월
FROM EMP;

-- 13. EMP테이블에서 9월에 입사한 직원의 정보 조회
SELECT *
    FROM EMP
WHERE TO_CHAR(HIREDATE,'MM') = '09';
--WHERE EXTRACT(MONTH FROM HIREDATE) = '9';
-- 14. EMP테이블에서 81년도에 입사한 직원 조회
SELECT *
    FROM EMP
WHERE TO_CHAR(HIREDATE,'YY') = '81';
----==WHERE EXTRACT(YEAR FROM HIREDATE) = '81';

-- 15. EMP테이블에서 이름이 'E'로 끝나는 직원 조회
SELECT * FROM EMP WHERE ENAME LIKE '%E';
--WHERE SUBSTR(ENAME,-1,1_='E';
-- 16. EMP테이블에서 이름의 세 번째 글자가 'R'인 직원의 정보 조회
SELECT * FROM EMP WHERE ENAME LIKE '__R%';
-- 17. EMP테이블에서 사번, 사원명, 입사일, 입사일로부터 40년 되는 날짜 조회
SELECT EMPNO, ENAME, HIREDATE, ADD_MONTHS(HIREDATE, 40*12) AS "40년" FROM EMP;
-- 18. EMP테이블에서 입사일로부터 38년 이상 근무한 직원의 정보 조회
SELECT * FROM EMP WHERE MONTHS_BETWEEN(SYSDATE,HIREDATE)/12 >=38;
-- 19. 오늘 날짜에서 년도만 추출
SELECT EXTRACT (YEAR FROM SYSDATE) FROM DUAL;
단일 행 함수

 

그룹 함수

 

SELECT COUNT ( *) FROM EMP;  

 

SELCT문 이어서 

--총 레코드 개수를 세어 줌
SELECT COUNT (*) FROM EMP;
--   COUNT(컬럼명넣어도되긴함)

SELECT SUM(SAL) FROM EMP;
--합계↑
SELECT SUM(DISTINCT DEPTNO) FROM EMP;
--중복 제거 후 계산 ↑

SELECT SUM(SAL),SUM(COMM) FROM EMP;
--연봉합, 추가수당합 ↑

--부서번호가 20인사람들의 급여합계↓
SELECT SUM(SAL) FROM EMP WHERE DEPTNO=20;

--직책이 MANAGER인 인원 수↓
SELECT COUNT(DEPTNO) FROM EMP WHERE JOB='MANAGER';

--추가수당이 없는 사람 수(0과 NULL 둘다 생각)
SELECT COUNT(*) FROM EMP WHERE COMM IS NULL OR COMM=0;

--MAX,MIN 최대값 최소값 AVG 평균
SELECT MAX(SAL), MIN(SAL), AVG(SAL) FROM EMP;
그룹화 

GROUP BY 

부서변호별 급여의 평균을 게산해서 출력

그룹바이 예시 ↓ 

 

  
-- 부서번호별 급여의 평균을 계산해서 출력
  SELECT DEPTNO, AVG(SAL) 
  FROM EMP
  GROUP BY DEPTNO; 

--직책별 인원 수와 급여의 합계를 출력
    SELECT JOB, COUNT(*), SUM(SAL)
    FROM EMP
    GROUP BY JOB;
    
---직책별, 부서번호별 인원 수와 급여의 합계를 출력
    SELECT JOB, COUNT(*), SUM(SAL)
    FROM EMP
    GROUP BY JOB, DEPTNO;  
    
    --직책별 급여 합계를 출력하는데
    --급여합계가 5000이상인 것만 보고싶음, 그룹바이쓰면 조건절을 생각해보고 주로 HAVING을 써야함
    SELECT JOB, SUM(SAL)
    FROM EMP
    GROUP BY JOB
    HAVING SUM(SAL)>=5000;
 

SELECT 컬럼(*)

FROM 테이블명

WHERE 조건식

GROUP BY 그룹화할 컬럼

HAVING 그룹에 대한 조건식

ORDER BY 정렬할 컬럼

 

부서번호별 직책별 급여가 2000이상인 급여평균을 출력

단, 급여평균은 2500이상인 데이터만 표시

부서번호 기준으로 오름차순, 직책을 기준으로 내림차순 정렬 

SELECT DEPTNO, JOB, AVG(SAL)
FROM EMP
WHERE SAL>=2000
GROUP BY DEPTNO, JOB
HAVING AVG(SAL) >=2500
ORDER BY DEPTNO, JOB DESC;
순서 잘보고 차근차근 부서번호별, 직책별, 급여평균이니까 SELECT문에 

DEPTNO, JOB, AVG(SAL) 기재

SELECT 다음에 FROM EMP(테이블명)  그다음 각각의 조건을 나타내는

WHERE절 WEHRE SAL>= 2000

그룹바이로 DEPRNO와 JOB을 묶고

묶은 놈들 중에서 급여 2500이상인애들만 이니까 HAVING

HAVING AVG(SAL) >= 2500

맨마지막에 정렬 

 

-> 평균을 계산하기전에 급여가 2000보다 작은건 다 제외시킨후 (WHERE절로) 급여평균이 계산됨

계산이 처리된 급여평균이 2500이상인것만(HAVING 절)  결과로 출력

 

부서번호별 급여평균, 최고급여, 최저급여, 인원수를 출력

급여평균은 소수첫째자리에서 반올림 

SELECT DEPTNO, 
ROUND(AVG(SAL),0),
MAX(SAL),
MIN(SAL),
COUNT(*)
FROM  EMP
GROUP BY DEPTNO;
 
