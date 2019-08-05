-- *************************************************************************************************
-- This script creates all of the database objects (tables, sequences, etc) for the database
-- *************************************************************************************************

BEGIN;

-- CREATE statements go here
DROP TABLE IF EXISTS app_user;
DROP TABLE IF EXISTS pothole;
DROP TABLE IF EXISTS address;

CREATE TABLE app_user (
  id SERIAL PRIMARY KEY,
  user_name varchar(32) NOT NULL UNIQUE,
  password varchar(32) NOT NULL,
  role varchar(32),
  salt varchar(255) NOT NULL
);

CREATE TABLE pothole (
  id SERIAL PRIMARY KEY,
  address_id int(32) NOT NULL,
  size varchar(32) NOT NULL,
  description varchar(32),
  created_on date(255) NOT NULL,
  latitude varchar (255) NOT NULL,
  longitude varchar (255) NOT NULL
);

CREATE TABLE address (
  address_id SERIAL PRIMARY KEY,
  zip_code int(32) NOT NULL,
  city varchar(32) NOT NULL,
  address_line_1 varchar (255) NOT NULL,
  address_line_2 varchar (255) NOT NULL

  CONSTRAINT fk_pothole_address_id foreign key (address_id) references pothole(address_id)

);

COMMIT;