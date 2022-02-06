select * from tab;

--�ּ���

select * from emp;
select ename, sal from emp;

select * from emp;
--���ʽ��� ���� �ʴ� ����� �����϶�
select * from emp where comm = null;
select * from emp where comm is null;
select * from emp where comm is not null;
select * from emp where comm is null or comm=0;


--�Ի����� 80�⵵�� ������
select * from emp where hiredate like '81%';

--2���� �Ի��� ������
select * from emp where hiredate like '___02%';


--���� (order by)

--�̸������� �����϶� : ���������� asc(����Ʈ)
select * from emp order by ename asc;
--�������� : desc
select * from emp order by ename desc;

--�μ��� �޿������� �����϶�. (�ΰ��� ����)
select * from emp order by job asc, sal asc;

--emp���̺��� ��� �� �������� �繫��, �Ŵ����� ����� �Ի��ϼ����� �����϶�
--��, �ʵ�� �����,������,�Ի���,�޿��� ����
select ename,job,hiredate,sal from emp where job='CLERK' or job='MANAGER' order by hiredate;
select ename,job,hiredate,sal from emp where job in('CLERK', 'MANAGER') order by hiredate;

--emp���̺��� ���ʽ��� ���� �ʴ� ����� �����ȣ,�����,�޿�,���ʽ��� �޿��� ���� ������ �����϶�
select empno,ename,sal,comm from emp where comm is null or comm=0 order by sal desc;


--��������

--1. EMP���̺��� ���ڵ� �� �����ȣ,�����,�޿��� �����϶�
select ename,empno,sal from emp;

--3. EMP���̺��� ���ڵ� �� 5���� �Ի��� ����� ��� �����϶�
select * from emp where hiredate like '___05%';

--5. EMP���̺��� ���ڵ� �� ������ SALESMAN�̰ų� MANAGER�� ����� �����϶�
select * from emp where job='SALESMAN' or job='MANAGER';

--7. EMP���̺��� ��� �� �޿��� 2000~4000�޷��� ����� ���ʽ��� �޴� ����� �����Ͽ� �޿��� ������������ �����Ͽ� �����϶�
select * from emp
where sal between 2000 and 4000 or comm>0 order by sal desc;

--9.EMP���̺��� ��� �� �����ȣ, �̸�,����,�Ի���,�޿��� �μ��ڵ尡 10,20�� ����� ���� ��������, �޿� ������������ �����Ͽ� �����϶�
select empno, ename, job, hiredate, sal
from emp
where deptno=10 or deptno=20
order by job asc, sal desc;

--¦���� ���� Ǯ���
--2.
select empno, ename, sal, job from emp order by name;
--4.
select * from emp where ename like '%A%' or sal >= 3000;
--6.
select * from emp where sal>=3000 and (comm is null or comm=0);
--8.
select * from tab;
select * from tabs;


--NVL() : null �����͸� �ٸ������� �����Ͽ� ó���ϴ� �Լ�
--NVL(comm,0) -> comm�� null�̸� 0���� ǥ���ϰڴ�

select ename,sal,comm,comm+100 from emp;
--�̰� comm�� null�� �����Ͱ� comm+100�� null
select ename,sal,comm,NVL(comm,0)+100 from emp;
--�̷��� ���ϴ� �����ʹ� ��������, ���ڵ���� NVL(comm,0)+100 �� �ǹ���
--���� ���� ����!
select ename,sal,comm,NVL(comm,0)+100 "�� �� ��" from emp;

--emp ���̺��� ����� �����϶�
--�ʵ�� �����,������,�޿�,���ʽ�,���޾��� ����
--���ʽ��� null�� ��� 0���� ǥ���ϰ�
--���޾��� ���ʽ�+�޿��̴�.
select ename, job, sal, NVL(comm,0)"���ʽ�", NVL(comm,0)+sal "���޾�" from emp;

-- ���ͷ�
select ename || ' ' || 'AS A ' || job || '.' msg from emp; -- �ڹٿ��� ���ڿ� ���� + ���� ���� ��.. ||
select ename || ': 1 YEAR SALARY = ' || sal*12 msg from emp; -- �̸�: 1 YEAR SALARY = ���� �������� ��� -- ����=�޿�*12

-- distinct : �ߺ�����
select * from emp;
select distinct job from emp; -- �ߺ����� ���� �� ���� -- �ܵ����θ� �� �� ����