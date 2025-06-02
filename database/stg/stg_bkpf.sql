{{ config(materialized='table', schema=env_var('DBT_ENV') ~ '_STG') }}

with source_data as (
    select $1 as data
    from @s3_stage/path/{{ var('year') }}/{{ var('month') }}/{{ var('day') }}/bkpf.json
)

select
    parse_json(data):bukrs::string as company_code,
    parse_json(data):belnr::string as document_number,
    parse_json(data):gjahr::string as fiscal_year,
    parse_json(data):blart::string as doc_type
from source_data;
