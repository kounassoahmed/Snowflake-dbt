{{ config(materialized='incremental', unique_key='company_code') }}

select
    bukrs,
    butxt,
    land1
from {{ ref('stg_t001') }}

{% if is_incremental() %}
where bukrs not in (select bukrs from {{ this }})
{% endif %}
