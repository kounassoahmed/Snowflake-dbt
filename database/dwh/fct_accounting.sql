{{ config(materialized='incremental', unique_key='fact_key', schema=env_var('DBT_ENV') ~ '_DWH') }}

with joined_data as (
    select
        r.document_key,
        c.company_name,
        r.doc_type
    from {{ ref('raw_bkpf') }} r
    join {{ ref('raw_t001') }} c on r.company_code = c.company_code
)

select
    md5(document_key) as fact_key,
    *
from joined_data

{% if is_incremental() %}
where fact_key not in (select fact_key from {{ this }})
{% endif %}
