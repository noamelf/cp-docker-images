CREATE DATABASE connect_test;
\c connect_test;

CREATE TABLE test (
	id serial NOT NULL PRIMARY KEY,
	name varchar(100),
	email varchar(200),
	department varchar(200),
	modified timestamp default CURRENT_TIMESTAMP NOT NULL
);

