CREATE TABLE car_dealership (
  dealership_id SERIAL PRIMARY KEY,
  "name" VARCHAR(50),
  address VARCHAR(50),
  phone_number VARCHAR(50)
);


CREATE TABLE car (
  car_id SERIAL PRIMARY KEY,
  car_make VARCHAR(50),
  car_model VARCHAR(50),
  car_year NUMERIC(4)
  FOREIGN KEY (dealership_id) REFERENCES car_dealership(dealership_id)
);

SELECT * FROM car c

--ALTER TABLE car
--ADD COLUMN dealership_id INTEGER;
--
--ALTER TABLE car
--ADD FOREIGN KEY (dealership_id) REFERENCES car_dealership(dealership_id)


CREATE TABLE sales_employee (
  employee_id SERIAL PRIMARY KEY,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  email VARCHAR(50),
  phone_number VARCHAR(50)
);


CREATE TABLE customer (
  customer_id SERIAL PRIMARY KEY,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  email VARCHAR(50),
  phone_number VARCHAR(50)
);


CREATE TABLE service_facility (
  service_id SERIAL PRIMARY KEY,
  "name" VARCHAR(50),
  address VARCHAR(50),
  phone_number VARCHAR(50)
);


CREATE TABLE mechanic (
  mechanic_id SERIAL PRIMARY KEY,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  phone_number VARCHAR(50),
  email VARCHAR(50)
);


CREATE TABLE invoice (
  invoice_id SERIAL PRIMARY KEY,
  price NUMERIC(8,2),
  date_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  car_id INTEGER,
  employee_id INTEGER,
  customer_id INTEGER,
  FOREIGN KEY (car_id) REFERENCES car(car_id),
  FOREIGN KEY (employee_id) REFERENCES sales_employee(employee_id),
  FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
);


CREATE TABLE service_ticket (
  record_id SERIAL PRIMARY KEY,
  description VARCHAR,
  date_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  car_id INTEGER,
  mechanic_id INTEGER,
  service_id INTEGER,
  customer_id INTEGER,
  FOREIGN KEY (car_id) REFERENCES car(car_id),
  FOREIGN KEY (mechanic_id) REFERENCES mechanic(mechanic_id),
  FOREIGN KEY (service_id) REFERENCES service_facility(service_id),
  FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
);

SELECT *
FROM service_ticket st


