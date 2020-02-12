create table hire_dates(
id number(8),
hire_date date default sysdate);

insert into hire_dates
values(1,to_date('21-DEC-20'));

insert into hire_dates
values(2,null);

insert into hire_dates(id)
values(3);

commit;

select * from hire_dates;
--
-- system user 로그인
drop user you cascade;

create user you identified by you
default tablespace users;

grant connect,resource to you;

grant all on hr.departments to you;
--
-- you user 로그인
drop table depts cascade constraints;
drop table emps cascade constraints;

create table depts(
department_id number(3) constraint depts_deptid_pk primary key,
department_name varchar2(20));

create table emps(
employee_id number(3) primary key,
emp_name varchar2(10) constraint emps_empid_nn not null,
email varchar2(20),
salary number(6) constraint emps_sal_ck check(salary>1000),
department_id number(3),
constraint emps_email_uk unique(email),
constraint emps_deptid_fk foreign key(department_id)
  references depts(department_id));
--
insert into depts values(100, 'Development');
insert into emps values(500, 'musk', 'musk@gmail.com', 5000, 100);
commit;
delete depts; -- error, fk 위배

insert into depts values(100, 'Marketing'); -- error, pk위배
insert into depts values(null, 'Marketing'); --error, pk위배

insert into emps values(
  501, null, 'good@gmail.com', 6000, 100); -- error, nn위배
insert into emps values(
  501, 'abel', 'musk@gmail.com', 6000, 100); --error, uk위배
insert into emps values(
  501, 'abel', 'good@gmail.com', 900, 100); --error, ck위배
insert into emps values(
  501, 'abel', 'good@gmail.com', 6000, 200); --error, fk위배
--
drop table employees cascade constraints;

create table employees(
employee_id    number(6)    constraint emp_empid_pk    primary key,
first_name     varchar2(20),
last_name      varchar2(25) constraint emp_lastname_nn not null,
email          varchar2(25) constraint emp_email_nn    not null
                            constraint emp_email_uk    unique,
phone_number   varchar2(20),
hire_date      date         constraint emp_hiredate_nn not null,
job_id         varchar2(10) constraint emp_job_nn      not null,
salary         number(8,2)  constraint emp_salary_ck   check(salary>0),
commission_pct number(2,2),
manager_id     number(6)    constraint emp_manager_fk  references
                                     employees(employee_id),
department_id  number(4)    constraint emp_dept_fk     references
                                     hr.departments(department_id));
--
drop table gu cascade constraints;
drop table dong cascade constraints;
drop table dong2 cascade constraints;

create table gu(
gu_id number(3) primary key,
gu_name char(9) not null);

create table dong(
dong_id number(4) primary key,
dong_name varchar2(12) not null,
gu_id number(3) references gu(gu_id) on delete cascade);

create table dong2(
dong_id number(4) primary key,
dong_name varchar2(12) not null,
gu_id number(3) references gu(gu_id) on delete set null);

insert into gu values(100,'강남구');
insert into gu values(200,'노원구');
insert into dong values(5000,'압구정동',null);
insert into dong values(5001,'삼성동',100);
insert into dong values(5002,'역삼동',100);
insert into dong values(6001,'상계동',200);
insert into dong values(6002,'중계동',200);

insert into dong2 select * from dong;
commit;

delete gu where gu_id=100;

select * from dong;
select * from dong2;
--
drop table a cascade constraints;
drop table b cascade constraints;

create table a(
aid number(1) constraint a_aid_pk primary key);

create table b(
bid number(2),
aid number(1),
constraint b_aid_fk foreign key(aid) references a(aid));
--
insert into a values(1);
insert into b values(31,1);
insert into b values(31,9); --error, fk위배
alter table b disable constraint b_aid_fk;
insert into b values(31,9);
alter table b enable validate constraint b_aid_fk; --error, fk위배
alter table b enable novalidate constraint b_aid_fk;
insert into b values(32,8); --error, fk위배
--
drop table sub_departments;

create table sub_departments as
  select department_id dept_id, department_name dept_name
  from hr.departments;
  
select * from sub_departments;
--
drop table users cascade constraints;

create table users(user_id number(3));     
desc users
alter table users add   (user_name varchar2(10));
desc users
alter table users modify(user_name number(7)); 
desc users
alter table users drop column user_name;
desc users
--
insert into users values(1);

alter table users read only;
insert into users values(2); --error

alter table users read write;
insert into users values(2);
commit;
--
select tname, tabtype 
from tab
where tname not like 'BIN%';

select constraint_name, constraint_type, table_name
from user_constraints
where constraint_name not like 'BIN%';