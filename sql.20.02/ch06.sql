select department_id, department_name, location_id, city
from departments natural join locations;

select department_id, department_name, location_id, city
from departments natural join locations
where department_id in (20,50);
--
select employee_id, last_name, location_id, department_id
from employees join departments
using (department_id);

select employee_id, last_name, location_id, department_id
from employees natural join departments;
--
select l.city, d.department_name
from locations l join departments d
using(location_id)
where d.location_id=1400; --error

select l.city, d.department_name, d.location_id 
from locations l join departments d
using(location_id)
where location_id=1400; --error

select city, department_name
from locations l join departments d
using(location_id)
where location_id=1400;

select l.city, d.department_name
from locations l join departments d
using(location_id)
where location_id=1400;

select locations.city, departments.department_name
from locations join departments
using(location_id)
where location_id=1400;
--
select e.last_name, d.department_name
from employees e join departments d
using(department_id)
where department_id=60;

select e.last_name, d.department_name
from employees e join departments d
using(department_id)
where d.department_id=60; --error

select e.last_name, d.department_name
from employees e join departments d
using(department_id)
where d.manager_id=60;

select e.last_name, d.department_name
from employees e join departments d
using(department_id)
where manager_id=60;  --error
--
select e.last_name, d.department_name
from employees e join departments d
using(department_id)
where employee_id=100;

select e.last_name, d.department_name
from employees e join departments d
using(department_id)
where e.employee_id=100;
--
select e.employee_id, e.last_name, e.department_id,
      d.department_id, d.location_id
from employees e join departments d
on (e.department_id = d.department_id);
--
select employee_id, city, department_name
from employees e
join departments d
on d.department_id = e.department_id
join locations l
on d.location_id = l.location_id;

select e.employee_id, l.city, d.department_name
from employees e
join departments d
using (department_id)
join locations l
using (location_id);
--
select e.employee_id, e.last_name, e.department_id,
      d.department_id, d.location_id
from employees e join departments d
on e.department_id = d.department_id
and e.manager_id=149;

select e.employee_id, e.last_name, e.department_id,
      d.department_id, d.location_id
from employees e join departments d
on e.department_id = d.department_id
where e.manager_id=149;
--
select worker.last_name emp, manager.last_name mgr
from employees worker join employees manager
on worker.manager_id = manager.employee_id;

select worker.last_name emp, manager.last_name mgr
from employees worker join employees manager
on manager_id = employee_id; -- error

select last_name emp, last_name mgr
from employees worker join employees manager
on worker.manager_id = manager.employee_id; -- error
--
select e.last_name, e.salary, e.job_id
from employees e join jobs j
on e.salary between j.min_salary and j.max_salary
where j.job_id='IT_PROG';

select e.last_name, e.salary, e.job_id
from employees e join jobs j
on e.salary between 4000 and 10000
and j.job_id='IT_PROG';
--
select count(*)
from employees
where department_id=190;

select department_id, department_name
from departments
where department_id=190;

select employee_id, last_name, department_id
from employees
where department_id is null;
--
select e.last_name, e.department_id, d.department_name
from employees e left outer join departments d
on e.department_id = d.department_id;

select e.last_name, d.department_id, d.department_name
from employees e right outer join departments d
on e.department_id = d.department_id;

select e.last_name, d.department_id, d.department_name
from employees e full outer join departments d
on e.department_id = d.department_id;
--
select d.department_id, d.department_name, d.location_id, l.city
from departments d, locations l
where d.location_id = l.location_id;

select d.department_id, d.department_name, d.location_id, l.city
from departments d, locations l
where d.location_id = l.location_id
and d.department_id in (20,50);
--
select e.last_name, d.department_name, l.city
from employees e, departments d, locations l
where e.department_id = d.department_id
and d.location_id = l.location_id;
--
select e.last_name, e.salary, e.job_id
from employees e, jobs j
where e.salary between j.min_salary and j.max_salary
and j.job_id='IT_PROG';
--
select e.last_name, e.department_id, d.department_name
from employees e, departments d
where e.department_id(+) = d.department_id;

select e.last_name, e.department_id, d.department_name
from employees e, departments d
where e.department_id = d.department_id(+);
--
select worker.last_name||' works for '||manager.last_name
from employees worker, employees manager
where worker.manager_id = manager.employee_id;