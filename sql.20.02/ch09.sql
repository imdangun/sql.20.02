drop table dept;
drop table emp;

create table dept(
department_id  number(4),
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
--
insert into dept(department_id, department_name,
                 manager_id, location_id)
values(300, 'Public Relation',100,1700);

insert into dept(department_id, department_name)
values(310,'Purchasing');

insert into dept
values(320,'Finance',null,null);
--
insert into emp(employee_id, first_name, last_name,
                email, phone_number, hire_date,
                job_id, salary, commission_pct,
                manager_id, department_id)
values(300, 'Louis', 'Pop',
       'Pop@gmail.com','010-378-1278',sysdate,
       'AC_ACCOUNT',6900, null,
       205,110);
--
insert into emp
values(310, 'Jark', 'Klein',
       'Klein@gmail.com','010-753-4625',
       to_date('FEB 8, 2020','MON DD, YYYY'),
       'IT_PROG',8000, null, 120,90);
       
insert into emp
values(320, 'Terry', 'Benard',
       'Benard@gmail.com','010-721-0972','02-NOV-23',  
       'AD_PRES',5000, .2,100,30);
--
create table sa_reps(
id number(6),
name varchar2(25),
salary number(8,2),
commission_pct number(2,2));

insert into sa_reps(id, name, salary, commission_pct)
  select employee_id, last_name, salary, commission_pct
  from employees
  where job_id like '%REP%';
--
select * from sa_reps;
rollback;
select * from sa_reps;

insert into sa_reps
  select employee_id, last_name, salary, commission_pct
  from employees
  where job_id like '%REP%';

select * from sa_reps;
commit;
select * from sa_reps;
--
declare
  base number(6) := 400;
begin
  for i in 1..10 loop
    insert into sa_reps(id, name, salary, commission_pct) 
    values(base+i, 'n'||(base+i), base*i, i*0.01);
  end loop;
end;
/
select * from sa_reps where id>=400;
rollback;
select * from sa_reps where id>=400;
-- PL/SQL�� ������Ѵ�.
commit;
select * from sa_reps where id>=400;
--
select employee_id, salary, job_id
from emp
where employee_id=300;

update emp
set salary=9000, job_id=null
where employee_id=300;

select employee_id, salary, job_id
from emp
where employee_id=300;

commit;
--
update emp
set job_id = (select job_id
              from employees
              where employee_id=205),
    salary = (select salary
              from employees
              where employee_id=205)
where employee_id=300;

rollback;
--
update emp
set (job_id, salary) = 
             (select job_id, salary
              from employees
              where employee_id=205)
where employee_id=300;

select employee_id, job_id, salary
from emp
where employee_id=300;

commit;
--
select * from dept;

delete from dept
where department_id = 300;

select * from dept;

rollback;

select * from dept;

delete dept
where department_id = 300;

commit;
--
select employee_id, department_id
from emp
where department_id = 90;

delete emp
where department_id = (
      select department_id
      from departments
      where department_name = 'Executive');

select employee_id, department_id
from emp
where department_id = 90;      
      
commit;


-- 실습
drop table my_employee;

create table my_employee(
    id number(4) primary key,
    last_name varchar2(25),
    first_name varchar2(25),
    userid varchar2(8),
    salary number(9,2));
    
--1.
desc my_employee

--2.
insert into my_employee
values (1, 'Patel', 'Ralph', 'rpatel', 895);

--3.
insert into my_employee(id, last_name, first_name, userid, salary)
values (2, 'Dancs', 'Betty', 'bdancs', 860);

--4.
select *
from my_employee;

--5.
insert into my_employee values (3, 'Biri', 'Ben', 'bbiri', 1100);
insert into my_employee values (4, 'Newman', 'Chad', 'cnewman', 750);
insert into my_employee values (5, 'Ropeburn', 'Audrey', 'aropebur', 1550);

--6.
commit;

--7.
update my_employee
set last_name = 'Drexler'
where id = 3;

--8.
update my_employee
set salary = 1000
where salary < 900;

--9.
delete from my_employee
where last_name = 'Dancs';

--10.
savepoint step10;

--11.
delete my_employee;

--12.
rollback to step10;

--13.
commit;