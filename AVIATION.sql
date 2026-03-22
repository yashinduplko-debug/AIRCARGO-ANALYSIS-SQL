CREATE DATABASE AVIATION ;
use aviation;
select * from customer;
select * from passengers_on_flights;
select * from routes;
select * from ticket_details;
USE AVIATION;

SELECT *
FROM passengers_on_flights
WHERE route_id BETWEEN 1 AND 25;

SELECT count(customer_id)
FROM passengers_on_flights
WHERE class_id = 'Bussiness';

SELECT 
    COUNT(*) AS total_passengers,
    SUM(price_per_ticket * no_of_tickets) AS total_revenue
FROM ticket_details
WHERE class_id = 'Bussiness';

select
	concat(first_name,' ', last_name)
    from customer;


SELECT 
    CONCAT(first_name, ' ', last_name) AS full_name
FROM customer;

SELECT DISTINCT *
FROM customer as c
JOIN ticket_details as t
ON c.customer_id = t.customer_id;

select c.first_name, c.last_name
from customer as c
JOIN ticket_details as t
ON c.customer_id = t.customer_id
WHERE T.BRAND = 'EMIRATES';

select * from passengers_on_flights
WHERE CLASS_ID = 'ECONOMY PLUS';

select * from passengers_on_flights
WHERE CLASS_ID = 'ECONOMY PLUS';

SELECT 
    SUM(price_per_ticket * no_of_tickets) AS revenue,
    IF(SUM(price_per_ticket * no_of_tickets) > 10000, 'YES', 'NO') AS status
FROM ticket_details;

CREATE USER 'new_user'@'localhost' IDENTIFIED BY 'password';

GRANT ALL PRIVILEGES ON your_database.* TO 'new_user'@'localhost';

FLUSH PRIVILEGES;

SELECT 
    class_id,
    price_per_ticket,
    MAX(price_per_ticket) OVER (PARTITION BY class_id) AS max_price
FROM ticket_details;

CREATE INDEX idx_route_id
ON passengers_on_flights(route_id);

SELECT *
FROM passengers_on_flights
WHERE route_id = 4;

SELECT 
    customer_id,
    aircraft_id,
    SUM(price_per_ticket * no_of_tickets) AS total_price
FROM ticket_details
GROUP BY customer_id, aircraft_id WITH ROLLUP;

CREATE VIEW business_class_customers AS
SELECT customer_id, brand
FROM ticket_details
WHERE class_id = 'Bussiness';

DELIMITER //

CREATE PROCEDURE get_passengers_by_route(IN start_id INT, IN end_id INT)
BEGIN
    SELECT *
    FROM passengers_on_flights
    WHERE route_id BETWEEN start_id AND end_id;
END //

DELIMITER ;

