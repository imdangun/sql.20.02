select employee_id, job_id
from employees
union
select employee_id, job_id
from job_history;

select employee_id, job_id
from employees
intersect
select employee_id, job_id
from job_history;

select employee_id, job_id
from job_history
where employee_id = 200;

select employee_id, job_id
from employees
where employee_id = 200;


select employee_id, job_id
from employees
union all
select employee_id, job_id
from job_history;

select employee_id
from employees
minus
select employee_id
from job_history
order by employee_id;

select location_id, department_name
from departments
union
select location_id, state_province
from locations;

select location_id, department_name, null state
from departments
union
select location_id, null, state_province
from locations;

select employee_id, job_id, salary
from employees
union
select employee_id, job_id, 0
from job_history
order by 2;
