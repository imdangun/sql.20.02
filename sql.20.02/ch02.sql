select employee_id, last_name, job_id, department_id
from employees
where department_id=90;
--

select last_name, job_id, department_id
from employees
where last_name='Whalen';

-- 도구 - 환경설정 - NLS 로 검색, 
-- 언어와 날짜언어: AMERICAN, 날짜 형식: DD-MON-RR 로 설정한다.
select last_name, hire_date
from employees
where hire_date = '06-FEB-08';

select last_name, salary
from employees
where salary<=3000;

select last_name,job_id
from employees
where job_id <> 'SA_REP';

select last_name,job_id
from employees
where job_id != 'SA_REP';

select last_name,job_id
from employees
where job_id ^= 'SA_REP';
--
select last_name, salary
from employees
where salary between 2500 and 3500;

select last_name
from employees
where last_name between 'King' and 'Smith';

select last_name, hire_date
from employees
where hire_date between '01-JAN-02' and '31-DEC-02';
--
select employee_id, last_name, salary, manager_id
from employees
where manager_id in (100, 101, 201);

select employee_id, last_name, salary, manager_id
from employees
where manager_id=100 or manager_id=101 or manager_id=201;

select employee_id, manager_id, department_id
from employees
where last_name in ('Hartstein','Vargas');

select employee_id, last_name, hire_date
from employees
where hire_date in ('17-JUN-03','21-SEP-05');
--
select first_name
from employees
where first_name like 'S%';

select first_name
from employees
where first_name like '%r';

select first_name
from employees
where first_name like '%s%';

select last_name, hire_date
from employees
where hire_date like '%05';
--
select first_name, last_name
from employees
where last_name like 'K___';

select last_name
from employees
where last_name like '_o%';
--
select employee_id, last_name, job_id
from employees
where job_id like '%SA\_%' escape '\';

select employee_id, last_name, job_id
from employees
where job_id like '%SAe_%' escape 'e';

select employee_id, last_name, job_id
from employees
where job_id like '%[_R%' escape '[';

select employee_id, last_name, job_id
from employees
where job_id like '%[_[R%' escape '[';
--01424. 00000 -  "missing or illegal character following the escape character"
--*Cause: The character following the escape character in LIKE pattern is
-- missing or not one of the escape character, '%', or '_'.
--

select last_name, manager_id
from employees
where manager_id is null;

select last_name, manager_id
from employees
where manager_id = null;
--

select employee_id, last_name, job_id, salary
from employees
where salary >= 10000 and job_id like '%MAN%';

select employee_id, last_name, job_id, salary
from employees
where salary>=10000 or job_id like '%MAN%';

select last_name, job_id
from employees
where job_id not in('IT_PROG', 'ST_CLERK', 'SA_REP');

select last_name, salary
from employees
where salary not between 10000 and 15000;

select last_name
from employees
where last_name not like '%A%';

select last_name, commission_pct
from employees
where commission_pct is not null;
--
select last_name, salary
from employees
where manager_id is null and salary>20000;

select last_name, salary
from employees
where not(manager_id is null and salary>20000);
--
select last_name, salary
from employees
where manager_id=null and salary>20000;

select last_name, salary
from employees
where not (manager_id=null and salary>20000);

select last_name, salary
from employees
where not (manager_id=null or salary>20000);
--

select last_name, job_id, salary
from employees
where job_id='SA_REP' or job_id='AD_PRES' and salary>15000;

select last_name, job_id, salary
from employees
where (job_id='SA_REP' or job_id='AD_PRES') and salary>15000;
--
select last_name, job_id, department_id, hire_date
from employees
order by hire_date;

select last_name, job_id, department_id, hire_date
from employees
order by hire_date desc;

select employee_id, last_name, salary*12 annsal
from employees
order by annsal;
--

select last_name, job_id, department_id, hire_date
from employees
order by 3;

select last_name, department_id, salary
from employees
order by department_id, salary desc;


--실습
--1
select last_name, salary
from employees
where salary > 12000;
 
 
--2
select last_name, department_id
from employees
where employee_id = 176;
 
 
--3
select last_name, salary
from employees
where salary not between 5000 and 12000;
 
 
--4
select last_name, job_id, hire_date
from employees
where last_name in ('Matos', 'Taylor')
order by hire_date;
 
 
--5
select last_name, department_id
from employees
where department_id in (20,50)
order by last_name asc;
 
 
--6
select last_name "Employee", salary "Monthly Salary"
from employees
where salary between 5000 and 12000
and department_id in (20,50);
 
 
--7
select last_name, hire_date
from employees
where hire_date like '%03';
 
 
--8
select last_name, job_id
from employees
where manager_id is null;
 
 
--9
select last_name, salary, commission_pct
from employees
where commission_pct is not null
order by 2 desc, 3 desc;
 
--10
select last_name
from employees
where last_name like '__a%';
 
 
--11
select last_name
from employees
where last_name like '%a%'
and last_name like '%e%';
 
 
--12
select last_name, job_id, salary
from employees
where job_id in ('SA_REP', 'ST_CLERK')
and salary not in (2500, 3500, 7000);
 
 
--13
select last_name "Employee", salary "Monthly Salary", commission_pct
from employees
where commission_pct = .2;
