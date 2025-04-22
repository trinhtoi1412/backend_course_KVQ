DROP TABLE IF EXISTS order_items, orders, products, customers, employees;
CREATE TABLE customers (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100)
);

CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    order_date DATE,
    customer_id INTEGER REFERENCES customers(id),
    total_amount NUMERIC
);

CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    price NUMERIC
);

CREATE TABLE order_items (
    id SERIAL PRIMARY KEY,
    order_id INTEGER REFERENCES orders(id),
    product_id INTEGER REFERENCES products(id),
    quantity INTEGER
);

CREATE TABLE employees (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    manager_id INTEGER
);

delete from employees;

alter table employees
add constraint fk_manager foreign key (manager_id) references manager(id) on delete cascade ;

create table manager(
    id serial primary key ,
    name varchar(255)
);

insert into manager(name)
values ('Nguyễn Văn A'),
       ('Trần Thị B');

-- Dữ liệu mẫu
INSERT INTO customers (name, email) VALUES
('Alice', 'alice@example.com'),
('Bob', 'bob@example.com'),
('Charlie', 'charlie@example.com');

INSERT INTO orders (order_date, customer_id, total_amount) VALUES
('2023-01-10', 1, 200),
('2023-01-11', 1, 150),
('2023-01-12', 2, 300);

INSERT INTO orders (order_date, customer_id, total_amount) VALUES
('2023-01-31', null, 200);

INSERT INTO products (name, price) VALUES
('Laptop', 1000),
('Mouse', 20),
('Keyboard', 50);

INSERT INTO order_items (order_id, product_id, quantity) VALUES
(1, 1, 1),
(1, 2, 2),
(2, 3, 1),
(3, 2, 3);

INSERT INTO employees (name, manager_id) VALUES
('John', NULL),
('Anna', 1),
('Mike', 1),
('Sara', 2);


--1.	Viết câu lệnh SQL để liệt kê danh sách tên khách hàng và ngày đặt hàng.
select name, o.order_date
    from customers
    inner join orders o on customers.id = o.customer_id;

--2.	Liệt kê toàn bộ khách hàng, kèm theo tổng tiền đơn hàng nếu có. Nếu khách chưa có đơn hàng thì để trống phần tổng tiền.
select name, email, o.total_amount
    from customers
    left join orders o on customers.id = o.customer_id;

--3.	Liệt kê danh sách đơn hàng và tên khách hàng tương ứng. Nếu đơn hàng không rõ khách thì vẫn hiển thị.
select order_date, customer_id, total_amount, c.name
    from orders
    left join customers c on c.id = orders.id;

--4.	Tạo một danh sách kết hợp cả khách hàng và đơn hàng, dù có liên kết hay không.
select * from customers
    full join orders o on customers.id = o.customer_id;

--5.	Tạo danh sách kết hợp mọi sản phẩm với mọi đơn hàng (dùng cho thử nghiệm/test case).
select * from orders
    full join order_items oi on oi.order_id = orders.id
    full join products p on oi.product_id = p.id;

--6.	Viết câu SQL liệt kê tên nhân viên và tên quản lý của họ.
select * from employees
    full join manager m on m.id = employees.manager_id;

--7.	Viết câu lệnh SQL liệt kê: Tên khách hàng, Ngày đặt hàng, Tên sản phẩm, Số lượng
select customers.name, o.order_date, p.name, oi.quantity
from customers
    inner join orders o on customers.id = o.customer_id
    inner join order_items oi on o.id = oi.order_id
    inner join products p on p.id = oi.product_id;
