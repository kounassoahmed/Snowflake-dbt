{% macro generate_alias_name(custom_alias_name=none, node=none) %}
  {% set name = node.name %}
  {% set cleaned = name | replace('^raw_', '') | replace('^stg_', '') | replace('^dwh_', '') %}
  {{ return(cleaned) }}
{% endmacro %}
