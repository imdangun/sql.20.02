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