create database bankaccountmanager;
use bankaccountmanager;

create table customers(
	customerNumber int auto_increment not null,
    fullName varchar(50) not null ,
    address varchar(100) not null,
    email varchar(50) not null,
    phone varchar(10) not null,
    constraint pk_customer primary key(customerNumber)
);

create table accounts(
	accountNumber int not null,
    accountType varchar(50),
    date date not null,
    balance bigint,
    customerNumber int not null,
    constraint pk_Account primary key(accountNumber),
    constraint fk_customer foreign key (customerNumber) references customers(customerNumber)
);

create table transactions(
	tranNumber int not null,
    accountNumber int not null,
    date date not null,
    amounts bigint not null,
    description varchar(255) not null,
    constraint pk_Transaction primary key(tranNumber),
    constraint fk_Account foreign key(accountNumber) references accounts(accountNumber)
);
