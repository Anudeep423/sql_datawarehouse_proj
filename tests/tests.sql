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














