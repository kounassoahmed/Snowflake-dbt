
{{ config(materialized='incremental', unique_key='fact_key') }}

with joined_data as (
    select
        r.document_key,
        c.bukrs,
        r.blart
    from {{ ref('raw_bkpf') }} r
    join {{ ref('raw_t001') }} c on r.bukrs = c.bukrs
)

select
    md5(document_key) as fact_key,
    *
from joined_data

{% if is_incremental() %}
where fact_key not in (select fact_key from {{ this }})
{% endif %}
