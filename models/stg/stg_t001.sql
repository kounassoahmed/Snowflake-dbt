{{ config(materialized='table', schema='STG') }}

select
  $1::string as bukrs,
  $2::string as butxt,
  $3::string as land1,
  SELECT METADATA$FILENAME,
  METADATA$FILE_ROW_NUMBER,
  METADATA$FILE_CONTENT_KEY,
from @DEV_SAP_STG.STG.SAP_STAGE/{{ var('year') }}/{{ var('month') }}/{{ var('day') }}/t001.csv
(file_format => DEV_SAP_STG.STG.CSV_FORMAT);
