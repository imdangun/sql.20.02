SELECT * 
FROM departments;

select *
from employees;

select *
from locations;

select department_id, location_id
from departments;

SELECT LOCATION_id, department_id
from departments;

select last_name, salary, salary + 300
from employees;

select last_name, salary * 12
from employees;

select last_name, salary * (12 + 100)
from employees;

select last_name, job_id, commission_pct, salary, salary * 12 + ((salary * 12) * commission_pct)
from employees;

select last_name as name, commission_pct as comm
from employees;

select last_name name, commission_pct comm
from employees;

select last_name "Name", salary * 12 ann_sal
from employees;

select last_name "Name", salary * 12 "Annual Salary"
from employees;

select last_name || job_id as "Employees"
from employees;

select first_name || ' ' || last_name name
from employees;

select last_name || null
from employees;

select last_name || ''
from employees;

select last_name || commission_pct
from employees;

select last_name || salary
from employees;

select last_name || hire_date
from employees;

select last_name || (salary + 300)
from employees;

select 'hello' 
from employees;

select 12
from employees;

select '2021/01/04'
from employees;

select last_name || ' is a ' || job_id as "Employee Details"
from employees;

-- qute
select department_name || 
    q'[ Department's Manager Id: ]' ||
    manager_id as "Department and Manager"
from departments;

select q'[ Department's Manager Id: ]' from employees;
select q'< Department's Manager Id: >' from employees;
select q's Department's Manager Id: s' from employees;

select 'Department''s Manager Id:' from employees;

select department_id
from departments;

select distinct department_id
from employees;

describe employees  -- sqlplus ¾ð¾î
desc employees

--3.
select employee_id, last_name,
salary * 12 ANNUAL_SALARY
from employees;

--4.
desc departments

select * from departments;

--5.
desc employees

--6.
select employee_id, last_name, job_id, hire_date StartDate
from employees;

--7.
select distinct job_id from employees;

select distinct job_id, salary from employees;

--8.
select employee_id "Emp #", last_name "Employee", job_id "Job", hire_date "Hire Date"
from employees;

--9.
select last_name || ',' || job_id "Employee and Title"
from employees;

--10.
select employee_id || ',' || first_name || ',' || last_name
        || ',' || email || ',' || phone_number || ',' || job_id
        || ',' || manager_id || ',' || hire_date || ','
        || salary || ',' || commission_pct || ','
        || department_id THE_OUTPUT
from employees;