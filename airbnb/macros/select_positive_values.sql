{% macro select_positive_values(model, column_name) %}

  {% set check_query %}
    select count(*) from {{ model }} where {{ column_name }} > 0
  {% endset %}

  {% set results = run_query(check_query) %}

  {% if execute %}
    {% set positive_count = results.columns[0].values()[0] %}
  {% else %}
    {% set positive_count = 0 %}
  {% endif %}

  {% if positive_count > 0 %}
    {{ log("Encontrados " ~ positive_count ~ " valores positivos na coluna " ~ column_name, info=True) }}
    
    select * from {{ model }} where {{ column_name }} > 0

  {% else %}
    {{ log("Nenhum valor positivo encontrado em " ~ column_name, info=True) }}
    
    select * from {{ model }} where 1=0
    
  {% endif %}

{% endmacro %}