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
