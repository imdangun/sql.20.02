desc dual

select * from dual;

select lower('SQL Course')
from dual;

select upper('SQL Cousre')
from dual;

select initcap('SQL Course')
from dual;

select employee_id, last_name, department_id
from employees
where lower(last_name) = 'higgins';

select concat('Hello', 'World') from dual;

select substr('HelloWorld', 1, 3) from dual;

select length('HelloWorld') from dual;

select instr('HelloWorld', 'W') from dual;

select lpad(salary, 10, '*') from employees;

select rpad(salary, 10, '*') from employees;

select replace('JACK and JUE', 'J', 'BL') from dual;

select trim('H' from 'HelloWorld') from dual;

select '|' || ' hello world ' || '|' from dual;

select '|' || trim(' hello world ') || '|' 
from dual;

select employee_id, concat(first_name, last_name) name,
    job_id, length(last_name), instr(last_name, 'a') "Contains 'a'?"
from employees
where substr(job_id, 4) = 'REP';

select employee_id, concat(first_name, last_name) name,
    length(last_name), instr(last_name, 'a') "Contains 'a'?"
from employees
where substr(last_name, -1, 1) = 'n';

select round(45.926, 2) from dual;

select trunc(45.926, 2) from dual;

select mod(1600, 300) from dual;

select round(45.923, 2), round(45.923, 0), round(45.923, -1)
from dual;

select last_name, salary, mod(salary, 5000)
from employees
where job_id = 'SA_REP';

select sysdate from dual;

select current_date from dual;

select sysdate + 1 from dual;

select sysdate - 1 from dual;

select sysdate - sysdate from dual;

select sysdate + sysdate from dual; -- error

select sysdate * 1 from dual; -- error

select sysdate / 1 from dual; -- error

select last_name, (sysdate - hire_date) / 7 as weeks
from employees
where department_id = 90;

select months_between('25-FEB-19', '19-DEC-18') from dual;

select months_between('19-DEC-18', '25-FEB-19') from dual;

select add_months('05-JAN-21', 6) from dual;

select next_day('05-JAN-21', 'monday') from dual;

select last_day('05-JAN-21') from dual;

select employee_id, hire_date,
    months_between(sysdate, hire_date) tenure,
    add_months(hire_date, 6) review,
    next_day(hire_date, 'friday'),
    last_day(hire_date)
from employees
where months_between(sysdate, hire_date) < 190;

select '05-JAN-21' from dual;

select to_date('05-JAN-21') from dual;

select round(to_date('05-JAN-21'), 'month') from dual;

select round(to_date('15-JAN-21'), 'month') from dual;

select round(to_date('16-JAN-21'), 'month') from dual;

select round(to_date('05-FEB-21'), 'month') from dual;

select round(to_date('15-FEB-21'), 'month') from dual;

select round(to_date('16-FEB-21'), 'month') from dual;

select round(to_date('05-JAN-21'), 'year') from dual;

select round(to_date('30-JUN-21'), 'year') from dual;

select round(to_date('01-JUL-21'), 'year') from dual;

select trunc(to_date('16-FEB-21'), 'month') from dual;

select trunc(to_date('01-JUL-21'), 'year') from dual;

select employee_id, hire_date,
    round(hire_date, 'month'),
    trunc(hire_date, 'month')
from employees
where hire_date like '%07';

--1.
select sysdate "Date"
from dual;

--2.
select employee_id, last_name, salary, round(salary * 1.155) "New Salary"
from employees;

--3.
select employee_id, last_name, salary,
    round(salary * 1.155, 0) "New Salary",
    round(salary * 1.155, 0) - salary "Increase"
from employees;

--4.
select initcap(last_name) "Name", length(last_name) "Length"
from employees
where last_name like 'J%' or
        last_name like 'M%' or
        last_name like 'A%'
order by last_name;

--5.
select last_name, round(months_between(sysdate, hire_date)) months_worked
from employees
order by months_worked;

--6.
select last_name, lpad(salary, 15, '$') salary
from employees;

--7.
select rpad(last_name, 8), rpad(' ', salary / 1000 + 1, '*') salary
from employees
order by salary desc;

--8.
select last_name, trunc((sysdate - hire_date) / 7) as tenure
from employees
where department_id = 90
order by tenure;