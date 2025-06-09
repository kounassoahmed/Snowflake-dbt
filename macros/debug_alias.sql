-- models/debug_alias.sql
{{ config(materialized='table') }}

select '{{ generate_alias_name(None, this) }}' as test_alias
