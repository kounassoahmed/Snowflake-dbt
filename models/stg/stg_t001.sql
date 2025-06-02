
{{ config(materialized='table', schema=env_var('DBT_ENV') ~ '_STG') }}

with source_data as (
    select $1 as data
    from @s3_stage/path/{{ var('year') }}/{{ var('month') }}/{{ var('day') }}/t001.json
)

select
    parse_json(data):bukrs::string as company_code,
    parse_json(data):butxt::string as company_name,
    parse_json(data):land1::string as country
from source_data;
