use classicmodels;

-- lây dữ liệu customerNumber, customerName, phone từ bảng customers
create view customer_view as 
select customerNumber, customerName, phone from customers;

select * from customer_view;

-- cập nhật customer_view

create or replace view customer_view as
select customerNumber, customerName, contactFirstName, contactLastName, phone
from customers
where city = 'Nantes';

select * from customer_view;