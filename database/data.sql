-- *****************************************************************************
-- This script contains INSERT statements for populating tables with seed data
-- *****************************************************************************

BEGIN;

-- INSERT statements go here

SELECT * FROM address;
INSERT INTO address (address_id, zip_code, city, address_line_1, address_line_2  )
VALUES (default, 43229, Columbus, '123 Elm Street', 'Apt B' );


SELECT * FROM pothole;
INSERT INTO pothole(id, address_id, size, description, created_on, longitude, latitude )
VALUES (default, 1, 'large', 'Its a doozie', 8/6/2019, 123456, 1234567 );


SELECT * FROM address;
INSERT INTO address (address_id, zip_code, city, address_line_1, address_line_2  )
VALUES (default, 43229, Columbus, '666 Elm Street', 'Apt A' );

SELECT * FROM pothole;
INSERT INTO pothole(id, address_id, size, description, created_on, longitude, latitude )
VALUES (default, 2, 'medium', 'whoa doggy', 8/6/2019, 123457, 1234568 );


SELECT * FROM address;
INSERT INTO address (address_id, zip_code, city, address_line_1  )
VALUES (default, 43229, Columbus, '1234 Street St' );

SELECT * FROM pothole;
INSERT INTO pothole(id, address_id, size, description, created_on, longitude, latitude )
VALUES (default, 3, 'small', 'whoa nelly', 8/6/2019, 123458, 1234569 );



COMMIT;