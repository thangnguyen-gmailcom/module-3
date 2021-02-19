create database test;
use test;

create table students(
	id int not null auto_increment,
    ten varchar(100) not null,
    tuoi int not null,
    khoahoc varchar(50),
    sotien int,
    constraint pk_student primary key(id)
);

insert into students(ten, tuoi, khoahoc,sotien)
value('hoang', 21, 'CNTT', 400000),
	 ('viet', 19, 'DTVT', 320000),
     ('thanh', 18, 'KTDN', 400000),
     ('nhan', 19, 'CK',450000  ),
     ('huong', 20, 'TCNH', 500000),
     ('huong', 20, 'TCNH', 200000);
     
-- Viết câu lệnh hiện thị tất cả các dòng có tên là Huong
select * from students
where ten = 'huong';

-- Viết câu lệnh lấy ra tổng số tiền của Huong
select sum(sotien) as 'tong so tien' from students
where ten = 'huong';
-- Viết câu lệnh lấy ra tên danh sách của tất cả học viên, không trùng lặp
select distinct ten from students;
