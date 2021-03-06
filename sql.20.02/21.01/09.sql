create table dept(
department_id number(4),
department_name varchar2(30),
manager_id number(6),
location_id number(4));

create table emp(
employee_id number(6),
first_name varchar2(20),
last_name varchar2(25),
email varchar2(25),
phone_number varchar2(20),
hire_date date,
job_id varchar2(10),
salary number(8,2),
commission_pct number(2,2),
manager_id number(6),
department_id number(4));

drop table dept;
drop table emp;

insert into dept(department_id, department_name, manager_id, location_id)
    values(300, 'Public Relation', 100, 1700);

select * from dept;

insert into dept(department_id, department_name)
    values(310, 'Purchasing');

insert into dept
    values(320, 'Finance', null, null);

commit;

insert into emp(employee_id, first_name, last_name,
                email, phone_number, hire_date,
                job_id, salary, commission_pct,
                manager_id, department_id)
values(300, 'Louis', 'Pop',
        'Pop@gamail.com', '010-378-1278',sysdate,
        'AC_ACCOUNT', 6900, null,
        205, 100);

select * from emp;

insert into emp
    values(320, 'Terry', 'Benard',
    'Benard@gmail.com', '010-721-0972', '02-NOV-23',
    'AD_PRES', 5000, .2, 100, 30);


insert into emp
    values(310, 'Jark', 'Klein',
    'Klein@gmail.com', '010-753-4625', to_date('FEB 8, 2020', 'MON DD, YYYY'),
    'IT_PROG', 8000, null, 120, 90);
 
commit; 
   
create table sa_reps(
id number(6),
name varchar2(25),
salary number(8, 2),
commission_pct number(2,2));

insert into sa_reps(id, name, salary, commission_pct)
    select employee_id, last_name, salary, commission_pct
    from employees
    where job_id like '%REP%';
    
select * from sa_reps;  

commit;

declare
    base number(6) := 400;
begin
    for i in 1..10 loop
        insert into sa_reps(id, name, salary, commission_pct)
        values(base + i, 'n' || (base + i), base * i, i * 0.01);
    end loop;
end;
/

select * 
from sa_reps
where id >= 400;

commit;

rollback;

select employee_id, salary, job_id
from emp
where employee_id = 300;

update emp
set salary = 9000, job_id = null
where employee_id = 300;

select * from emp;

rollback;

commit;

update emp
set job_id = (select job_id
                from employees
                where employee_id = 205),
    salary = (select salary
                from employees
                where employee_id = 205)
where employee_id = 300;

select *
from emp
where employee_id = 300;

rollback;

update emp
set (job_id, salary) =
    (select job_id, salary
    from employees
    where employee_id = 205)
where employee_id = 300;

commit;

select * from dept;

delete from dept
where department_id = 300;

commit;

rollback;

select employee_id, department_id
from emp
where department_id = 90;

delete emp
where department_id = (
    select department_id
    from departments
    where department_name = 'Executive');

commit;

delete emps;
delete emp_history;

create table emps(
emp_id number(2),
job_id varchar2(10));

create table emp_history(
emp_id number(2),
job_id varchar2(10),
reg_date date);

select * from emps;
select * from emp_history;

create or replace trigger emp_update 
    after update on emps
    for each row
    begin
        insert into emp_history
        values (:OLD.emp_id, :OLD.job_id, sysdate) ;
    end;
/

insert into emps values (1, 'IT_PROG');
insert into emps values (2, 'SA_REP');

select * from emps;
select * from emp_history;

update emps
set job_id = 'ST_CLERK'
where emp_id = 1;

select * from emps;
select * from emp_history;

delete emps
where emp_id = 2;

select * from emps;
select * from emp_history;





