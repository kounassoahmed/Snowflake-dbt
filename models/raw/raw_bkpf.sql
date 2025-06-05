{{ config(materialized='incremental', unique_key='document_key') }}

select
    concat_ws('-', bukrs, belnr, gjahr) as document_key,
    *
from {{ ref('bkpf') }}

{% if is_incremental() %}
where document_key not in (select document_key from {{ this }})
{% endif %}
