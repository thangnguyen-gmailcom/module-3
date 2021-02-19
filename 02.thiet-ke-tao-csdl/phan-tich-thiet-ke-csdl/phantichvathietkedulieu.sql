CREATE DATABASE carsalesmanagement;
USE carsalesmanagement;

CREATE TABLE cutomers(
	customerNumber INT NOT NULL,
    customerName VARCHAR(50) NOT NULL,
    contactFirstName VARCHAR(25) NOT NULL,
    contactLastName VARCHAR(25) NOT NULL,
    phone VARCHAR(50) NOT NULL,
    addressLine1 VARCHAR(50) NOT NULL,
    addressLine2 VARCHAR(50),
    city VARCHAR(50) NOT NULL,
    state VARCHAR(50),
    postalCode VARCHAR(15),
    country VARCHAR(50) NOT NULL,
    salesRepEmployeeNumber int,
    creditLimit DECIMAL(10,2),
    CONSTRAINT pk_customemr PRIMARY KEY(customerNumber)
);

ALTER TABLE cutomers 
	ADD CONSTRAINT fk_saleRemEmployee_customer FOREIGN KEY(salesRepEmployeeNumber) REFERENCES employees(employeeNumber);

CREATE TABLE employees(
	employeeNumber INT NOT NULL,
    lastName VARCHAR(50) NOT NULL,
    firstName VARCHAR(50) NOT NULL,
    extension VARCHAR(10) NOT NULL,
    email VARCHAR(100) NOT NULL,
    officeCode VARCHAR(10) NOT NULL,
    reporstTo int,
    jobTitle VARCHAR(50) NOT NULL,
    CONSTRAINT pk_employee PRIMARY KEY(employeeNumber)
);

ALTER TABLE employees
	ADD  CONSTRAINT fk_officeCode_employees FOREIGN KEY(officeCode) REFERENCES offices(officeCode);
    
ALTER TABLE employees
	ADD CONSTRAINT fk_reporstTo FOREIGN KEY(reporstTo) REFERENCES employees(employeeNumber);

CREATE TABLE offices(
	officeCode VARCHAR(10) NOT NULL,
    city VARCHAR(50) NOT NULL,
    phone VARCHAR(50) NOT NULL,
    addressLine1 VARCHAR(50) NOT NULL,
    addressLine2 VARCHAR(50),
    state VARCHAR(50),
    conntry VARCHAR(50) NOT NULL,
    postalCode VARCHAR(15) NOT NULL,
    territory VARCHAR(10) NOT NULL,
    CONSTRAINT pk_office PRIMARY KEY(officeCode)
);

CREATE TABLE orders(
	orderNumber INT NOT NULL,
    orderDate DATE NOT NULL,
    requiredDate DATE NOT NULL,
    shippedDate DATE NOT NULL,
    status VARCHAR(15),
    comments text,
    customerNumber INT NOT NULL,
    CONSTRAINT pk_order PRIMARY KEY(orderNumber),
    CONSTRAINT fk_orders_customerNumber FOREIGN KEY(customerNumber) REFERENCES cutomers(customerNumber)
);

CREATE TABLE orderdetails(
	orderNumber INT NOT NULL,
    productCode VARCHAR(15) NOT NULL,
    quantityOrdered INT NOT NULL,
    priceEach DECIMAL(10,2) NOT NULL,
    orderLineNumber SMALLINT,
    CONSTRAINT fk_product FOREIGN KEY(productCode) REFERENCES  products(productCode),
    CONSTRAINT fk_order FOREIGN KEY(orderNumber) REFERENCES orders(orderNumber)
);

CREATE TABLE payments(
	customerNumber INT NOT NULL,
    checkNumber VARCHAR(15) NOT NULL,
    paymentDate DATE NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    CONSTRAINT pk_payment PRIMARY KEY(checkNumber),
    CONSTRAINT fk_payment_customerNumber FOREIGN KEY(customerNumber) REFERENCES cutomers(customerNumber)
);

CREATE TABLE products(
	productCode VARCHAR(15) NOT NULL,
    productName VARCHAR(50) NOT NULL,
    productLine VARCHAR(50) NOT NULL,
    productScale VARCHAR(10) NOT NULL,
    productVendor VARCHAR(50) NOT NULL,
    productDescription TEXT NOT NULL,
    quantityInStock SMALLINT NOT NULL,
    buyPrice DECIMAL(10,2) NOT NULL,
    MSRP DECIMAL(10,2) NOT NULL,
    CONSTRAINT pk_product PRIMARY KEY(productCode),
    CONSTRAINT fk_product_productLine FOREIGN KEY(productLine) REFERENCES productLine(productLine)
);

CREATE TABLE productLine(
	productLine VARCHAR(50) NOT NULL,
    textDescription VARCHAR(255) NOT NULL,
    htmlDescription mediumtext NOT NULL,
    image mediumblob NOT NULL,
    CONSTRAINT pk_productLine PRIMARY KEY(productLine)
);