{% macro generate_alias_name(custom_alias_name=none, node=none) %}
    {% set name = custom_alias_name if custom_alias_name is not none else node.name %}

    {# Remove common prefixes like 'stg_', 'raw_', 'dwh_' #}
    {% set cleaned_name = name
        | replace('stg_', '')
        | replace('raw_', '')
        | replace('dwh_', '') %}

    {{ cleaned_name }}
{% endmacro %}
