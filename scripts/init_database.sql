/*
===================================================
CREATE DATABASE AND SCHEMAS
===================================================
Script Purpose:
  This script creates a new database "DataWarehouse" after checking if it already exists.
  If the database exists, it is dropped and recreated. Additionally, the script sets up three schemas
  within the database: 'bronze', 'silver', 'gold'

*/

-- drop and recreate database
BEGIN
    IF EXISTS (
        SELECT FROM pg_database WHERE datname = 'DataWarehouse'
    ) THEN
        -- Terminate all active connections
        PERFORM pg_terminate_backend(pid)
        FROM pg_stat_activity
        WHERE datname = 'DataWarehouse'
          AND pid <> pg_backend_pid();

        -- Drop the database
        EXECUTE 'DROP DATABASE "DataWarehouse"';
    END IF;
END





-- create database
create database DataWarehouse;

-- create schemas
create schema bronze;

create schema silver;

create schema gold;

