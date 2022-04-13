CREATE DATABASE testDB;
CREATE TABLE testDB.Persons (
    PersonID int,
    LastName varchar(255),
    FirstName varchar(255),
    Addr varchar(255),
    City varchar(255)
);

INSERT INTO testDB.Persons (PersonID, LastName, FirstName, Addr, City)
VALUE ('1', 'Gajjala', 'Prarthana', '123 Main Street', 'Cleveland');
DROP DATABASE testDB;