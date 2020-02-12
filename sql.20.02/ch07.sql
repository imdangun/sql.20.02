select last_name, salary
from employees
where salary > (select salary
                from employees
                where last_name='Abel');
--
select last_name, job_id, salary
from employees
where job_id = (select job_id
                from employees
                where last_name='Ernst')
and salary >   (select salary
                from employees
                where last_name='Ernst');
--
select last_name, job_id, salary
from employees
where salary = (select min(salary)
                from employees);
--
select department_id, min(salary)
from employees
group by department_id
having min(salary)>(select min(salary)
                    from employees
                    where department_id=50);

select job_id, avg(salary)
from employees
group by job_id
having avg(salary) = (select min(avg(salary))
                      from employees
                      group by job_id);
--
select employee_id, last_name
from employees
where salary = (select min(salary)
                from employees
                group by department_id); --error
--
select last_name, salary, department_id
from employees
where salary in (select min(salary)
                 from employees
                 group by department_id);
                 
select last_name, salary, department_id
from employees
where salary =any (select min(salary)
                 from employees
                 group by department_id);
--
select employee_id, last_name, job_id, salary
from employees
where salary <any (select salary
                   from employees
                   where job_id='IT_PROG')
and job_id<>'IT_PROG';

select employee_id, last_name, job_id, salary
from employees
where salary <all (select salary
                   from employees
                   where job_id='IT_PROG')
and job_id<>'IT_PROG';
--
select last_name, salary, department_id
from employees
where salary >any(select salary 
                  from employees 
                  where employee_id=1000);
                  
select last_name, salary, department_id
from employees
where salary >all(select salary 
                  from employees 
                  where employee_id=1000);                  
--
select count(*) from departments;

select count(*) from departments d
where exists (select * from employees e
              where e.department_id=d.department_id);

select count(*) from departments d
where not exists (select * from employees e
              where e.department_id=d.department_id);
--
select emp.last_name
from employees emp
where emp.employee_id in (select mgr.manager_id
                          from employees mgr);

select emp.last_name
from employees emp
where emp.employee_id not in (select mgr.manager_id
                              from employees mgr);

select emp.last_name
from employees emp
where emp.employee_id <>all (select mgr.manager_id
                             from employees mgr);

select emp.last_name
from employees emp
where emp.employee_id not in (
          select mgr.manager_id
          from employees mgr
          where manager_id is not null);                             