select * from tab;

--주석문

select * from emp;
select ename, sal from emp;

select * from emp;
--보너스를 받지 않는 사원을 선택하라
select * from emp where comm = null;
select * from emp where comm is null;
select * from emp where comm is not null;
select * from emp where comm is null or comm=0;


--입사일이 80년도인 사원목록
select * from emp where hiredate like '81%';

--2월에 입사한 사원목로
select * from emp where hiredate like '___02%';


--정렬 (order by)

--이름순으로 선택하라 : 오름차순은 asc(디폴트)
select * from emp order by ename asc;
--내림차순 : desc
select * from emp order by ename desc;

--부서별 급여순으로 정렬하라. (두가지 정렬)
select * from emp order by job asc, sal asc;

--emp테이블의 사원 중 담당업무가 사무직, 매니저인 사원의 입사일순으로 선택하라
--단, 필드는 사원명,담당업무,입사일,급여를 선택
select ename,job,hiredate,sal from emp where job='CLERK' or job='MANAGER' order by hiredate;
select ename,job,hiredate,sal from emp where job in('CLERK', 'MANAGER') order by hiredate;

--emp테이블에서 보너스를 받지 않는 사원의 사원번호,사원명,급여,보너스를 급여가 높은 순으로 선택하라
select empno,ename,sal,comm from emp where comm is null or comm=0 order by sal desc;


--연습문제

--1. EMP테이블의 레코드 중 사원번호,사원명,급여를 선택하라
select ename,empno,sal from emp;

--3. EMP테이블의 레코드 중 5월에 입사한 사원을 모두 선택하라
select * from emp where hiredate like '___05%';

--5. EMP테이블의 레코드 중 업무가 SALESMAN이거나 MANAGER인 사원을 선택하라
select * from emp where job='SALESMAN' or job='MANAGER';

--7. EMP테이블의 사원 중 급여가 2000~4000달러인 사원과 보너스를 받는 사원을 선택하여 급여를 내림차순으로 정렬하여 선택하라
select * from emp
where sal between 2000 and 4000 or comm>0 order by sal desc;

--9.EMP테이블의 사원 중 사원번호, 이름,업무,입사일,급여를 부서코드가 10,20인 사원을 업무 오름차순, 급여 내림차순으로 정렬하여 선택하라
select empno, ename, job, hiredate, sal
from emp
where deptno=10 or deptno=20
order by job asc, sal desc;

--짝수는 내가 풀어보기
--2.
select empno, ename, sal, job from emp order by name;
--4.
select * from emp where ename like '%A%' or sal >= 3000;
--6.
select * from emp where sal>=3000 and (comm is null or comm=0);
--8.
select * from tab;
select * from tabs;


--NVL() : null 데이터를 다른값으로 변경하여 처리하는 함수
--NVL(comm,0) -> comm이 null이면 0으로 표시하겠다

select ename,sal,comm,comm+100 from emp;
--이건 comm이 null인 데이터가 comm+100도 null
select ename,sal,comm,NVL(comm,0)+100 from emp;
--이러면 원하는 데이터는 나오지만, 레코드명이 NVL(comm,0)+100 이 되버림
--따라서 별명 쓰기!
select ename,sal,comm,NVL(comm,0)+100 "보 너 스" from emp;

--emp 테이블의 사원을 선택하라
--필드는 사원명,담당엄무,급여,보너스,지급액을 선택
--보너스는 null인 경우 0으로 표시하고
--지급액은 보너스+급여이다.
select ename, job, sal, NVL(comm,0)"보너스", NVL(comm,0)+sal "지급액" from emp;

-- 리터럴
select ename || ' ' || 'AS A ' || job || '.' msg from emp; -- 자바에서 문자열 연산 + 역할 같은 것.. ||
select ename || ': 1 YEAR SALARY = ' || sal*12 msg from emp; -- 이름: 1 YEAR SALARY = 연봉 형식으로 출력 -- 연봉=급여*12

-- distinct : 중복제거
select * from emp;
select distinct job from emp; -- 중복값을 가진 행 제거 -- 단독으로만 쓸 수 있음