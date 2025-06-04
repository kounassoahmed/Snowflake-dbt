
{{ config(materialized='incremental', unique_key='line_key', schema='RAW') }}

select
    concat_ws('-', company_code, document_number, fiscal_year, line_item) as line_key,
    *
from {{ ref('stg_bseg') }}

{% if is_incremental() %}
where line_key not in (select line_key from {{ this }})
{% endif %}
