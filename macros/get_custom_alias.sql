{% macro generate_alias_name(custom_alias_name=none, node=none) -%}

    {%- set raw_name = node.name -%}
    {%- set cleaned_name = raw_name
        | replace('^stg_', '')
        | replace('^raw_', '')
        | replace('^dwh_', '')
    -%}

    {%- if custom_alias_name -%}
        {{ custom_alias_name | trim }}

    {%- elif node.version -%}
        {{ cleaned_name ~ "_v" ~ (node.version | replace(".", "_")) }}

    {%- else -%}
        {{ cleaned_name }}

    {%- endif -%}

{%- endmacro %}
