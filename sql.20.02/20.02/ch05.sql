select avg(salary), max(salary), min(salary), sum(salary)
from employees
where job_id like '%REP%';

select min(hire_date), max(hire_date)
from employees;
--
select count(*)
from employees
where department_id=70;

select count(commission_pct)
from employees
where department_id=70;
--
select avg(commission_pct)
from employees;

select avg(nvl(commission_pct,0))
from employees;
--
select count(distinct department_id)
from employees;

select sum(distinct salary) from employees;
select sum(all salary) from employees;
select sum(salary) from employees;
--
select department_id, avg(salary)
from employees
group by department_id;

select avg(salary)
from employees
group by department_id;
--
select department_id,job_id,sum(salary)
from employees
where department_id>40
group by department_id, job_id
order by department_id;
--
select count(last_name)
from employees;

select department_id, count(last_name)
from employees; --error

select department_id, job_id, count(last_name)
from employees
group by department_id,job_id;

select department_id, job_id, count(last_name)
from employees
group by department_id; --error
--
select department_id, max(salary)
from employees
group by department_id
having max(salary)>10000;

select job_id, sum(salary) payroll
from employees
where job_id not like '%REP%'
group by job_id
having sum(salary)>13000
order by sum(salary);
--
select max(avg(salary))
from employees
group by department_id;

select max(avg(salary))
from employees; -- error

select department_id, max(avg(salary))
from employees
group by department_id; -- error


-- 실습

-- 1. True

-- 2. False

-- 3. True

--4
select round(max(salary), 0) "Maximum",
        round(min(salary), 0) "Minimum",
        round(sum(salary), 0) "Sum",
        round(avg(salary), 0) "Average"
from employees;

--5
select job_id, round(max(salary), 0) "Maximum",
                round(min(salary), 0) "Minimum",
                round(sum(salary), 0) "Sum",
                round(avg(salary), 0) "Average"
from employees
group by job_id;

--6
select job_id, count(*)
from employees
group by job_id;

--7
select count(distinct manager_id) "Number of Managers"
from employees;

--8
select max(salary) - min(salary) difference
from employees;

--9
select manager_id, min(salary)
from employees
where manager_id is not null
group by manager_id
having min(salary) > 6000
order by min(salary) desc;

--10
select sum(decode(to_char(hire_date, 'yyyy'), 2000, 1, 0)) "2000",
        sum(decode(to_char(hire_date, 'yyyy'), 2001, 1, 0)) "2001",
        sum(decode(to_char(hire_date, 'yyyy'), 2002, 1, 0)) "2002",
        sum(decode(to_char(hire_date, 'yyyy'), 2003, 1, 0)) "2003"
from employees;

--11
select job_id "Job",
    sum(decode(department_id, 20, salary)) "Dept 20",
    sum(decode(department_id, 50, salary)) "Dept 50",
    sum(decode(department_id, 80, salary)) "Dept 80",
    sum(decode(department_id, 90, salary)) "Dept 90"
from employees
group by job_id;