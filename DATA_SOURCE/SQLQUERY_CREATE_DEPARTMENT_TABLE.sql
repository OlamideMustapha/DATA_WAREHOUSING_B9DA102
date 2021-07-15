USE [B9DA102_DATA_SOURCE]

create table Department_T (
	department_id INT not null,
	department_name VARCHAR(100),
	CONSTRAINT department_PK PRIMARY KEY (department_id),
);
insert into Department_T (department_id, department_name) values (100, 'Engineering');
insert into Department_T (department_id, department_name) values (101, 'Science');
insert into Department_T (department_id, department_name) values (102, 'Information and Technology');
insert into Department_T (department_id, department_name) values (103, 'Art');
insert into Department_T (department_id, department_name) values (104, 'Law');
insert into Department_T (department_id, department_name) values (105, 'Business');
