{{ config(materialized='incremental', unique_key='company_code') }}

select
    bukrs,
    butxt,
    land1
from {{ ref('stg_t001') }}

{% if is_incremental() %}
where company_code not in (select company_code from {{ this }})
{% endif %}
