-- Tạo bảng customer, id là khóa chính
create table customer(
    id numeric primary key not null,
    first_name varchar(255),
    last_name varchar(255),
    user_name varchar(50),
    age integer,
    type varchar(100),
    phone_number varchar(255),
    status varchar(10),
    email varchar(1000),
    password text,
    gender varchar(10),
    updated_datetime timestamp,
    created_datetime timestamp
);

-- tạo bảng identification, id là khóa chính, customer_id là khóa ngoài
create table identification(
    id numeric primary key,
    customer_id numeric, --uuid: mã duy nhất
    id_type varchar(50),
    id_number varchar(100),
    issued_date date,
    expiry_date date,
    issued_by varchar(255),
    foreign key (customer_id) references customer(id)
);

-- tạo bảng address, id là khoá chính, customer_id là khóa ngoài
create table address(
    id numeric primary key,
    customer_id numeric,
    address_type varchar(50),
    street varchar(255),
    city varchar(100),
    state varchar(100),
    country varchar(100),
    postal_cde varchar(20),
    foreign key (customer_id) references customer(id)
);

-- tạo bảng bank_account, id là khóa chính, customer_id là khóa ngoài
create table bank_account(
    id numeric primary key,
    customer_id numeric,
    bank_status varchar(100),
    bank_account_no varchar(100),
    bank_address varchar(1000),
    bank_code varchar(100),
    foreign key (customer_id) references customer(id)
);

-- tạo bảng option_set, id là khóa chính
create table option_set(
    id numeric primary key,
    config_code varchar(100),
    status varchar,
    created_by varchar(1000),
    updated_datetime timestamp,
    created_datetime timestamp
);

-- tạo bảng option_set_value, id là khóa chính, option_set_id là khóa ngoài
create table option_set_value(
    id numeric primary key,
    option_set_id numeric,
    status varchar,
    value varchar,
    create_by varchar(1000),
    updated_datetime timestamp,
    created_datetime timestamp,
    foreign key (option_set_id) references option_set(id)
);

--tạo bảng audit_log, id là khóa chính
create table audit_log(
    id numeric primary key,
    object_code varchar(255),
    object_id varchar(255),
    old_value text,
    source varchar(255),
    new_value text,
    updated_datetime timestamp,
    created_datetime timestamp
);

--tạo bảng message_log, id là khóa chính
create table message_log(
    id numeric primary key,
    message_data text,
    message_key varchar(1000),
    topic varchar(1000),
    status varchar(10),
    source varchar(255),
    partition varchar(255),
    updated_datetime timestamp,
    created_datetime timestamp
);

--tạo bảng retry_data, id là khóa chính
create table retry_data(
    id numeric primary key,
    retry_key varchar,
    status varchar,
    retry_count numeric(5),
    created_by varchar(1000),
    updated_datetime timestamp,
    created_datetime timestamp
);