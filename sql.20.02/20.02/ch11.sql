create view empvu80 as
select employee_id, last_name, department_id
from employees
where department_id = 80;

desc empvu80

select * from empvu80;

select * from (
  select employee_id, last_name, department_id
  from employees
  where department_id = 80);
--
create view salvu50 as
select employee_id id_number, last_name name, 
       salary*12 ann_salary, department_id
from employees
where department_id=50;

select * from salvu50;
--
create or replace view salvu50 as
select employee_id emp_id, last_name, 
       salary*12 ann_sal, department_id
from employees
where department_id=50;

desc salvu50

select * from salvu50;
--
drop table teams;
drop view team50;

create table teams as
  select department_id team_id, department_name team_name
  from departments;

create view team50 as
  select * from teams
  where team_id=50;

insert into team50 values(300,'Marketing');

select * from team50;
select * from teams where team_id=300;
 
create or replace view team50 as
  select * from teams
  where team_id=50
  with check option; 

insert into team50 values(301,'IT Support'); --error
insert into team50 values(50,'IT Support');
--
create or replace view empvu10(
          employee_number, employee_name, job_title)
as select employee_id, last_name, job_id
   from employees
   where department_id = 10
   with read only;

select * from empvu10;

insert into empvu10 
values(501, 'abel', 'Sales'); --error
--
drop sequence team_teamid_seq;

create sequence team_teamid_seq
                increment by 10
                start with 400
                maxvalue 9999
                nocache
                nocycle;
                
select team_teamid_seq.nextval from dual;
select team_teamid_seq.currval from dual;

insert into teams
values(team_teamid_seq.nextval,'Marketing');
insert into teams
values(team_teamid_seq.nextval,'Marketing');

select * from teams where team_id>=400;
--
drop index emp_lastname_idx;

create index emp_lastname_idx
on employees(last_name);

select last_name, rowid 
from employees;

select index_name, index_type, table_owner, table_name 
from user_indexes
where index_name='EMP_LASTNAME_IDX';
--
create synonym team for departments;

select * from team;

-------
-- 실습
--1.
create view employee_vu as
select employee_id, last_name employee, department_id
from employees;

--2.
select * from employee_vu;

--3.
select employee, department_id
from employee_vu;

--4.
create or replace view dept50 (empno, employee, deptno) as
select employee_id, last_name, department_id
from employees
where department_id = 50
with check option constraint dept50_vu_ck;

--5.
desc dept50

--6.
update dept50
set deptno = 80
where employee = 'Matos';

--7.
create sequence dept_id_seq
    start with 300
    increment by 10
    maxvalue 1000;

--8.
insert into dept
values (dept_id_seq.nextval, 'Education');

--9.
create index dept_name_idx on dept(name);

--10.
create synonym emps for employees;
