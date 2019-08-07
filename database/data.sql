-- *****************************************************************************
-- This script contains INSERT statements for populating tables with seed data
-- *****************************************************************************

BEGIN;

-- INSERT statements go here

SELECT * FROM address;
INSERT INTO address (address_id, zip_code, city, address_line_1, address_line_2, state  )
VALUES (1, 43229, 'Columbus', '123 Elm Street', 'Apt B', 'Ohio' );


SELECT * FROM pothole;
INSERT INTO pothole(id, address_id, size, description, created_on, longitude, latitude, status_id )
VALUES (default, 1, 'large', 'Its a doozie', '8/6/2019', 123456, 1234567, 1 );

SELECT * FROM status;
INSERT INTO status(status_id, reported_on, inspected_on, repaired_on, rank  ) 
VALUES (default, '8/6/2019', '8/6/2019', '8/6/2019', 'easy' );


SELECT * FROM address;
INSERT INTO address (address_id, zip_code, city, address_line_1, address_line_2, state  )
VALUES (2, 43229, 'Columbus', '666 Elm Street', 'Apt A', 'Ohio' );

SELECT * FROM pothole;
INSERT INTO pothole(id, address_id, size, description, created_on, longitude, latitude, status_id )
VALUES (default, 2, 'medium', 'whoa doggy', '8/6/2019', 123457, 1234568, 2 );

SELECT * FROM status;
INSERT INTO status(status_id, reported_on, inspected_on, repaired_on, rank  ) 
VALUES (default, '8/6/2019', '8/6/2019', '8/6/2019', 'easy' );


SELECT * FROM address;
INSERT INTO address (address_id, zip_code, city, address_line_1, address_line_2, state  )
VALUES (3, 43229, 'Columbus', '1234 Street St', 'asd', 'Ohio' );

SELECT * FROM pothole;
INSERT INTO pothole(id, address_id, size, description, created_on, longitude, latitude, status_id )
VALUES (default, 3, 'small', 'whoa nelly', '8/6/2019', 123458, 1234569, 3 );

SELECT * FROM status;
INSERT INTO status(status_id, reported_on, inspected_on, repaired_on, rank  ) 
VALUES (default, '8/6/2019', '8/6/2019', '8/6/2019', 'easy' );



COMMIT;