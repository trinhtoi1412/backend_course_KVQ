-- Tạo bảng nhân viên
create table employees(
    id serial primary key ,
    name varchar(100) ,
    department_id int ,
    salary numeric
);

-- Tạo bảng phòng ban
create table departments(
    id serial primary key ,
    name varchar(100)
);

-- Insert dữ liệu mẫu
insert into departments (name)
values ('HR'), ('IT'), ('Finance');

insert into departments (name)
values ('Communication');

insert into employees(name, department_id, salary)
values ('Alice', 1, 600),
       ('Bob', 2, 800),
       ('Charlie', 2, 750),
       ('David', 3, 900),
       ('Eve', 1, 500);

-- 1.	Liệt kê nhân viên có mức lương cao nhất.
select * from employees
    where salary = (select max(salary) from employees);

-- 2.	Liệt kê các nhân viên có lương cao hơn mức lương trung bình của toàn bộ nhân viên.
select id, name, department_id, salary, (select avg(salary) from employees) as average_salary
    from employees
    where salary > (select avg(salary) from employees);

-- 3.	Liệt kê các phòng ban không có nhân viên nào.
select * from departments
    where id not in (select distinct department_id from employees);

-- 4.	Tạo View tên là high_salary_employees chứa thông tin nhân viên có lương > 700.
create view high_salary_employees as
    select * from employees
    where salary > 700;

insert into employees(name, department_id, salary)
values ('Tới', 1, 2000); -- insert dữ liệu để kiểm tra view

-- 5.	Sử dụng View high_salary_employees để đếm số lượng nhân viên lương cao theo department_id.
select department_id, count(*) as count_high_salary_employees
from high_salary_employees
group by department_id;

-- 6.	Dùng CTE để tính mức lương trung bình theo từng phòng ban, sau đó liệt kê các nhân viên có lương cao hơn mức trung bình của phòng ban đó.
with avg_salary as(
    select department_id, avg(salary) as average_salary
    from employees
    group by department_id
)
select e.name,e.salary, d.name, a.average_salary
    from employees e
    inner join avg_salary a on e.department_id = a.department_id
    inner join departments d on a.department_id = d.id
    where salary > average_salary;

-- 7.	Dùng CTE để đếm số lượng nhân viên của từng phòng ban, sau đó lọc ra những phòng ban có nhiều hơn 1 nhân viên.
with count_employees_cte as(
    select department_id, count(*) as count_employees
    from employees
    group by department_id
)
select d.id, d.name, c.count_employees
    from departments d
    inner join count_employees_cte c on d.id = c.department_id
    where c.count_employees > 1;
