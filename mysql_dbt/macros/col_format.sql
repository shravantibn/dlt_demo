{% macro format_order_date(order_date_column) %}
  -- This macro formats the order date to 'YYYY-MM-DD' string
  date_format({{ order_date_column }}, '%Y-%m-%d')
{% endmacro %}
 
 
{% macro extract_order_year(order_date_column) %}
  -- This macro extracts the year from the order date
  year({{ order_date_column }})
{% endmacro %}
 
{% macro days_since_order(order_date_column, current_date) %}
  -- This macro calculates the days since the order date compared to current_date
  datediff({{ current_date }}, {{ order_date_column }})
{% endmacro %}