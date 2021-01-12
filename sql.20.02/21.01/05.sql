select avg(salary), max(salary), min(salary), sum(salary)
from employees
where job_id like '%REP%';

select last_name, department_id, job_id
from employees
where job_id like '%REP%';

select min(hire_date), max(hire_date)
from employees;

select count(*)
from employees
where department_id = 70;

select count(c)
from employees
where department_id = 70;

select *
from employees
where department_id = 70;

select avg(commission_pct)
from employees;

select avg(nvl(commission_pct, 0))
from employees;

select sum(all salary)
from employees;

select sum(distinct salary)
from employees;

select sum(all salary)
from employees;

select salary
from employees;

select count(distinct department_id)
from employees;

select count(department_id)
from employees;

select count(department_id)
from departments;

select department_id, avg(salary)
from employees
group by department_id;

select avg(salary)
from employees
group by department_id;

select *
from employees
where department_id is null;

select department_id, job_id, sum(salary)
from employees
where department_id > 40
group by department_id, job_id
order by department_id;

select count(last_name)
from employees;

select department_id, count(last_name)
from employees
group by department_id;

select department_id, job_id, count(last_name)
from employees
group by department_id, job_id;

select department_id, job_id, count(last_name)
from employees
group by department_id;

select department_id, max(salary)
from employees
group by department_id
having max(salary) > 10000;

select job_id, sum(salary) payroll
from employees
where job_id not like '%REP%'
group by job_id
having sum(salary) > 13000
order by sum(salary);

select job_id, sum(salary) payroll
from employees
where job_id not like '%REP%'
group by job_id
having payroll > 13000  -- error
order by payroll;

select max(avg(salary))
from employees
group by department_id;

select max(avg(salary))
from employees; -- error

select department_id, max(avg(salary))
from employees
group by salary; -- error

--4.
select max(salary), min(salary), sum(salary), round(avg(salary))
from employees;

--5.
select job_id, max(salary), min(salary), sum(salary), round(avg(salary))
from employees
group by job_id;

--6.
select job_id, count(*)
from employees
group by job_id;

--7.
select count(distinct manager_id)
from employees;

--8.
select max(salary) - min(salary)
from employees;

--9.
select manager_id, min(salary)
from employees
where manager_id is not null
group by manager_id
having min(salary) > 6000
order by min(salary) desc;

--10.
select sum(decode(to_char(hire_date, 'yyyy'), '2000', 1, 0)) "2000",
        sum(decode(to_char(hire_date, 'yyyy'), '2001', 1, 0)) "2001",
        sum(decode(to_char(hire_date, 'yyyy'), '2002', 1, 0)) "2002",
        sum(decode(to_char(hire_date, 'yyyy'), '2003', 1, 0)) "2003"
from employees;

--11.
select job_id "job",
    sum(decode(department_id, 20, salary)) "Dept 20",
    sum(decode(department_id, 50, salary)) "Dept 50",
    sum(decode(department_id, 80, salary)) "Dept 80",
    sum(decode(department_id, 90, salary)) "Dept 90"
from employees
group by job_id;