-- Creamos la base de datos

CREATE DATABASE lab_mysql;

-- Seleccionamos esa base de datos

USE lab_mysql;

-- Creamos la tabla Cars, Customers, Salespersons e Invoice (Sé que hay algunos campos que deberían ser INT pero al ponerlo me daba error así que los he creado todos como VARCHAR...)

CREATE TABLE cars (vin VARCHAR(20), manufacturer VARCHAR(20), model VARCHAR(20), year VARCHAR(20), color VARCHAR(20));

CREATE TABLE customers (customer_id VARCHAR(20), name VARCHAR(20), phone_number VARCHAR(20), email VARCHAR(20), address VARCHAR(20), city VARCHAR(20), state VARCHAR(20), country VARCHAR(20), zip VARCHAR(20));

CREATE TABLE salespersons (staff_id VARCHAR(20), name VARCHAR(20), store VARCHAR(20));

CREATE TABLE invoice (invoice_number VARCHAR(20), date VARCHAR(20), car VARCHAR(20), customer VARCHAR(20), salesperson VARCHAR(20));

