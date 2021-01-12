--ch01
select * from departments;
--

select department_id, location_id 
from departments;

select location_id, department_id 
from departments;
--

select last_name, salary, salary+300 
from employees;

select last_name, salary, 12*salary+100 
from employees;

select last_name, salary, 12*(salary+100) 
from employees;
--

select last_name, 12*salary*commission_pct 
from employees;

select last_name,job_id,
       commission_pct,12*salary*commission_pct 
from employees;
--

select last_name as name, commission_pct comm 
from employees;

select last_name "Name", salary*12 "Annual Salary" 
from employees;
--

select last_name||job_id as "Employees" 
from employees;

select last_name||null 
from employees;

select last_name||commission_pct 
from employees;

select last_name||salary 
from employees;

select last_name||hire_date 
from employees;

select last_name||(salary+300)
from employees;
--
select 'hello' from employees;
select '2018/07/15' from employees;
--
select last_name||' is a '||job_id as "Employee Details"
from employees;
--
select department_name||q'[ Departments's Manager Id:]'
  ||manager_id as "Department and Manager"
from departments;

select q'[Department's Manager Id:]' from employees;
select q'<Department's Manager Id:>' from employees;
select q'sDepartment's Manager Id:s' from employees;
select 'Department''s Manager Id:' from employees;
--

select department_id from employees;
select distinct department_id from employees;
--

describe employees
desc employees


-- 실습
--1. True
 
--2. Fale
 
--3. EMPLOYEES 테이블엔 SAL 칼럼이 있다. SALARY 로 고쳐야 한다.
  -- x 를 곱셈 기호 * 로 고쳐야 한다.
  -- ANNUAL SALARY를 ANNUAL_SALARY나 "ANNUAL SALARY"로 고쳐야 한다.
  
 
--4
desc departments
select * from departments;
 
 
--5
desc employees;
 
 
--6
select employee_id, last_name, job_id, hire_date StartDate
from employees;
 
 
--7
select distinct job_id from employees;
select distinct job_id,salary from employees;
 
 
--8
select employee_id "Emp #", last_name "Employee",
       job_id "Job", hire_date "Hire Date"
from employees;
 
 
--9
select last_name||','||job_id "Employee and Title"
from employees;
 
 
--10
select employee_id || ',' || first_name || ',' || last_name
       || ',' || email || ',' || phone_number || ',' || job_id
       || ',' || manager_id || ',' || hire_date || ','
       || salary || ',' || commission_pct || ','
       || department_id THE_OUTPUT
from employees;