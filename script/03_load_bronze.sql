EXEC bronze.load_bronze

CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
BEGIN TRY
PRINT '=========================================';
PRINT 'LOADING BRONZE LAYER';
PRINT '--------------------------------------';
PRINT 'LOADING CRM TABLES';
PRINT'-------------------------------';

BULK INSERT bronze.crm_cust_info
FROM 'C:\Users\Faiza\Desktop\cust_info.csv'
WITH(
FIRSTROW =2,
FIELDTERMINATOR = ',',
TABLOCK
);
PRINT'----------------------------';
PRINT'INSERTING DATA INTO bronze.crm_prd_info';
PRINT'----------------------------';
BULK INSERT bronze.crm_prd_info
FROM 'C:\Users\Faiza\Desktop\prd_info.csv'
WITH(
FIRSTROW =2,
FIELDTERMINATOR =',',
TABLOCK
);

PRINT'--------------------------------';
PRINT'INSERTING DATA INTO bronze.crm_sales_details_info';
PRINT'--------------------------------';
BULK INSERT bronze.crm_sales_details_info
FROM 'C:\Users\Faiza\Desktop\sales_details.csv'
WITH(
FIRSTROW =2,
FIELDTERMINATOR = ',',
TABLOCK
);
PRINT'========================';
PRINT'LOADING ERP TABLES';
PRINT'========================';
PRINT'--------------------------------';
PRINT'INSERTING DATA INTO bronze.erp_loc_a101';
PRINT'---------------------------------';
BULK INSERT bronze.erp_loc_a101
FROM 'C:\Users\Faiza\Desktop\LOC_A101.csv'
WITH (
FIRSTROW =2,
FIELDTERMINATOR =',',
TABLOCK
);
PRINT'---------------------------------';
PRINT'INSERTING DATA INTO bronze.erp_cust_az12';
PRINT'---------------------------------';
BULK INSERT bronze.erp_cust_az12
FROM 'C:\Users\Faiza\Desktop\CUST_AZ12.csv'
WITH(
FIRSTROW =2,
FIELDTERMINATOR =',',
TABLOCK
);
PRINT'-------------------------------';
PRINT'INSERTING DATA INTO bronze.erp_px_cat_g1v2';
PRINT'-------------------------------';
BULK INSERT bronze.erp_px_cat_g1v2
FROM 'C:\Users\Faiza\Desktop\PX_CAT_G1V2.csv'
WITH(
FIRSTROW = 2,
FIELDTERMINATOR = ',',
TABLOCK
);
PRINT'===SUCCESS : BRONZE LOAD COMPELETE===';
END TRY
BEGIN CATCH
    PRINT'ERROR OCCURED';
    PRINT'ERROR MESSAGE()';
 END CATCH
END;
