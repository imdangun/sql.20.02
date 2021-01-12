select employee_id, job_id
from employees
union
select employee_id, job_id
from job_history;

select employee_id, job_id
from employees
union all
select employee_id, job_id
from job_history;
--
select employee_id, job_id
from employees
intersect
select employee_id, job_id
from job_history;

select employee_id, job_id, department_id
from employees
intersect
select employee_id, job_id, department_id
from job_history;
--
select employee_id
from employees
minus
select employee_id
from job_history;
--
select location_id, department_name, null
from departments
union
select location_id, null, state_province
from locations;

select location_id, department_name, null province
from departments
union
select location_id, null, state_province
from locations;
--
select employee_id, job_id, salary
from employees
union
select employee_id, job_id, 0
from job_history
order by job_id;

select employee_id, job_id, salary
from employees
union
select employee_id, job_id, 0
from job_history
order by 2;

