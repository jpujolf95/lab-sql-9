USE sakila;

SELECT * FROM rental;

#Creation of database
---------------------------------------------------
CREATE TABLE rental_may (
  rental_id INT NOT NULL AUTO_INCREMENT,
  rental_date DATETIME NOT NULL,
  inventory_id MEDIUMINT UNSIGNED NOT NULL,
  customer_id SMALLINT UNSIGNED NOT NULL,
  return_date DATETIME DEFAULT NULL,
  staff_id TINYINT UNSIGNED NOT NULL,
  last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (rental_id),
  UNIQUE KEY  (rental_date,inventory_id,customer_id),
  KEY idx_fk_inventory_id (inventory_id),
  KEY idx_fk_customer_id (customer_id),
  KEY idx_fk_staff_id (staff_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE rental_june (
  rental_id INT NOT NULL AUTO_INCREMENT,
  rental_date DATETIME NOT NULL,
  inventory_id MEDIUMINT UNSIGNED NOT NULL,
  customer_id SMALLINT UNSIGNED NOT NULL,
  return_date DATETIME DEFAULT NULL,
  staff_id TINYINT UNSIGNED NOT NULL,
  last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (rental_id),
  UNIQUE KEY  (rental_date,inventory_id,customer_id),
  KEY idx_fk_inventory_id (inventory_id),
  KEY idx_fk_customer_id (customer_id),
  KEY idx_fk_staff_id (staff_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO rental_may 
SELECT * FROM rental
WHERE MONTH(rental_date) = 05;

INSERT INTO rental_june
SELECT * FROM rental
WHERE MONTH(rental_date) = 06;


#applying changed
----------------------------------------------

SELECT customer_id, COUNT(rental_id) AS rented_may 
FROM rental_may
GROUP BY customer_id; #1156 total movies rented

SELECT customer_id, COUNT(rental_id) AS rented_june 
FROM rental_june
GROUP BY customer_id; #2311 total movies rented


