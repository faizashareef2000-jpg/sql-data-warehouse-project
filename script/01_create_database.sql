-- ======================================================
-- Creating Databae and Schemas
-- ======================================================

-- Create Database If It does not already Exist
CREATE DATABASE datawarehouse;
END 
GO
-- Switch Context To Datawarehouse
USE datawarehouse;
GO
--Create Schemas for Layered Architecture
CREATE SCHEMA bronze;
GO
CREATE SCHEMA silver;
GO
CREATE SCHEMA gold;
GO

