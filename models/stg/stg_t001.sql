{{ config(materialized='table', schema='STG') }}

select
  $1::string as bukrs,
  $2::string as butxt,
  $3::string as land1
from @DEV_SAP_STG.STG.SAP_STAGE/2024/06/01/t001.csv;
