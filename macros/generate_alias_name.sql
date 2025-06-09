{% macro generate_alias_name(custom_alias_name=none, node=none) -%}
    {%- set raw_name = node.name -%}

    {# Supprimer les préfixes raw_, stg_ ou dwh_ #}
    {%- set cleaned_name = (
        raw_name
        | regex_replace('^stg_', '')
        | regex_replace('^raw_', '')
        | regex_replace('^dwh_', '')
    ) -%}

    {%- if custom_alias_name -%}
        {{ custom_alias_name | trim }}

    {%- elif node.version -%}
        {{ cleaned_name ~ "_v" ~ (node.version | replace(".", "_")) }}

    {%- else -%}
        {{ cleaned_name }}

    {%- endif -%}
{%- endmacro %}
