-- fix crm_cust_info

insert into silver.crm_cust_info(
cst_id             ,
    cst_key            ,
    cst_firstname      ,
    cst_lastname       ,
    cst_marital_status ,
    cst_gndr          ,
    cst_create_date   
    )
	  SELECT 
cst_id,
cst_key,
TRIM(cst_firstname) as cst_firstname,
TRIM(cst_lastname) as cst_lastname,
CASE
  when trim(upper(cst_marital_status)) = 'S' then 'single'
  when trim(upper(cst_marital_status)) = 'M' then 'Married'
else 'n/a'
end as cst_marital_status
,
CASE
  when trim(upper(cst_gndr)) = 'M' then 'Male'
  when trim(upper(cst_gndr)) = 'F' then 'Female'
else 'n/a'
end as cst_gndr,
cst_create_date
FROM(
SELECT
*,
Row_number() over(
partition by cst_id
order by cst_create_date DESC) as flag_last
from bronze.crm_cust_info
) AS T
WHERE flag_last = 1 and cst_id is not null;
