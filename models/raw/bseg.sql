{{ config(materialized='incremental', unique_key='line_key') }}

select
    concat_ws('-', bukrs, belnr, gjahr, buzei) as line_key,
    *
from {{ ref('bseg') }}

{% if is_incremental() %}
where line_key not in (select line_key from {{ this }})
{% endif %}
