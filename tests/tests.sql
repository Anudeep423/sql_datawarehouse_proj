-- Queries to test silver.crm_cust_info 









-- Writing a query to check if any duplicates are there in pk(cst_id) or not
SELECT
cst_id,
count(*) 
from silver.crm_cust_info
group by cst_id
having count(*) > 1 or cst_id is null;



--check for unwanted spaces in firstname

SELECT cst_firstname from silver.crm_cust_info
WHERE cst_firstname != trim(cst_firstname)


--check for unwanted spaces in lastname

SELECT cst_lastname from silver.crm_cust_info
WHERE cst_lastname != trim(cst_lastname)

-- Lets check the values in gender columns

SELECT DISTINCT cst_gndr
from silver.crm_cust_info;


-- Lets check the values in marital status col 

SELECT DISTINCT cst_marital_status
from silver.crm_cust_info;





-- Test for silver.crm.prd_info 











--- checking if prd_id has any null or duplicates
SELECT prd_id,
count(*) as prd_id_count from bronze.crm_prd_info
group by prd_id
having count(*) > 1 or prd_id is null;


-- Check if prd_nm has any unwanted spaces

SELECT prd_nm
from bronze.crm_prd_info
where prd_nm != Trim(prd_nm)

-- Check of prd_cost has any null 

SELECT prd_cost
from bronze.crm_prd_info
where prd_cost IS NULL;



-- Lets check if the start date is less than end date


SELECT * from bronze.crm_prd_info
where prd_start_dt < prd_end_dt;







-- test for crm_sales_details




-- Checking for invalid dates for sls_order_dt
SELECT
sls_order_dt
from bronze.crm_sales_details
where sls_order_dt <= 0 or len(sls_order_dt) != 8 or sls_order_dt is null

-- Checking for invalid dates for sls_ship_dt
SELECT
sls_ship_dt
from bronze.crm_sales_details
where sls_ship_dt <= 0 or len(sls_ship_dt) != 8 or sls_ship_dt is null
-- Lets check for due_dt
SELECT
sls_due_dt
from bronze.crm_sales_details
where sls_due_dt <= 0 or len(sls_due_dt) != 8 or sls_due_dt is null;

SELECT * from bronze.crm_sales_details
where sls_sales is null or sls_sales !=  sls_quantity * sls_price  ;


SELECT * from bronze.crm_sales_details
where sls_price is null or sls_price !=  sls_sales / sls_quantity  ;

SELECT * from bronze.crm_sales_details
where sls_quantity is null or sls_quantity !=  sls_sales / sls_price  ;







-- tests for erp_cust_az12



-- Lets get the diff types of values in gender
select distinct gen
from bronze.erp_cust_az12;


-- getting invalud bdates
SELECT DISTINCT
bdate
from bronze.erp_cust_az12
where bdate < '1926-01-01' or bdate > getdate()





