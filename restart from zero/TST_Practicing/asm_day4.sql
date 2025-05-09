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
select c.name as customer_name, o.order_date
    from customers c
    inner join orders o on c.id = o.customer_id;

--2.	Liệt kê toàn bộ khách hàng, kèm theo tổng tiền đơn hàng nếu có. Nếu khách chưa có đơn hàng thì để trống phần tổng tiền.
select c.name as customer_name, o.total_amount
    from customers c
    left join orders o on c.id = o.customer_id;

--3.	Liệt kê danh sách đơn hàng và tên khách hàng tương ứng. Nếu đơn hàng không rõ khách thì vẫn hiển thị.
select o.id as order_id, c.name as customer_name
    from orders o
    right join customers c on o.customer_id = c.id;

--4.	Tạo một danh sách kết hợp cả khách hàng và đơn hàng, dù có liên kết hay không.
select c.name as customer_name, o.id as order_id
    from customers c
    full join orders o on c.id = o.customer_id;

--5.	Tạo danh sách kết hợp mọi sản phẩm với mọi đơn hàng (dùng cho thử nghiệm/test case).
select o.id as order_id, p.name as product_name
    from orders o
    cross join products p;

--6.	Viết câu SQL liệt kê tên nhân viên và tên quản lý của họ.
select e.name as employee, m.name as manager
    from employees e
    left join employees m on e.manager_id = m.id;

--7.	Viết câu lệnh SQL liệt kê: Tên khách hàng, Ngày đặt hàng, Tên sản phẩm, Số lượng
select c.name as customer_name, o.order_date, p.name as product_name, oi.quantity
from customers c
    inner join orders o on c.id = o.customer_id
    inner join order_items oi on o.id = oi.order_id
    inner join products p on oi.product_id = p.id;