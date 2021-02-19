-- create database librarymanagement;
-- use librarymanager;
create table students(	
	studentNumber varchar(15) not null,
    studentName varchar(50) not null,
    dayOfBirth date not null,
    address varchar(50) not null,
    email varchar(50) default null,
    phoneNumber varchar(10) default null,
    images varchar(255) default null,
	constraint pk_student	primary key(studentNumber)
)engine = InnoDB;

insert into librarymanager.students(studentNumber, studentName, dayOfBirth, address, email, phoneNumber)
values 
		('16T1457', 'Nguyen A', '2000-01-01', 'thanh pho hue', 'anguyen@gmail.com', '0987654321');
        
create table books(
	idBook int(4) NOT NULL,
    titleBook varchar(50) NULL,
    publishingCompany varchar(255) default null,
    author varchar(50) default null,
    publishingYear date default null,
    numOfpublications int(4) default null,
    price decimal(10,2) default null,
    imageBook varchar(255) default null,
    idCategory int(4) not null,
    constraint pk_book primary key(idBook),
    foreign key(idCategory) references category(idCategory)
)engine = InnoDB;

insert into books ( idBook, titleBook, publishingCompany, author, publishingYear, numOfpublications, price, idCategory)
values 
		(145, 'toan cao cap', 'kim dong', 'dai hung', 1993-12-20, 5, 69000, 'toan hoc');

create table category(
	idCategory int(4) not null,
    nameCategory varchar(50) default null,
    constraint pk_category primary key(idCategory)
)engine = InnoDB;

create table borrowandreturn(
	idBorrowAndReturn int(4) not null,
    studentNumber varchar(15) not null,
    idBook	int(4) not null,
    amountBook int(4) default null,
    dateBorrowed date default null,
    datePay date default null,
    constraint pk_borrowandreturn primary key(idBorrowAndReturn),
    foreign key(studentNumber) references students(studentNumber),
	foreign key(idBook) references books(idBook)
)engine = InnoDB;

select * from librarymanager.students;
