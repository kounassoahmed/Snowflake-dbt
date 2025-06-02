
{{ config(materialized='incremental', unique_key='company_code', schema=env_var('DBT_ENV') ~ '_RAW') }}

select
    company_code,
    company_name,
    country
from {{ ref('stg_t001') }}

{% if is_incremental() %}
where company_code not in (select company_code from {{ this }})
{% endif %}
