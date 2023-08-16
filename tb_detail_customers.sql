create table detail_customers
(id number generated always as identity primary key,
first_name varchar2(30),
last_name varchar2(30),
email varchar2(50) not null,
CONSTRAINT unique_person UNIQUE (first_name,last_name));


drop table detail_customers;
