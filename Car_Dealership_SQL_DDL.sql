CREATE TABLE car_dealership (
  dealership_id SERIAL PRIMARY KEY,
  "name" VARCHAR(50)
);


CREATE TABLE new_car (
  new_car_id SERIAL PRIMARY KEY,
  car_make VARCHAR(50),
  car_model VARCHAR(50),
  car_year NUMERIC(4)
);


CREATE TABLE old_car (
  old_car_id SERIAL PRIMARY KEY,
  car_make VARCHAR(50),
  car_model VARCHAR(50),
  car_year NUMERIC(4)
);


CREATE TABLE sales_employee (
  employee_id SERIAL PRIMARY KEY,
  first_name VARCHAR(50),
  last_name VARCHAR(50)
);


CREATE TABLE customer (
  customer_id SERIAL PRIMARY KEY,
  first_name VARCHAR(50),
  last_name VARCHAR(50)
);


CREATE TABLE invoice (
  invoice_id SERIAL PRIMARY KEY,
  new_car_id INTEGER,
  old_car_id INTEGER,
  employee_id INTEGER,
  customer_id INTEGER,
  dealership_id INTEGER,
  FOREIGN KEY (new_car_id) REFERENCES new_car(new_car_id),
  FOREIGN KEY (old_car_id) REFERENCES old_car(old_car_id),
  FOREIGN KEY (employee_id) REFERENCES sales_employee(employee_id),
  FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
  FOREIGN KEY (dealership_id) REFERENCES car_dealership(dealership_id)
);


CREATE TABLE service_ticket (
  ticket_id SERIAL PRIMARY KEY,
  description VARCHAR
);


CREATE TABLE service_facility (
  service_id SERIAL PRIMARY KEY,
  description VARCHAR,
  ticket_id INTEGER,
  FOREIGN KEY (ticket_id) REFERENCES service_ticket(ticket_id)
);


CREATE TABLE service_record (
  record_id SERIAL PRIMARY KEY,
  new_car_id INTEGER,
  old_car_id INTEGER,
  service_id INTEGER,
  customer_id INTEGER,
  dealership_id INTEGER,
  FOREIGN KEY (new_car_id) REFERENCES new_car(new_car_id),
  FOREIGN KEY (old_car_id) REFERENCES old_car(old_car_id),
  FOREIGN KEY (service_id) REFERENCES service_facility(service_id),
  FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
  FOREIGN KEY (dealership_id) REFERENCES car_dealership(dealership_id)
);



