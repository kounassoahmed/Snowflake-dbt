
{{ config(materialized='incremental', unique_key='document_key', schema=env_var('DBT_ENV') ~ '_RAW') }}

select
    concat_ws('-', company_code, document_number, fiscal_year) as document_key,
    *
from {{ ref('stg_bkpf') }}

{% if is_incremental() %}
where document_key not in (select document_key from {{ this }})
{% endif %}
