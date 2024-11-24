CREATE DATABASE IF NOT EXISTS OpenData;
USE OpenData;

-- Table transporter_dimension
CREATE TABLE transporter_dimension (
    transporter_id INT PRIMARY KEY,
    transporter_name VARCHAR(255)
);

-- Table delivery_fact
CREATE TABLE delivery_fact (
    delivery_id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,
    supplier_id INT,
    transporter_id INT,
    date_id INT,
    delivery_quantity INT,
    FOREIGN KEY (product_id) REFERENCES product_dimension(product_id),
    FOREIGN KEY (supplier_id) REFERENCES supplier_dimension(supplier_id),
    FOREIGN KEY (transporter_id) REFERENCES transporter_dimension(transporter_id),
    FOREIGN KEY (date_id) REFERENCES date_dimension(date_id)
);

-- Table transportation_type_dimension
CREATE TABLE transportation_type_dimension (
    transportation_type_id INT PRIMARY KEY,
    transportation_mode VARCHAR(255)
);

-- Table inventory_fact
CREATE TABLE inventory_fact (
    inventory_id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,
    date_id INT,
    stock_quantity INT,
    FOREIGN KEY (product_id) REFERENCES product_dimension(product_id),
    FOREIGN KEY (date_id) REFERENCES date_dimension(date_id)
);

-- Table sales_fact
CREATE TABLE sales_fact (
    sales_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    product_id INT,
    date_id INT,
    sales_quantity INT,
    sales_amount DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES customer_dimension(customer_id),
    FOREIGN KEY (product_id) REFERENCES product_dimension(product_id),
    FOREIGN KEY (date_id) REFERENCES date_dimension(date_id)
);

-- Table customer_dimension
CREATE TABLE customer_dimension (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(255),
    customer_segment VARCHAR(255)
);

-- Table date_dimension
CREATE TABLE date_dimension (
    date_id INT PRIMARY KEY,
    date_value DATE,
    year INT,
    month INT,
    day INT
);

-- Table product_dimension
CREATE TABLE product_dimension (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(255),
    category VARCHAR(255),
    sub_category VARCHAR(255)
);

-- Table supplier_dimension
CREATE TABLE supplier_dimension (
    supplier_id INT PRIMARY KEY,
    supplier_name VARCHAR(255),
    supplier_region VARCHAR(255)
);
