{{ config(materialized='table', schema=env_var('DBT_ENV') ~ '_STG') }}

select
  $1::string as bukrs,
  $2::string as belnr,
  $3::string as gjahr,
  $4::string as buzei,
  $5::float as wrbtr
from @DEV_SAP_STG.STG.SAP_STAGE/2024/06/01/bseg.csv;
