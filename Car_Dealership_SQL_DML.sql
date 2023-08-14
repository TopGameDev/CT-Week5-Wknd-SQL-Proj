CREATE OR REPLACE PROCEDURE add_dealership(name VARCHAR(50), address VARCHAR(50), phone_number VARCHAR(50))
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO car_dealership ("name", address, phone_number)
	VALUES ("name", address, phone_number);
END;
$$;

CALL add_dealership('CarShack', '123 Sunnyside Rd.', '(888)-444-2222');
CALL add_dealership('MechSpot', '444 Almighty Rd.', '(999)-777-3333');

SELECT *
FROM car_dealership cd


CREATE OR REPLACE PROCEDURE add_car(car_make VARCHAR(50), car_model VARCHAR(50), car_year NUMERIC(4), dealership_id INTEGER)
LANGUAGE plpgsql
AS $$
BEGIN 
	INSERT INTO car (car_make, car_model, car_year, dealership_id)
	VALUES (car_make, car_model, car_year, dealership_id);
END;
$$;

CALL add_car('Mercedes-Benz', 'A-Class', 2022, 1);
CALL add_car('Audi', 'A3', 2022, 2);
CALL add_car('Audi', 'A3', 2023, 1);
CALL add_car('Audi', 'A4', 2022, 2);
CALL add_car('Audi', 'A3', 2023, 2);
CALL add_car('GMC', 'Acadia', 2022, 1);
CALL add_car('GMC', 'Acadia', 2023, 2);
CALL add_car('Hyundai', 'Accent', 2022, 1);
CALL add_car('Honda', 'Accord', 2024, 1);
CALL add_car('Honda', 'Accord', 2023, 2);
CALL add_car('Honda', 'Accord', 2022, 2);
CALL add_car('Nissan', 'Altima', 2023, 1);
CALL add_car('Nissan', 'Altima', 2022, 1);
CALL add_car('Mclaren', 'Artura', 2023, 2);
CALL add_car('Subaru', 'Ascent', 2023, 1);
CALL add_car('Subaru', 'Ascent', 2024, 1);
CALL add_car('Subaru', 'Ascent', 2022, 2);
CALL add_car('Volkswagen', 'Atlas', 2023, 1);
CALL add_car('Volkswagen', 'Atlas', 2024, 2);
CALL add_car('Volkswagen', 'Atlas', 2022, 1);
CALL add_car('Volkswagen', 'Atlas Cross Sport', 2023, 1);
CALL add_car('Volkswagen', 'Atlas Cross Sport', 2022, 2);
CALL add_car('Volkswagen', 'Atlas Cross Sport', 2024, 2);
CALL add_car('Toyota', 'Avalon', 2022, 1);
CALL add_car('Toyota', 'Avalon Hybrid', 2022, 2);

SELECT *
FROM car c


CREATE OR REPLACE PROCEDURE add_sales_employee (first_name VARCHAR(50), last_name VARCHAR(50), phone_number VARCHAR(50), email VARCHAR(50))
LANGUAGE plpgsql
AS $$
BEGIN 
	INSERT INTO sales_employee (first_name, last_name, phone_number, email)
	VALUES (first_name, last_name, phone_number, email);
END;
$$;

CALL add_sales_employee('John', 'JingleHymer', '(555)-732-8764', 'jjhschmidt@gmail.com');
CALL add_sales_employee('Goofy', 'Gooferson', '(365)-745-2387', 'ggson@gmail.com');

SELECT *
FROM sales_employee se;


CREATE OR REPLACE PROCEDURE add_customer(first_name VARCHAR(50), last_name VARCHAR(50), email VARCHAR(50), phone_number VARCHAR(50))
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO customer(first_name, last_name, email, phone_number)
	VALUES (first_name, last_name, email, phone_number);
END;
$$;

CALL add_customer('Jason', 'Mamoa', 'jmoa@outlook.com', '777-834-0378');
CALL add_customer('Jason', 'Stathom', 'jstathom@gmail.com', '444-367-3710');
CALL add_customer('Denzel', 'Washington', 'dequalizer@yahoo.com', '123-999-4825');
CALL add_customer('Mickey', 'Mouse', 'm&m@playhouse.com', '323-739-2056');

SELECT *
FROM customer c


CREATE OR REPLACE PROCEDURE add_mechanic(first_name VARCHAR(50), last_name VARCHAR(50), email VARCHAR(50), phone_number VARCHAR(50))
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO mechanic(first_name, last_name, email, phone_number)
	VALUES (first_name, last_name, email, phone_number);
END;
$$;

CALL add_mechanic('Jose', 'Lopez', 'jpez@gmail.com', '111-498-8825');
CALL add_mechanic('George', 'Lopez', 'wapaaah@gmail.com', '888-279-1639');
CALL add_mechanic('Darnell', 'Smith', 'dsmith@gmail.com', '222-865-9264');

SELECT *
FROM mechanic m

CREATE OR REPLACE PROCEDURE add_invoice(price NUMERIC(8,2), car_id INTEGER, employee_id INTEGER, customer_id INTEGER)
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO invoice(price, car_id, employee_id, customer_id)
	VALUES (price, car_id, employee_id, customer_id);
END;
$$;

CALL add_invoice(265000, 14, 1, 3);
CALL add_invoice(40000, 2, 2, 2);

--UPDATE invoice
--SET car_id = 15
--WHERE car_id = 14

--UPDATE invoice
--SET invoice_id = 2
--WHERE invoice_id = 7

SELECT *
FROM invoice i


CREATE OR REPLACE PROCEDURE add_service_ticket(description VARCHAR, price NUMERIC(6,2))
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO service_ticket(description, price)
	VALUES (description, price);
END;
$$;

CALL add_service_ticket('oil change', 39.99);
CALL add_service_ticket('adjusted suspension', 674.99);
CALL add_service_ticket('fixed air-condition system', 275.50);

SELECT *
FROM service_ticket st 


CREATE OR REPLACE PROCEDURE add_service(ticket_id INTEGER, mechanic_id INTEGER, "name" VARCHAR(50), address VARCHAR(50), phone_number VARCHAR(50))
LANGUAGE plpgsql
AS $$
BEGIN 
	INSERT INTO service_facility(ticket_id, mechanic_id, "name", address, phone_number)
	VALUES (ticket_id, mechanic_id, "name", address, phone_number);
END;
$$;

CALL add_service(1, 2, 'QuickStop', '145 South Ridge Rd.', '(593)-825-9462');
CALL add_service(2, 1, 'CarSpot', '2935 South Princeton St.', '(602)-274-8395');
CALL add_service(3, 3, 'CarSpot', '2935 South Princeton St.', '(602)-274-8395');

SELECT *
FROM service_facility sf

CREATE OR REPLACE PROCEDURE add_service_record(car_id INTEGER, service_id INTEGER, customer_id INTEGER)
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO service_record(car_id, service_id, customer_id)
	VALUES (car_id, service_id, customer_id);
END;
$$;

CALL add_service_record(15, 2, 3);
CALL add_service_record(13, 1, 4);
CALL add_service_record(2, 2, 2);

--DELETE FROM service_record
--WHERE record_id = 3

--UPDATE service_record 
--SET service_id = 3
--WHERE service_id = 1

UPDATE service_record 
SET service_id = 1
WHERE service_id = 2 AND customer_id = 2

SELECT *
FROM service_record sr