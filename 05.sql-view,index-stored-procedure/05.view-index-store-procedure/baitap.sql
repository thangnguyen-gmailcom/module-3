create database if not exists demo;
use demo;

create table if not exists product(
	id int not null auto_increment,
    productCode int not null,
	productName varchar(50) not null,
	productPrice decimal(10,2) not null,
	productAmount int not null,
	productDescription text not null,
	productStatus varchar(255) default 'còn hàng',
	constraint pk_product primary key(id)
);

insert into product (productCode, productName, productPrice, productAmount, productDescription) 
values
		(100, 'iphone5s 16GB',  5990000, 10, 'Thiết kế sang trọng, gia công tỉ mỉ, tích hợp cảm biến vân tay cao cấp hơn, camera cho hình ảnh đẹp và sáng hơn.'),
		(101, 'iPhone 7 256GB', 21990000, 20, 'iPhone 7 256 GB mang trên mình thiết kế quen thuộc từ thời iPhone 6, máy được trang bị bộ nhớ lưu trữ lớn, khả năng chống nước cao cấp, dàn loa stereo cho âm thanh hay và cấu hình cực mạnh.'),
        (102, 'Sony Xperia X', 7990000, 15, 'Sony vừa giới thiệu dòng sản phẩm X Serie mới của hãng trong năm 2016 tại triển lãm MWC. Xperia X là chiếc smartphone tầm trung mới với nhiều điểm nhấn đáng chú ý.'),
        (103, 'Apple Macbook Air MMGF2ZP/A i5 5250U/8GB/128GB', 23990000, 17, 'Với thiết kế gần như hoàn hảo, hiệu năng mượt mà, phiên bản Macbook Air 2015 13 inch sẽ còn tối ưu hơn khi được trang bị card đồ họa tích hợp Intel HD Graphics 6000, thanh RAM 8 GB mạnh mẽ, ổ cứng lưu trữ SSD tốc độ tăng gấp đôi 128 GB và bộ vi xử lý mới từ Intel.');

explain select * from product where productName = 'Sony Xperia X' or productName = 'iPhone 7 256GB';        

-- tạo chỉ mục (index)
alter table product drop index product_index;
        
create unique index product_index
on product (productName, productPrice);        

explain select * from product where productName = 'Sony Xperia X' or productName = 'iPhone 7 256GB';     

-- tạo view
create view product_view as
	select productCode, productName, productPrice, productStatus from product;
    
select * from product_view;

-- cập nhật view
create or replace view product_view as
		select id, productCode, productName, productPrice, productDescription from product;
        
select * from product_view;

-- xóa view
drop view product_view;

-- tạo store lấy tất cả thông tin sản phẩm trong bảng products
call getAllProduct();

-- tạo store procedures thêm một sản phẩm mới
call insertNewProduct(103, 'Apple Macbook', 25000000, 17, 'Với thiết kế gần như hoàn hảo, hiệu năng mượt mà, phiên bản Macbook Air 2015 13 inch sẽ còn tối ưu hơn khi được trang bị card đồ họa tích hợp Intel HD Graphics 6000, thanh RAM 8 GB mạnh mẽ, ổ cứng lưu trữ SSD tốc độ tăng gấp đôi 128 GB và bộ vi xử lý mới từ Intel.');
call insertNewProduct(100, 'iphone5s 16GB',  5990000, 10, 'Thiết kế sang trọng, gia công tỉ mỉ, tích hợp cảm biến vân tay cao cấp hơn, camera cho hình ảnh đẹp và sáng hơn.');
call insertNewProduct(105, 'iphone5s',  990000, 10, 'Thiết kế sang trọng, gia công tỉ mỉ, tích hợp cảm biến vân tay cao cấp hơn, camera cho hình ảnh đẹp và sáng hơn.');
call insertNewProduct(107, 'iphone5',  890000, 10, 'Thiết kế sang trọng, gia công tỉ mỉ, tích hợp cảm biến vân tay cao cấp hơn, camera cho hình ảnh đẹp và sáng hơn.');
call insertNewProduct(@maxID,103, 'Appwatch', 25000000, 17, 'Với thiết kế gần như hoàn hảo, hiệu năng mượt mà, phiên bản Macbook Air 2015 13 inch sẽ còn tối ưu hơn khi được trang bị card đồ họa tích hợp Intel HD Graphics 6000, thanh RAM 8 GB mạnh mẽ, ổ cứng lưu trữ SSD tốc độ tăng gấp đôi 128 GB và bộ vi xử lý mới từ Intel.');
select * from product;
-- tạo store procedure sửa thông tin sản phẩm theo id
call updateProduct(3,110, 'iphone5s',@result);

-- xóa sản phẩm theo id
select * from product;
call removeProduct(14);
call removeProduct(15);
call removeProduct(8);
call removeProduct(6);